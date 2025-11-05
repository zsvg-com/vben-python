from sqlalchemy import select, update, delete

from modules.base.sys.org.group.model import SysOrgGroup, GroupDTO, SysOrgGroupOrg
from modules.base.sys.org.root.model import SysOrg, OrgDTO
from modules.base.sys.org.root.utils import OrmUtil
from utils.id_util import IdUtil


class SysOrgGroupService:

    def __init__(self, db):
        self.db = db
        self.model = SysOrgGroup

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, GroupDTO)
        query = select(SysOrg).join(SysOrgGroupOrg, SysOrgGroupOrg.oid == SysOrg.id).where(SysOrgGroupOrg.gid == main.id)
        list = (await self.db.execute(query)).scalars().all()
        vo.members = []
        for item in list:
            vo.members.append(OrmUtil.to_vo(item, OrgDTO))
        return vo


    async def insert(self,  bo: GroupDTO):
        main = self.model(**bo.model_dump(exclude={'members'}))
        main.id = str(IdUtil.generate_id())
        self.db.add(main)
        for user in bo.members:
            self.db.add(SysOrgGroupOrg(gid=main.id,oid=user.id))
        org = SysOrg(id=main.id, name=main.name, type=1)
        self.db.add(org)
        await self.db.commit()


    async def update(self,  bo: GroupDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        await self.db.execute(update(self.model), [main_dict])
        await self.db.execute(delete(SysOrgGroupOrg).where(SysOrgGroupOrg.gid == main_dict['id']))
        for user in bo.members:
            self.db.add(SysOrgGroupOrg(gid=main_dict['id'], oid=user.id))
        org = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysOrg), [org])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(SysOrgGroupOrg).where((SysOrgGroupOrg.gid.in_(ids.split(',')))))
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysOrg).where(SysOrg.id.in_(ids.split(','))))
        await self.db.commit()
