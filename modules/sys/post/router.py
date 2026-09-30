from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from common.config.get_db import get_db
from modules.sys.org.model import SysOrg
from modules.sys.post.model import SysPost, PostDTO, PostQueryBo
from modules.sys.post.service import SysPostService
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/post", tags=["actor"])


async def get_service(db=Depends(get_db)) -> SysPostService:
    return SysPostService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: PostQueryBo = Depends(PostQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysPost.id, SysPost.name, SysPost.crtim,SysPost.notes,SysOrg.name.label('orgna'))
        .join(SysOrg, SysOrg.id == SysPost.orgid)
        .where(SysPost.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysPost.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=PostDTO)
async def info(id: str, service: SysPostService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: PostDTO, service: SysPostService = Depends(get_service)):
    await service.insert(bo)
    return ResponseUtil.success()


@router.put('')
async def put(bo: PostDTO, service: SysPostService = Depends(get_service)):
    await service.update(bo)
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysPostService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()
