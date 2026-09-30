from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from admin.demo.link.main.model import LinkDTO, LinkQueryBo, DemoLink
from admin.demo.link.main.service import DemoLinkService
from common.config.get_db import get_db
from common.entity.base import R
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/demo/link", tags=["link"])
@router.get("/", response_model=PageResponseModel)

async def get_service(db=Depends(get_db)) -> DemoLinkService:
    return DemoLinkService(db)

@router.get('', response_model=PageResponseModel)
async def get(bo: LinkQueryBo = Depends(LinkQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(DemoLink.id, DemoLink.name, DemoLink.notes,DemoLink.crtim,DemoLink.uptim)
        .where(DemoLink.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(DemoLink.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/info/{id}')
async def info(id: str, service: DemoLinkService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.post('')
async def post(bo: LinkDTO, service: DemoLinkService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: LinkDTO, service: DemoLinkService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: DemoLinkService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
