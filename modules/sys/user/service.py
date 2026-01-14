from datetime import datetime

from sqlalchemy import select, update, delete

from modules.sys.dept.model import SysDept
from modules.sys.org.model import SysOrg
from modules.sys.user.model import SysUser
from common.utils.id_util import IdUtil


class SysUserService:

    def __init__(self, db):
        self.db = db
        self.model = SysUser

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        return main

    async def insert(self,  main: SysUser):
        if not main.id:
            main.id = "u" + str(IdUtil.generate_id())
        if not main.tier:
            if not main.depid:
                main.tier = main.id
            else:
                tier = (await self.db.execute(select(SysDept.tier).where(SysDept.id == main.depid))).scalars().first()
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
            tier = (await self.db.execute(select(SysDept.tier).where(SysDept.id == main_dict['depid']))).scalars().first()
            main_dict['tier'] = tier + "_" +  main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        org = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysOrg), [org])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysOrg).where(SysOrg.id.in_(ids.split(','))))
        await self.db.commit()
