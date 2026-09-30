from typing import Optional

from pydantic import BaseModel, Field
from sqlalchemy import String, Column, Integer

from common.config.database import Base

class SysActor(Base):
    __tablename__ = 'sys_actor'
    __table_args__ = {'comment': '系统参与者'}

    id = Column(String(36), primary_key=True, comment='主键ID')
    name = Column(String(64), nullable=True, comment='名称')
    type = Column(Integer, nullable=True, comment='类型')

class ActorDTO(BaseModel):
    id: Optional[str] = Field(default=None, description='ID')
    name: Optional[str] = Field(default=None, description='名称')
    type: Optional[int] = Field(default=None, description='类型')

def sqlalchemy_to_pydantic(actor_db: SysActor) -> ActorDTO:
    return ActorDTO(
        id=actor_db.id,
        name=actor_db.name,
        type=actor_db.type,
    )

def pydantic_to_sqlalchemy(dto: ActorDTO) -> SysActor:
    return SysActor(
        id=dto.id,
        name=dto.name,
        type=dto.type,
    )

def pydantic_to_sqlalchemy2(dto: ActorDTO) -> SysActor:
    return SysActor(
        id=dto.id,
        name=dto.name,
        type=dto.type,
    )

class TreeMoveBo(BaseModel):
    draid: Optional[str] = Field(default=None, description='拖动节点ID')
    droid: Optional[str] = Field(default=None, description='放下时目标节点ID')
    type: Optional[str] = Field(default=None, description='移动类型')