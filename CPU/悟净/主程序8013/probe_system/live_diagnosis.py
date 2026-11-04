import copy
import time

import numpy as np

from .live_features import CONTRACT, digest
from .unpowered_ai.core import ACTIONS, ROOT, Ranker
from .unpowered_ai.controller import OptimizedController
from .unpowered_ai.service import normalize


def model_job(job):
    return dict(circuit=copy.deepcopy(job['circuit']), excitation_net=job['scope']['excitation_net'],
                power=dict(mode='unpowered', rails='disconnected', fixed_ground=True))


def identity(job):
    return digest(normalize(model_job(job)))


def model_actions(job, resolve):
    normalized = normalize(model_job(job))
    source = resolve(normalized['net_mapping']['P'], 'left')
    actions = []
    for index, (rs, sense, frequency) in enumerate(ACTIONS):
        internal = sense == 'P'
        target = source if internal else resolve(normalized['net_mapping'][sense], 'right')
        points = {'left': dict(x=source['x'], y=source['y'])}
        if not internal:
            points['right'] = dict(x=target['x'], y=target['y'])
        actions.append(dict(action_id=index, rs_ohm=int(rs), frequency_hz=int(frequency),
                            excitation=source, measurement=target, measurement_net=normalized['net_mapping'][sense],
                            motion_points=points, internal_vb_only=internal))
    return actions


def validate_record(record, index, frames, calibration_id, seen):
    if (record.get('source') != 'hardware' or record.get('calibrated') is not True
            or record.get('quality_passed') is not True or record.get('feature_contract') != CONTRACT
            or record.get('contact_profile') != 'passive-node-loaded-v1'
            or record.get('action_id') != index or record.get('frames') != frames
            or record.get('calibration_id') != calibration_id):
        raise ValueError('诊断采样身份错误')
    session = record.get('acquisition_session_id')
    ids = record.get('frame_ids')
    if not isinstance(session, str) or not session or not isinstance(ids, list) or len(ids) != frames * 4:
        raise ValueError('诊断采样帧错误')
    keys = {(session, value) for value in ids if type(value) is int and value > 0}
    if len(keys) != len(ids) or keys & seen:
        raise ValueError('诊断采样帧复用')
    value = np.asarray(record.get('features'), dtype=float)
    if value.shape != (6,) or not np.isfinite(value).all() or value[3] < 0:
        raise ValueError('诊断特征错误')
    seen.update(keys)
    return value


def make_reference(job, calibration, records):
    if len(records) != 36:
        raise ValueError('正常参考条件不完整')
    seen = set()
    values = [None] * 36
    for row in records:
        index = row.get('action_id')
        if type(index) is not int or not 0 <= index < 36 or values[index] is not None:
            raise ValueError('正常参考索引错误')
        values[index] = validate_record(row, index, 256, calibration.identity, seen).tolist()
    result = dict(schema='probe-normal-reference/1.0', model_identity=identity(job),
                  calibration_id=calibration.identity, features=values, records=records,
                  station_id=calibration.profile['station_id'], dut_id=job['dut_id'], source='hardware')
    result['reference_id'] = digest(result)
    return result


def diagnose(job, calibration, reference, reader, cancel=None, ranker=None):
    body = dict(reference)
    reference_id = body.pop('reference_id', None)
    if (digest(body) != reference_id or reference.get('source') != 'hardware'
            or reference.get('model_identity') != identity(job)
            or reference.get('calibration_id') != calibration.identity
            or reference.get('station_id') != calibration.profile['station_id']
            or reference.get('dut_id') != job['dut_id']):
        raise ValueError('正常参考身份错误')
    baseline = make_reference(job, calibration, reference['records'])
    if baseline['features'] != reference['features']:
        raise ValueError('正常参考特征错误')
    seen = {(row['acquisition_session_id'], frame) for row in reference['records'] for frame in row['frame_ids']}
    normalized = normalize(model_job(job))
    ranker = ranker or Ranker(ROOT / 'model')
    measured_rs = calibration.profile['rs_measured_ohm']
    controller = OptimizedController(normalized['parts'], np.asarray(reference['features']), ranker, rs_values=measured_rs)
    if not np.isfinite(controller.reference_mse) or controller.reference_mse > 9:
        raise ValueError('正常参考物理拟合失败')
    records = []
    acquisition_seconds = 0.
    started = time.monotonic()

    def measure(index, frames):
        nonlocal acquisition_seconds
        if cancel:
            cancel()
        tick = time.monotonic()
        row = reader(index, frames, 'fit' if frames == 16 else 'confirmation')
        acquisition_seconds += time.monotonic() - tick
        value = validate_record(row, index, frames, calibration.identity, seen)
        records.append(row)
        return value

    result = controller.diagnose(measure, cancel=cancel)
    names = []
    for index in result['candidates']:
        label = controller.names[index]
        names.append('normal' if index == 0 else normalized['ref_mapping'][label.split(':')[0]] + ':' + label.split(':')[1])
    elapsed = time.monotonic() - started
    neural = ranker.evidence() if hasattr(ranker, 'evidence') else dict(backend='cpu', NPU_executed=False)
    result.update(candidate_names=names, normal_confirmed=result['status'] == 'confirmed' and result['candidates'] == [0],
                  fault_confirmed=result['status'] == 'confirmed' and result['candidates'] != [0],
                  feature_contract=CONTRACT, reference_id=reference_id, calibration_id=calibration.identity, dut_id=job['dut_id'],
                  hardware_executed=True, NPU_executed=bool(neural.get('NPU_executed')), neural_execution=neural,
                  acquisition_seconds=acquisition_seconds, elapsed_seconds=elapsed,
                  processing_seconds=max(0., elapsed - acquisition_seconds), records=records)
    return result
