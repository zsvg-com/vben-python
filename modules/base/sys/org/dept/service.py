from datetime import datetime

from sqlalchemy import select, update, delete, func

from modules.base.sys.org.dept.model import SysOrgDept
from modules.base.sys.org.post.model import SysOrgPost
from modules.base.sys.org.root.model import SysOrg, TreeMoveBo
from modules.base.sys.org.user.model import SysOrgUser
from utils.id_util import IdUtil


class SysOrgDeptService:

    def __init__(self, db):
        self.db = db
        self.model = SysOrgDept

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        return main

    async def insert(self, main: SysOrgDept):
        if not main.id:
            main.id = "d" + str(IdUtil.generate_id())
        if not main.ornum:
            main.ornum = (await self.db.execute(select(func.count('*')).select_from(SysOrgDept).where(SysOrgDept.pid == main.pid))).scalar() + 1
        self.db.add(main)
        if not main.tier:
            if not main.pid:
                main.tier = main.id
            else:
                tier = (await self.db.execute(select(SysOrgDept.tier).where(self.model.id == main.pid))).scalars().first()
                main.tier = tier + "_" + main.id
        org = SysOrg(id=main.id, name=main.name, type=1)
        self.db.add(org)
        await self.db.commit()

    async def update(self, main_dict: dict):
        main_dict['uptim'] = datetime.now()
        old_tier = (
            await self.db.execute(select(SysOrgDept.tier).where(self.model.id == main_dict['id']))).scalars().first()
        if not main_dict['ornum']:
            main_dict['ornum'] = 0
        if not main_dict['pid']:
            main_dict['tier'] = main_dict['id']
        else:
            tier = (await self.db.execute(select(SysOrgDept.tier).where(self.model.id == main_dict['pid']))).scalars().first()
            main_dict['tier'] = tier + "_" + main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        org = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysOrg), [org])

        await self.__deal_tier(old_tier, main_dict['tier'], main_dict['id'])
        await self.db.commit()

    async def __deal_tier(self, old_tier: str, new_tier: str, id: str):
        dept_stmt = update(SysOrgDept).where(SysOrgDept.tier.like(old_tier + '%'), SysOrgDept.id != id).values(
            tier=func.replace(SysOrgDept.tier, old_tier, new_tier)
        )
        await self.db.execute(dept_stmt)
        user_stmt = update(SysOrgUser).where(SysOrgUser.tier.like(old_tier + '%')).values(
            tier=func.replace(SysOrgUser.tier, old_tier, new_tier)
        )
        await self.db.execute(user_stmt)
        post_stmt = update(SysOrgPost).where(SysOrgPost.tier.like(old_tier + '%')).values(
            tier=func.replace(SysOrgPost.tier, old_tier, new_tier)
        )
        await self.db.execute(post_stmt)

    async def delete(self, ids: str):
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysOrg).where(SysOrg.id.in_(ids.split(','))))
        await self.db.commit()

    async def move(self, bo: TreeMoveBo):
        dragDept = await self.find_info(bo.draid)
        stmt1 = update(SysOrgDept).where(SysOrgDept.ornum > dragDept.ornum, SysOrgDept.pid == dragDept.pid).values(ornum=SysOrgDept.ornum - 1)
        await self.db.execute(stmt1)

        if "inner" == bo.type:
            dragDept.pid = bo.droid
            count = (await self.db.execute(
                select(func.count('*')).select_from(SysOrgDept).where(SysOrgDept.pid == bo.droid))).scalar()
            dragDept.ornum = int(count) + 1
        elif "before" == bo.type:
            dropDept = await self.find_info(bo.droid)
            dragDept.pid = dropDept.pid
            dragDept.ornum = dropDept.ornum
            stmt3 = update(SysOrgDept).where(SysOrgDept.ornum > dropDept.ornum, SysOrgDept.pid == dropDept.pid).values(ornum=SysOrgDept.ornum + 1)
            await self.db.execute(stmt3)
            dropDept.ornum = dropDept.ornum + 1
            dept_stmt4 = update(SysOrgDept).where(SysOrgDept.id == dropDept.id).values(ornum=dropDept.ornum)
            await self.db.execute(dept_stmt4)
        elif "after" == bo.type:
            dropDept = await self.find_info(bo.droid)
            count = (await self.db.execute(select(func.count('*')).select_from(SysOrgDept).where(SysOrgDept.pid == dropDept.pid))).scalar()
            if dragDept.pid and dragDept.pid == dropDept.pid:
                dragDept.ornum = int(count)
            else:
                dragDept.pid = dropDept.pid
                dragDept.ornum = int(count) + 1
        # await self.update(dragDept)
        dragDept.uptim = datetime.now()
        old_tier = (
            await self.db.execute(select(SysOrgDept.tier).where(self.model.id == dragDept.id))).scalars().first()
        if not dragDept.pid:
            dragDept.tier = dragDept.id
        else:
            tier = (await self.db.execute(select(SysOrgDept.tier).where(self.model.id == dragDept.pid))).scalars().first()
            dragDept.tier = tier + "_" + dragDept.id
        # await self.db.execute(update(self.model), )
        await self.db.merge(dragDept)
        await self.__deal_tier(old_tier, dragDept.tier, dragDept.id)
        await self.db.commit()
