from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from admin.demo.single.main.model import SingleQueryBo, SingleDTO, DemoSingle
from admin.demo.single.main.service import DemoSingleService
from common.config.get_db import get_db
from common.entity.base import R
# from modules.sys.config.model import ConfigQueryBo, SysConfig, ConfigDTO
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/demo/single", tags=["single"])
@router.get("/", response_model=PageResponseModel)

async def get_service(db=Depends(get_db)) -> DemoSingleService:
    return DemoSingleService(db)

@router.get('', response_model=PageResponseModel)
async def get(bo: SingleQueryBo = Depends(SingleQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(DemoSingle.id, DemoSingle.name, DemoSingle.notes,DemoSingle.crtim,DemoSingle.uptim)
        .where(DemoSingle.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(DemoSingle.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/info/{id}')
async def info(id: str, service: DemoSingleService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.post('')
async def post(bo: SingleDTO, service: DemoSingleService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: SingleDTO, service: DemoSingleService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: DemoSingleService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
