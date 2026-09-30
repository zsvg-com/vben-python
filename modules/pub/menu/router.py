from fastapi import APIRouter, Request, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio.session import AsyncSession

from common.config.get_db import get_db
from common.utils.utils import OrmUtil, TreeUtil
from modules.pub.menu.model import RouterBuilder
from modules.sys.menu.model import MenuQueryBo, SysMenu, MenuDTO
from common.utils.response_util import ResponseUtil

router = APIRouter()

@router.get('/pub/menus')
async def get_routers(bo: MenuQueryBo = Depends(MenuQueryBo.as_query), db: AsyncSession = Depends(get_db)):
    query = (
        select(SysMenu)
        .order_by(SysMenu.id)
        .distinct()
    )
    list = (await db.execute(query)).scalars().all()
    menus = []
    for menu in list:
        menus.append(OrmUtil.to_vo(menu, MenuDTO))
    tree = TreeUtil.build_tree(menus, pid="0")

    return ResponseUtil.success(data=RouterBuilder.build_menus(tree))
