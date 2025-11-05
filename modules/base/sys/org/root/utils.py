from typing import Any, Callable, List, Optional, Type, Union, get_origin, get_args, TypeVar
from sqlalchemy.orm import Query

T = TypeVar('T')

class OrmUtil:
    """
    ORM工具类
    """

    @staticmethod
    def to_vo(ormObj, vo_class: Optional[Type[T]] = None, row_handler: Optional[Callable[[Any], T]] = None) -> Union[
        T, Any, None]:
        """
        将orm对象转为vo对象
        :param ormObj: orm对象
        :param vo_class: vo类
        :param row_handler: 后置处理函数，可以给vo_class追加额外属性或二次处理
        :return: 转换后的vo对象
        """
        # 处理空对象情况
        if ormObj is None:
            return None

        # 如果没有指定vo_class，则直接返回原始对象
        if vo_class is None:
            return ormObj

        # 构建传递给vo_class的字段字典
        vo_data = {}

        # 遍历vo_class的所有字段
        for field_name, field_info in vo_class.model_fields.items():
            # 检查ORM对象是否有对应属性
            if hasattr(ormObj, field_name):
                field_value = getattr(ormObj, field_name)

                # 处理类型转换，特别是Union类型中包含str的情况
                origin_type = get_origin(field_info.annotation)
                if origin_type is not None and origin_type is Union:
                    # 如果字段类型是Union且包含str，则将值转换为字符串
                    if str in get_args(field_info.annotation) and field_value is not None:
                        field_value = str(field_value)

                vo_data[field_name] = field_value

        # 创建VO对象
        try:
            vo_instance = vo_class(**vo_data)
        except Exception as e:
            raise ValueError(f"Failed to create VO instance: {e}")

        # 应用后置处理函数（如果提供）
        if row_handler is not None:
            try:
                vo_instance = row_handler(vo_instance)
            except Exception as e:
                raise ValueError(f"Error in row_handler: {e}")

        return vo_instance

    @staticmethod
    def has_logic_delete_field(clazz):
        """
        判断模型实例是否存在逻辑删除字段且未被设置为None
        :param cls: 模型类
        :return: bool
        """
        # 检查模型是否有isDeleted属性，且该属性不为None
        # 如果属性为None，表示该字段在当前模型中被显式设置为不映射
        return (
                hasattr(clazz, 'isDeleted')
                and getattr(clazz, 'isDeleted') is not None
        )

    @staticmethod
    def to_list(query: Query, vo_class=None, row_handler: Optional[Callable[[Any], T]] = None) -> List[T]:
        """
        将SQLAlchemy查询对象转成vo-list
        :param query: SQLAlchemy查询对象
        :param vo_class: VO类，用于转换模型对象
        :param row_handler: 行处理函数，用于处理每一行数据
        :return: List[VO] 列表对象
        """
        items = query.all()
        # 转换为VO对象
        rows = []
        for item in items:
            obj = OrmUtil.to_vo(item, vo_class, row_handler)
            if obj is not None:
                rows.append(obj)
        return rows

class TreeUtil:
    """
    树结构工具类
    """

    @staticmethod
    def build_tree(nodes_list, pid: str|None = "0"):
        """
        构建树，pid默认为0
        """
        return TreeUtil._build_tree(nodes_list=nodes_list, pid=pid)

    @staticmethod
    def _build_tree(nodes_list, pid):
        """
        递归构建树结构
        """
        if nodes_list is None or len(nodes_list) == 0:
            return []
        children = []
        for node in nodes_list:
            # 获取节点的pid，支持dict和pydantic模型
            if hasattr(node, 'pid'):
                node_pid = node.pid
            elif isinstance(node, dict) and 'pid' in node:
                node_pid = node['pid']
            else:
                continue
            if str(node_pid) == str(pid):
                children.append(node)
                # 获取节点的id，支持dict和pydantic模型
                if hasattr(node, 'id'):
                    node_id = node.id
                elif isinstance(node, dict) and 'id' in node:
                    node_id = node['id']
                else:
                    continue

                node_children = TreeUtil._build_tree(nodes_list, node_id)
                if len(node_children) > 0:
                    if hasattr(node, 'children'):
                        node.children = node_children
                    elif isinstance(node, dict):
                        node['children'] = node_children
        return children