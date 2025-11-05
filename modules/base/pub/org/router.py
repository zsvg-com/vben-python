from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from config.get_db import get_db
from modules.base.sys.org.root.model import SysOrg
from utils.response_util import ResponseUtil

router = APIRouter(prefix="/pub/org", tags=["pub"])


@router.get('')
async def get(db: AsyncSession = Depends(get_db)):
    query = select(SysOrg)
    list = (await db.execute(query)).scalars().all()
    return ResponseUtil.success(data=list)


@router.get('/rece')
async def get_rece(db: AsyncSession = Depends(get_db)):
    return ResponseUtil.success(data=[])

@router.post('/rece')
async def post_rece(db: AsyncSession = Depends(get_db)):
    return ResponseUtil.success()

