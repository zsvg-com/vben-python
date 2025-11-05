from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import  Column, DateTime, Integer, String,Boolean

from config.database import Base
from module_admin.annotation.pydantic_annotation import as_query
from modules.base.sys.notice.big_int_type import BigIntType


class SysConfig(Base):
    __tablename__ = 'sys_config'
    __table_args__ = {'comment': '系统配置'}

    id = Column(BigIntType, name="id", primary_key=True, comment="主键ID", nullable=False, autoincrement=False)
    name = Column(String(32), nullable=True, comment='参数名称')
    kenam = Column(String(32), nullable=True, comment='参数键名')
    keval = Column(String(32), nullable=True, comment='参数键值')
    intag = Column(Boolean, nullable=True, default=True, comment='内置标记')
    notes = Column(String(255), nullable=True, comment='备注')
    crtim = Column(DateTime, nullable=True, default=datetime.now(), comment='创建时间')
    uptim = Column(DateTime, nullable=True, default=datetime.now(), comment='更新时间')
    ornum = Column(Integer, nullable=True, comment='排序号')


class ConfigDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='参数名称')
    kenam: Optional[str] = Field(default=None, description='参数键名')
    keval: Optional[str] = Field(default=None, description='参数键值')
    intag: Optional[bool] = Field(default=True, description='内置标记')
    crtim: Optional[datetime] = Field(default=None, description='创建时间')
    uptim: Optional[datetime] = Field(default=None, description='更新时间')
    notes: Optional[str] = Field(default=None, description='备注')
    ornum: Optional[int] = Field(default=None, description='排序号')


@as_query
class ConfigQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='参数名称', alias="name")
    pageNum: int = Field(default=1, description='当前页码', alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数', alias="pageSize")
