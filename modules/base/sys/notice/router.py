from datetime import datetime, time
from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from config.database import transactional_session
from config.get_db import get_db

from modules.base.sys.notice.model import SysNoticeBo, SysNotice, NoticeQueryBo, SysNoticeVo
from modules.base.sys.notice.service import SysNoticeService
from utils.log_util import logger
from utils.page_util import PageResponseModel, PageUtil
from utils.response_util import ResponseUtil


# noticeController = APIRouter(prefix='/sys', dependencies=[Depends(LoginService.get_current_user)])
noticeRoute = APIRouter(prefix="/sys/notice", tags=["notice"])

async def get_service(db = Depends(get_db)) -> SysNoticeService:
    return SysNoticeService(db)

@noticeRoute.get('', response_model=PageResponseModel)
async def get(bo: NoticeQueryBo=Depends(NoticeQueryBo.as_query), db: AsyncSession = Depends(get_db)):

    # # 使用 text() 构造 SQL 语句
    # stmt = text("SELECT id, username FROM users WHERE active = :active_val")
    # # 执行查询，并传递参数
    # result = await session.execute(stmt, {"active_val": True})  # 异步执行[citation:2]
    # # 处理结果
    # users = result.mappings().all()  # 获取所有结果，以字典形式返回
    query = (
        select(SysNotice)
        .where(
            SysNotice.name.like(f'%{bo.name}%') if bo.name else True,
            SysNotice.crtim.between(
                datetime.combine(datetime.strptime(bo.begin_time, '%Y-%m-%d'), time(00, 00, 00)),
                datetime.combine(datetime.strptime(bo.end_time, '%Y-%m-%d'), time(23, 59, 59)),
            )
            if bo.begin_time and bo.end_time
            else True,
        )
        .order_by(SysNotice.id)
        .distinct()
    )
    notice_list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(model_content=notice_list)

# @noticeRoute.post('')
# async def post(bo: SysNoticeBo,service: SysNoticeService = Depends(get_service)):
#     bo.crtim = datetime.now()
#     bo.uptim = datetime.now()
#     entity = SysNotice(**bo.model_dump())
#     add_notice_result = await service.insert(entity)
#     logger.info(add_notice_result.message)
#     return ResponseUtil.success(msg=add_notice_result.message)

# @noticeRoute.post('')
# async def post(bo: SysNoticeBo,service: SysNoticeService = Depends(get_service)):
#     async with transactional_session(service.db):
#          service.insert2(SysNotice(**bo.model_dump()))
#     return ResponseUtil.success()

@noticeRoute.get('/info/{id}', response_model=SysNoticeVo)
async def info(id: int, service: SysNoticeService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)

@noticeRoute.post('')
async def post(bo: SysNoticeBo,service: SysNoticeService = Depends(get_service)):
    await service.insert(SysNotice(**bo.model_dump()))
    return ResponseUtil.success()

@noticeRoute.put('')
async def put(bo: SysNoticeBo,service: SysNoticeService = Depends(get_service)):
    await service.update(bo.model_dump(exclude_unset=True))
    return ResponseUtil.success()

@noticeRoute.delete('/{ids}')
async def delete(ids: str,service: SysNoticeService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()