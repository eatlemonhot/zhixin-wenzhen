import json
import os
from pathlib import Path
import subprocess
import threading
import uuid

from .servo_service import ServoError

TERMINAL = ('completed', 'cancelled', 'failed', 'stopped')


class ServoCycleService:
    def __init__(self, root):
        self.root = Path(root)
        self.lock = threading.RLock()
        self.current = None

    def _folder(self, owner):
        if not self.current or self.current['owner'] != owner:
            raise ServoError('当前会话没有舵机测量周期。', 404)
        return self.current['folder']

    def status(self, owner=None):
        with self.lock:
            if not self.current:
                return dict(state='idle', busy=False)
            if owner is not None and self.current['owner'] != owner:
                return dict(state='busy', busy=self.busy, message='其他会话持有舵机任务。')
            folder = self.current['folder']
            state = json.loads((folder / 'status.json').read_text(encoding='utf-8'))
            process = self.current['process']
            if process.poll() is not None and state['state'] not in TERMINAL:
                state.update(state='failed', message='周期进程已退出，请读取舵机状态并确认探针位置。')
                (folder / 'status.json').write_text(json.dumps(state, ensure_ascii=False), encoding='utf-8')
            state.update(job_id=folder.name, busy=process.poll() is None or state['state'] not in TERMINAL)
            return state

    @property
    def busy(self):
        return bool(self.current and self.status().get('busy'))

    @staticmethod
    def validate_payload(payload):
        staged = isinstance(payload, dict) and payload.get('kind') == 'staged_abca'
        if staged:
            from .staged_cycle_worker import validate
            try: validate(payload)
            except ValueError as exc: raise ServoError(str(exc), 400)
        elif not isinstance(payload, dict) or set(payload) != {'channel', 'decimation_log2'}:
            raise ServoError('周期参数需要通道和采样窗口。', 400)
        if not staged and (type(payload['channel']) is not int or payload['channel'] not in (1, 2, 3)):
            raise ServoError('通道必须为1、2或3。', 400)
        if type(payload['decimation_log2']) is not int or payload['decimation_log2'] not in (0, 4, 8):
            raise ServoError('采样窗口无效。', 400)

    def start(self, owner, payload):
        self.validate_payload(payload)
        with self.lock:
            if self.busy:
                raise ServoError('已有落针测量周期正在执行。')
            folder = self.root / ('cycle_' + uuid.uuid4().hex)
            folder.mkdir(parents=True, exist_ok=False)
            (folder / 'request.json').write_text(json.dumps(payload), encoding='utf-8')
            (folder / 'status.json').write_text(json.dumps(dict(state='preparing', sequence=0, message='正在检查配套和采集条件。', events=[]), ensure_ascii=False), encoding='utf-8')
            env = dict(os.environ, PYTHONDONTWRITEBYTECODE='1', LD_LIBRARY_PATH='/root/icraft3361_test/runtime/usr/lib/aarch64-linux-gnu')
            with (folder / 'worker.log').open('wb') as log:
                process = subprocess.Popen(['/root/icraft3361_test/venv/bin/python', '-B', str(Path(__file__).with_name('servo_cycle_worker.py')), str(folder)],
                                           stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT, env=env)
            self.current = dict(owner=owner, folder=folder, process=process)
            return self.status(owner)

    def confirm(self, owner, payload):
        with self.lock:
            folder = self._folder(owner)
            state = self.status(owner)
            position = {'waiting_lowered': 'lowered', 'waiting_raised': 'raised'}.get(state['state'])
            expected = {'sequence': state.get('sequence'), 'position': position}
            if not position or payload != expected or type(payload.get('sequence')) is not int:
                raise ServoError('到位确认已过期，请按当前阶段重新确认。')
            target = folder / ('confirm_' + str(state['sequence']) + '.json')
            try:
                with target.open('x', encoding='utf-8') as output:
                    json.dump(expected, output)
            except FileExistsError:
                raise ServoError('本阶段已提交确认，请等待下一步。')
            return state

    def cancel(self, owner, stop=False):
        with self.lock:
            folder = self._folder(owner)
            if not self.busy:
                raise ServoError('当前周期已经结束。')
            (folder / ('stop.request' if stop else 'cancel.request')).touch()
            return self.status(owner)

    def capture_file(self, owner, name):
        if name not in ('capture.bin', 'capture.json', 'capture.packet', 'staged_raw.zip', 'sequence.json'):
            raise ServoError('文件不存在。', 404)
        folder = self._folder(owner)
        path = folder / name
        if self.busy or not path.is_file():
            raise ServoError('任务结束后才可下载已保存的原码。', 409)
        return path
