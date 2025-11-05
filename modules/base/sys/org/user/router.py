from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from config.get_db import get_db
from modules.base.sys.org.dept.model import SysOrgDept
from modules.base.sys.org.user.model import SysOrgUser, UserDTO, UserQueryBo
from modules.base.sys.org.user.service import SysOrgUserService
from utils.page_util import PageResponseModel, PageUtil
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/org/user", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysOrgUserService:
    return SysOrgUserService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: UserQueryBo = Depends(UserQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrgUser.id, SysOrgUser.name, SysOrgUser.usnam, SysOrgUser.avtag, SysOrgUser.crtim,SysOrgDept.name.label('depna'))
        .join(SysOrgDept, SysOrgDept.id == SysOrgUser.depid)
        .where(SysOrgUser.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrgUser.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)


@router.get('/info/{id}', response_model=UserDTO)
async def info(id: str, service: SysOrgUserService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: UserDTO, service: SysOrgUserService = Depends(get_service)):
    await service.insert(SysOrgUser(**bo.model_dump()))
    return ResponseUtil.success()


@router.put('')
async def put(bo: UserDTO, service: SysOrgUserService = Depends(get_service)):
    await service.update(bo.model_dump(exclude_unset=True))
    return ResponseUtil.success()


@router.delete('/{ids}')
async def delete(ids: str, service: SysOrgUserService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()
