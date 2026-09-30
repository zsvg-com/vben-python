from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from common.config.get_db import get_db
from common.utils.utils import TreeUtil
from modules.sys.actor.model import TreeMoveBo
from modules.sys.org.model import SysOrg, OrgVo, OrgBo, OrgQueryBo, TreeVo
from modules.sys.org.service import SysOrgService
from common.utils.page_util import PageResponseModel, PageUtil
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/sys/org", tags=["actor"])


async def get_service(db=Depends(get_db)) -> SysOrgService:
    return SysOrgService(db)


@router.get('', response_model=PageResponseModel)
async def get(bo: OrgQueryBo = Depends(OrgQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrg)
        .where(SysOrg.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrg.id)
        .distinct()
    )
    list = await PageUtil.paginate(db, query, bo.pageNum, bo.pageSize, True)
    return ResponseUtil.success(data=list)

@router.get('/list')
async def get(bo: OrgQueryBo = Depends(OrgQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysOrg)
        .where(SysOrg.name.like(f'%{bo.name}%') if bo.name else True)
        .order_by(SysOrg.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)

@router.get('/tree')
async def get(id: str=None, db: AsyncSession = Depends(get_db)):
    # query = (
    #     select(SysOrg)
    #     .where(SysOrg.avtag == True)
    #     .order_by(SysOrg.ornum)
    #     .distinct()
    # )
    # list = (await db.execute(query)).scalars().all()
    # tree = TreeUtil.build_tree(list)

    result = await db.execute(select(SysOrg.id, SysOrg.name, SysOrg.pid)
                              .where(SysOrg.id != id if id else True))
    treeList = [TreeVo(id=org.id, name=org.name, pid=org.pid) for org in result.all()]
    tree = TreeUtil.build_tree(treeList,pid=None)
    return ResponseUtil.success(data=tree)


@router.get('/info/{id}', response_model=OrgVo)
async def info(id: str, service: SysOrgService = Depends(get_service)):
    info = await service.find_info(id)
    return ResponseUtil.success(data=info)


@router.post('')
async def post(bo: OrgBo, service: SysOrgService = Depends(get_service)):
    await service.insert(SysOrg(**bo.model_dump()))
    return ResponseUtil.success()


@router.put('')
async def put(bo: OrgBo, service: SysOrgService = Depends(get_service)):
    await service.update(bo.model_dump())
    return ResponseUtil.success()

@router.delete('/{ids}')
async def delete(ids: str, service: SysOrgService = Depends(get_service)):
    await service.delete(ids)
    return ResponseUtil.success()

@router.post('/move')
async def move(bo: TreeMoveBo, service: SysOrgService = Depends(get_service)):
    await service.move(bo)
    return ResponseUtil.success()
