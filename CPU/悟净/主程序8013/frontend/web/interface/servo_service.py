import json
import os
from pathlib import Path
import subprocess
import threading
import time

from .servo_worker import validate
from .servo_positions import load_presets


class ServoError(Exception):
    def __init__(self, message, status=409):
        super().__init__(message)
        self.status = status


class ServoService:
    def __init__(self, runner=None, settings_path=None):
        self.lock = threading.RLock()
        self._runner = runner or self._execute
        self._state = dict(available=False, checked=False, message='请点击读取舵机状态。', channels=[])
        self._up_observed = None
        self.settings_path = Path(settings_path) if settings_path is not None else None
        self._presets = {}
        self._profile_error = None
        try:
            self._presets = load_presets(self.settings_path)
        except (OSError, ValueError, TypeError):
            self._profile_error = '已保存的舵机端点无法读取，请重新保存端点；XY未启动。'

    @staticmethod
    def _execute(payload):
        env = dict(os.environ, PYTHONDONTWRITEBYTECODE='1')
        env['LD_LIBRARY_PATH'] = '/root/icraft3361_test/runtime/usr/lib/aarch64-linux-gnu'
        command = ['/root/icraft3361_test/venv/bin/python', '-B', str(Path(__file__).with_name('servo_worker.py'))]
        try:
            process = subprocess.run(command, input=json.dumps(payload).encode('utf-8'), stdout=subprocess.PIPE,
                                     stderr=subprocess.STDOUT, timeout=8, env=env)
        except subprocess.TimeoutExpired:
            raise ServoError('读取或提交舵机指令超时，请重新读取状态。', 503)
        lines = process.stdout.decode('utf-8', errors='replace').splitlines()
        rows = [line[len('SERVO_WEB_RESULT '):] for line in lines if line.startswith('SERVO_WEB_RESULT ')]
        if process.returncode or len(rows) != 1:
            raise ServoError('舵机驱动未正常返回，请检查板上程序。', 503)
        result = json.loads(rows[0])
        if not result.get('ok'):
            raise ServoError(result.get('error', '舵机操作失败。'), result.get('status', 503))
        return result['state']

    @staticmethod
    def identity(state):
        return (state.get('boot_id'), state.get('revision'), state.get('command_sequence'),
                tuple((row['up_us'], row['down_us'], row['selected_position'], row['active_us'], row['enabled']) for row in state.get('channels', [])))

    def status(self):
        with self.lock:
            return dict(self._state, probe_state=self.probe_state(),
                        automatic_raise=dict(actions=['jog', 'pads', 'rebuild', 'circle'], settle_ms=600,
                                             presets={str(k): dict(v) for k, v in self._presets.items()},
                                             profile_error=self._profile_error or (
                                                 '请先校准并保存两针的抬落端点。' if set(self._presets) != {1, 2} else None),
                                             position_feedback_available=False))

    def run(self, payload):
        try:
            validate(payload)
        except ValueError as exc:
            raise ServoError(str(exc), 400)
        with self.lock:
            try:
                state = self._runner(payload)
            except ServoError as exc:
                self._up_observed = None
                self._state.update(available=False, checked=True, message=str(exc))
                raise
            state.update(checked=True, message='已读取PWM状态；指令提交不代表机械到位。')
            self._state = state
            # Remember the first verified observation of this exact UP command.
            # Every future move still reads hardware; this only avoids waiting
            # 600 ms again for an unchanged command already given time to settle.
            try:
                self._motion_state(state, raised=True)
            except ServoError:
                self._up_observed = None
            else:
                identity = self.identity(state)
                if self._up_observed is None or self._up_observed[0] != identity:
                    self._up_observed = (identity, time.monotonic())
            if payload['action'] == 'configure':
                presets = {k: dict(v) for k, v in self._presets.items()}
                for channel in (1, 2):
                    if payload['channel'] & channel:
                        presets[channel] = dict(up_us=payload['up_us'], down_us=payload['down_us'])
                try:
                    if self.settings_path is not None:
                        self.settings_path.parent.mkdir(parents=True, exist_ok=True)
                        temporary = self.settings_path.with_name(self.settings_path.name + '.tmp')
                        temporary.write_text(json.dumps(dict(channels={str(k): v for k, v in presets.items()})) + '\n')
                        temporary.replace(self.settings_path)
                except OSError:
                    self._profile_error = '硬件端点已写入，但本地保存失败，请重新保存端点；XY未启动。'
                    raise ServoError(self._profile_error, 503)
                self._presets = presets
                self._profile_error = None
            return self.status()

    @staticmethod
    def _motion_state(state, raised=False):
        rows = state.get('channels', [])
        if (not state.get('available') or state.get('revision') != 124 or state.get('error_code') != 0
                or not state.get('boot_id') or type(state.get('command_sequence')) is not int
                or len(rows) != 2 or {row.get('channel') for row in rows} != {1, 2}):
            raise ServoError('双针PWM身份或状态异常，XY未启动。', 503)
        for row in rows:
            if (row.get('pending') is not False
                    or any(type(row.get(k)) is not int or not 900 <= row[k] <= 2100 for k in ('up_us', 'down_us'))):
                raise ServoError('双针PWM参数或待处理状态异常，XY未启动。')
            if raised and (row.get('enabled') is not True or row.get('selected_position') != 'up'
                           or row.get('active_us') != row['up_us'] or row.get('requested_us') != row['up_us']):
                raise ServoError('双针抬起指令回读未通过，XY未启动。')

    def _sync_presets(self, state, check_stop):
        boot_id = state['boot_id']
        for channel, preset in list(self._presets.items()):
            row = next(row for row in state['channels'] if row['channel'] == channel)
            if any(row[k] != value for k, value in preset.items()):
                check_stop()
                state = self.run(dict(preset, action='configure', channel=channel))
                self._motion_state(state)
                if state['boot_id'] != boot_id or any(next(r for r in state['channels'] if r['channel'] == channel)[k] != v for k, v in preset.items()):
                    raise ServoError('舵机端点写回或启动标识异常，未提交位置命令。')
        return state

    def _require_saved_positions(self):
        if self._profile_error:
            raise ServoError(self._profile_error, 503)
        if set(self._presets) != {1, 2}:
            raise ServoError('请先校准并保存两针的抬落端点；自动动作尚未启动。')

    def prepare_cycle(self):
        with self.lock:
            self._require_saved_positions()
            state = self.run({'action': 'read'})
            self._motion_state(state)
            return self._sync_presets(state, lambda: None)

    def raise_for_motion(self, stop_requested):
        """One dual-channel UP, register verification and bounded settling; no position sensor."""
        def check_stop():
            if stop_requested():
                raise ServoError('自动抬针期间收到停车请求，XY未启动。')

        with self.lock:
            check_stop()
            self._require_saved_positions()
            state = self.run({'action': 'read'})
            self._motion_state(state)
            boot_id = state['boot_id']
            state = self._sync_presets(state, check_stop)
            check_stop()
            sent_up = False
            try:
                self._motion_state(state, raised=True)
            except ServoError:
                before_sequence = state['command_sequence']
                state = self.run({'action': 'up', 'channel': 3})
                sent_up = True
                self._motion_state(state, raised=True)
                if state['boot_id'] != boot_id or state['command_sequence'] != ((before_sequence + 1) & 0xFFFFFFFF):
                    raise ServoError('抬针指令序号不连续，XY未启动。')
            identity = self.identity(state)
            if self._up_observed is None or self._up_observed[0] != identity:
                raise ServoError('双针抬起状态尚未建立，XY未启动。')
            deadline = self._up_observed[1] + .6
            remaining = max(0, deadline - time.monotonic())
            while time.monotonic() < deadline:
                check_stop()
                time.sleep(min(.05, max(0, deadline - time.monotonic())))
            check_stop()
            if remaining > 0:
                state = self.run({'action': 'read'})
                self._motion_state(state, raised=True)
                if self.identity(state) != identity:
                    raise ServoError('等待期间舵机状态被更改，XY未启动。')
            check_stop()
            return dict(command_verified=True, position_feedback_available=False,
                        settle_ms=round(remaining*1000), up_command_sent=sent_up,
                        reused_verified_up=not sent_up,
                        command_sequence=state['command_sequence'], boot_id=state['boot_id'],
                        up_us={str(row['channel']): row['up_us'] for row in state['channels']})

    def probe_state(self):
        try:
            self._motion_state(self._state)
            rows=self._state['channels']
            if any(not row.get('enabled') for row in rows):return 'unknown'
            if all(row.get('selected_position')=='up' for row in rows):
                self._motion_state(self._state,raised=True)
                return ('up' if self._up_observed and self._up_observed[0]==self.identity(self._state)
                        and time.monotonic()-self._up_observed[1]>=.6 else 'raising')
            return 'down'
        except ServoError:
            return 'fault' if self._state.get('checked') else 'unknown'
