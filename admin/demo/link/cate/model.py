from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import Column, DateTime, Integer, String, Boolean, CHAR

from common.config.database import Base
from common.annotation.pydantic_annotation import as_query
from modules.sys.notice.big_int_type import BigIntType


class DemoLinkCate(Base):
    __tablename__ = 'demo_link_cate'
    __table_args__ = {'comment': '关联树表'}

    id = Column(BigIntType, name="id", primary_key=True, comment="主键ID", nullable=False, autoincrement=False)
    name = Column(String(32), nullable=True, comment='名称')
    pid = Column(BigIntType, nullable=True, comment='父ID')
    ornum = Column(Integer, nullable=True, comment='排序号')
    tier = Column(String(255), nullable=True, comment='层级')
    # label = Column(String(32), nullable=True, comment='标签')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    cruid = Column(String(36), nullable=True, comment='创建者')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    upuid = Column(String(36), nullable=True, comment='更新者')
    avtag = Column(CHAR(1), nullable=True, server_default='1', comment='可用标记')

class LinkCateDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    pid: Optional[str] = Field(default=None, description='名称')
    tier: Optional[str] = Field(default=None, description='层级')
    # label: Optional[str] = Field(default=None, description='标签')
    ornum: Optional[int] = Field(default=None, description='排序号')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    cruna: Optional[str] = Field(default=None, description='创建人姓名')
    upuna: Optional[str] = Field(default=None, description='更新人姓名')
    notes: Optional[str] = Field(default=None, description='备注')
    avtag: Optional[bool] = Field(default=True, description='可用标记')


@as_query
class LinkCateQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称', alias="name")
    pageNum: int = Field(default=1, description='当前页码', alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数', alias="pageSize")
