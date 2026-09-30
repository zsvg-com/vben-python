from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from admin.demo.single.cate.model import DemoSingleCate, SingleCateDTO, SingleCateQueryBo
from admin.demo.single.cate.service import DemoSingleCateService
from common.config.get_db import get_db
from common.entity.base import R
from common.utils.response_util import ResponseUtil
from common.utils.utils import TreeUtil
from modules.sys.org.model import TreeVo

router = APIRouter(prefix="/demo/singlec", tags=["singlec"])


async def get_service(db=Depends(get_db)) -> DemoSingleCateService:
    return DemoSingleCateService(db)


@router.get('/info/{id}')
async def info(id: str, service: DemoSingleCateService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)


@router.get('/tree')
async def get(id: str = None, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(DemoSingleCate.id, DemoSingleCate.name, DemoSingleCate.pid)
                              .where(DemoSingleCate.id != id if id else True))
    treeList = [TreeVo(id=node.id, name=node.name, pid=node.pid) for node in result.all()]
    tree = TreeUtil.build_tree(treeList, pid=None)
    return R.data(tree)


@router.get('/list')
async def get(bo: SingleCateQueryBo = Depends(SingleCateQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(DemoSingleCate)
        .where(DemoSingleCate.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(DemoSingleCate.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)


@router.post('')
async def post(bo: SingleCateDTO, service: DemoSingleCateService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: SingleCateDTO, service: DemoSingleCateService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: DemoSingleCateService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
