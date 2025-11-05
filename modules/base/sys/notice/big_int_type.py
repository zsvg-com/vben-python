from sqlalchemy import TypeDecorator, BigInteger


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