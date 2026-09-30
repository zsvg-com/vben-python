from datetime import datetime

from sqlalchemy import select, update, delete, func

from modules.sys.org.model import SysOrg
from modules.sys.post.model import SysPost
from modules.sys.actor.model import SysActor, TreeMoveBo
from modules.sys.user.model import SysUser
from common.utils.id_util import IdUtil


class SysOrgService:

    def __init__(self, db):
        self.db = db
        self.model = SysOrg

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        return main

    async def insert(self, main: SysOrg):
        if not main.id:
            main.id = "d" + str(IdUtil.generate_id())
        if not main.ornum:
            main.ornum = (await self.db.execute(select(func.count('*')).select_from(SysOrg).where(SysOrg.pid == main.pid))).scalar() + 1
        self.db.add(main)
        if not main.tier:
            if not main.pid:
                main.tier = main.id
            else:
                tier = (await self.db.execute(select(SysOrg.tier).where(self.model.id == main.pid))).scalars().first()
                main.tier = tier + "_" + main.id
        actor = SysActor(id=main.id, name=main.name, type=1)
        self.db.add(actor)
        await self.db.commit()

    async def update(self, main_dict: dict):
        main_dict['uptim'] = datetime.now()
        old_tier = (
            await self.db.execute(select(SysOrg.tier).where(self.model.id == main_dict['id']))).scalars().first()
        if not main_dict['ornum']:
            main_dict['ornum'] = 0
        if not main_dict['pid']:
            main_dict['tier'] = main_dict['id']
        else:
            tier = (await self.db.execute(select(SysOrg.tier).where(self.model.id == main_dict['pid']))).scalars().first()
            main_dict['tier'] = tier + "_" + main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        actor = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysActor), [actor])

        await self.__deal_tier(old_tier, main_dict['tier'], main_dict['id'])
        await self.db.commit()

    async def __deal_tier(self, old_tier: str, new_tier: str, id: str):
        org_stmt = update(SysOrg).where(SysOrg.tier.like(old_tier + '%'), SysOrg.id != id).values(
            tier=func.replace(SysOrg.tier, old_tier, new_tier)
        )
        await self.db.execute(org_stmt)
        user_stmt = update(SysUser).where(SysUser.tier.like(old_tier + '%')).values(
            tier=func.replace(SysUser.tier, old_tier, new_tier)
        )
        await self.db.execute(user_stmt)
        post_stmt = update(SysPost).where(SysPost.tier.like(old_tier + '%')).values(
            tier=func.replace(SysPost.tier, old_tier, new_tier)
        )
        await self.db.execute(post_stmt)

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysActor).where(SysActor.id.in_(ids.split(','))))
        await self.db.commit()

    async def move(self, bo: TreeMoveBo):
        dragNode = await self.find_info(bo.draid)
        stmt1 = update(SysOrg).where(SysOrg.ornum > dragNode.ornum, SysOrg.pid == dragNode.pid).values(ornum=SysOrg.ornum - 1)
        await self.db.execute(stmt1)

        if "inner" == bo.type:
            dragNode.pid = bo.droid
            count = (await self.db.execute(
                select(func.count('*')).select_from(SysOrg).where(SysOrg.pid == bo.droid))).scalar()
            dragNode.ornum = int(count) + 1
        elif "before" == bo.type:
            dropNode = await self.find_info(bo.droid)
            dragNode.pid = dropNode.pid
            dragNode.ornum = dropNode.ornum
            stmt3 = update(SysOrg).where(SysOrg.ornum > dropNode.ornum, SysOrg.pid == dropNode.pid).values(ornum=SysOrg.ornum + 1)
            await self.db.execute(stmt3)
            dropNode.ornum = dropNode.ornum + 1
            node_stmt4 = update(SysOrg).where(SysOrg.id == dropNode.id).values(ornum=dropNode.ornum)
            await self.db.execute(node_stmt4)
        elif "after" == bo.type:
            dropNode = await self.find_info(bo.droid)
            count = (await self.db.execute(select(func.count('*')).select_from(SysOrg).where(SysOrg.pid == dropNode.pid))).scalar()
            if dragNode.pid and dropNode.pid == dropNode.pid:
                dragNode.ornum = int(count)
            else:
                dragNode.pid = dropNode.pid
                dragNode.ornum = int(count) + 1
        # await self.update(dragNode)
        dragNode.uptim = datetime.now()
        old_tier = (
            await self.db.execute(select(SysOrg.tier).where(self.model.id == dragNode.id))).scalars().first()
        if not dragNode.pid:
            dragNode.tier = dragNode.id
        else:
            tier = (await self.db.execute(select(SysOrg.tier).where(self.model.id == dragNode.pid))).scalars().first()
            dragNode.tier = tier + "_" + dragNode.id
        # await self.db.execute(update(self.model), )
        await self.db.merge(dragNode)
        await self.__deal_tier(old_tier, dragNode.tier, dragNode.id)
        await self.db.commit()
