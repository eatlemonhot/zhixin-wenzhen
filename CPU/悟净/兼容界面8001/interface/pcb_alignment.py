"""保存PCB到滑台的坐标标定配置。"""
import copy
import hashlib
import json
from pathlib import Path
import threading

from .pcb_coordinates import PROBE_AXES, PROBE_MAPPING_VERSION, validate_offsets


def reference_id(coordinates):
    frame = {str(a): coordinates['axes'][str(a)]['origin']['origin_encoder_deg'] for a in range(1, 5)}
    frame['mm_per_rev'] = coordinates['mm_per_rev']
    frame['probe_mapping'] = dict(version=PROBE_MAPPING_VERSION, axes=PROBE_AXES)
    return hashlib.sha256(json.dumps(frame, sort_keys=True, allow_nan=False).encode()).hexdigest()


class AlignmentStore:
    def __init__(self, path):
        self.path = Path(path)
        self.lock = threading.RLock()

    def read(self):
        with self.lock:
            if not self.path.exists():
                return dict(revision=0, layout_id=None, orientation=0, anchors={},
                            offsets={probe: dict(x=0.0, y=0.0) for probe in ('left', 'right')})
            value = json.loads(self.path.read_text(encoding='utf-8'))
            validate_offsets(value['offsets'])
            if not isinstance(value.get('revision'), int) or isinstance(value['revision'], bool):
                raise ValueError('PCB对准配置版本无效，请检查保存文件。')
            return value

    def _write(self, value):
        self.path.parent.mkdir(parents=True, exist_ok=True)
        temporary = self.path.with_suffix('.tmp')
        temporary.write_text(json.dumps(value, ensure_ascii=False, indent=2, allow_nan=False) + '\n', encoding='utf-8')
        temporary.replace(self.path)
        return copy.deepcopy(value)

    @staticmethod
    def _check_revision(value, revision):
        if isinstance(revision, bool) or not isinstance(revision, int) or revision != value['revision']:
            raise ValueError('PCB配置已变化，请刷新后重新预览或记录。')

    def save_offsets(self, offsets, revision):
        offsets = validate_offsets(offsets)
        with self.lock:
            value = self.read()
            self._check_revision(value, revision)
            value.update(offsets=offsets, revision=value['revision'] + 1)
            return self._write(value)

    def record(self, probe, anchor, layout_id, orientation, revision):
        if probe not in ('left', 'right'):
            raise ValueError('未知探针。')
        with self.lock:
            value = self.read()
            self._check_revision(value, revision)
            if (value['layout_id'], value['orientation']) != (layout_id, orientation):
                value['anchors'] = {}
            value.update(layout_id=layout_id, orientation=orientation, revision=value['revision'] + 1)
            value['anchors'][probe] = copy.deepcopy(anchor)
            return self._write(value)

    def view(self, layout_id, orientation, current_reference=None):
        value = self.read()
        if (value['layout_id'], value['orientation']) != (layout_id, orientation):
            value['anchors'] = {}
        if current_reference is not None:
            value['anchors'] = {probe: anchor for probe, anchor in value['anchors'].items()
                                if anchor.get('reference_id') == current_reference}
        else:
            value['anchors'] = {}
        value.update(layout_id=layout_id, orientation=orientation,
                     alignment={probe: probe in value['anchors'] for probe in ('left', 'right')})
        if layout_id is None:
            value['message'] = '请先上传PCB文件。'
        else:
            missing = ['左针' if p == 'left' else '右针' for p in ('left', 'right') if not value['alignment'][p]]
            value['message'] = ('、'.join(missing) + '尚未记录当前PCB方向、机械映射和回零参考的对准基准。'
                                if missing else '两针对准基准已保存。')
        return value
