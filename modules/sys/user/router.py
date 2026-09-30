from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from common.config.get_db import get_db
from modules.sys.org.model import SysOrg
from modules.sys.user.model import SysUser, UserDTO, UserQueryBo
from modules.sys.user.service import SysUserService
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/user", tags=["actor"])


async def get_service(db=Depends(get_db)) -> SysUserService:
    return SysUserService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: UserQueryBo = Depends(UserQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysUser.id, SysUser.name, SysUser.username, SysUser.avtag, SysUser.crtim,SysOrg.name.label('orgna'))
        .join(SysOrg, SysOrg.id == SysUser.orgid)
        .where(SysUser.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysUser.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=UserDTO)
async def info(id: str, service: SysUserService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: UserDTO, service: SysUserService = Depends(get_service)):
    await service.insert(SysUser(**bo.model_dump()))
    return ResponseUtil.success()


@router.put('')
async def put(bo: UserDTO, service: SysUserService = Depends(get_service)):
    await service.update(bo.model_dump(exclude_unset=True))
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysUserService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()
