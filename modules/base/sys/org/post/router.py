from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from config.get_db import get_db
from modules.base.sys.org.dept.model import SysOrgDept
from modules.base.sys.org.post.model import SysOrgPost, PostDTO, PostQueryBo
from modules.base.sys.org.post.service import SysOrgPostService
from modules.base.sys.org.root.model import pydantic_to_sqlalchemy
from utils.page_util import PageResponseModel, PageUtil
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/org/post", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysOrgPostService:
    return SysOrgPostService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: PostQueryBo = Depends(PostQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrgPost.id, SysOrgPost.name, SysOrgPost.crtim,SysOrgPost.notes,SysOrgDept.name.label('depna'))
        .join(SysOrgDept, SysOrgDept.id == SysOrgPost.depid)
        .where(SysOrgPost.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrgPost.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=PostDTO)
async def info(id: str, service: SysOrgPostService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: PostDTO, service: SysOrgPostService = Depends(get_service)):
    await service.insert(bo)
    return ResponseUtil.success()


@router.put('')
async def put(bo: PostDTO, service: SysOrgPostService = Depends(get_service)):
    await service.update(bo)
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysOrgPostService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()
