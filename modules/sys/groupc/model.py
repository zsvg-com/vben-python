from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import Column, Integer, String
from common.config.database import Base
from common.annotation.pydantic_annotation import as_query

class SysGroupCate(Base):
    __tablename__ = 'sys_group_cate'
    __table_args__ = {'comment': '组织架构-群组分类'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(16), nullable=True, comment='名称')
    pid = Column(String(36), nullable=True, comment='父ID')
    ornum = Column(Integer, nullable=True, comment='排序号')

class GroupcDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    pid: Optional[str] = Field(default=None, description='分类ID')
    ornum: Optional[int] = Field(default=None, description='排序号')

@as_query
class GroupcQueryBo(BaseModel):
    name: Optional[str] = Field(default=None, description='名称',alias="name")
    pageNum: int = Field(default=1, description='当前页码',alias="pageNum")
    pageSize: int = Field(default=10, description='每页记录数',alias="pageSize")
