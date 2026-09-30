from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from common.config.get_db import get_db
from common.entity.base import R
from modules.sys.api.model import ApiDTO, ApiQueryBo, SysApi
from modules.sys.api.service import SysApiService
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/api", tags=["perm"])

async def get_service(db=Depends(get_db)) -> SysApiService:
    return SysApiService(db)

@router.get('', response_model=PageResponseModel)
async def get(bo: ApiQueryBo = Depends(ApiQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysApi.id, SysApi.name, SysApi.notes,SysApi.perm, SysApi.avtag, SysApi.crtim)
        .where(SysApi.name.like(f'%{bo.name}%') if bo.name else True)
        .where(SysApi.menid==bo.menid if bo.menid else True)
        .order_by(SysApi.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/info/{id}')
async def info(id: str, service: SysApiService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.post('')
async def post(bo: ApiDTO, service: SysApiService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: ApiDTO, service: SysApiService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: SysApiService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
