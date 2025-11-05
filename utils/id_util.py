import time


class IdUtil:
    """
    雪花算法生成器
    """

    def __init__(self, worker_id, datacenter_id, epoch=1288834974657):
        self.worker_id = worker_id & 0x0F  # 保证worker_id不超过4位
        self.datacenter_id = datacenter_id & 0x07  # 保证datacenter_id不超过3位
        self.epoch = epoch
        self.sequence = 0
        self.last_timestamp = -1

    def _next_id(self):
        timestamp = int(time.time() * 1000)

        if timestamp < self.last_timestamp:
            raise Exception(
                "Clock moved backwards. Refusing to generate id for %d milliseconds"
                % (self.last_timestamp - timestamp)
            )

        if timestamp == self.last_timestamp:
            self.sequence = (self.sequence + 1) & 0xFFF
            if self.sequence == 0:
                timestamp = self._wait_for_next_millis(self.last_timestamp)
        else:
            self.sequence = 0

        self.last_timestamp = timestamp

        new_id = (
            ((timestamp - self.epoch) << 22)
            | (self.datacenter_id << 17)
            | (self.worker_id << 12)
            | self.sequence
        )
        return new_id

    def _wait_for_next_millis(self, last_timestamp):
        timestamp = last_timestamp
        while timestamp <= last_timestamp:
            timestamp = int(time.time() * 1000)
        return timestamp

    def generate(self):
        return self._next_id()

    @staticmethod
    def generate_id():
        return generator.generate()


generator = IdUtil(worker_id=1, datacenter_id=1)
