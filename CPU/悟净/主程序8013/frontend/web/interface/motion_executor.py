
import atexit
import json
import os
from pathlib import Path
import queue
import subprocess
import sys
import threading
import uuid


class MotionExecutor:
    def __init__(self, root, runtime, popen=subprocess.Popen, idle_seconds=30):
        self.root, self.runtime = Path(root), Path(runtime)
        self.stop_file = self.root / 'zdt/machine_coordinates/stop.request'
        self.fault_path = self.runtime / 'motion_executor.fault.json'
        self.idle_seconds = idle_seconds
        self._popen = popen
        self._lock = threading.Lock()
        self._process = None
        self._responses = None
        self._log = None
        atexit.register(self.close)

    @property
    def running(self):
        return self._process is not None and self._process.poll() is None

    def fault(self):
        if not self.fault_path.exists():
            return None
        try:
            return json.loads(self.fault_path.read_text(encoding='utf-8'))
        except (ValueError, OSError):
            return dict(error='控制会话恢复记录无法读取，请检查电机。')

    def clear_fault(self):
        # Called only after an explicit, successful independent hardware check.
        if self.running:
            raise RuntimeError('控制会话尚未退出，不能清除故障记录。')
        fault = self.fault()
        if fault and fault.get('cleanup_verified') is not True:
            raise RuntimeError('上次会话参数恢复未获核验，请先核对驱动配置及恢复记录。')
        if self.fault_path.exists():
            self.fault_path.unlink()

    def _failed(self, message):
        try:
            self.runtime.mkdir(parents=True, exist_ok=True)
            if not self.fault_path.exists():
                temporary = self.fault_path.with_suffix('.parent.tmp')
                temporary.write_text(json.dumps(dict(error=message, source='pipe_client', cleanup_verified=False), ensure_ascii=False))
                temporary.replace(self.fault_path)
        except OSError:
            pass
        if self.stop_file.parent.is_dir():
            try:
                with self.stop_file.open('x', encoding='utf-8') as handle:
                    handle.write('Motion executor uncertainty: ' + message + '\n')
            except OSError:
                pass

    def _forget(self):
        self._process = None
        self._responses = None
        if self._log is not None:
            self._log.close()
            self._log = None

    def _end_input(self):
        if self._process is not None and self._process.stdin is not None:
            try:
                self._process.stdin.close()
            except (OSError, ValueError):
                pass

    def _collect_exit(self, releasing=False):
        if self._process is not None and self._process.poll() is not None:
            code = self._process.returncode
            self._process.wait()
            for stream in (self._process.stdin, self._process.stdout):
                if stream is not None:
                    try:
                        stream.close()
                    except (OSError, ValueError):
                        pass
            self._forget()
            if code:
                if releasing and (self.fault() or {}).get('cleanup_verified') is True:
                    return
                self._failed('USB控制进程异常退出（%s），没有自动重发。' % code)
                raise RuntimeError('USB控制进程异常退出，请检查电机。')

    def _spawn(self):
        self.runtime.mkdir(parents=True, exist_ok=True)
        self._log = (self.runtime / 'motion_executor.log').open('ab', buffering=0)
        command = [sys.executable, '-B', str(Path(__file__).with_name('motion_resident.py')),
                   '--root', str(self.root), '--runtime', str(self.runtime),
                   '--parent-pid', str(os.getpid()), '--idle-seconds', str(self.idle_seconds), '--execute']
        try:
            self._process = self._popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                        stderr=self._log, start_new_session=True, bufsize=0)
        except BaseException:
            self._forget()
            raise
        responses = self._responses = queue.Queue()
        stream = self._process.stdout

        def receive():
            try:
                while True:
                    line = stream.readline(1024 * 1024 + 1)
                    if not line:
                        break
                    if len(line) > 1024 * 1024 or not line.endswith(b'\n'):
                        raise RuntimeError('控制会话响应过大或不完整。')
                    responses.put(json.loads(line))
            except BaseException as exc:
                responses.put(exc)
            finally:
                responses.put(EOFError('控制会话结束，未重发指令。'))

        threading.Thread(target=receive, name='motion-executor-pipe', daemon=True).start()

    def run(self, payload):
        if not self._lock.acquire(blocking=False):
            raise RuntimeError('控制会话已有请求，不会排队或重复下令。')
        sent = False
        try:
            action = payload['action']
            self._collect_exit(releasing=action == 'release')
            if action not in ('jog', 'pads', 'teach', 'probe', 'release'):
                raise ValueError('控制会话不支持此任务。')
            if self.fault() and action != 'release':
                raise RuntimeError('上次控制会话异常，请先检查电机；指令未发送。')
            if action == 'release' and not self.running:
                fault = self.fault()
                if fault and fault.get('cleanup_verified') is not True:
                    raise RuntimeError('上次USB会话参数恢复未核验，请核对驱动配置及恢复记录。')
                return dict(passed=True, parameters_restored=True, warm_active=False)
            if not self.running:
                self._spawn()
            identifier = uuid.uuid4().hex
            timeout = 600 if action == 'pads' else 5 if action == 'probe' else 30 if action == 'release' else 90
            request = dict(request_id=identifier, payload=dict(payload, timeout_s=timeout))
            raw = (json.dumps(request, ensure_ascii=False, allow_nan=False) + '\n').encode('utf-8')
            if len(raw) > 65536:
                raise ValueError('控制请求过大。')
            sent = True
            if self._process.stdin.write(raw) != len(raw):
                raise RuntimeError('控制请求只发送了部分数据；不会重发。')
            self._process.stdin.flush()
            try:
                response = self._responses.get(timeout=timeout + 5)
            except queue.Empty:
                self._failed('控制任务超时，已请求停车，等待参数恢复。')
                self._process.terminate()
                self._process.wait()
                raise RuntimeError('控制任务超时；未自动重试。')
            if isinstance(response, BaseException):
                raise response
            if not isinstance(response, dict) or response.get('request_id') != identifier:
                raise RuntimeError('控制会话响应编号不匹配，未重发指令。')
            if type(response.get('warm_active')) is not bool:
                raise RuntimeError('控制会话未返回有效的参数持有状态。')
            result = response.get('result')
            if not isinstance(result, dict) or type(result.get('passed')) is not bool:
                raise RuntimeError('控制会话返回无效结果。')
            result = dict(result, warm_active=response.get('warm_active') is True)
            if not result['passed']:
                if (action in ('probe', 'teach') and result.get('read_only_failure') is True
                        and response['warm_active'] is False and result.get('parameters_retained') is False
                        and result.get('motion_commands_sent') == 0 and result.get('motor_parameter_writes') == 0):
                    return result
                raise RuntimeError(result.get('error', '控制会话执行失败。'))
            if action == 'release':
                if result.get('parameters_restored') is not True or result['warm_active']:
                    raise RuntimeError('控制会话未确认完整恢复参数。')
                self._end_input()
                self._process.wait(timeout=10)
                self._collect_exit(releasing=True)
            return result
        except BaseException as exc:
            if sent:
                self._failed('%s: %s' % (type(exc).__name__, exc))
                self._end_input()
                if self._process is not None:
                    self._process.wait()
            raise
        finally:
            self._lock.release()

    def release(self):
        return self.run(dict(action='release', run_id='web_release' + uuid.uuid4().hex))

    def close(self):
        try:
            if self.running:
                self.release()
            else:
                self._collect_exit()
        except BaseException:
            self._end_input()
