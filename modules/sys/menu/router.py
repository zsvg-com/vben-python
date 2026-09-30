from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from common.config.get_db import get_db
from common.entity.base import R
from common.utils.utils import TreeUtil
from modules.sys.org.model import TreeVo
from modules.sys.menu.model import SysMenu, MenuDTO, MenuQueryBo
from modules.sys.menu.service import SysMenuService
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/menu", tags=["perm"])


async def get_service(db=Depends(get_db)) -> SysMenuService:
    return SysMenuService(db)

@router.get('/list')
async def get(bo: MenuQueryBo = Depends(MenuQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysMenu)
        .where(SysMenu.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysMenu.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)

@router.get('/info/{id}')
async def info(id: str, service: SysMenuService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(SysMenu.id, SysMenu.name, SysMenu.pid)
                              .where(SysMenu.id != id if id else True))
    treeList = [TreeVo(id=node.id, name=node.name, pid=node.pid) for node in result.all()]
    tree = TreeUtil.build_tree(treeList)
    return R.data(tree)

@router.post('')
async def post(bo: MenuDTO, service: SysMenuService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: MenuDTO, service: SysMenuService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: SysMenuService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
