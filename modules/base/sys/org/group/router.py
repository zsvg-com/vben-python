from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from config.get_db import get_db
from modules.base.sys.org.group.model import GroupQueryBo, SysOrgGroup, GroupDTO
from modules.base.sys.org.group.service import SysOrgGroupService
from utils.page_util import PageResponseModel, PageUtil
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/org/group", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysOrgGroupService:
    return SysOrgGroupService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: GroupQueryBo = Depends(GroupQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrgGroup.id, SysOrgGroup.name, SysOrgGroup.crtim,SysOrgGroup.notes)
        .where(SysOrgGroup.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrgGroup.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=GroupDTO)
async def info(id: str, service: SysOrgGroupService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: GroupDTO, service: SysOrgGroupService = Depends(get_service)):
    await service.insert(bo)
    return ResponseUtil.success()


@router.put('')
async def put(bo: GroupDTO, service: SysOrgGroupService = Depends(get_service)):
    await service.update(bo)
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysOrgGroupService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()
