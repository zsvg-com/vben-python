from datetime import datetime
from typing import Optional, List

from pydantic import BaseModel, Field
from sqlalchemy import CHAR, Column, DateTime, Integer, String
from common.config.database import Base
from common.annotation.pydantic_annotation import as_query

class SysDept(Base):
    __tablename__ = 'sys_dept'
    __table_args__ = {'comment': '组织架构-部门'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(64), nullable=True, comment='部门名称')
    pid = Column(String(36), nullable=True, comment='父部门id')
    type = Column(Integer, nullable=True, comment='部门类型')
    tier = Column(String(512), nullable=True, comment='层级')
    label = Column(String(32), nullable=True, comment='标签')
    notes = Column(String(255), nullable=True, comment='备注')
    ornum = Column(Integer, nullable=True, comment='排序号')
    avtag = Column(CHAR(1), nullable=True, server_default='1', comment='可用标记')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')

class DeptBo(BaseModel):
    id: Optional[str] = Field(default=None, description='部门ID')
    name: Optional[str] = Field(default=None, description='部门名称')
    pid: Optional[str] = Field(default=None, description='父部门id')
    type: Optional[int] = Field(default=None, description='部门类型')
    tier: Optional[str] = Field(default=None, description='层级')
    label: Optional[str] = Field(default=None, description='标签')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')

class DeptVo(BaseModel):
    id: Optional[str] = Field(default=None, description='部门ID')
    name: Optional[str] = Field(default=None, description='部门名称')
    pid: Optional[str] = Field(default=None, description='父部门id')
    type: Optional[int] = Field(default=None, description='部门类型')
    tier: Optional[str] = Field(default=None, description='层级')
    label: Optional[str] = Field(default=None, description='标签')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')

@as_query
class DeptQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='公告标题',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")

class TreeVo(BaseModel):
    id: Optional[str] = Field(default=None, description='部门ID')
    name: Optional[str] = Field(default=None, description='部门名称')
    pid: Optional[str] = Field(default=None, description='父部门id')
    type: Optional[int] = Field(default=None, description='部门类型')
    children: List["TreeVo"] = Field(None, description="子部门")