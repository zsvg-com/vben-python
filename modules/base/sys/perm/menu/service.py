from sqlalchemy import select, update, delete

from modules.base.sys.org.root.utils import OrmUtil
from modules.base.sys.perm.menu.model import SysPermMenu, MenuDTO
from utils.id_util import IdUtil


class SysPermMenuService:

    def __init__(self, db):
        self.db = db
        self.model = SysPermMenu

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, MenuDTO)
        return vo

    async def insert(self, bo: MenuDTO):
        id = IdUtil.generate_id()
        main = self.model(**bo.model_dump())
        main.id = id
        if main.pid is None:
            main.pid = 0
        self.db.add(main)
        await self.db.commit()
        return id

    async def update(self, bo: MenuDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        await self.db.execute(update(self.model), [main_dict])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.commit()
