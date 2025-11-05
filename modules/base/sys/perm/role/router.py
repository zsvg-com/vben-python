from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from config.get_db import get_db
from modules.base.sys.perm.role.model import RoleDTO, SysPermRole, RoleQueryBo
from modules.base.sys.perm.role.service import SysPermRoleService
from utils.page_util import PageResponseModel, PageUtil
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/perm/role", tags=["perm"])


async def get_service(db=Depends(get_db)) -> SysPermRoleService:
    return SysPermRoleService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: RoleQueryBo = Depends(RoleQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysPermRole.id, SysPermRole.name, SysPermRole.crtim,SysPermRole.notes)
        .where(SysPermRole.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysPermRole.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=RoleDTO)
async def info(id: str, service: SysPermRoleService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: RoleDTO, service: SysPermRoleService = Depends(get_service)):
    await service.insert(bo)
    return ResponseUtil.success()


@router.put('')
async def put(bo: RoleDTO, service: SysPermRoleService = Depends(get_service)):
    await service.update(bo)
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysPermRoleService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()

@router.get('/perms')
async def info(service: SysPermRoleService = Depends(get_service)):
    data = await service.find_menu_list()
    return ResponseUtil.success(data=data)