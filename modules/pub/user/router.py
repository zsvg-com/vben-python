from fastapi import APIRouter, Depends
from common.utils.response_util import ResponseUtil

router = APIRouter()


@router.get('/pub/user')
async def get_user():
    user = {
        "useid": 1,
        "usena": "admin",
        "nicna": "管理员",
        "orgna": "维本科技",
        "orgid": 1,
        "avatar": "https://vfadmin.insistence.tech/assets/profile-CuEt6NNf.jpg",
    }
    userVo = {
        "user": user,
        "perms": ["*:*:*"],
        "roles": ["superadmin"],
    }
    return ResponseUtil.success(data=userVo)
