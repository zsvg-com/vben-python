from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from common.config.get_db import get_db
from modules.sys.actor.model import SysActor
from common.utils.response_util import ResponseUtil

router = APIRouter(prefix="/pub", tags=["pub"])


@router.get('/actor')
async def get(db: AsyncSession = Depends(get_db)):
    query = select(SysActor)
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)

@router.get('/group/tree')
async def get_group_tree(db: AsyncSession = Depends(get_db)):
    return ResponseUtil.success(data=[])

@router.get('/group/list')
async def get_group_list(db: AsyncSession = Depends(get_db)):
    return ResponseUtil.success(data=[])

@router.get('/rece')
async def get_rece(db: AsyncSession = Depends(get_db)):
    return ResponseUtil.success(data=[])

@router.post('/rece')
async def post_rece(db: AsyncSession = Depends(get_db)):
    return ResponseUtil.success()





