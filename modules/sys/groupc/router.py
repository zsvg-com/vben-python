from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from common.config.get_db import get_db
from modules.sys.dept.model import TreeVo
from modules.sys.org.base import R
from modules.sys.org.utils import TreeUtil
from modules.sys.groupc.model import SysGroupCate, GroupcDTO
from modules.sys.groupc.service import SysGroupCateService

router = APIRouter(prefix="/sys/groupc", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysGroupCateService:
    return SysGroupCateService(db)


@router.get('/info/{id}')
async def info(id: str, service: SysGroupCateService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(SysGroupCate.id, SysGroupCate.name, SysGroupCate.pid)
                              .where(SysGroupCate.id != id if id else True))
    treeList = [TreeVo(id=node.id, name=node.name, pid=node.pid) for node in result.all()]
    tree = TreeUtil.build_tree(treeList,pid=None)
    return R.data(tree)

@router.post('')
async def post(bo: GroupcDTO, service: SysGroupCateService = Depends(get_service)):
    id = await service.insert(SysGroupCate(**bo.model_dump()))
    return R.data(id)


@router.put('')
async def put(bo: GroupcDTO, service: SysGroupCateService = Depends(get_service)):
    await service.update(bo.model_dump(exclude_unset=True))
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: SysGroupCateService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
