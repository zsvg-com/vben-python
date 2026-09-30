from admin.demo.single.main.router import router as singleRouter
from admin.demo.single.cate.router import router as singlecRouter
from admin.demo.link.main.router import router as linkRouter
from admin.demo.link.cate.router import router as linkcRouter

admin_routers = [
    {'router': singleRouter},
    {'router': singlecRouter},
    {'router': linkRouter},
    {'router': linkcRouter},
]