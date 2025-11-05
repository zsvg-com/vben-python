from datetime import datetime
from typing import Optional, List

from pydantic import BaseModel, Field
from sqlalchemy import CHAR, Column, DateTime, Integer, String, Boolean, Table, ForeignKey
from sqlalchemy.ext.associationproxy import association_proxy
from sqlalchemy.orm import relationship

from config.database import Base
from module_admin.annotation.pydantic_annotation import as_query
from modules.base.sys.org.root.model import OrgDTO
#
# post_org = Table(
#     'sys_org_post_org',
#     Base.metadata,
#     Column('pid', String(36), ForeignKey('sys_org_post.id', ondelete='CASCADE'), primary_key=True),  # 联合主键
#     Column('oid', String(36), ForeignKey('sys_org.id', ondelete='CASCADE'), primary_key=True)
# )

class SysOrgPostOrg(Base):
    __tablename__ = 'sys_org_post_org'
    pid = Column(String(36), ForeignKey('sys_org_post.id'), primary_key=True)
    oid = Column(String(36), ForeignKey('sys_org.id'), primary_key=True)

    # post = relationship("SysOrgPost", back_populates="user_associations")
    # user = relationship("SysOrg")

class SysOrgPost(Base):
    __tablename__ = 'sys_org_post'
    __table_args__ = {'comment': '组织架构-岗位'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(16), nullable=True, comment='名称')
    depid = Column(String(36), nullable=True, comment='部门id')
    tier = Column(String(512), nullable=True, comment='层级')
    ornum = Column(Integer, nullable=True, comment='排序号')
    avtag = Column(Boolean, nullable=True, default=True, comment='可用标记')
    label = Column(String(32), nullable=True, comment='标签')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')

    # 指向UserRole的关系
    # user_associations = relationship("SysOrgPostOrg", back_populates="post", cascade="all, delete-orphan")

    # 使用association_proxy直接访问Role对象，简化操作[citation:1][citation:2]
    # 这里代理了"role_associations"关系中的"role"属性
    # users = association_proxy('user_associations', 'user',
    #                           creator=lambda user_obj: PostUser(user=user_obj))

    # # 通过关联对象的关系
    # role_associations = relationship("UserRoleAssociation", back_populates="user")
    #
    # # 使用 association_proxy 直接访问角色
    # users = association_proxy('role_associations', 'role',
    #                           creator=lambda role: PostUser(user=user))

    # 定义与Course模型的多对多关系
    # secondary参数指定了中间表[citation:1][citation:9]
    # users = relationship(
    #     'oid',
    #     secondary=post_org,
    #     back_populates='sys_org',  # 与Course模型中的'students'属性反向引用
    #     lazy='dynamic'  # 可选：懒加载模式，返回查询对象而非立即加载所有数据[citation:1][citation:7]
    # )
    # users = relationship(
    #     'SysOrg',
    #     secondary=post_org,
    #     backref=None,
    #     lazy='select'
    # )


class PostDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    depid: Optional[str] = Field(default=None, description='部门id')
    tier: Optional[str] = Field(default=None, description='层级')
    label: Optional[str] = Field(default=None, description='标签')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')
    avtag: Optional[bool] = Field(default=True, description='可用标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruid: Optional[str] = Field(default=None, description='创建者ID')
    upuid: Optional[str] = Field(default=None, description='更新者ID')
    users: List[OrgDTO] = Field(default=None, description='包含用户')

@as_query
class PostQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
