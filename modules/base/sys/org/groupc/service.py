from sqlalchemy import select, update, delete

from modules.base.sys.org.groupc.model import SysOrgGroupCate, GroupcDTO
from modules.base.sys.org.root.utils import OrmUtil
from utils.id_util import IdUtil


class SysOrgGroupCateService:

    def __init__(self, db):
        self.db = db
        self.model = SysOrgGroupCate

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id==id))).scalars().first()
        return OrmUtil.to_vo(main, GroupcDTO)
        # return main

    async def insert(self,  main: SysOrgGroupCate):
        id = str(IdUtil.generate_id())
        main.id = id
        self.db.add(main)
        await self.db.commit()
        return id

    async def update(self,  main: dict):
        # # 移除id字段，避免更新id
        await self.db.execute(update(self.model), [main])
        await self.db.commit()

    async def delete(self, ids: str):
        # # 移除id字段，避免更新id
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.commit()
