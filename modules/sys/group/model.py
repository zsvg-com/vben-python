from datetime import datetime
from typing import Optional, List

from pydantic import BaseModel, Field
from sqlalchemy import Column, DateTime, Integer, String, Boolean, ForeignKey
from common.config.database import Base
from common.annotation.pydantic_annotation import as_query
from modules.sys.org.model import OrgDTO


class SysGroupOrg(Base):
    __tablename__ = 'sys_group_org'
    gid = Column(String(36), ForeignKey('sys_group.id'), primary_key=True)
    oid = Column(String(36), ForeignKey('sys_org.id'), primary_key=True)

class SysGroup(Base):
    __tablename__ = 'sys_group'
    __table_args__ = {'comment': '组织架构-群组'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(16), nullable=True, comment='名称')
    catid = Column(String(36), nullable=True, comment='分类ID')
    ornum = Column(Integer, nullable=True, comment='排序号')
    avtag = Column(Boolean, nullable=True, default=True, comment='可用标记')
    label = Column(String(32), nullable=True, comment='标签')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')

class GroupDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    catid: Optional[str] = Field(default=None, description='分类ID')
    label: Optional[str] = Field(default=None, description='标签')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')
    members: List[OrgDTO] = Field(default=None, description='包含成员')

@as_query
class GroupQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
