from sqlalchemy import delete, select, update
from sqlalchemy.ext.asyncio import AsyncSession

from modules.sys.notice.model import SysNotice
from common.utils.id_util import IdUtil


class SysNoticeDao:
    """
    通知公告管理模块数据库操作层
    """

    @classmethod
    async def find_by_id(cls, db: AsyncSession, id: str):
        return (await db.execute(select(SysNotice).where(SysNotice.id == id))).scalars().first()

    @classmethod
    async def insert(cls, db: AsyncSession, dept: SysNotice):
        """
        新增通知公告数据库操作

        :param db: orm对象
        :param notice: 通知公告对象
        :return:
        """
        dept.id = IdUtil.generate_id()
        dept.ornum = 1
        dept.avtag = True
        dept.type = 1
        db.add(dept)
        await db.commit()
        # await db.flush()

        return dept

    @classmethod
    async def update(cls, db: AsyncSession, dept: dict):
        """
        编辑通知公告数据库操作

        :param db: orm对象
        :param notice: 需要更新的通知公告字典
        :return:
        """
        await db.execute(update(SysNotice), [dept])

    @classmethod
    async def delete(cls, db: AsyncSession, dept: SysNotice):
        """
        删除通知公告数据库操作
        """
        await db.execute(delete(SysNotice).where(SysNotice.id.in_([dept.id])))

    # @classmethod
    # async def get_notice_list(cls, db: AsyncSession, query_object: NoticePageQueryModel, is_page: bool = False):
    #     """
    #     根据查询参数获取通知公告列表信息
    #
    #     :param db: orm对象
    #     :param query_object: 查询参数对象
    #     :param is_page: 是否开启分页
    #     :return: 通知公告列表信息对象
    #     """
    #     query = (
    #         select(SysNotice)
    #         .where(
    #             SysNotice.notice_title.like(f'%{query_object.notice_title}%') if query_object.notice_title else True,
    #             SysNotice.create_by.like(f'%{query_object.create_by}%') if query_object.create_by else True,
    #             SysNotice.notice_type == query_object.notice_type if query_object.notice_type else True,
    #             SysNotice.create_time.between(
    #                 datetime.combine(datetime.strptime(query_object.begin_time, '%Y-%m-%d'), time(00, 00, 00)),
    #                 datetime.combine(datetime.strptime(query_object.end_time, '%Y-%m-%d'), time(23, 59, 59)),
    #             )
    #             if query_object.begin_time and query_object.end_time
    #             else True,
    #         )
    #         .order_by(SysNotice.notice_id)
    #         .distinct()
    #     )
    #     notice_list = await PageUtil.paginate(db, query, query_object.page_num, query_object.page_size, is_page)
    #
    #     return notice_list
