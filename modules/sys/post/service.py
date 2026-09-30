from datetime import datetime

from sqlalchemy import select, update, delete

from common.utils.utils import OrmUtil
from modules.sys.actor.model import SysActor, ActorDTO
from modules.sys.org.model import SysOrg
from modules.sys.post.model import SysPost, PostDTO, SysPostActor
from common.utils.id_util import IdUtil


class SysPostService:

    def __init__(self, db):
        self.db = db
        self.model = SysPost

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, PostDTO)
        query = select(SysActor).join(SysPostActor, SysPostActor.aid == SysActor.id).where(SysPostActor.pid==main.id)
        list = (await self.db.execute(query)).scalars().all()
        vo.users = []
        for item in list:
            vo.users.append(OrmUtil.to_vo(item, ActorDTO))
        return vo

    async def insert(self,  bo: PostDTO):
        main = self.model(**bo.model_dump(exclude={'users'}))
        if not main.id:
            main.id = "p" + str(IdUtil.generate_id())
        if not main.tier:
            if not main.orgid:
                main.tier = main.id
            else:
                tier = (await self.db.execute(select(SysOrg.tier).where(SysOrg.id == main.orgid))).scalars().first()
                main.tier = tier + "_" + main.id
        self.db.add(main)
        for user in bo.users:
            self.db.add(SysPostActor(pid=main.id,aid=user.id))
        actor = SysActor(id=main.id, name=main.name, type=2)
        self.db.add(actor)
        await self.db.commit()

    async def update(self,  bo: PostDTO):
        main_dict= bo.model_dump()
        main_dict['uptim'] = datetime.now()
        if not main_dict['orgid']:
            main_dict['tier'] = main_dict['id']
        else:
            tier = (await self.db.execute(
                select(SysOrg.tier).where(SysOrg.id == main_dict['orgid']))).scalars().first()
            main_dict['tier'] = tier + "_" + main_dict['id']
        await self.db.execute(update(self.model), [main_dict])
        await self.db.execute(delete(SysPostActor).where(SysPostActor.pid==main_dict['id']))
        for user in bo.users:
            self.db.add(SysPostActor(pid=main_dict['id'], aid=user.id))
        actor = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysActor), [actor])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(SysPostActor).where((SysPostActor.pid.in_(ids.split(',')))))
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysActor).where(SysActor.id.in_(ids.split(','))))
        await self.db.commit()
