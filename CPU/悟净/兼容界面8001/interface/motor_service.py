import fcntl
import json
from pathlib import Path
import subprocess
import sys
import threading
import uuid

from .motor_worker import validate_jog


class ControlError(Exception):
    def __init__(self, message, status=409):
        super().__init__(message)
        self.status = status


class MotorService:
    def __init__(self, root, runtime, popen=subprocess.Popen, usb_lock_file='/tmp/wujing_zdt_ch340.lock'):
        self.root = Path(root)
        self.runtime = Path(runtime)
        self.stop_file = self.root / 'zdt/machine_coordinates/stop.request'
        self._popen = popen
        self.usb_lock_file = str(usb_lock_file)
        self._lock = threading.RLock()
        self._state = dict(connected=False, busy=False, ready=False, positions_mm={},
                           last_job=None, message='接好电机USB接口后，请点击检查电机。')

    @property
    def available(self):
        return (self.root / 'zdt/wujing_usb_probe/motorctl.py').is_file()

    def status(self):
        with self._lock:
            state = dict(self._state)
            state.update(available=self.available, stopped=self.stop_file.exists())
            if state['stopped']:
                state['ready'] = False
            if not state['available']:
                state.update(ready=False, message='未找到悟净电机控制程序。')
            if state['busy'] and state['last_job']:
                try:
                    progress = json.loads((self.runtime / (state['last_job']['job_id'] + '.progress.json')).read_text())
                    if progress.get('job_id') == state['last_job']['job_id']:
                        state['message'] = progress['message']
                        state['last_job'] = dict(state['last_job'], phase=progress['phase'])
                except (OSError, ValueError, KeyError, TypeError):
                    pass
            return state

    def _write_stop(self):
        if not self.stop_file.parent.is_dir():
            raise ControlError('未找到悟净电机控制目录。', 503)
        self.stop_file.write_text('Requested by CircuitScout web control\n', encoding='utf-8')

    def stop(self):
        with self._lock:
            self._write_stop()
            self._state.update(ready=False, message='已请求当前控制器停车，后续点动已锁定。')
        return self.status()

    def clear_stop(self):
        with self._lock:
            if self._state['busy']:
                raise ControlError('控制器仍在运行或恢复参数，请等待结束。')
            # The same lock is held by coordinate rebuilding and all USB controllers.
            with open(self.usb_lock_file, 'a') as handle:
                try:
                    fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
                except BlockingIOError:
                    raise ControlError('USB正被坐标重建等控制程序占用。')
                if self.stop_file.exists():
                    self.stop_file.unlink()
            self._state.update(ready=False, connected=False, positions_mm={},
                               message='已解除停车，请重新检查电机。')
        return self.status()

    def start(self, action, jog=None, context=None, on_success=None):
        if action not in ('check', 'jog', 'pads', 'teach', 'rebuild', 'circle'):
            raise ControlError('不支持的操作。', 400)
        if action == 'jog':
            try:
                validate_jog(jog)
            except ValueError as exc:
                raise ControlError(str(exc), 400)
        with self._lock:
            if not self.available:
                raise ControlError('未找到悟净电机控制程序。', 503)
            if action in ('rebuild', 'circle') and not (self.root / 'zdt/wujing_usb_probe/fast_rebuild.py').is_file():
                raise ControlError('未找到坐标重建与画圆程序。', 503)
            if self._state['busy']:
                raise ControlError('已有电机任务正在执行，请等待，不会排队重复运动。')
            if action != 'check' and self.stop_file.exists():
                raise ControlError('停车锁定中，请先解除停车。')
            if action not in ('check', 'rebuild') and not self._state['ready']:
                raise ControlError('请先解除停车并通过检查电机。')
            self.runtime.mkdir(parents=True, exist_ok=True)
            handle = (self.runtime / 'active.lock').open('a')
            try:
                fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                handle.close()
                raise ControlError('已有网页电机任务正在执行。')
            job_id = 'web_' + uuid.uuid4().hex
            job = dict(job_id=job_id, action=action, state='running')
            messages = {'check': '正在检查电机。', 'jog': '正在执行一次低速点动。',
                        'teach': '正在读取对准位置，不发送运动。', 'pads': '正在低速移动到焊盘目标，请等待。',
                        'rebuild': '正在准备25 rpm坐标重建，四轴各找边一次。',
                        'circle': '正在验证已有坐标并准备画圆，不重复碰边。'}
            self._state.update(busy=True, ready=False, last_job=job, message=messages[action])
            payload = dict(action=action, run_id=job_id)
            if jog is not None:
                payload['jog'] = jog
            if context is not None:
                payload['context'] = context
            arguments = (payload, handle) if on_success is None else (payload, handle, on_success)
            thread = threading.Thread(target=self._run, args=arguments, daemon=True)
            try:
                thread.start()
            except BaseException:
                handle.close()
                self._state.update(busy=False, ready=False)
                raise
            return job_id

    def _run(self, payload, handle, on_success=None):
        job_id = payload['run_id']
        result_path = self.runtime / (job_id + '.json')
        result = {}
        try:
            with (self.runtime / (job_id + '.log')).open('wb') as log:
                command = [sys.executable, '-B', str(Path(__file__).with_name('motor_worker.py')),
                           '--root', str(self.root), '--result', str(result_path),
                           '--progress', str(self.runtime / (job_id + '.progress.json')), '--execute']
                process = self._popen(command, stdin=subprocess.PIPE, stdout=log,
                                      stderr=subprocess.STDOUT, start_new_session=True)
                try:
                    process.communicate(json.dumps(payload).encode('utf-8'),
                                        timeout=(600 if payload['action'] == 'pads' else
                                                 260 if payload['action'] in ('rebuild', 'circle') else 90))
                except subprocess.TimeoutExpired:
                    with self._lock:
                        self._write_stop()
                        self._state.update(ready=False, message='任务超时，已请求停车，等待控制器完成清理。')
                    process.communicate()
                if result_path.is_file():
                    result = json.loads(result_path.read_text(encoding='utf-8'))
                if process.returncode != 0 or not result.get('passed'):
                    raise RuntimeError(result.get('error') or '控制程序未正常完成，需重新检查。')
            with self._lock:
                limited = (payload['action'] == 'jog' and result.get('outcome') == 'limited'
                           and result.get('error_code') == 'jog_soft_limit'
                           and result.get('motion_commands_sent') == 0
                           and result.get('ready') is True and result.get('connected') is True)
                if result.get('outcome') == 'limited' and not limited:
                    raise RuntimeError('软限位结果缺少无运动及参考有效的核验，需重新检查电机。')
                if on_success is not None and not limited:
                    on_success(result)
                self._state.update(connected=True, ready=not self.stop_file.exists(),
                                   positions_mm=result.get('positions_mm', {}),
                                   message=result.get('message', '操作完成。'))
                self._state['last_job'] = dict(job_id=job_id, action=payload['action'],
                                              state='limited' if limited else 'completed')
                if limited:
                    self._state['last_job'].update(notice=result['message'], error_code='jog_soft_limit')
                if result.get('timing'):
                    self._state['last_job']['timing'] = result['timing']
                if result.get('jog'):
                    self._state['last_job']['jog'] = result['jog']
        except BaseException as exc:
            with self._lock:
                self._state.update(connected=False, ready=False, positions_mm={},
                                   message='任务失败，可先点击“检查电机”重新核验；参考失效时才需要坐标重建。')
                self._state['last_job'] = dict(job_id=job_id, action=payload['action'], state='failed', error=str(exc))
        finally:
            with self._lock:
                self._state['busy'] = False
                handle.close()
