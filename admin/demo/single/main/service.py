from datetime import datetime

from sqlalchemy import select, update, delete

from admin.demo.single.main.model import SingleDTO, DemoSingle
from common.utils.id_util import IdUtil
from common.utils.utils import OrmUtil
from modules.sys.actor.model import SysActor


class DemoSingleService:

    def __init__(self, db):
        self.db = db
        self.model = DemoSingle

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, SingleDTO)
        if main.cruid is not None:
            vo.cruna = await self.db.execute(select(SysActor.name).where(self.model.id == main.cruid)).scalars().first()
        if main.upuid is not None:
            vo.upuna = await self.db.execute(select(SysActor.name).where(self.model.id == main.upuid)).scalars().first()
        return vo

    async def insert(self, bo: SingleDTO):
        id = IdUtil.generate_id()
        main = self.model(**bo.model_dump(exclude_unset=True))
        main.id = id
        self.db.add(main)
        await self.db.commit()
        return id

    async def update(self, bo: SingleDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        bo.uptim = datetime.now()
        await self.db.execute(update(self.model), [main_dict])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.commit()
