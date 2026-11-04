import copy
import csv
import hashlib
import html
import json
import os
from pathlib import Path
import re
import threading
import time
import uuid
import zipfile

from .file_lock import fcntl
from .unpowered_measurements import UnpoweredMeasurements, Cancelled, write_json, finish_condition
from probe_system.live_features import Calibration, FrameProcessor, aggregate, calibration_profile, point, digest
from probe_system.live_diagnosis import model_actions, identity, make_reference, diagnose
from probe_system.unpowered_ai.core import ROOT, Ranker


class ClosedLoopMeasurements(UnpoweredMeasurements):
    def __init__(self, *args, processor=None, feedback=None, **kwargs):
        super().__init__(*args, **kwargs)
        backend = os.environ.get('PROBE_FEATURE_BACKEND', 'pl' if os.environ.get('PROBE_NODE_ROLE') == 'board' else 'cpu')
        self.processor = processor or FrameProcessor(backend)
        self.feedback = feedback
        if self.feedback is None and os.environ.get('PROBE_POSITION_FEEDBACK'):
            from probe_system.position_feedback import PositionFeedback
            self.feedback = PositionFeedback(os.environ['PROBE_POSITION_FEEDBACK'])
        self.assets = self.root / 'assets'
        self.assets.mkdir(exist_ok=True)

    def asset_path(self, owner, kind, key):
        directory = self.assets / digest(str(owner))
        directory.mkdir(exist_ok=True)
        return directory / (kind + '_' + key + '.json')

    def put_calibration(self, owner, payload):
        if self.busy:
            raise ValueError('测量任务占用中')
        profile = calibration_profile(payload)
        name = profile['calibration_id']
        path = self.asset_path(owner, 'cal', name)
        if path.exists():
            self.asset(owner, 'cal', name)
        else:
            write_json(path, dict(owner=owner, value=profile))
        return profile

    def asset(self, owner, kind, key):
        if kind not in ('cal', 'ref') or not isinstance(key, str) or re.fullmatch('[a-f0-9]{64}', key) is None:
            raise ValueError('数据编号错误')
        try:
            value = json.loads(self.asset_path(owner, kind, key).read_text(encoding='utf-8'))
        except (OSError, ValueError):
            raise ValueError('数据不存在') from None
        if value['owner'] != owner:
            raise ValueError('数据归属错误')
        return value['value']

    def catalog(self, owner):
        result = dict(calibrations=[], references=[])
        for path in sorted((self.assets / digest(str(owner))).glob('*.json')):
            value = json.loads(path.read_text(encoding='utf-8'))
            if value['owner'] != owner:
                continue
            row = value['value']
            if path.name.startswith('cal_'):
                result['calibrations'].append(dict(calibration_id=row['calibration_id'], station_id=row['station_id']))
            else:
                result['references'].append(dict(reference_id=row['reference_id'], dut_id=row['dut_id'], calibration_id=row['calibration_id']))
        return result

    def prepare_job(self, owner, job, payload, resolve):
        mode = payload.get('analysis_mode', 'measurement')
        if mode not in ('measurement', 'reference', 'diagnosis'):
            raise ValueError('测量模式错误')
        if mode == 'measurement':
            return job
        calibration = self.asset(owner, 'cal', payload.get('calibration_id'))
        calibrated = Calibration(calibration)
        dut_id = payload.get('dut_id')
        if not isinstance(dut_id, str) or not 1 <= len(dut_id.strip()) <= 128:
            raise ValueError('待测板编号错误')
        job.update(analysis_mode=mode, dut_id=dut_id.strip(), calibration=calibration, left_terminal=calibration['left_terminal'])
        actions = model_actions(job, resolve)
        for action in actions:
            for channel in ('VA', 'VB', 'PROBE'):
                if (action['rs_ohm'], action['frequency_hz'], channel, 16) not in calibrated.rows:
                    raise ValueError('校准频点不完整')
        job['actions'] = actions
        job['scope']['measurement_nets'] = list(dict.fromkeys(a['measurement_net'] for a in actions))
        job['frames_per_path'] = 256 if mode == 'reference' else 16
        job['budget']['max_elapsed_ms'] = 86400000
        job['unpowered_readiness']['total_conditions'] = len(actions)
        job['unpowered_readiness']['frames_per_path'] = job['frames_per_path']
        job['unpowered_readiness']['automatic_fault_diagnosis_available'] = mode == 'diagnosis'
        job['unpowered_readiness']['measurement_only'] = False
        job['execution']['mode'] = 'hardware_' + mode
        job['model_identity'] = identity(job)
        if mode == 'reference' and payload.get('reference_label') != 'user_declared_normal':
            raise ValueError('请选择正常参考板')
        if mode == 'diagnosis':
            reference = self.asset(owner, 'ref', payload.get('reference_id'))
            if (reference['model_identity'] != job['model_identity'] or reference['calibration_id'] != calibrated.identity
                    or reference['dut_id'] != job['dut_id']):
                raise ValueError('正常参考与测量方案不匹配')
            job['normal_reference'] = reference
        return job

    def _run(self, folder, task_handle, resume=False):
        job = json.loads((folder / 'job.json').read_text(encoding='utf-8'))
        if job.get('analysis_mode') not in ('reference', 'diagnosis'):
            return super()._run(folder, task_handle, resume)
        report = dict(job_id=job['job_id'], scope=job['scope'], reference_label=job['reference_label'],
                      source_layout_id=job['import_provenance']['layout_id'], conditions=[], events=[],
                      frames_captured=0, total_conditions=36, limitations=[],
                      feature_contract='pl-lsq8192-dds-mean-v1', calibration_id=job['calibration']['calibration_id'])
        state = json.loads((folder / 'status.json').read_text(encoding='utf-8'))
        session_id = uuid.uuid4().hex
        started = time.monotonic()
        seen = set()
        raw = folder / 'raw'
        raw.mkdir(exist_ok=True)
        calibration = Calibration(job['calibration'])
        role_bits = 1 if job['calibration']['left_terminal'] == 'TP_A' else 4
        previous = [None]
        records = []
        sense_handle = None
        owned = False
        touched = False
        original_runner = None
        servo_handles = []
        self.clearance_event.clear()

        def check():
            if self.cancel_event.is_set() or self.motor.stop_file.exists():
                raise Cancelled('收到取消或停车请求。')

        def save(phase, message, **fields):
            state.update(phase=phase, message=message, elapsed_seconds=time.monotonic() - started,
                         completed_conditions=len(report['conditions']), frames_captured=report['frames_captured'], **fields)
            write_json(folder / 'status.json', state)

        def send(command):
            check()
            return self.query(command)

        def wait(seconds):
            deadline = time.monotonic() + seconds
            while time.monotonic() < deadline:
                check()
                time.sleep(min(.05, max(0, deadline - time.monotonic())))

        def contact(position, mask):
            nonlocal touched
            check()
            touched = True
            if hasattr(self.feedback, 'reset'):
                self.feedback.reset()
            self.servo.run(dict(action=position, channel=mask))
            wait(.65)
            actual = self.servo.run(dict(action='read'))
            if actual.get('revision') != 124 or actual.get('error_code'):
                raise ValueError('舵机接口错误')
            for row in actual['channels']:
                if mask & (1 << (row['channel'] - 1)) and (row.get('pending') or row.get('selected_position') != position or row.get('active_us') != row[position + '_us']):
                    raise ValueError('舵机回读错误')
            if self.feedback is not None:
                deadline = time.monotonic() + 5
                while not self.feedback(position, mask):
                    if time.monotonic() > deadline:
                        raise TimeoutError('针位反馈超时')
                    wait(.02)
                return
            with self.lock:
                self.clearance_event.clear()
                self.clearance_token = uuid.uuid4().hex
                token = self.clearance_token
            save('waiting_clearance', '确认通道%s已%s' % (mask, '抬起' if position == 'up' else '接触'),
                 clearance_token=token, contact_position=position, contact_channels=mask)
            deadline = time.monotonic() + 600
            while not self.clearance_event.is_set():
                if time.monotonic() > deadline:
                    raise TimeoutError('针位确认超时')
                wait(.05)
            check()
            with self.lock:
                self.clearance_token = None

        def select(name, rs):
            send('SENSE_SELECT %s 10' % name)
            deadline = time.monotonic() + 2
            while True:
                route = send('SENSE_STATUS')
                if not route.get('settling'):
                    break
                if time.monotonic() > deadline:
                    raise TimeoutError('通路切换超时')
                wait(.01)
            selected = {'VA': 1, 'VB': 2, 'PROBE': 3}[name]
            if (route.get('fault') or route.get('sense_protocol') != 1 or route.get('selected') != selected
                    or route.get('rs_nominal_ohm') != rs or route.get('relay_mask', 0) & 15 != role_bits):
                raise ValueError('采集通路错误')
            return route

        def acquire(index, frames, role):
            check()
            if self.pcb.store.read()['revision'] != job['mechanical']['revision']:
                raise ValueError('机械对准配置已变化')
            action = job['actions'][index]
            send('HALT')
            group = (action['motion_points'], action['rs_ohm'])
            if previous[0] != group:
                contact('up', 3)
                save('positioning', '测点定位', action_id=index)
                identifier = self.motor.start('pads', context=dict(points=action['motion_points'], profile=job['mechanical'], movement_profile='measurement_slow_v1'))
                deadline = time.monotonic() + 70
                while True:
                    motion = self.motor.status()
                    last = motion.get('last_job') or {}
                    if last.get('job_id') != identifier:
                        raise ValueError('运动任务身份错误')
                    if not motion['busy']:
                        if last.get('state') != 'completed':
                            raise ValueError('测点定位失败')
                        break
                    if time.monotonic() > deadline:
                        self.motor.stop()
                        raise TimeoutError('测点定位超时')
                    wait(.05)
                self.motor.release_idle()
                base = role_bits | (32 if action['rs_ohm'] == 100 else 0)
                if send('RELAY_SET ' + str(base)).get('relay_mask') != base:
                    raise ValueError('采样量程错误')
                contact('down', 1)
                if not action['internal_vb_only']:
                    contact('down', 2)
                previous[0] = copy.deepcopy(group)
            frequency = action['frequency_hz']
            send('DAC_SET %d %d 2048 0 0' % (frequency, job['gain_q11']))
            send('DAC_ENABLE 1')
            stimulus = send('DAC_STATUS')
            expected = point(frequency, 16)
            if not stimulus.get('enabled') or stimulus.get('frequency_word') != expected['dds_ftw'] or stimulus.get('gain_q11') != job['gain_q11']:
                raise ValueError('激励身份错误')
            wait(max(.05, 20 / frequency))
            paths = {}
            ordinal = len(records)
            for channel in ('VA', 'VB', 'PROBE', 'VA_check'):
                name = 'VA' if channel == 'VA_check' else 'VB' if channel == 'PROBE' and action['internal_vb_only'] else channel
                route = select(name, action['rs_ohm'])
                wait(.03)
                rows = []
                for n in range(frames):
                    check()
                    save('capturing', '采集%s %d/%d' % (channel, n + 1, frames), action_id=index)
                    frame, packet = self.capture(4, service=lambda *_: check())
                    metadata = frame['metadata']
                    stem = '%03d_%02d_%s_%03d' % (ordinal, index, channel, n)
                    (raw / (stem + '.packet')).write_bytes(packet)
                    record_id = metadata['record_id']
                    if record_id in seen or metadata['dac_tag'] != stimulus['tag']:
                        raise ValueError('采样身份错误')
                    if rows and metadata['first_tick'] <= rows[-1]['last_tick']:
                        raise ValueError('采样时间重复')
                    seen.add(record_id)
                    binding = send('ADC_SENSE_STATUS')
                    after_route = send('SENSE_STATUS')
                    if ((binding.get('record_id'), binding.get('sense_generation'), binding.get('relay_mask')) != (record_id, route['generation'], route['relay_mask'])
                            or after_route.get('generation') != route['generation'] or after_route.get('relay_mask') != route['relay_mask']):
                        raise ValueError('采样通路身份错误')
                    result = self.processor.process(frame, frequency, 16)
                    result.update(packet_sha256=hashlib.sha256(packet).hexdigest(), metadata=metadata,
                                  acquisition_session_id=session_id, channel=channel)
                    write_json(raw / (stem + '.json'), result)
                    rows.append(result)
                    report['frames_captured'] += 1
                after = send('DAC_STATUS')
                if any(after.get(k) != stimulus.get(k) for k in ('enabled', 'tag', 'frequency_word', 'gain_q11', 'offset_code', 'phase_word')):
                    raise ValueError('采集中激励变化')
                paths[channel] = aggregate(rows)
            send('HALT')
            record = calibration.features(paths, frequency, action['rs_ohm'], frames, index, session_id, action['internal_vb_only'])
            record.update(role=role, capture_index=ordinal, contact_profile='passive-node-loaded-v1')
            records.append(record)
            condition = finish_condition(action, paths)
            condition.update(calibrated_features=record, voltage_calibrated=True, transfer_calibrated=True,
                             elapsed_seconds=time.monotonic() - started, role=role, capture_index=ordinal)
            report['conditions'].append(condition)
            write_json(folder / 'features.json', records)
            write_json(folder / 'report.partial.json', report)
            return record

        try:
            sense_handle = (self.root / 'sense.lock' if os.name == 'nt' else Path('/run/lock/fdw_sense117.lock')).open('a')
            fcntl.flock(sense_handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            info = send('INFO')
            if info.get('board_revision') != 'LXB-R4-SENSE117' or info.get('sense_protocol') != 1 or not info.get('adc_ready'):
                raise ValueError('采集固件版本错误')
            capabilities = send('SENSE_CAPS')
            if (capabilities.get('schema') != 'fdw-probe-roles/1' or role_bits not in capabilities.get('role_masks', [])
                    or capabilities.get('hot_role_switch') is not False):
                raise ValueError('探针角色接口错误')
            mode = send('MODE_STATUS')
            dac = send('DAC_STATUS')
            if send('ADC_JOB_STATUS').get('state') == 1 or mode.get('mode') != 0 or mode.get('capture_active') or mode.get('output_enabled') or dac.get('enabled') or dac.get('busy'):
                raise ValueError('采集设备占用中')
            self.motor.release_idle()
            if self.processor.backend == 'pl':
                from .servo_worker import dispatch
                for revision in (123, 124):
                    handle = open('/run/lock/fdw-servo-pair' + str(revision) + '.lock', 'a')
                    servo_handles.append(handle)
                    fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
                self.processor.open()
                original_runner = self.servo._runner
                def shared_servo(payload):
                    with self.processor.lock:
                        result = dispatch(payload, self.processor.device.defaultRegRegion())
                        result['boot_id'] = Path('/proc/sys/kernel/random/boot_id').read_text().strip()
                        return result
                self.servo._runner = shared_servo
            self.servo.prepare_cycle()
            owned = True
            report['hardware_info'] = info
            if job['analysis_mode'] == 'reference':
                for index in range(36):
                    acquire(index, 256, 'normal_reference')
                reference = make_reference(job, calibration, records)
                owner = json.loads((folder / 'owner.json').read_text(encoding='utf-8'))['owner']
                write_json(self.asset_path(owner, 'ref', reference['reference_id']), dict(owner=owner, value=reference))
                write_json(folder / 'reference.json', reference)
                report['reference_id'] = reference['reference_id']
            else:
                ranker = Ranker(ROOT / 'model', device=self.processor.device)
                result = diagnose(job, calibration, job['normal_reference'], acquire, cancel=check, ranker=ranker)
                report['diagnosis'] = result
                report['model_inference_executed'] = True
                report['fault_diagnosis_executed'] = True
                write_json(folder / 'diagnosis.json', result)
            state.update(state='completed', message='完成')
        except BaseException as exc:
            state.update(state='cancelled' if isinstance(exc, Cancelled) else 'failed', message=str(exc))
            report['error'] = str(exc)
        finally:
            if owned:
                try:
                    self.query('HALT')
                except Exception as exc:
                    report['cleanup_error'] = str(exc)
                    state['state'] = 'failed'
            if touched and not self.emergency:
                try:
                    self.servo.run(dict(action='up', channel=3))
                    time.sleep(.7)
                    self.servo._motion_state(self.servo.run(dict(action='read')), raised=True)
                except Exception as exc:
                    report['raise_error'] = str(exc)
                    state['state'] = 'failed'
            if sense_handle is not None:
                sense_handle.close()
            if original_runner is not None:
                self.servo._runner = original_runner
            if self.processor.backend == 'pl' and self.processor.device is not None:
                try:
                    ranker = None
                    self.processor.close()
                except Exception as exc:
                    report['device_error'] = str(exc)
                    state['state'] = 'failed'
            for handle in reversed(servo_handles):
                handle.close()
            report.update(state=state['state'], completed_conditions=len(report['conditions']), planned_conditions=len(job['actions']),
                          elapsed_seconds=time.monotonic() - started, hardware_sampled=bool(seen),
                          voltage_calibrated=bool(records), processing_backend=self.processor.backend)
            if state['state'] == 'completed':
                report['total_conditions'] = len(report['conditions'])
            state.update(completed_conditions=len(report['conditions']), frames_captured=report['frames_captured'],
                         total_conditions=report['total_conditions'], elapsed_seconds=report['elapsed_seconds'], phase='finished')
            try:
                write_json(folder / 'report.json', report)
                self._export(folder, job, report)
            except Exception as exc:
                state.update(state='failed', message=str(exc))
            finally:
                try:
                    write_json(folder / 'status.json', state)
                finally:
                    with self.lock:
                        self.active = None
                        self.clearance_token = None
                    task_handle.close()

    @staticmethod
    def _export(folder, job, report):
        if job.get('analysis_mode') not in ('reference', 'diagnosis'):
            return UnpoweredMeasurements._export(folder, job, report)
        fields = ['action_id', 'measurement_net', 'frequency_hz', 'rs_ohm', 'frames', 'role', 'C_A_real',
                  'C_A_imag', 'DC_C_A', 'residual_C_A', 'B_A_real', 'B_A_imag']
        rows = []
        for condition in report['conditions']:
            record = condition['calibrated_features']
            rows.append([condition['action_id'], condition['measurement_net'], condition['frequency_hz'],
                         condition['rs_nominal_ohm'], record['frames'], record['role'], *record['features']])
        with (folder / 'measurements.csv').open('w', encoding='utf-8-sig', newline='') as stream:
            writer = csv.writer(stream)
            writer.writerow(fields)
            writer.writerows(rows)
        diagnosis = report.get('diagnosis', {})
        labels = '、'.join(diagnosis.get('candidate_names', []))
        links = ''.join('<a href="files/' + name + '">' + name + '</a> ' for name in
                        ('report.json', 'features.json', 'measurements.csv', 'measurement_bundle.zip'))
        table = '<tr>' + ''.join('<th>' + html.escape(value) + '</th>' for value in fields) + '</tr>'
        table += ''.join('<tr>' + ''.join('<td>' + html.escape(str(value)) + '</td>' for value in row) + '</tr>' for row in rows)
        page = '<!doctype html><html lang="zh-CN"><meta charset="utf-8"><title>飞针检测</title><style>body{font:15px system-ui;margin:32px;color:#182638}table{border-collapse:collapse}td,th{padding:8px;border:1px solid #ddd}a{margin-right:12px}</style><h1>飞针检测</h1><p>' + html.escape(labels) + '</p><nav>' + links + '</nav><table>' + table + '</table></html>'
        (folder / 'report.html').write_text(page, encoding='utf-8')
        with zipfile.ZipFile(folder / 'measurement_bundle.zip', 'w', zipfile.ZIP_DEFLATED, compresslevel=1) as archive:
            for path in folder.rglob('*'):
                if path.is_file() and path.name not in ('measurement_bundle.zip', 'owner.json', 'status.json', 'report.partial.json') and not path.name.endswith('.tmp'):
                    archive.write(path, str(path.relative_to(folder)))
