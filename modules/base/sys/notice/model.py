from datetime import datetime
from typing import Optional

import sqlalchemy
from pydantic import BaseModel, Field
from sqlalchemy import CHAR, Column, DateTime, Integer, String, BigInteger
from sqlalchemy.dialects.mysql import BIGINT
from sqlalchemy.orm import Mapped
from sqlalchemy.testing.schema import mapped_column

from config.database import Base
from module_admin.annotation.pydantic_annotation import as_query
from modules.base.sys.notice.big_int_type import BigIntType
from utils.id_util import IdUtil


class SysNotice(Base):
    """
    部门表
    """
    __tablename__ = 'sys_notice'
    __table_args__ = {'comment': '系统通知'}

    id = Column(BigIntType, name="id", primary_key=True, comment="主键ID", nullable=False,autoincrement=False)
    # id = Column(BIGINT(unsigned=True), primary_key=True, comment='主键ID')
    # id: Mapped[int] = mapped_column(sqlalchemy.BIGINT, primary_key=True, comment='主键ID')
    name = Column(String(64), nullable=True, comment='公告标题')
    content = Column(String(2000), nullable=True, comment='公告内容')
    type = Column(Integer, nullable=True, comment='公告类型（1通知 2公告）')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    avtag = Column(CHAR(1), nullable=True, server_default='1', comment='可用标记')
    ornum = Column(Integer, nullable=True, comment='排序号')

class SysNoticeBo(BaseModel):
    """
    通知公告表对应pydantic模型
    """

    id: Optional[str] = Field(default=None, description='公告ID')
    name: Optional[str] = Field(default=None, description='公告标题')
    content: Optional[bytes] = Field(default=None, description='公告内容')
    # create_by: Optional[str] = Field(default=None, description='创建者')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    # update_by: Optional[str] = Field(default=None, description='更新者')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    # remark: Optional[str] = Field(default=None, description='备注')

class SysNoticeVo(BaseModel):
    """
    通知公告表对应pydantic模型
    """

    id: Optional[str] = Field(default=None, description='公告ID')
    name: Optional[str] = Field(default=None, description='公告标题')
    content: Optional[bytes] = Field(default=None, description='公告内容')
    # create_by: Optional[str] = Field(default=None, description='创建者')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    # update_by: Optional[str] = Field(default=None, description='更新者')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    # remark: Optional[str] = Field(default=None, description='备注')


@as_query
class NoticeQueryBo(BaseModel):
    """
    通知公告管理分页查询模型
    """
    name: Optional[str] = Field(default=None, description='公告标题',alias="name")
    begin_time: Optional[str] = Field(default=None, description='开始时间',alias="beginTime")
    end_time: Optional[str] = Field(default=None, description='结束时间',alias="endTime")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")




