from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from config.get_db import get_db
from modules.base.sys.org.dept.model import TreeVo
from modules.base.sys.org.root.base import R
from modules.base.sys.org.root.utils import TreeUtil
from modules.base.sys.org.groupc.model import SysOrgGroupCate, GroupcDTO
from modules.base.sys.org.groupc.service import SysOrgGroupCateService

router = APIRouter(prefix="/sys/org/groupc", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysOrgGroupCateService:
    return SysOrgGroupCateService(db)


@router.get('/info/{id}')
async def info(id: str, service: SysOrgGroupCateService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(SysOrgGroupCate.id, SysOrgGroupCate.name, SysOrgGroupCate.pid)
                              .where(SysOrgGroupCate.id != id if id else True))
    treeList = [TreeVo(id=node.id, name=node.name, pid=node.pid) for node in result.all()]
    tree = TreeUtil.build_tree(treeList,pid=None)
    return R.data(tree)

@router.post('')
async def post(bo: GroupcDTO, service: SysOrgGroupCateService = Depends(get_service)):
    id = await service.insert(SysOrgGroupCate(**bo.model_dump()))
    return R.data(id)


@router.put('')
async def put(bo: GroupcDTO, service: SysOrgGroupCateService = Depends(get_service)):
    await service.update(bo.model_dump(exclude_unset=True))
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: SysOrgGroupCateService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
