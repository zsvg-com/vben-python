from datetime import datetime

from sqlalchemy import select, update, delete

from admin.demo.single.cate.model import DemoSingleCate, SingleCateDTO
from modules.sys.org.model import SysOrg
from modules.sys.org.utils import OrmUtil
from common.utils.id_util import IdUtil


class DemoSingleCateService:

    def __init__(self, db):
        self.db = db
        self.model = DemoSingleCate

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, SingleCateDTO)
        if main.cruid is not None:
            vo.cruna = await self.db.execute(select(SysOrg.name).where(self.model.id == main.cruid)).scalars().first()
        if main.upuid is not None:
            vo.upuna = await self.db.execute(select(SysOrg.name).where(self.model.id == main.upuid)).scalars().first()
        return vo

    async def insert(self, bo: SingleCateDTO):
        id = IdUtil.generate_id()
        main = self.model(**bo.model_dump(exclude_unset=True))
        main.id = id
        self.db.add(main)
        await self.db.commit()
        return id

    async def update(self, bo: SingleCateDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        bo.uptim = datetime.now()
        await self.db.execute(update(self.model), [main_dict])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.commit()
