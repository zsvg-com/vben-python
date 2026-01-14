from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from common.config.get_db import get_db
from modules.sys.role.model import RoleDTO, SysRole, RoleQueryBo
from modules.sys.role.service import SysRoleService
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/role", tags=["perm"])


async def get_service(db=Depends(get_db)) -> SysRoleService:
    return SysRoleService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: RoleQueryBo = Depends(RoleQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysRole.id, SysRole.name, SysRole.crtim,SysRole.notes)
        .where(SysRole.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysRole.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=RoleDTO)
async def info(id: str, service: SysRoleService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: RoleDTO, service: SysRoleService = Depends(get_service)):
    await service.insert(bo)
    return ResponseUtil.success()


@router.put('')
async def put(bo: RoleDTO, service: SysRoleService = Depends(get_service)):
    await service.update(bo)
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysRoleService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()

@router.get('/perms')
async def info(service: SysRoleService = Depends(get_service)):
    data = await service.find_menu_list()
    return ResponseUtil.success(data=data)