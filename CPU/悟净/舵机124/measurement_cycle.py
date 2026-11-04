"""测量周期的舵机互锁：确认落针后测量，完成后抬针。"""
from contextlib import contextmanager
try:
    from .servo_positions import require_cycle_positions
except ImportError:
    from servo_positions import require_cycle_positions


@contextmanager
def process_lock():
    import fcntl
    with open('/run/lock/fdw-servo-pair124.lock', 'a') as stream:
        fcntl.flock(stream.fileno(), fcntl.LOCK_EX)
        try:
            yield
        finally:
            fcntl.flock(stream.fileno(), fcntl.LOCK_UN)


class MeasurementCycle:

    def __init__(self, servo, confirm_lowered, confirm_raised, lock=process_lock):
        if not all(callable(x) for x in (confirm_lowered, confirm_raised)):
            raise ValueError('必须接入真实到位反馈或显式人工确认')
        self.servo = servo
        self.confirm_lowered = confirm_lowered
        self.confirm_raised = confirm_raised
        self.lock = lock

    def run(self, measure, channels=2):
        if not callable(measure):
            raise ValueError('测量入口必须是可调用任务')
        with self.lock():
            state = self.servo.status()
            if state.get('revision') != 124 or state.get('error_code'):
                raise RuntimeError('舵机版本或错误状态不允许启动测量周期')
            mask = self.servo._mask(channels)
            require_cycle_positions(state, mask)
            try:
                state = self.servo.down(mask)
                if self.confirm_lowered(state) is not True:
                    raise RuntimeError('未确认探针落下，禁止开始测量')
                result = measure()
                return result
            finally:
                state = self.servo.up(mask)
                if self.confirm_raised(state) is not True:
                    raise RuntimeError('测量完成但未确认探针已抬起')
