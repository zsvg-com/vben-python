from sqlalchemy import select, update, delete

from common.utils.utils import OrmUtil
from modules.sys.actor.model import SysActor, ActorDTO
from modules.sys.group.model import SysGroup, GroupDTO, SysGroupActor
from common.utils.id_util import IdUtil


class SysGroupService:

    def __init__(self, db):
        self.db = db
        self.model = SysGroup

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, GroupDTO)
        query = select(SysActor).join(SysGroupActor, SysGroupActor.aid == SysActor.id).where(SysGroupActor.gid == main.id)
        list = (await self.db.execute(query)).scalars().all()
        vo.members = []
        for item in list:
            vo.members.append(OrmUtil.to_vo(item, ActorDTO))
        return vo


    async def insert(self,  bo: GroupDTO):
        main = self.model(**bo.model_dump(exclude={'members'}))
        main.id = str(IdUtil.generate_id())
        self.db.add(main)
        for user in bo.members:
            self.db.add(SysGroupActor(gid=main.id,aid=user.id))
        actor = SysActor(id=main.id, name=main.name, type=1)
        self.db.add(actor)
        await self.db.commit()


    async def update(self,  bo: GroupDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        await self.db.execute(update(self.model), [main_dict])
        await self.db.execute(delete(SysGroupActor).where(SysGroupActor.gid == main_dict['id']))
        for user in bo.members:
            self.db.add(SysGroupActor(gid=main_dict['id'], aid=user.id))
        actor = {'id': main_dict['id'], 'name': main_dict['name']}
        await self.db.execute(update(SysActor), [actor])
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(SysGroupActor).where((SysGroupActor.gid.in_(ids.split(',')))))
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.execute(delete(SysActor).where(SysActor.id.in_(ids.split(','))))
        await self.db.commit()
