from typing import Optional, List

from pydantic import BaseModel, Field


class MetaVo(BaseModel):
    title: Optional[str] = Field(default=None, description='设置该路由在侧边栏和面包屑中展示的名字')
    icon: Optional[str] = Field(default=None, description='设置该路由的图标，对应路径src/assets/icons/svg')
    catag: Optional[bool] = Field(default=True, description='设置为true，则不会被<keep-alive>缓存')
    link: Optional[str] = Field(default=None, description='内链地址（http(s): // 开头）')


class RouterVo(BaseModel):
    name: Optional[str] = Field(default=None, description='路由名字')
    path: Optional[str] = Field(default=None, description='路由地址')
    shtag: Optional[bool] = Field(default=True, description='是否隐藏路由，当设置true的时候该路由不会再侧边栏出现')
    redirect: Optional[str] = Field(default=None, description='重定向地址，当设置noRedirect的时候该路由在面包屑导航中不可被点击')
    comp: Optional[str] = Field(default=None, description='组件地址')
    param: Optional[str] = Field(default=None, description='路由参数：如{"id": 1, "name": "ry"}')
    alwaysShow: Optional[bool] = Field(default=None, description='当你一个路由下面的children声明的路由大于1个时，自动会变成嵌套的模式 - -如组件页面')
    meta: Optional[MetaVo] = Field(default=None, description='其他元素')
    children: List["RouterVo"] = Field(None, description="子路由")


# 或者使用类的方式，更接近Java风格
class RouterBuilder:
    """路由构建器"""

    # 常量定义
    TOP_PARENT_ID = 0
    INNER_LINK = 'InnerLink'

    @staticmethod
    def build_menus(menus: List['SysMenu']) -> List['RouterVo']:
        """
        构建路由菜单

        Args:
            menus: SysMenu对象列表

        Returns:
            RouterVo对象列表
        """
        routers = []

        for menu in menus:
            router = RouterVo()
            name = menu.name + str(menu.id)

            router.shtag = menu.shtag
            router.name = name
            router.path = '/' + menu.path if (menu.pid == 0 or menu.pid == "0") else menu.path
            router.comp = menu.comp
            router.param = menu.param
            router.meta = MetaVo(
                title=menu.name,
                icon=menu.icon,
                catag=menu.catag,
                link=menu.path
            )

            c_menus = menu.children

            # 处理有子菜单的情况
            if c_menus and menu.type == '1':
                router.alwaysShow = True
                router.redirect = 'noRedirect'
                router.children = RouterBuilder.build_menus(c_menus)

                if menu.pid == 0 or menu.pid == "0":
                    router.comp = 'Layout'
                else:
                    router.comp = 'ParentView'

            # 处理菜单框架的情况
            elif (menu.pid == 0 or menu.pid == "0") and "2" == menu.type and not menu.outag:
                frame_name = menu.path.capitalize() + str(menu.id) if menu.path else str(menu.id)
                router.meta = None

                children = RouterVo()
                children.path = menu.path
                children.comp = menu.comp
                children.name = frame_name
                children.meta = MetaVo(
                    title=menu.name,
                    icon=menu.icon,
                    catag=menu.catag,
                    link=menu.path
                )
                children.param = menu.param

                router.children = [children]

            # 处理内链的情况
            # elif menu.pid == RouterBuilder.TOP_PARENT_ID and menu.outag:
            elif menu.pid == RouterBuilder.TOP_PARENT_ID and menu.outag:
                router.meta = MetaVo(title=menu.name, icon=menu.icon)
                router.path = '/'

                router_path = RouterBuilder.inner_link_replace_each(menu.path)
                inner_link_name = router_path.capitalize() + str(menu.id) if router_path else str(menu.id)

                children = RouterVo()
                children.path = router_path
                children.comp = RouterBuilder.INNER_LINK
                children.name = inner_link_name
                children.meta = MetaVo(
                    title=menu.name,
                    icon=menu.icon,
                    link=menu.path
                )

                router.children = [children]

            routers.append(router)

        return routers

    @staticmethod
    def inner_link_replace_each(path: str) -> str:
        """内链路径替换"""
        # 实现具体的路径替换逻辑
        if not path:
            return path

        # 示例实现
        if path.startswith(('http://', 'https://')):
            # 移除协议部分
            path = path.split('://', 1)[1] if '://' in path else path

        return path
