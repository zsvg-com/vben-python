from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import String, Column, Integer

from common.config.database import Base

class SysOrg(Base):
    __tablename__ = 'sys_org'
    __table_args__ = {'comment': '组织架构-投影'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(64), nullable=True, comment='名称')
    type = Column(Integer, nullable=True, comment='类型')

class OrgDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    type: Optional[int] = Field(default=None, description='类型')

def sqlalchemy_to_pydantic(org_db: SysOrg) -> OrgDTO:
    return OrgDTO(
        id=org_db.id,
        name=org_db.name,
        type=org_db.type,
    )

def pydantic_to_sqlalchemy(dto: OrgDTO) -> SysOrg:
    return SysOrg(
        id=dto.id,
        name=dto.name,
        type=dto.type,
    )

def pydantic_to_sqlalchemy2(dto: OrgDTO) -> SysOrg:
    return SysOrg(
        id=dto.id,
        name=dto.name,
        type=dto.type,
    )

class TreeMoveBo(BaseModel):
    draid: Optional[str] = Field(default=None, description='拖动节点ID')
    droid: Optional[str] = Field(default=None, description='放下时目标节点ID')
    type: Optional[str] = Field(default=None, description='移动类型')