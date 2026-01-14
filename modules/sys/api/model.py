from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import Column, DateTime, Integer, String, Boolean
from common.config.database import Base
from common.annotation.pydantic_annotation import as_query
from modules.sys.notice.big_int_type import BigIntType


class SysApi(Base):
    __tablename__ = 'sys_api'
    __table_args__ = {'comment': '权限管理-菜单'}

    id = Column(BigIntType, name="id", primary_key=True, comment="主键ID", nullable=False, autoincrement=False)
    name = Column(String(32), nullable=True, comment='名称')
    menid = Column(BigIntType, nullable=True, comment='菜单ID')
    ornum = Column(Integer, nullable=True, comment='排序号')
    perm = Column(String(64), nullable=True, comment='权限字符')
    code = Column(BigIntType, nullable=True, comment='权限代码')
    pos = Column(Integer, nullable=True, comment='权限位')
    type = Column(String(64), nullable=True, comment='权限类型')
    avtag = Column(Boolean, nullable=True, default=True, comment='可用标记')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')

class ApiDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    menid: Optional[str] = Field(default=None, description='菜单ID')
    perm: Optional[str] = Field(default=None, description='权限字符')
    type: Optional[str] = Field(default=None, description='类型')
    code: Optional[str] = Field(default=None, description='权限代码')
    pos: Optional[int] = Field(default=None, description='权限位')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')

@as_query
class ApiQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称',alias="name")
    menid: Optional[str] = Field(default=None, description='菜单ID',alias="menid")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
