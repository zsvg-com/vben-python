from datetime import datetime
from typing import Optional, List

from pydantic import BaseModel, Field
from sqlalchemy import Column, DateTime, Integer, String, Boolean, ForeignKey
from common.config.database import Base
from common.annotation.pydantic_annotation import as_query
from modules.sys.actor.model import ActorDTO
from modules.sys.notice.big_int_type import BigIntType


class SysRoleActor(Base):
    __tablename__ = 'sys_role_actor'
    rid = Column(BigIntType, ForeignKey('sys_role.id'), primary_key=True)
    aid = Column(String(36), ForeignKey('sys_actor.id'), primary_key=True)

class SysRole(Base):
    __tablename__ = 'sys_role'
    __table_args__ = {'comment': '权限管理-角色'}

    id = Column(BigIntType, name="id", primary_key=True, comment="主键ID", nullable=False, autoincrement=False)
    name = Column(String(32), nullable=True, comment='名称')
    ornum = Column(Integer, nullable=True, comment='排序号')
    avtag = Column(Boolean, nullable=True, default=True, comment='可用标记')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')

class RoleDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')
    actors: List[ActorDTO] = Field(default=None, description='包含成员')


class MenuVo(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    icon: Optional[str] = Field(default=None, description='图标')
    type: Optional[str] = Field(default=None, description='类别')
    pid: Optional[str] = Field(default=None, description='父菜单ID')
    apis: List[ApiVo] = Field(default=[], description='包含接口')

class ApiVo(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    menid: Optional[str] = Field(default=None, description='所属菜单ID')


@as_query
class RoleQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
