from sqlalchemy import TypeDecorator, BigInteger
from sqlalchemy.dialects.mysql import TINYINT


class BigIntType(TypeDecorator):
    """将 BigInteger 在 Python 中表示为字符串"""
    impl = BigInteger

    def process_bind_param(self, value, dialect):
        if value is not None:
            return int(value)
        return value

    def process_result_value(self, value, dialect):
        if value is not None:
            return str(value)  # 返回字符串避免精度丢失
        return value


class BooleanType(TypeDecorator):
    """自定义布尔类型处理器"""
    impl = TINYINT  # 使用 TINYINT 作为底层类型

    def process_bind_param(self, value, dialect):
        """将 Python 值转换为数据库值"""
        if value is None:
            return None
        return 1 if value else 0

    def process_result_value(self, value, dialect):
        """将数据库值转换为 Python 值"""
        if value is None:
            return None
        # 确保正确处理各种情况
        if isinstance(value, bool):
            return value
        elif isinstance(value, (int, float)):
            return bool(value and value != 0)
        elif isinstance(value, str):
            return value.lower() not in ('0', 'false', 'f', 'no', 'n', '')
        else:
            return bool(value)
