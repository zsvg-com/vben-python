from sqlalchemy import select, update, delete

from modules.sys.org.model import SysOrg, OrgDTO
from modules.sys.org.utils import OrmUtil
from modules.sys.api.model import SysApi
from modules.sys.menu.model import SysMenu
from modules.sys.role.model import SysRole, RoleDTO, SysRoleOrg, MenuVo, ApiVo
from common.utils.id_util import IdUtil


class SysRoleService:

    def __init__(self, db):
        self.db = db
        self.model = SysRole

    async def find_info(self, id: str):
        main = (await self.db.execute(select(self.model).where(self.model.id == id))).scalars().first()
        vo = OrmUtil.to_vo(main, RoleDTO)
        query = select(SysOrg).join(SysRoleOrg, SysRoleOrg.oid == SysOrg.id).where(SysRoleOrg.rid == main.id)
        list = (await self.db.execute(query)).scalars().all()
        vo.orgs = []
        for item in list:
            vo.orgs.append(OrmUtil.to_vo(item, OrgDTO))
        return vo


    async def insert(self,  bo: RoleDTO):
        main = self.model(**bo.model_dump(exclude={'orgs'}))
        main.id = str(IdUtil.generate_id())
        self.db.add(main)
        for org in bo.orgs:
            self.db.add(SysRoleOrg(rid=main.id,oid=org.id))
        await self.db.commit()


    async def update(self,  bo: RoleDTO):
        main_dict = bo.model_dump(exclude_unset=True)
        await self.db.execute(update(self.model), [main_dict])
        await self.db.execute(delete(SysRoleOrg).where(SysRoleOrg.rid == main_dict['id']))
        for org in bo.orgs:
            self.db.add(SysRoleOrg(rid=main_dict['id'], oid=org.id))
        await self.db.commit()

    async def delete(self, ids: str):
        await self.db.execute(delete(SysRoleOrg).where((SysRoleOrg.rid.in_(ids.split(',')))))
        await self.db.execute(delete(self.model).where(self.model.id.in_(ids.split(','))))
        await self.db.commit()

    async def find_menu_list(self):
        menu_result = await self.db.execute(select(SysMenu.id, SysMenu.name, SysMenu.pid,SysMenu.icon,SysMenu.type)
                                  .where(SysMenu.avtag).order_by(SysMenu.ornum))
        menu_list = [MenuVo(id=menu.id, name=menu.name, pid=menu.pid,icon=menu.icon,type=menu.type) for menu in menu_result.all()]
        api_result = await self.db.execute(select(SysApi.id, SysApi.name,SysApi.menid)
                                  .where(SysApi.avtag).order_by(SysApi.ornum))
        api_list = [ApiVo(id=api.id, name=api.name,menid=api.menid) for api in api_result.all()]
        for menu in menu_list:
            for api in api_list:
                if api.menid == menu.id:
                    menu.apis.append(api)
        return menu_list