from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import Column, DateTime, Integer, String, Boolean
from common.config.database import Base
from common.annotation.pydantic_annotation import as_query

class SysUser(Base):
    __tablename__ = 'sys_user'
    __table_args__ = {'comment': '系统用户'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(16), nullable=True, comment='姓名')
    orgid = Column(String(36), nullable=True, comment='组织id')
    tier = Column(String(512), nullable=True, comment='层级')
    job = Column(String(64), nullable=True, comment='职务')
    username = Column(String(32), nullable=True, comment='登录名')
    password = Column(String(64), nullable=True, comment='密码')
    email = Column(String(32), nullable=True, comment='邮箱')
    gender = Column(String(32), nullable=True, comment='性别')
    monum = Column(String(16), nullable=True, comment='手机号')
    ornum = Column(Integer, nullable=True, comment='排序号')
    avtag = Column(Boolean, nullable=True, default=True, comment='可用标记')
    label = Column(String(32), nullable=True, comment='标签')
    notes = Column(String(255), nullable=True, comment='备注')
    avatar = Column(String(128), nullable=True, comment='头像url')
    loip = Column(String(20), nullable=True, comment='登录IP')
    lotim = Column(DateTime, nullable=True, default=datetime.now(), comment='登录时间')
    type = Column(Integer, nullable=True, comment='用户类别')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')

class UserDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='姓名')
    orgid: Optional[str] = Field(default=None, description='组织id')
    tier: Optional[str] = Field(default=None, description='层级')
    job: Optional[str] = Field(default=None, description='职务')
    type: Optional[int] = Field(default=None, description='用户类型')
    username: Optional[str] = Field(default=None, description='登录名')
    password: Optional[str] = Field(default=None, description='密码')
    email: Optional[str] = Field(default=None, description='邮箱')
    gender: Optional[str] = Field(default=None, description='密码')
    label: Optional[str] = Field(default=None, description='性别')
    monum: Optional[str] = Field(default=None, description='手机号')
    notes: Optional[str] = Field(default=None, description='备注')
    avatar: Optional[str] = Field(default=None, description='头像url')
    loip: Optional[str] = Field(default=None, description='登录IP')
    lotim: Optional[datetime] = Field(default=None, description='登录时间')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')

@as_query
class UserQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='公告标题',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
