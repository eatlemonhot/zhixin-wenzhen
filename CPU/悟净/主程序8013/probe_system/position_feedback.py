import json
from pathlib import Path
import threading


class PositionFeedback:
    def __init__(self, path):
        config = json.loads(Path(path).read_text(encoding='utf-8'))
        self.channels = config['channels']
        if set(self.channels) != {'1', '2'}:
            raise ValueError('针位输入配置错误')
        paths = []
        for channel in self.channels.values():
            if set(channel) != {'up', 'down'}:
                raise ValueError('针位输入配置错误')
            for source in channel.values():
                if set(source) != {'path', 'active_level'} or source['active_level'] not in ('0', '1') or not Path(source['path']).is_absolute():
                    raise ValueError('针位输入配置错误')
                paths.append(str(Path(source['path']).resolve()))
        if len(set(paths)) != len(paths):
            raise ValueError('针位输入重复')
        self.lock = threading.RLock()
        self.count = 0
        self.target = None

    def reset(self):
        with self.lock:
            self.count = 0
            self.target = None

    def __call__(self, position, mask):
        with self.lock:
            if position not in ('up', 'down') or mask not in (1, 2, 3):
                raise ValueError('针位目标错误')
            values = []
            for number in (1, 2):
                if not mask & number:
                    continue
                channel = self.channels[str(number)]
                active = {}
                for name, source in channel.items():
                    value = Path(source['path']).read_text(encoding='ascii').strip()
                    if value not in ('0', '1'):
                        raise ValueError('针位输入错误')
                    active[name] = value == source['active_level']
                if active['up'] and active['down']:
                    raise ValueError('针位反馈冲突')
                values.append(active[position])
            target = (position, mask)
            if self.target != target:
                self.count = 0
                self.target = target
            self.count = self.count + 1 if all(values) else 0
            return self.count >= 3
