# from datetime import datetime, time
# from fastapi import APIRouter, Depends
# from pydantic_validation_decorator import ValidateFields
# from sqlalchemy import select
# from sqlalchemy.ext.asyncio import AsyncSession
# from config.get_db import get_db
#
# from modules.base.sys.notice.model import SysNoticeBo, SysNotice, NoticeQueryBo
# from modules.base.sys.notice.service import SysNoticeService
# from utils.log_util import logger
# from utils.page_util import PageResponseModel, PageUtil
# from utils.response_util import ResponseUtil
#
#
# # noticeController = APIRouter(prefix='/sys', dependencies=[Depends(LoginService.get_current_user)])
# noticeRoute = APIRouter(prefix="/sys/notice", tags=["notice"])
#
# @noticeRoute.get('', response_model=PageResponseModel)
# async def get_system_notice_list(
#     query_bo: NoticeQueryBo=Depends(NoticeQueryBo.as_query),
#     query_db: AsyncSession = Depends(get_db)
# ):
#     query = (
#         select(SysNotice)
#         .where(
#             SysNotice.name.like(f'%{query_bo.name}%') if query_bo.name else True,
#             SysNotice.crtim.between(
#                 datetime.combine(datetime.strptime(query_bo.begin_time, '%Y-%m-%d'), time(00, 00, 00)),
#                 datetime.combine(datetime.strptime(query_bo.end_time, '%Y-%m-%d'), time(23, 59, 59)),
#             )
#             if query_bo.begin_time and query_bo.end_time
#             else True,
#         )
#         .order_by(SysNotice.id)
#         .distinct()
#     )
#     notice_list = await PageUtil.paginate(query_db, query, query_bo.pageNum, query_bo.pageSize, True)
#     return ResponseUtil.success(model_content=notice_list)
#
#
# # @noticeRoute.post('/sys/notice')
# # @ValidateFields(validate_model='add_notice')
# # @Log(title='通知公告', business_type=BusinessType.INSERT)
# # async def put(
# #     request: Request,
# #     add_notice: SysNotice,
# #     query_db: AsyncSession = Depends(get_db),
# #     current_user: CurrentUserModel = Depends(LoginService.get_current_user),
# # ):
# #     add_notice.create_by = current_user.user.user_name
# #     add_notice.create_time = datetime.now()
# #     add_notice.update_by = current_user.user.user_name
# #     add_notice.update_time = datetime.now()
# #     add_notice_result = await SysNoticeService.insert(query_db, add_notice)
# #     logger.info(add_notice_result.message)
# #
# #     return ResponseUtil.success(msg=add_notice_result.message)
#
# @noticeRoute.post('')
# async def post(bo: SysNoticeBo,query_db: AsyncSession = Depends(get_db)):
#     bo.crtim = datetime.now()
#     bo.uptim = datetime.now()
#     entity = SysNotice(**bo.model_dump())
#     add_notice_result = await SysNoticeService.insert(query_db, entity)
#     logger.info(add_notice_result.message)
#
#     return ResponseUtil.success(msg=add_notice_result.message)
#
#
# # @noticeController.put('', dependencies=[Depends(CheckUserInterfaceAuth('system:notice:edit'))])
# # @ValidateFields(validate_model='edit_notice')
# # @Log(title='通知公告', business_type=BusinessType.UPDATE)
# # async def edit_system_notice(
# #     request: Request,
# #     edit_notice: NoticeModel,
# #     query_db: AsyncSession = Depends(get_db),
# #     current_user: CurrentUserModel = Depends(LoginService.get_current_user),
# # ):
# #     edit_notice.update_by = current_user.user.user_name
# #     edit_notice.update_time = datetime.now()
# #     edit_notice_result = await NoticeService.edit_notice_services(query_db, edit_notice)
# #     logger.info(edit_notice_result.message)
# #
# #     return ResponseUtil.success(msg=edit_notice_result.message)
#
# #
# # @noticeController.delete('/{notice_ids}', dependencies=[Depends(CheckUserInterfaceAuth('system:notice:remove'))])
# # @Log(title='通知公告', business_type=BusinessType.DELETE)
# # async def delete_system_notice(request: Request, notice_ids: str, query_db: AsyncSession = Depends(get_db)):
# #     delete_notice = DeleteNoticeModel(noticeIds=notice_ids)
# #     delete_notice_result = await NoticeService.delete_notice_services(query_db, delete_notice)
# #     logger.info(delete_notice_result.message)
# #
# #     return ResponseUtil.success(msg=delete_notice_result.message)
#
# #
# # @noticeController.get(
# #     '/{notice_id}', response_model=NoticeModel, dependencies=[Depends(CheckUserInterfaceAuth('system:notice:query'))]
# # )
# # async def query_detail_system_post(request: Request, notice_id: int, query_db: AsyncSession = Depends(get_db)):
# #     notice_detail_result = await NoticeService.notice_detail_services(query_db, notice_id)
# #     logger.info(f'获取notice_id为{notice_id}的信息成功')
# #
# #     return ResponseUtil.success(data=notice_detail_result)
