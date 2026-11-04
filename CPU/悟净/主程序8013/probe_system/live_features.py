import cmath
import hashlib
import json
import math
from pathlib import Path
import threading

import numpy as np


CONTRACT = 'pl-lsq8192-dds-mean-v1'
PATHS = ('VA', 'VB', 'PROBE', 'VA_check')


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, ensure_ascii=False, allow_nan=False, separators=(',', ':')).encode('utf-8')).hexdigest()


def finite(value):
    return type(value) in (int, float) and math.isfinite(value)


def pair(value):
    if not isinstance(value, (list, tuple)) or len(value) != 2 or not all(finite(v) for v in value):
        raise ValueError('复数格式错误')
    return complex(*value)


def point(frequency, ratio=16):
    if not finite(frequency) or frequency <= 0 or type(ratio) is not int or ratio < 1 or ratio > 65536 or ratio & (ratio - 1):
        raise ValueError('采样配置错误')
    ftw = round(frequency * 2**32 / 25000000)
    if not 0x100000 <= ftw * ratio < 0x80000000:
        raise ValueError('采样频率超出范围')
    f = ftw / 2**32
    gain = 1.0 if ratio == 1 else (math.sin(math.pi * ratio * f) / (ratio * math.sin(math.pi * f)))**3
    return dict(dds_ftw=ftw, interval_ticks=ratio, pl_ftw=ftw * ratio,
                filter='cic3' if ratio != 1 else 'bypass', filter_gain=gain,
                filter_phase_radians=-math.pi * f * 3 * (ratio - 1))


def validate_frame(frame, expected):
    meta = frame['metadata']
    required = ('record_id', 'generation', 'sample_count', 'raw_clock_hz', 'first_tick', 'last_tick',
                'first_phase_word', 'last_phase_word', 'dds_ftw', 'dac_tag', 'interval_ticks',
                'decimation_log2', 'filter_id', 'pipeline_tick_compensation', 'errors')
    if any(type(meta.get(k)) is not int for k in required):
        raise ValueError('相位元数据错误')
    ratio = expected['interval_ticks']
    if (meta.get('metadata_version') != 2 or meta.get('complete') is not True or meta['errors']
            or frame.get('flags') != 8 or frame.get('mode') != 0 or frame.get('overrange_count') != 0
            or meta['sample_count'] != 8192 or meta['raw_clock_hz'] != 25000000
            or meta['dds_ftw'] != expected['dds_ftw'] or meta['interval_ticks'] != ratio
            or meta['decimation_log2'] != ratio.bit_length() - 1 or meta['filter_id'] != int(ratio != 1)
            or meta['pipeline_tick_compensation'] != (2 if ratio != 1 else 0)
            or not 0 < meta['record_id'] < 2**32 or not 0 < meta['generation'] < 2**32
            or not 0 < meta['dac_tag'] < 2**32 or type(meta.get('inverted')) is not bool
            or not 0 <= meta['first_tick'] < meta['last_tick'] < 2**64
            or not 0 <= meta['first_phase_word'] < 2**32 or not 0 <= meta['last_phase_word'] < 2**32
            or meta['last_tick'] - meta['first_tick'] != 8191 * ratio
            or meta['last_phase_word'] != (meta['first_phase_word'] + 8191 * expected['pl_ftw']) & 0xffffffff):
        raise ValueError('采样身份或质量错误')
    samples = np.asarray(frame['samples'])
    if samples.shape != (8192,) or not np.isfinite(samples).all() or samples.min() <= -2048 or samples.max() >= 2047:
        raise ValueError('ADC样本错误')
    return meta


class FrameProcessor:
    def __init__(self, backend='cpu', device=None):
        if backend not in ('cpu', 'pl'):
            raise ValueError('特征后端错误')
        self.backend = backend
        self.device = device
        self.driver = None
        self.lock = threading.RLock()
        self.schedule = json.loads((Path(__file__).with_name('live_schedule.json')).read_text(encoding='utf-8'))

    def open(self):
        if self.backend != 'pl':
            return
        from teammate_pl.software.wujing.pl_runtime.sdk_backend import FdwPlDspClient
        with self.lock:
            if self.device is None:
                from icraft import xrt
                self.device = xrt.Device.Open('axi://zg330aiu?npu=0x40000000&dma=0x80000000')
            if self.driver is None:
                self.driver = FdwPlDspClient(self.device)
            self.driver.require_version()

    def close(self):
        with self.lock:
            if self.driver is not None and self.driver.quarantine:
                self.driver.release_quarantine()
            if self.device is not None:
                from icraft import xrt
                xrt.Device.Close(self.device)
            self.driver = None
            self.device = None

    def process(self, frame, frequency, ratio=16):
        config = point(frequency, ratio)
        meta = validate_frame(frame, config)
        if self.backend == 'pl':
            from teammate_pl.software.wujing.pl_runtime.phase_contract import reference_phasor
            with self.lock:
                self.open()
                compiled = self.schedule[str(int(frequency)) + ':' + str(ratio)]
                if compiled['ftw'] != config['pl_ftw']:
                    raise ValueError('PL配置错误')
                result = self.driver.compute(frame['samples'], compiled, meta['record_id'], frame['flags'])
                z = reference_phasor(result, meta, config)
                dc, residual = result['dc_counts'], result['residual_rms_counts']
        else:
            phases = ((np.arange(8192, dtype=np.int64) * config['pl_ftw'] + meta['first_phase_word']) % 2**32) * (2 * math.pi / 2**32)
            basis = np.column_stack((np.ones(8192), np.cos(phases), np.sin(phases)))
            samples = np.asarray(frame['samples'], dtype=float)
            coefficients = np.linalg.lstsq(basis, samples, rcond=None)[0]
            dc = float(coefficients[0])
            residual = float(np.sqrt(np.mean((samples - basis @ coefficients)**2)))
            z = complex(coefficients[1], -coefficients[2]) * 1j
            if meta['inverted']:
                z = -z
            z *= cmath.exp(-1j * config['filter_phase_radians']) / config['filter_gain']
        return dict(real_counts=float(z.real), imag_counts=float(z.imag), dc_counts=float(dc),
                    residual_rms_counts=float(residual), record_id=meta['record_id'], generation=meta['generation'],
                    first_tick=meta['first_tick'], last_tick=meta['last_tick'], backend=self.backend)


def aggregate(frames):
    if not frames:
        raise ValueError('采样帧为空')
    if len({f['record_id'] for f in frames}) != len(frames):
        raise ValueError('重复采样帧')
    z = np.array([complex(f['real_counts'], f['imag_counts']) for f in frames])
    mean = complex(z.mean())
    return dict(real_counts=mean.real, imag_counts=mean.imag, peak_counts=abs(mean),
                phase_degrees=math.degrees(cmath.phase(mean)),
                dc_counts=float(np.mean([f['dc_counts'] for f in frames])),
                residual_rms_counts=float(np.sqrt(np.mean([f['residual_rms_counts']**2 for f in frames]))),
                repeatability_counts=float(np.sqrt(np.mean(abs(z - mean)**2))), frame_count=len(frames),
                frame_ids=[f['record_id'] for f in frames], first_ticks=[str(f['first_tick']) for f in frames],
                backend=frames[0]['backend'])


def calibration_profile(payload):
    standards = payload.get('standards')
    if not isinstance(standards, list) or not 6 <= len(standards) <= 4096:
        raise ValueError('校准标准数量错误')
    groups = {}
    seen = set()
    for sample in standards:
        key = (sample.get('rs_ohm'), sample.get('frequency_hz'), sample.get('path'), sample.get('interval_ticks', 16))
        if key[0] not in (100, 10000) or key[2] not in ('VA', 'VB', 'PROBE'):
            raise ValueError('校准通道错误')
        point(key[1], key[3])
        identity = (sample.get('session_id'), sample.get('record_id'))
        if not isinstance(identity[0], str) or not identity[0] or type(identity[1]) is not int or identity[1] <= 0 or identity in seen:
            raise ValueError('校准采样身份错误')
        seen.add(identity)
        raw_hash = sample.get('raw_sha256')
        if not isinstance(raw_hash, str) or len(raw_hash) != 64 or any(c not in '0123456789abcdef' for c in raw_hash):
            raise ValueError('校准原始数据身份错误')
        pair(sample.get('measured_phasor_counts'))
        pair(sample.get('reference_phasor_V'))
        if not all(finite(sample.get(k)) for k in ('measured_dc_counts', 'reference_dc_V')):
            raise ValueError('校准直流数据错误')
        groups.setdefault(key, []).append(sample)
    rows = []
    for (rs, frequency, path, ratio), samples in groups.items():
        if len(samples) < 2:
            raise ValueError('每个通道至少需要两个校准电平')
        x = np.array([pair(s['measured_phasor_counts']) for s in samples])
        y = np.array([pair(s['reference_phasor_V']) for s in samples])
        energy = float(np.vdot(x, x).real)
        if energy <= 1e-12:
            raise ValueError('校准激励不足')
        scale = np.vdot(x, y) / energy
        xd = np.array([s['measured_dc_counts'] for s in samples])
        yd = np.array([s['reference_dc_V'] for s in samples])
        if np.ptp(xd) < 1:
            raise ValueError('直流校准电平不足')
        gain, offset = np.linalg.lstsq(np.column_stack((xd, np.ones(len(xd)))), yd, rcond=None)[0]
        relative_error = float(np.linalg.norm(y - x * scale) / max(np.linalg.norm(y), 1e-12))
        if not abs(scale) > 0 or not gain > 0 or relative_error > .01 or np.max(abs(yd - (xd * gain + offset))) > .001:
            raise ValueError('校准拟合误差超限')
        rows.append(dict(rs_ohm=rs, frequency_hz=frequency, path=path, interval_ticks=ratio,
                         fundamental_V_per_count=[float(scale.real), float(scale.imag)],
                         dc_V_per_count=float(gain), dc_offset_V=float(offset), residual_V_per_count=float(abs(scale)),
                         relative_fit_error=relative_error))
    for rs, frequency, _, ratio in groups:
        if any((rs, frequency, channel, ratio) not in groups for channel in ('VA', 'VB', 'PROBE')):
            raise ValueError('校准通道不完整')
    measured_rs = payload.get('rs_measured_ohm', {})
    if set(measured_rs) != {'100', '10000'} or any(not finite(measured_rs[k]) or abs(measured_rs[k] / float(k) - 1) > .1 for k in measured_rs):
        raise ValueError('实测采样电阻错误')
    result = dict(schema='probe-calibration/1.0', feature_contract=CONTRACT,
                  station_id=payload.get('station_id'), rs_measured_ohm=measured_rs, rows=rows,
                  evidence_sha256=digest(standards), left_terminal=payload.get('left_terminal'))
    if not isinstance(result['station_id'], str) or not result['station_id']:
        raise ValueError('设备编号错误')
    if result['left_terminal'] not in ('TP_A', 'TP_B'):
        raise ValueError('探针接线配置错误')
    result['calibration_id'] = digest(result)
    return result


class Calibration:
    def __init__(self, profile):
        self.profile = profile
        body = dict(profile)
        identity = body.pop('calibration_id', None)
        if profile.get('schema') != 'probe-calibration/1.0' or digest(body) != identity:
            raise ValueError('校准文件身份错误')
        self.identity = identity
        self.rows = {(r['rs_ohm'], r['frequency_hz'], r['path'], r['interval_ticks']): r for r in profile['rows']}

    def features(self, paths, frequency, rs, frames, action_id, session_id, internal_vb=False):
        calibrated = {}
        all_ids = []
        for name in PATHS:
            row = paths[name]
            channel = 'VA' if name == 'VA_check' else 'VB' if name == 'PROBE' and internal_vb else name
            key = (rs, frequency, channel, 16)
            cal = self.rows[key]
            z = complex(row['real_counts'], row['imag_counts']) * pair(cal['fundamental_V_per_count'])
            calibrated[name] = dict(phasor=[z.real, z.imag], dc=row['dc_counts'] * cal['dc_V_per_count'] + cal['dc_offset_V'],
                                    residual=row['residual_rms_counts'] * cal['residual_V_per_count'])
            if row['frame_count'] != frames:
                raise ValueError('帧数错误')
            all_ids.extend(row['frame_ids'])
        if len(set(all_ids)) != len(all_ids):
            raise ValueError('采样帧重复')
        a, b, c, check = (pair(calibrated[k]['phasor']) for k in PATHS)
        if abs(a) < 1e-6 or abs(check / a - 1) > .01:
            raise ValueError('参考通道不稳定')
        value = [float((c / a).real), float((c / a).imag), calibrated['PROBE']['dc'] / abs(a),
                 calibrated['PROBE']['residual'] / abs(a), float((b / a).real), float((b / a).imag)]
        return dict(action_id=action_id, frames=frames, features=value, calibrated=True, quality_passed=True,
                    feature_contract=CONTRACT, calibration_id=self.identity, acquisition_session_id=session_id,
                    frame_ids=all_ids, channels=calibrated, source='hardware',
                    rs_measured_ohm=self.profile['rs_measured_ohm'][str(rs)])
