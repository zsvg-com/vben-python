from contextlib import asynccontextmanager
from fastapi import FastAPI
from common.config.env import AppConfig
from common.config.get_db import init_create_table
from common.config.get_redis import RedisUtil
from common.exceptions.handle import handle_exception
from common.middlewares.handle import handle_middleware
from modules.pub.org.router import router as pubOrgRouter
from modules.sys.dept.router import router as deptRouter
from modules.sys.user.router import router as userRouter
from modules.sys.post.router import router as postRouter
from modules.sys.group.router import router as groupRouter
from modules.sys.groupc.router import router as groupcRouter
from modules.sys.menu.router import router as menuRouter
from modules.sys.api.router import router as apiRouter
from modules.sys.role.router import router as roleRouter
from modules.sys.notice.router import noticeRoute
from modules.sys.config.router import router as configRouter
from modules.auth.auth_api import authRouter
from common.sub_applications.handle import handle_sub_applications
from common.utils.common_util import worship
from common.utils.log_util import logger


# 生命周期事件
@asynccontextmanager
async def lifespan(app: FastAPI):
    logger.info(f'⏰️ {AppConfig.app_name}开始启动')
    worship()
    await init_create_table()
    app.state.redis = await RedisUtil.create_redis_pool()
    await RedisUtil.init_sys_dict(app.state.redis)
    await RedisUtil.init_sys_config(app.state.redis)
    # await SchedulerUtil.init_system_scheduler()
    logger.info(f'🚀 {AppConfig.app_name}启动成功')
    yield
    await RedisUtil.close_redis_pool(app)
    # await SchedulerUtil.close_system_scheduler()


# 初始化FastAPI对象
app = FastAPI(
    title=AppConfig.app_name,
    description=f'{AppConfig.app_name}接口文档',
    version=AppConfig.app_version,
    lifespan=lifespan,
)

# 挂载子应用
handle_sub_applications(app)
# 加载中间件处理方法
handle_middleware(app)
# 加载全局异常处理方法
handle_exception(app)


# 加载路由列表
controller_list = [
    {'router': authRouter, 'tags': ['登录认证']},
    {'router': noticeRoute, 'tags': ['系统管理-通知公告管理']},
    {'router': deptRouter},
    {'router': userRouter},
    {'router': postRouter},
    {'router': groupRouter},
    {'router': groupcRouter},
    {'router': pubOrgRouter},
    {'router': menuRouter},
    {'router': apiRouter},
    {'router': roleRouter},
    {'router': configRouter},
]

for controller in controller_list:
    app.include_router(router=controller.get('router'), tags=controller.get('tags'))
