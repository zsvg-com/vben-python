from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import CHAR, Column, DateTime, Integer, String, Boolean
from config.database import Base
from module_admin.annotation.pydantic_annotation import as_query
from modules.base.sys.notice.big_int_type import BigIntType


class SysPermMenu(Base):
    __tablename__ = 'sys_perm_menu'
    __table_args__ = {'comment': '权限管理-菜单'}

    id = Column(BigIntType, name="id", primary_key=True, comment="主键ID", nullable=False, autoincrement=False)
    name = Column(String(32), nullable=True, comment='名称')
    type = Column(String(8), nullable=True, comment='类型')
    notes = Column(String(255), nullable=True, comment='备注')
    pid = Column(BigIntType, nullable=True, comment='父ID')
    ornum = Column(Integer, nullable=True, comment='排序号')
    avtag = Column(Boolean, nullable=True, default=True, comment='可用标记')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')
    icon = Column(String(64), nullable=True, comment='图标')
    path = Column(String(64), nullable=True, comment='路由路径')
    param = Column(String(64), nullable=True, comment='路由参数')
    comp = Column(String(64), nullable=True, comment='组件路径')
    shtag = Column(Boolean, nullable=True, default=True, comment='显示标记')
    catag = Column(Boolean, nullable=True, default=False, comment='缓存标记')
    outag = Column(Boolean, nullable=True, default=False, comment='外链标记')

class MenuDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    pid: Optional[str] = Field(default=None, description='分类ID')
    type: Optional[str] = Field(default=None, description='类型')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')
    icon: Optional[str] = Field(default=None, description='图标')
    path: Optional[str] = Field(default=None, description='路由路径')
    param: Optional[str] = Field(default=None, description='路由参数')
    comp: Optional[str] = Field(default=None, description='显示标记')
    shtag: Optional[bool] = Field(default=True, description='可用标记')
    catag: Optional[bool] = Field(default=False, description='缓存标记')
    outag: Optional[bool] = Field(default=False, description='外链标记')

@as_query
class MenuQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
