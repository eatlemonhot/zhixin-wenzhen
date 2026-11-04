import copy
import json
import math
from pathlib import Path
import threading
from .pcb_coordinates import validate_offsets, PCB_FRAME_VERSION
from .reference_frame import reference_id, reference_frame, rebase_anchor

FIXTURE_MOUNT_ID = 'slot_upper_left_v1'


def fixture_empty():
    return dict(mount_id=FIXTURE_MOUNT_ID, anchors={},
                offsets={p:dict(x=0.,y=0.) for p in ('left','right')}, history={})


def empty():
    return dict(layout_id=None, orientation=0, anchors={},
                offsets={p:dict(x=0.,y=0.) for p in ('left','right')})


def effective(profile, probe):
    anchor = profile.get('anchors',{}).get(probe)
    if not anchor:
        return None
    off = profile['offsets'][probe]
    return dict(x=anchor['x']+(off['x'] if probe == 'left' else -off['x']), y=anchor['y']+off['y'])


def pcb_anchor(anchor, point_lookup=None):
    """将旧版正Y标定转换为负Y坐标，同时保持示教点位置。

    转换采用只读视图，原记录与恢复历史保留；新保存记录带有坐标版本标识。"""
    value=copy.deepcopy(anchor)
    version=value.get('pcb_frame_version',1)
    if type(version) is not int or version not in (1,PCB_FRAME_VERSION):
        raise ValueError('补偿的PCB坐标模型版本未知，请重新对准一次。')
    if version==PCB_FRAME_VERSION:return value
    points=[]
    samples=value.get('calibration',{}).get('samples',[])
    if samples:
        if len(samples)!=5 or len({s.get('pad_id') for s in samples})!=5:
            raise ValueError('旧五点记录不完整，请重新对准一次。')
        points=[s.get('point') for s in samples]
    else:
        point=value.get('taught_point')
        if point is None and point_lookup and value.get('pad_id'):
            point=point_lookup(value['pad_id'])
        if point is None:
            raise ValueError('旧补偿缺少可核对的校准焊盘，无法换算Y方向，请手动对准一次。')
        points=[point]
    if any(not isinstance(p,dict) or any(isinstance(p.get(a),bool) or not isinstance(p.get(a),(int,float)) or not math.isfinite(p[a]) for a in ('x','y')) for p in points):
        raise ValueError('旧补偿的校准点坐标无效，请重新对准一次。')
    reference_y=sum(p['y'] for p in points)/len(points)
    value['y']+=2*reference_y
    value['pcb_frame_version']=PCB_FRAME_VERSION
    value['y_direction_migration']=dict(from_version=1,reference_y_mm=reference_y,
                                       reference_preserved=True)
    if len(points)==1:value['taught_point']=dict(points[0])
    else:value['calibration_before_y_correction']=value.pop('calibration')
    return value


class AlignmentStore:
    def __init__(self, path):
        self.path = Path(path)
        self.lock = threading.RLock()

    def read(self):
        with self.lock:
            value = json.loads(self.path.read_text()) if self.path.exists() else dict(empty(),revision=0)
            validate_offsets(value['offsets'])
            if type(value.get('revision')) is not int:
                raise ValueError('PCB对准配置版本无效，请检查保存文件。')
            fixture=value.get('fixture_registration')
            if fixture is not None:
                if fixture.get('mount_id') != FIXTURE_MOUNT_ID:
                    raise ValueError('设备夹具坐标版本未知，请核对固定槽口。')
                validate_offsets(fixture['offsets'])
                if not isinstance(fixture.get('anchors'),dict) or set(fixture['anchors'])-{'left','right'}:
                    raise ValueError('设备探针补偿记录无效。')
                for anchor in fixture['anchors'].values():
                    if anchor.get('pcb_frame_version') != PCB_FRAME_VERSION:
                        raise ValueError('设备补偿必须采用当前PCB坐标模型。')
            return value

    def install_fixture(self, anchors, layout_id, orientation, revision):

        with self.lock:
            root=self.read();self._check_revision(root,revision)
            if 'fixture_registration' in root:
                raise ValueError('设备补偿已建立，不能重复迁移旧工程记录。')
            if not isinstance(anchors,dict) or not anchors or set(anchors)-{'left','right'}:
                raise ValueError('没有可迁移的探针补偿。')
            fixture=fixture_empty()
            for probe,anchor in anchors.items():
                if anchor.get('pcb_frame_version') != PCB_FRAME_VERSION or any(
                        isinstance(anchor.get(a),bool) or not isinstance(anchor.get(a),(int,float))
                        or not math.isfinite(anchor[a]) for a in ('x','y')):
                    raise ValueError('请先核对原工程并完成旧补偿坐标转换。')
                fixture['anchors'][probe]=dict(copy.deepcopy(anchor), source_layout_id=layout_id,
                                               source_orientation=orientation, mounting=FIXTURE_MOUNT_ID)
            root.update(fixture_registration=fixture,revision=revision+1,schema=3)
            return self._write(root)

    @staticmethod
    def key(layout_id, orientation):
        return str(layout_id)+':'+str(orientation)

    def _profile(self, root, layout_id, orientation):
        key = self.key(layout_id, orientation)
        if key in root.get('profiles',{}):
            return copy.deepcopy(root['profiles'][key])
        if (root['layout_id'],root['orientation']) == (layout_id,orientation):
            return {k:copy.deepcopy(root[k]) for k in empty()}
        return dict(empty(), layout_id=layout_id, orientation=orientation)

    def _write(self, value):
        self.path.parent.mkdir(parents=True, exist_ok=True)
        if self.path.exists() and not self.path.with_suffix('.legacy-backup.json').exists():
            self.path.with_suffix('.legacy-backup.json').write_bytes(self.path.read_bytes())
        temporary = self.path.with_suffix('.tmp')
        temporary.write_text(json.dumps(value,ensure_ascii=False,indent=2,allow_nan=False)+'\n')
        temporary.replace(self.path)
        return copy.deepcopy(value)

    @staticmethod
    def _check_revision(value, revision):
        if type(revision) is not int or revision != value['revision']:
            raise ValueError('PCB配置版本已变化，请刷新后重新预览或记录。')

    def _commit(self, root, profile):
        profiles = root.setdefault('profiles',{})
        if root.get('layout_id') and self.key(root['layout_id'],root['orientation']) not in profiles:
            profiles[self.key(root['layout_id'],root['orientation'])] = {k:copy.deepcopy(root[k]) for k in empty()}
        profiles[self.key(profile['layout_id'],profile['orientation'])] = copy.deepcopy(profile)
        root.update(profile, revision=root['revision']+1,
                    schema=3 if 'fixture_registration' in root else 2)
        return self._write(root)

    def save_offsets(self, offsets, revision, layout_id=None, orientation=None, fixture=False):
        offsets = validate_offsets(offsets)
        with self.lock:
            root=self.read();self._check_revision(root,revision)
            profile=self._profile(root,root['layout_id'] if layout_id is None else layout_id,
                                  root['orientation'] if orientation is None else orientation)
            profile['offsets']=offsets
            if fixture and 'fixture_registration' in root:
                root['fixture_registration']['offsets']=copy.deepcopy(offsets)
            return self._commit(root,profile)

    def record(self, probe, anchor, layout_id, orientation, revision, consolidate=False, fixture=False,seed_fixture=None):
        anchor=copy.deepcopy(anchor)
        anchor.setdefault('pcb_frame_version',PCB_FRAME_VERSION)
        if probe not in ('left','right'):
            raise ValueError('未知探针。')
        with self.lock:
            root=self.read();self._check_revision(root,revision)
            profile=self._profile(root,layout_id,orientation)
            if fixture and 'fixture_registration' not in root and seed_fixture is not None:
                if (seed_fixture['layout_id'],seed_fixture['orientation']) != (layout_id,orientation):
                    raise ValueError('设备补偿初值不属于当前工程及方向。')
                registration=fixture_empty()
                registration['offsets']=validate_offsets(seed_fixture['offsets'])
                for side,saved in seed_fixture['anchors'].items():
                    if saved.get('pcb_frame_version') != PCB_FRAME_VERSION:
                        raise ValueError('设备补偿初值尚未转换到当前PCB坐标模型。')
                    registration['anchors'][side]=dict(copy.deepcopy(saved),source_layout_id=layout_id,
                        source_orientation=orientation,mounting=FIXTURE_MOUNT_ID)
                root['fixture_registration']=registration
            history=root.setdefault('history',{}).setdefault(self.key(layout_id,orientation)+':'+probe,[])
            if probe in profile['anchors']:
                history.append(dict(anchor=copy.deepcopy(profile['anchors'][probe]),offset=copy.deepcopy(profile['offsets'][probe])))
                del history[:-20]
            profile['anchors'][probe]=copy.deepcopy(anchor)
            if consolidate:profile['offsets'][probe]=dict(x=0.,y=0.)
            if fixture:
                registration=root.setdefault('fixture_registration',fixture_empty())
                history=registration['history'].setdefault(probe,[])
                if probe in registration['anchors']:
                    history.append(dict(anchor=copy.deepcopy(registration['anchors'][probe]),
                                        offset=copy.deepcopy(registration['offsets'][probe])))
                    del history[:-20]
                registration['anchors'][probe]=dict(copy.deepcopy(anchor),source_layout_id=layout_id,
                    source_orientation=orientation,mounting=FIXTURE_MOUNT_ID)
                if consolidate:registration['offsets'][probe]=dict(x=0.,y=0.)
            return self._commit(root,profile)

    def restore(self, probe, layout_id, orientation, revision, fixture=False):
        if probe not in ('left','right'):raise ValueError('未知探针。')
        with self.lock:
            root=self.read();self._check_revision(root,revision)
            if fixture and 'fixture_registration' in root:
                registration=root['fixture_registration']
                history=registration['history'].get(probe,[])
                if not history:raise ValueError('该探针没有可恢复的上一版设备补偿。')
                old=history.pop()
                current=dict(anchor=copy.deepcopy(registration['anchors'].get(probe)),
                             offset=copy.deepcopy(registration['offsets'][probe]))
                registration['anchors'][probe]=old['anchor'];registration['offsets'][probe]=old['offset']
                if current['anchor']:history.append(current)
                root['revision']+=1
                return self._write(root)
            profile=self._profile(root,layout_id,orientation)
            key=self.key(layout_id,orientation)+':'+probe
            history=root.get('history',{}).get(key,[])
            if not history:raise ValueError('该探针没有可恢复的上一版补偿。')
            old=history.pop()
            current=dict(anchor=profile['anchors'].get(probe),offset=profile['offsets'][probe])
            profile['anchors'][probe]=old['anchor'];profile['offsets'][probe]=old['offset']
            if current['anchor']:history.append(current)
            return self._commit(root,profile)

    def invalidate(self,probe,layout_id,orientation,revision,fixture=False):
        if probe not in ('left','right'):raise ValueError('未知探针。')
        with self.lock:
            root=self.read();self._check_revision(root,revision)
            if fixture and 'fixture_registration' in root:
                registration=root['fixture_registration']
                audit=root.setdefault('invalidated_fixture_mounts',[])
                audit.append(dict(probe=probe,revision=revision,
                    anchor=registration['anchors'].pop(probe,None),
                    offset=registration['offsets'][probe],history=registration['history'].pop(probe,[])))
                del audit[:-40]
                registration['offsets'][probe]=dict(x=0.,y=0.)
                root['revision']+=1
                return self._write(root)
            profile=self._profile(root,layout_id,orientation)
            key=self.key(layout_id,orientation)+':'+probe
            audit=root.setdefault('invalidated_mounts',[])
            audit.append(dict(key=key,revision=revision,anchor=profile['anchors'].pop(probe,None),
                              offset=profile['offsets'][probe],history=root.get('history',{}).pop(key,[])))
            del audit[:-40]
            profile['offsets'][probe]=dict(x=0.,y=0.)
            return self._commit(root,profile)

    def view(self, layout_id, orientation, current_reference=None, lookup=None, point_lookup=None,use_fixture=False):
        root=self.read();value=self._profile(root,layout_id,orientation)
        value['revision']=root['revision']
        fixture=root.get('fixture_registration') if use_fixture else None
        if fixture is not None:
            value['anchors']=copy.deepcopy(fixture['anchors']) if layout_id else {}
            value['offsets']=copy.deepcopy(fixture['offsets'])
        raw=copy.deepcopy(value['anchors']);valid={};reasons={}
        for probe,anchor in raw.items():
            converted=rebase_anchor(anchor,current_reference,probe,lookup)
            if converted is not None:
                try:valid[probe]=pcb_anchor(converted,point_lookup)
                except (ValueError,KeyError,TypeError) as exc:reasons[probe]=str(exc)
        value['anchors']=valid
        value['alignment']={p:p in valid for p in ('left','right')}
        value['effective_offsets']={p:effective(value,p) for p in ('left','right')}
        value['saved_anchors']=raw
        value['can_restore']={p:bool(root.get('history',{}).get(self.key(layout_id,orientation)+':'+p)) for p in ('left','right')}
        if fixture is not None:
            value['can_restore']={p:bool(fixture['history'].get(p)) for p in ('left','right')}
        value['registration_scope']='fixed_fixture' if fixture is not None else 'board'
        value['fixture_mount_id']=fixture.get('mount_id') if fixture is not None else None
        value['pcb_frame_version']=PCB_FRAME_VERSION
        value['message']=('请先上传PCB文件。' if layout_id is None else
                          '固定槽口设备补偿跨工程沿用；PCB左上角贴齐槽口，页面方向与实物一致。' if fixture is not None else
                          '单点或五点均对准中心；正常定位左针靠左、右针靠右。')
        value['alignment_reasons']={p:('已记录' if p in valid else
            reasons.get(p,'机械参考或配置变化，旧值保留；请完成初始化或重新标定。') if p in raw else '尚未记录该针的中心对准补偿。') for p in ('left','right')}
        return value
