from sqlalchemy import select, update, delete

from modules.base.sys.org.root.utils import OrmUtil
from modules.base.sys.perm.api.model import SysPermApi, ApiDTO
from utils.id_util import IdUtil


class SysPermApiService:

    def __init__(self, db):
        self.db = db
        self.model = SysPermApi

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, ApiDTO)
        return vo

    async def insert(self, bo: ApiDTO):
        id = IdUtil.generate_id()
        main = self.model(**bo.model_dump())
        main.id = id
        self.db.add(main)
        await self.db.commit()
        return id

    async def update(self, bo: ApiDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        await self.db.execute(update(self.model), [main_dict])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.commit()
