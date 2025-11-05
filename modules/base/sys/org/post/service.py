from datetime import datetime

from sqlalchemy import select, update, delete

from modules.base.sys.org.dept.model import SysOrgDept
from modules.base.sys.org.post.model import SysOrgPost, PostDTO, SysOrgPostOrg
from modules.base.sys.org.root.model import SysOrg, pydantic_to_sqlalchemy, OrgDTO
from modules.base.sys.org.root.utils import OrmUtil
from utils.id_util import IdUtil


class SysOrgPostService:

    def __init__(self, db):
        self.db = db
        self.model = SysOrgPost

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, PostDTO)
        query = select(SysOrg).join(SysOrgPostOrg, SysOrgPostOrg.oid == SysOrg.id).where(SysOrgPostOrg.pid==main.id)
        list = (await self.db.execute(query)).scalars().all()
        vo.users = []
        for item in list:
            vo.users.append(OrmUtil.to_vo(item, OrgDTO))
        return vo

    async def insert(self,  bo: PostDTO):
        main = self.model(**bo.model_dump(exclude={'users'}))
        if not main.id:
            main.id = "p" + str(IdUtil.generate_id())
        if not main.tier:
            if not main.depid:
                main.tier = main.id
            else:
                tier = (await self.db.execute(select(SysOrgDept.tier).where(SysOrgDept.id == main.depid))).scalars().first()
                main.tier = tier + "_" + main.id
        self.db.add(main)
        for user in bo.users:
            self.db.add(SysOrgPostOrg(pid=main.id,oid=user.id))
        org = SysOrg(id=main.id, name=main.name, type=2)
        self.db.add(org)
        await self.db.commit()

    async def update(self,  bo: PostDTO):
        main_dict= bo.model_dump()
        main_dict['uptim'] = datetime.now()
        if not main_dict['depid']:
            main_dict['tier'] = main_dict['id']
        else:
            tier = (await self.db.execute(
                select(SysOrgDept.tier).where(SysOrgDept.id == main_dict['depid']))).scalars().first()
            main_dict['tier'] = tier + "_" + main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        await self.db.execute(delete(SysOrgPostOrg).where(SysOrgPostOrg.pid==main_dict['id']))
        for user in bo.users:
            self.db.add(SysOrgPostOrg(pid=main_dict['id'], oid=user.id))
        org = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysOrg), [org])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(SysOrgPostOrg).where((SysOrgPostOrg.pid.in_(ids.split(',')))))
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysOrg).where(SysOrg.id.in_(ids.split(','))))
        await self.db.commit()
