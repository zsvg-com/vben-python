from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from config.get_db import get_db
from modules.base.sys.org.dept.model import TreeVo
from modules.base.sys.org.root.base import R
from modules.base.sys.org.root.utils import TreeUtil
from modules.base.sys.perm.menu.model import SysPermMenu, MenuDTO, MenuQueryBo
from modules.base.sys.perm.menu.service import SysPermMenuService
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/perm/menu", tags=["perm"])


async def get_service(db=Depends(get_db)) -> SysPermMenuService:
    return SysPermMenuService(db)

@router.get('/list')
async def get(bo: MenuQueryBo = Depends(MenuQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysPermMenu)
        .where(SysPermMenu.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysPermMenu.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)

@router.get('/info/{id}')
async def info(id: str, service: SysPermMenuService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(SysPermMenu.id, SysPermMenu.name, SysPermMenu.pid)
                              .where(SysPermMenu.id != id if id else True))
    treeList = [TreeVo(id=node.id, name=node.name, pid=node.pid) for node in result.all()]
    tree = TreeUtil.build_tree(treeList)
    return R.data(tree)

@router.post('')
async def post(bo: MenuDTO, service: SysPermMenuService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: MenuDTO, service: SysPermMenuService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: SysPermMenuService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
