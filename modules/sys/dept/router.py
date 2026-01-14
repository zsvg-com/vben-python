from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from common.config.get_db import get_db
from modules.sys.dept.model import SysDept, DeptVo, DeptBo, DeptQueryBo, TreeVo
from modules.sys.dept.service import SysDeptService
from modules.sys.org.model import TreeMoveBo
from modules.sys.org.utils import TreeUtil
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/dept", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysDeptService:
    return SysDeptService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: DeptQueryBo = Depends(DeptQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysDept)
        .where(SysDept.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysDept.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/list')
async def get(bo: DeptQueryBo = Depends(DeptQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysDept)
        .where(SysDept.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysDept.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    # query = (
    #     select(SysDept)
    #     .where(SysDept.avtag == True)
    #     .order_by(SysDept.ornum)
    #     .distinct()
    # )
    # list = (await db.execute(query)).scalars().all()
    # tree = TreeUtil.build_tree(list)

    result = await db.execute(select(SysDept.id, SysDept.name, SysDept.pid)
                              .where(SysDept.id != id if id else True))
    treeList = [TreeVo(id=dept.id, name=dept.name, pid=dept.pid) for dept in result.all()]
    tree = TreeUtil.build_tree(treeList,pid=None)
    return ResponseUtil.success(data=tree)


@router.get('/info/{id}', response_model=DeptVo)
async def info(id: str, service: SysDeptService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: DeptBo, service: SysDeptService = Depends(get_service)):
    await service.insert(SysDept(**bo.model_dump()))
    return ResponseUtil.success()


@router.put('')
async def put(bo: DeptBo, service: SysDeptService = Depends(get_service)):
    await service.update(bo.model_dump())
    return ResponseUtil.success()

@router.delete('/{ids}')
async def delete(ids: str, service: SysDeptService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()

@router.post('/move')
async def move(bo: TreeMoveBo, service: SysDeptService = Depends(get_service)):
    await service.move(bo)
    return ResponseUtil.success()
