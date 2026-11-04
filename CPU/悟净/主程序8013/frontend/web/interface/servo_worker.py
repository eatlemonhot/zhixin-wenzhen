"""只在收到明确请求后访问舵机寄存器，加载模块本身不访问硬件。"""
import importlib.util
import json
from pathlib import Path
import sys

BASE = 0x400C0200
VERSIONS = {0x53525632: (123, 1500), 0x53525633: (124, 900)}


def validate(payload):
    if not isinstance(payload, dict) or payload.get('action') not in ('read', 'up', 'down', 'stop', 'configure', 'clear-error'):
        raise ValueError('不支持的舵机操作。')
    action = payload['action']
    keys = {'action'} if action in ('read', 'clear-error') else {'action', 'channel'}
    if action == 'configure':
        keys |= {'up_us', 'down_us'}
    if set(payload) != keys:
        raise ValueError('舵机请求字段不正确。')
    if 'channel' in keys and (type(payload['channel']) is not int or payload['channel'] not in (1, 2, 3)):
        raise ValueError('通道必须为1、2或3。')
    if action == 'configure' and any(type(payload[name]) is not int or not 900 <= payload[name] <= 2100 for name in ('up_us', 'down_us')):
        raise ValueError('位置脉宽必须为900～2100之间的整数微秒。')
    return action


def driver(registers):
    """先读硬件身份，再选择原123或124驱动，不猜测运行版本。"""
    if registers.read(0x400C00C0, False) & 0xFFFFFFFF != 0x20261014:
        raise RuntimeError('当前PL不是配套的主测量工程，未写寄存器。')
    identity = registers.read(BASE, False) & 0xFFFFFFFF
    if identity not in VERSIONS:
        raise RuntimeError('当前PL没有双路舵机PWM接口，需要加载123或124配套位流。')
    revision, minimum = VERSIONS[identity]
    spec = importlib.util.spec_from_file_location('servo_driver_' + str(revision), str(Path(__file__).with_name('servo_driver' + str(revision) + '.py')))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.ServoPair(registers), minimum


def dispatch(payload, registers):
    action = validate(payload)
    servo, minimum = driver(registers)
    if action == 'read':
        state = servo.status()
    elif action == 'configure':
        state = servo.configure(payload['channel'], up_us=payload['up_us'], down_us=payload['down_us'])
    elif action == 'clear-error':
        state = servo.clear_error()
    else:
        state = servo.command(action, payload['channel'])
    state.update(available=True, min_us=minimum, max_us=2100)
    return state


def main():
    device = None
    try:
        payload = json.loads(sys.stdin.buffer.read(2049))
        validate(payload)
        import fcntl
        from contextlib import ExitStack
        # 同时遵守两版CLI的锁，禁止网页与其他命令交叉写寄存器。
        with ExitStack() as stack:
            for revision in (123, 124):
                lock = stack.enter_context(open('/run/lock/fdw-servo-pair' + str(revision) + '.lock', 'a'))
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
            from icraft import xrt, zg330backend
            device = xrt.Device.Open('axi://zg330aiu?npu=0x40000000&dma=0x80000000')
            try:
                state = dispatch(payload, device.defaultRegRegion())
                state['boot_id'] = Path('/proc/sys/kernel/random/boot_id').read_text().strip()
            finally:
                xrt.Device.Close(device)
                device = None
        result = dict(ok=True, state=state)
    except ValueError as exc:
        result = dict(ok=False, error=str(exc), status=400)
    except BlockingIOError:
        result = dict(ok=False, error='舵机正在被其他任务使用，请稍后重试。', status=409)
    except Exception as exc:
        result = dict(ok=False, error=str(exc), status=503)
    print('SERVO_WEB_RESULT ' + json.dumps(result, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    main()
