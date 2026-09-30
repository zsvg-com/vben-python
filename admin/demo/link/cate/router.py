from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from admin.demo.link.cate.model import DemoLinkCate, LinkCateDTO, LinkCateQueryBo
from admin.demo.link.cate.service import DemoLinkCateService
from common.config.get_db import get_db
from common.entity.base import R
from common.utils.response_util import ResponseUtil
from common.utils.utils import TreeUtil
from modules.sys.org.model import TreeVo

router = APIRouter(prefix="/demo/linkc", tags=["linkc"])


async def get_service(db=Depends(get_db)) -> DemoLinkCateService:
    return DemoLinkCateService(db)


@router.get('/info/{id}')
async def info(id: str, service: DemoLinkCateService = Depends(get_service)):
    info = await service.find_info(id)
    return R.data(info)


@router.get('/tree')
async def get(id: str = None, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(DemoLinkCate.id, DemoLinkCate.name, DemoLinkCate.pid)
                              .where(DemoLinkCate.id != id if id else True))
    treeList = [TreeVo(id=node.id, name=node.name, pid=node.pid) for node in result.all()]
    tree = TreeUtil.build_tree(treeList, pid=None)
    return R.data(tree)


@router.get('/list')
async def get(bo: LinkCateQueryBo = Depends(LinkCateQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(DemoLinkCate)
        .where(DemoLinkCate.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(DemoLinkCate.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)


@router.post('')
async def post(bo: LinkCateDTO, service: DemoLinkCateService = Depends(get_service)):
    id = await service.insert(bo)
    return R.data(id)

@router.put('')
async def put(bo: LinkCateDTO, service: DemoLinkCateService = Depends(get_service)):
    await service.update(bo)
    return R.data(bo.id)


@router.delete('/{ids}')
async def delete(ids: str, service: DemoLinkCateService = Depends(get_service)):
    await service.delete(ids)
    return R.success()
