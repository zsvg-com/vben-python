from datetime import datetime

from sqlalchemy import select, update, delete

from modules.base.sys.org.dept.model import SysOrgDept
from modules.base.sys.org.root.model import SysOrg
from modules.base.sys.org.user.model import SysOrgUser
from utils.id_util import IdUtil


class SysOrgUserService:

    def __init__(self, db):
        self.db = db
        self.model = SysOrgUser

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        return main

    async def insert(self,  main: SysOrgUser):
        if not main.id:
            main.id = "u" + str(IdUtil.generate_id())
        if not main.tier:
            if not main.depid:
                main.tier = main.id
            else:
                tier = (await self.db.execute(select(SysOrgDept.tier).where(SysOrgDept.id == main.depid))).scalars().first()
                main.tier = tier + "_" + main.id
        self.db.add(main)
        org = SysOrg(id=main.id, name=main.name, type=2)
        self.db.add(org)
        await self.db.commit()

    async def update(self,  main_dict: dict):
        main_dict['uptim'] = datetime.now()
        if not main_dict['depid']:
            main_dict['tier'] = main_dict['id']
        else:
            tier = (await self.db.execute(select(SysOrgDept.tier).where(SysOrgDept.id == main_dict['depid']))).scalars().first()
            main_dict['tier'] = tier + "_" +  main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        org = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysOrg), [org])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysOrg).where(SysOrg.id.in_(ids.split(','))))
        await self.db.commit()
