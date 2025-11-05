from fastapi import APIRouter, Request
from datetime import datetime, timedelta, timezone
import jwt

from utils.response_util import ResponseUtil

authRouter = APIRouter()
# loginController = APIRouter()


@authRouter.post('/auth/login')
async def login(request: Request):
    # 读取原始字节数据
    body_bytes = await request.body()
    # 将字节解码为字符串（默认utf-8）
    body_str = body_bytes.decode()
    print(f"原始请求体字符串: {body_str}")
    data = {
        "tenantId": "1",
        "userId": "1",
        "userName": "admin",
        "deptId": 1,
        "deptName": "维本科技",
        "deptCategory": "1",
    }
    to_encode = data.copy()
    expire = datetime.now(timezone.utc) + timedelta(minutes=30)
    to_encode.update({'exp': expire})
    encoded_jwt = jwt.encode(to_encode, 'b01c66dc2c58dc6a0aabfe2144256be36226de378bf87f72c0c795dda67f4d55', algorithm='HS256')
    back = {
        "access_token": encoded_jwt,
        "expire_in": 604800,
    }
    return ResponseUtil.success(data=back)

@authRouter.get('/test')
async def test():
    return {'test': 'test'}

@authRouter.get('/system/user/getInfo')
async def get_login_user_info():
    print("进来了")
    userVo={
        "userId":1,
        "userName":"admin",
        "nickName":"管理员",
        "deptName":"维本科技",
        "deptId":1,
        "avatar":"https://vfadmin.insistence.tech/assets/profile-CuEt6NNf.jpg",
    }
    # userVo.userId = 1
    # userVo.userName = "admin"
    # userVo.nickName = "管理员"
    # userVo.deptName = "维本科技"
    # userVo.deptId = 1
    # userVo.avatar = "http://8.153.168.178:8080/tool/oss/main/show?id=1978437156538343424"
    userInfoVo ={
        "user":userVo,
        "permissions":["*:*:*"],
        "roles":["superadmin"],
    }
    # userInfoVo.user = userVo
    # userInfoVo.permissions = ["*:*:*"]
    # userInfoVo.roles = ["superadmin"]
    return ResponseUtil.success(data=userInfoVo)



# @authRouter.post('/login2', response_model=Token)
# @Log(title='用户登录', business_type=BusinessType.OTHER, log_type='login')
# async def login(
#     request: Request, form_data: CustomOAuth2PasswordRequestForm = Depends(), query_db: AsyncSession = Depends(get_db)
# ):
#     captcha_enabled = (
#         True
#         if await request.app.state.redis.get(f'{RedisInitKeyConfig.SYS_CONFIG.key}:sys.account.captchaEnabled')
#         == 'true'
#         else False
#     )
#     user = UserLogin(
#         userName=form_data.username,
#         password=form_data.password,
#         code=form_data.code,
#         uuid=form_data.uuid,
#         loginInfo=form_data.login_info,
#         captchaEnabled=captcha_enabled,
#     )
#     result = await LoginService.authenticate_user(request, query_db, user)
#     access_token_expires = timedelta(minutes=JwtConfig.jwt_expire_minutes)
#     session_id = str(uuid.uuid4())
#     access_token = await LoginService.create_access_token(
#         data={
#             'user_id': str(result[0].user_id),
#             'user_name': result[0].user_name,
#             'dept_name': result[1].dept_name if result[1] else None,
#             'session_id': session_id,
#             'login_info': user.login_info,
#         },
#         expires_delta=access_token_expires,
#     )
#     if AppConfig.app_same_time_login:
#         await request.app.state.redis.set(
#             f'{RedisInitKeyConfig.ACCESS_TOKEN.key}:{session_id}',
#             access_token,
#             ex=timedelta(minutes=JwtConfig.jwt_redis_expire_minutes),
#         )
#     else:
#         # 此方法可实现同一账号同一时间只能登录一次
#         await request.app.state.redis.set(
#             f'{RedisInitKeyConfig.ACCESS_TOKEN.key}:{result[0].user_id}',
#             access_token,
#             ex=timedelta(minutes=JwtConfig.jwt_redis_expire_minutes),
#         )
#     await UserService.edit_user_services(
#         query_db, EditUserModel(userId=result[0].user_id, loginDate=datetime.now(), type='status')
#     )
#     logger.info('登录成功')
#     # 判断请求是否来自于api文档，如果是返回指定格式的结果，用于修复api文档认证成功后token显示undefined的bug
#     request_from_swagger = request.headers.get('referer').endswith('docs') if request.headers.get('referer') else False
#     request_from_redoc = request.headers.get('referer').endswith('redoc') if request.headers.get('referer') else False
#     if request_from_swagger or request_from_redoc:
#         return {'access_token': access_token, 'token_type': 'Bearer'}
#     return ResponseUtil.success(msg='登录成功', dict_content={'token': access_token})

#
# @loginController.get('/getInfo', response_model=CurrentUserModel)
# async def get_login_user_info(
#     request: Request, current_user: CurrentUserModel = Depends(LoginService.get_current_user)
# ):
#     logger.info('获取成功')
#
#     return ResponseUtil.success(model_content=current_user)
#
#
# @loginController.get('/getRouters')
# async def get_login_user_routers(
#     request: Request,
#     current_user: CurrentUserModel = Depends(LoginService.get_current_user),
#     query_db: AsyncSession = Depends(get_db),
# ):
#     logger.info('获取成功')
#     user_routers = await LoginService.get_current_user_routers(current_user.user.user_id, query_db)
#
#     return ResponseUtil.success(data=user_routers)
#
#
# @loginController.post('/register', response_model=CrudResponseModel)
# async def register_user(request: Request, user_register: UserRegister, query_db: AsyncSession = Depends(get_db)):
#     user_register_result = await LoginService.register_user_services(request, query_db, user_register)
#     logger.info(user_register_result.message)
#
#     return ResponseUtil.success(data=user_register_result, msg=user_register_result.message)
#
# @loginController.post('/logout')
# async def logout(request: Request, token: Optional[str] = Depends(oauth2_scheme)):
#     payload = jwt.decode(
#         token, JwtConfig.jwt_secret_key, algorithms=[JwtConfig.jwt_algorithm], options={'verify_exp': False}
#     )
#     if AppConfig.app_same_time_login:
#         token_id: str = payload.get('session_id')
#     else:
#         token_id: str = payload.get('user_id')
#     await LoginService.logout_services(request, token_id)
#     logger.info('退出成功')
#
#     return ResponseUtil.success(msg='退出成功')
