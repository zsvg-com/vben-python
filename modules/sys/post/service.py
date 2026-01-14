from datetime import datetime

from sqlalchemy import select, update, delete

from modules.sys.dept.model import SysDept
from modules.sys.post.model import SysPost, PostDTO, SysPostOrg
from modules.sys.org.model import SysOrg, OrgDTO
from modules.sys.org.utils import OrmUtil
from common.utils.id_util import IdUtil


class SysPostService:

    def __init__(self, db):
        self.db = db
        self.model = SysPost

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, PostDTO)
        query = select(SysOrg).join(SysPostOrg, SysPostOrg.oid == SysOrg.id).where(SysPostOrg.pid==main.id)
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
                tier = (await self.db.execute(select(SysDept.tier).where(SysDept.id == main.depid))).scalars().first()
                main.tier = tier + "_" + main.id
        self.db.add(main)
        for user in bo.users:
            self.db.add(SysPostOrg(pid=main.id,oid=user.id))
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
                select(SysDept.tier).where(SysDept.id == main_dict['depid']))).scalars().first()
            main_dict['tier'] = tier + "_" + main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        await self.db.execute(delete(SysPostOrg).where(SysPostOrg.pid==main_dict['id']))
        for user in bo.users:
            self.db.add(SysPostOrg(pid=main_dict['id'], oid=user.id))
        org = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysOrg), [org])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(SysPostOrg).where((SysPostOrg.pid.in_(ids.split(',')))))
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysOrg).where(SysOrg.id.in_(ids.split(','))))
        await self.db.commit()
