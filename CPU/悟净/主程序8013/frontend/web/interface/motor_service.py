from .file_lock import fcntl
import json
from pathlib import Path
import subprocess
import sys
import threading
import time
import uuid

from .motor_worker import validate_jog


class ControlError(Exception):
    def __init__(self, message, status=409):
        super().__init__(message)
        self.status = status


class MotorService:
    def __init__(self, root, runtime, popen=subprocess.Popen, usb_lock_file='/tmp/wujing_zdt_ch340.lock', prepare_motion=None, executor=None):
        self.root = Path(root)
        self.runtime = Path(runtime)
        self.stop_file = self.root / 'zdt/machine_coordinates/stop.request'
        self._popen = popen
        self.usb_lock_file = str(usb_lock_file)
        self.prepare_motion = prepare_motion
        self.executor = executor
        self.initialization = dict(phase="disabled",message="本地离线模式，未启动自动初始化。")
        self._background_done = threading.Event(); self._background_done.set()
        self._lock = threading.RLock()
        self._state = dict(connected=False, busy=False, ready=False, positions_mm={},
                           last_job=None, message='接好电机USB接口后，请点击检查电机。')

    @property
    def available(self):
        return (self.root / 'zdt/wujing_usb_probe/motorctl.py').is_file()

    def status(self):
        with self._lock:
            state = dict(self._state)
            state.update(available=self.available, stopped=self.stop_file.exists(), initialization=dict(self.initialization))
            if self.executor is not None:
                state['control_session'] = dict(process_active=self.executor.running, idle_timeout_s=30)
                fault = self.executor.fault()
                if fault:
                    state.update(ready=False, message='控制会话异常，请检查电机及参数恢复记录。', control_fault=fault)
            if state['stopped']:
                state['ready'] = False
            if not state['available']:
                state.update(ready=False, message='电机后端未挂载；请检查服务启动参数--motor-root，不能用离线占位目录控制实机。')
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
            self.release_idle()
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

    def release_idle(self):
        if self.executor is not None:
            try:
                self.executor.release()
            except Exception as exc:
                self._state.update(ready=False)
                raise ControlError('控制会话尚未确认恢复，操作未继续：%s' % exc)

    def start(self, action, jog=None, context=None, on_success=None):
        if not self._background_done.wait(6):
            raise ControlError('正在核验四轴供电，请稍后操作。')
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
            if action not in ('check', 'rebuild') and (not self._state['ready'] or
                    self.executor is not None and self.executor.fault()):
                raise ControlError('请先解除停车并通过检查电机。')
            if action in ('jog', 'pads', 'rebuild', 'circle') and not callable(self.prepare_motion):
                raise ControlError('自动抬针服务未注册，不能启动XY运动。', 503)
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
                        'teach': '正在读取对准位置，不发送运动。', 'pads': '正在核验抬针，随后以画圆速度策略同步定位。',
                        'rebuild': '正在自动抬起双针，回读并等待后进行四轴坐标重建。',
                        'circle': '正在自动抬起双针，回读并等待后使用已有坐标画圆。'}
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
        submitted = time.monotonic()
        job_id = payload['run_id']
        result_path = self.runtime / (job_id + '.json')
        result = {}
        raise_receipt = None
        raise_elapsed = 0
        try:
            with (self.runtime / (job_id + '.log')).open('wb') as log:
                if self.executor is not None and payload['action'] in ('check', 'rebuild', 'circle'):
                    self.release_idle()
                if payload['action'] in ('jog', 'pads', 'rebuild', 'circle'):
                    if not callable(self.prepare_motion):
                        raise ControlError('自动抬针服务未注册，XY未启动。', 503)
                    raise_started = time.monotonic()
                    raise_receipt = self.prepare_motion(self.stop_file.exists)
                    raise_elapsed = time.monotonic()-raise_started
                    if not isinstance(raise_receipt, dict) or raise_receipt.get('command_verified') is not True:
                        raise ControlError('自动抬针没有返回有效回读凭据，XY未启动。')
                    with self._lock:
                        if self.stop_file.exists():
                            raise ControlError('自动抬针期间收到停车请求，XY未启动。')
                        self._state['last_job'] = dict(self._state.get('last_job') or {},
                                                      probe_raise=raise_receipt)
                        self._state['message'] = '双针抬起指令回读通过，等待已结束，正在启动XY任务。'
                if self.executor is not None and payload['action'] in ('jog', 'pads', 'teach'):
                    dispatched = time.monotonic()
                    result = self.executor.run(payload)
                    result['timing'] = dict(result.get('timing') or {},
                                            automatic_raise_s=raise_elapsed,
                                            prepare_before_dispatch_s=dispatched-submitted,
                                            service_elapsed_s=time.monotonic()-submitted)
                    temporary = result_path.with_suffix('.tmp')
                    temporary.write_text(json.dumps(result, ensure_ascii=False, allow_nan=False), encoding='utf-8')
                    temporary.replace(result_path)
                else:
                    result = self._run_once(payload, result_path, log)
                if not result.get('passed'):
                    raise RuntimeError(result.get('error') or '控制程序未正常完成，需重新检查。')
                if self.executor is not None and payload['action'] == 'check' and result.get('ready'):
                    self.executor.clear_fault()
            with self._lock:
                limited = (payload['action'] == 'jog' and result.get('outcome') == 'limited'
                           and result.get('error_code') == 'jog_soft_limit'
                           and result.get('motion_commands_sent') == 0
                           and result.get('ready') is True and result.get('connected') is True)
                if result.get('outcome') == 'limited' and not limited:
                    raise RuntimeError('软限位结果缺少无运动及参考有效的核验，需重新检查电机。')
                if on_success is not None and not limited:
                    on_success(result)
                self._state.update(connected=bool(result.get('connected',True)), ready=bool(result.get('ready',True)) and not self.stop_file.exists(),
                                   positions_mm=result.get('positions_mm', {}),
                                   message=result.get('message', '操作完成。'))
                self._state['last_job'] = dict(job_id=job_id, action=payload['action'],
                                              state='limited' if limited else 'completed')
                if limited:
                    self._state['last_job'].update(notice=result['message'], error_code='jog_soft_limit')
                for key in ('timing', 'jog', 'session_reused', 'parameters_retained'):
                    if key in result:
                        self._state['last_job'][key] = result[key]
        except BaseException as exc:
            failure = dict(passed=False, connected=False, ready=False, error=str(exc))
            if not result_path.exists():
                result_path.write_text(json.dumps(failure, ensure_ascii=False), encoding='utf-8')
            with self._lock:
                self._state.update(connected=False, ready=False, positions_mm={},
                                   message='任务失败，可先点击“检查电机”重新核验；参考失效时才需要坐标重建。')
                self._state['last_job'] = dict(job_id=job_id, action=payload['action'], state='failed', error=str(exc))
        finally:
            with self._lock:
                if raise_receipt is not None:
                    self._state['last_job']['probe_raise'] = raise_receipt
                self._state['busy'] = False
                handle.close()

    def _run_once(self, payload, result_path, log):
        job_id = payload['run_id']
        result = {}
        command = [sys.executable, '-B', str(Path(__file__).with_name('motor_worker.py')),
                   '--root', str(self.root), '--result', str(result_path),
                   '--progress', str(self.runtime / (job_id + '.progress.json')), '--execute']
        with self._lock:
            if payload['action'] in ('jog', 'pads', 'rebuild', 'circle') and self.stop_file.exists():
                raise ControlError('收到停车请求，XY未启动。')
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
        return result

    def inspect_idle(self):
        with self._lock:
            if self._state['busy'] or not self.available:return None
            self.runtime.mkdir(parents=True,exist_ok=True)
            handle=(self.runtime/'active.lock').open('a')
            try:fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            except BlockingIOError:handle.close();return None
            self._background_done.clear()
        identifier='web_'+uuid.uuid4().hex
        output=self.runtime/(identifier+'.json')
        try:
            if self.executor is not None and (self.executor.running or self.executor.fault()):
                if self.executor.fault():
                    return dict(connected=False, ready=False, reference_valid=False)
                result = self.executor.run(dict(action='probe', run_id=identifier))
                with self._lock:
                    self._state.update(connected=bool(result.get('connected')), ready=bool(result.get('ready')) and not self.stop_file.exists(),
                                       positions_mm=result.get('positions_mm', {}))
                return result
            command=[sys.executable,'-B',str(Path(__file__).with_name('motor_worker.py')),
                     '--root',str(self.root),'--result',str(output),'--execute']
            with (self.runtime/'power_monitor.log').open('wb') as log:
                process=self._popen(command,stdin=subprocess.PIPE,stdout=log,stderr=subprocess.STDOUT)
                try:process.communicate(json.dumps(dict(action='probe',run_id=identifier)).encode(),timeout=5)
                except subprocess.TimeoutExpired:
                    process.terminate()
                    try:process.communicate(timeout=2)
                    except subprocess.TimeoutExpired:process.kill();process.communicate()
                    return dict(connected=False)
            result=json.loads(output.read_text()) if output.exists() else dict(connected=False)
            if 'USB接口正被' in result.get('error',''):return None
            with self._lock:
                self._state.update(connected=bool(result.get('connected')),ready=bool(result.get('ready')) and not self.stop_file.exists(),
                                   positions_mm=result.get('positions_mm',{}),
                                   message='四轴供电和参考正常。' if result.get('ready') else '等待自动初始化或四轴供电就绪。')
            return result
        finally:
            if output.exists():output.unlink()
            handle.close();self._background_done.set()
