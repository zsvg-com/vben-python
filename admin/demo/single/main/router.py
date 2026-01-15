from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from admin.demo.single.main.model import SingleQueryBo, SingleDTO, DemoSingleMain
from admin.demo.single.main.service import DemoSingleMainService
from common.config.get_db import get_db
# from modules.sys.config.model import ConfigQueryBo, SysConfig, ConfigDTO
from modules.sys.org.base import R
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/demo/single/main", tags=["single"])
@router.get("/", response_model=PageResponseModel)

async def get_service(db=Depends(get_db)) -> DemoSingleMainService:
    return DemoSingleMainService(db)

@router.get('', response_model=PageResponseModel)
async def get(bo: SingleQueryBo = Depends(SingleQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(DemoSingleMain.id, DemoSingleMain.name, DemoSingleMain.notes,DemoSingleMain.crtim,DemoSingleMain.uptim)
        .where(DemoSingleMain.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(DemoSingleMain.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/info/{id}')
async def info(id: str, service: DemoSingleMainService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.post('')
async def post(bo: SingleDTO, service: DemoSingleMainService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: SingleDTO, service: DemoSingleMainService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: DemoSingleMainService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
