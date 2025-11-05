from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from config.get_db import get_db
from modules.base.sys.org.dept.model import SysOrgDept, DeptVo, DeptBo, DeptQueryBo, TreeVo
from modules.base.sys.org.dept.service import SysOrgDeptService
from modules.base.sys.org.root.model import TreeMoveBo
from modules.base.sys.org.root.utils import TreeUtil
from utils.page_util import PageResponseModel, PageUtil
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/org/dept", tags=["org"])


async def get_service(db=Depends(get_db)) -> SysOrgDeptService:
    return SysOrgDeptService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: DeptQueryBo = Depends(DeptQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrgDept)
        .where(SysOrgDept.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrgDept.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/list')
async def get(bo: DeptQueryBo = Depends(DeptQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrgDept)
        .where(SysOrgDept.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrgDept.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    # query = (
    #     select(SysOrgDept)
    #     .where(SysOrgDept.avtag == True)
    #     .order_by(SysOrgDept.ornum)
    #     .distinct()
    # )
    # list = (await db.execute(query)).scalars().all()
    # tree = TreeUtil.build_tree(list)

    result = await db.execute(select(SysOrgDept.id, SysOrgDept.name, SysOrgDept.pid)
                              .where(SysOrgDept.id != id if id else True))
    treeList = [TreeVo(id=dept.id, name=dept.name, pid=dept.pid) for dept in result.all()]
    tree = TreeUtil.build_tree(treeList,pid=None)
    return ResponseUtil.success(data=tree)


@router.get('/info/{id}', response_model=DeptVo)
async def info(id: str, service: SysOrgDeptService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: DeptBo, service: SysOrgDeptService = Depends(get_service)):
    await service.insert(SysOrgDept(**bo.model_dump()))
    return ResponseUtil.success()


@router.put('')
async def put(bo: DeptBo, service: SysOrgDeptService = Depends(get_service)):
    await service.update(bo.model_dump())
    return ResponseUtil.success()

@router.delete('/{ids}')
async def delete(ids: str, service: SysOrgDeptService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()

@router.post('/move')
async def move(bo: TreeMoveBo, service: SysOrgDeptService = Depends(get_service)):
    await service.move(bo)
    return ResponseUtil.success()
