from sqlalchemy import select, update, delete

from module_admin.entity.vo.common_vo import CrudResponseModel
from modules.base.sys.notice.model import SysNotice
from utils.id_util import IdUtil


class SysNoticeService:

    def __init__(self, db):
        self.db = db

    async def find_info(self, id: int):
        main = (await self.db.execute(select(SysNotice).where(SysNotice.id == id))).scalars().first()
        return main

    async def insert(self,  main: SysNotice):
        main.id = IdUtil.generate_id()
        main.ornum = 1
        main.avtag = True
        main.type = 1
        self.db.add(main)
        await self.db.commit()

    async def update(self,  main: dict):
        # # 移除id字段，避免更新id
        await self.db.execute(update(SysNotice), [main])
        await self.db.commit()

    async def delete(self, ids: str):
        # # 移除id字段，避免更新id
        # await self.db.execute(delete(SysNotice).where(SysNotice.id in ids.split(',')))
        await self.db.execute(delete(SysNotice).where(SysNotice.id.in_(ids.split(','))))
        await self.db.commit()

    async def insert3(self,  main: SysNotice):
        try:
            main.id = IdUtil.generate_id()
            main.ornum = 1
            main.avtag = True
            main.type = 1
            self.db.add(main)

            main2 = SysNotice()
            main2.id = IdUtil.generate_id()
            main2.name = ("fdasfdasffdasfdasfdafdasfdasfffdasfdasffdasfdasfdafdasfdasffdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfddasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfd"
                          "asfdasfdasfdasfdasfdasfdasfdasffdasfdasffdasfdasfdafdasfdasffdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfddasfdasfdasfdasfdasfdasfdasfdasfdasfdasdasfdasfd"
                          "assfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasdasfdasfdas")
            main2.ornum = 1
            main2.avtag = True
            main2.type = 1
            self.db.add(main2)

            await self.db.commit()
            return CrudResponseModel(is_success=True, message='新增成功')
        except Exception as e:
            await self.db.rollback()
            raise e

    async def insert2(self,  main: SysNotice):
        main.id = IdUtil.generate_id()
        main.ornum = 1
        main.avtag = True
        main.type = 1
        self.db.add(main)

        main2 = SysNotice()
        main2.id = IdUtil.generate_id()
        main2.name = (
            "fdasfdasffdasfdasfdafdasfdasfffdasfdasffdasfdasfdafdasfdasffdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfddasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfd"
            "asfdasfdasfdasfdasfdasfdasfdasffdasfdasffdasfdasfdafdasfdasffdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfddasfdasfdasfdasfdasfdasfdasfdasfdasfdasdasfdasfd"
            "assfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasdasfdasfdas")
        main2.ornum = 1
        main2.avtag = True
        main2.type = 1
        self.db.add(main2)
        await self.db.commit()
        # await self.db.flush()
