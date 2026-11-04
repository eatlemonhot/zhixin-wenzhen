import contextlib
import hashlib
import json
import os
from pathlib import Path
import sys
import time

APP = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(APP))
sys.path.insert(0, str(APP / 'teammate_pl/software/wujing/candidates/sense_sequence117'))
from probe_system.staged_acquisition import acquire, SequenceFailure
from phase_contract import validate_metadata
from sense_sequence import SenseSequence
from probe_system.probe_assignment import roles
from servo_positions import require_cycle_positions


def validate(payload):
    expected = {'kind', 'dac_channel', 'adc_channel', 'rs_ohm', 'decimation_log2',
                'frames', 'fixed_ground_confirmed', 'xy_position_confirmed', 'left_terminal'}
    if not isinstance(payload, dict) or set(payload) != expected or payload['kind'] != 'staged_abca':
        raise ValueError('分阶段周期参数不完整')
    if any(type(payload[k]) is not int for k in ('dac_channel', 'adc_channel', 'rs_ohm', 'decimation_log2', 'frames')):
        raise ValueError('通道、量程、窗口及帧数必须是整数')
    if {payload['dac_channel'], payload['adc_channel']} != {1, 2}:
        raise ValueError('必须明确不同的DAC/ADC舵机通道；不能假定左右对应')
    roles('left' if payload['dac_channel']==1 else 'right',payload['left_terminal'])
    if payload['rs_ohm'] not in (100, 10000) or payload['decimation_log2'] not in (0, 4, 8) or payload['frames'] != 16:
        raise ValueError('本入口支持100Ω/10kΩ、指定窗口、每支路16帧')
    if payload['fixed_ground_confirmed'] is not True or payload['xy_position_confirmed'] is not True:
        raise ValueError('必须确认固定共地和XY已安全到达目标；周期内不执行XY运动')
    return payload


def sense_identity(sense, rs, role_bits, path=None):
    selected={'VA':1,'VB':2,'PROBE':3}
    mask=sense.get('relay_mask')
    if (role_bits not in (1,4) or type(mask) is not int or not 0<=mask<=127 or mask&15!=role_bits
            or sense.get('sense_protocol')!=1 or sense.get('fault') or sense.get('settling')
            or type(sense.get('generation')) is not int or not 1<=sense['generation']<=0xffffffff
            or sense.get('rs_nominal_ohm')!=rs or path and sense.get('selected')!=selected[path]):
        raise ValueError('采样通路、探针角色或量程身份错误')
    return sense['generation'],mask


def execute(folder, servo, send, capture_job, ownership, clock=time.monotonic, sleep=time.sleep):
    p = validate(json.loads((folder / 'request.json').read_text(encoding='utf-8')))
    assignment=roles('left' if p['dac_channel']==1 else 'right',p['left_terminal'])
    current = dict(state='preparing', sequence=0, events=[], measurement_source='adc',
                   physical_feedback_available=False, fault_diagnosis_executed=False,probe_assignment=assignment)
    sense = SenseSequence(send=send, clock=clock, sleep=sleep)
    identities, records, previous = {}, set(), [None]

    def save(state, message):
        current.update(state=state, message=message, sequence=current['sequence'] + 1)
        current['events'].append(dict(state=state, message=message, at_monotonic=clock()))
        temp = folder / 'status.tmp'
        temp.write_text(json.dumps(current, ensure_ascii=False, indent=2), encoding='utf-8')
        os.replace(str(temp), str(folder / 'status.json'))

    def cancelled():
        return (folder / 'cancel.request').exists() or (folder / 'stop.request').exists()

    class Controls:
        hardware = True
        position_feedback_available = False
        confirmation_source = 'operator_stage_confirmation'
        def ownership(self): return ownership()
        def check_cancelled(self):
            if cancelled(): raise RuntimeError('周期已取消')
        def preflight(self, action):
            status = servo.status()
            if status.get('revision') != 124 or status.get('error_code'):
                raise RuntimeError('必须有配套124舵机接口且无错误；没有执行动作')
            require_cycle_positions(status)
            info = send('INFO')
            if info.get('board_revision') != 'LXB-R4-SENSE117' or info.get('sense_protocol') != 1:
                raise RuntimeError('7020必须提供SENSE117通路身份')
            if assignment['relay_role_bits']==4:
                caps=send('SENSE_CAPS')
                if caps.get('schema')!='fdw-probe-roles/1' or caps.get('role_masks')!=[1,4] or caps.get('hot_role_switch') is not False:
                    raise RuntimeError('当前7020未声明双向角色支持；没有执行动作')
                current['role_capabilities']=caps
            if send('ADC_JOB_STATUS').get('state') == 1: raise RuntimeError('ADC忙')
            mode = send('MODE_STATUS')
            if mode.get('mode') != 0 or mode.get('capture_active') or mode.get('output_enabled') or mode.get('settling'):
                raise RuntimeError('数字模式未空闲，不能启动模拟周期')
            dac = send('DAC_STATUS')
            if not dac.get('ready') or not dac.get('configured') or dac.get('busy') or dac.get('error_code') or dac.get('clipped'):
                raise RuntimeError('DAC尚未配置或不就绪；本入口不自行猜测幅度')
            ftw = dac.get('frequency_word', 0); ratio = 1 << p['decimation_log2']
            if type(ftw) is not int or not 0x100000 <= ftw * ratio < 0x80000000:
                raise RuntimeError('当前频率与采样窗口不适配')
            identities['point'] = dict(dds_ftw=ftw, interval_ticks=ratio, pl_ftw=ftw*ratio,
                                       filter='cic3' if p['decimation_log2'] else 'bypass')
            action['frequency_hz'] = ftw * 25000000.0 / (1 << 32)
            current['preflight'] = dict(dac=dac, info=info, servo_revision=124)
        def stop_stimulus(self): send('HALT')
        def mask(self, probe): return 3 if probe == 'both' else p[probe + '_channel']
        def raise_probe(self, probe):
            if (folder / 'stop.request').exists():
                servo.stop(self.mask(probe)); raise RuntimeError('PWM已停止；机械位置未确认')
            servo.up(self.mask(probe))
        def lower_probe(self, probe):
            self.check_cancelled();servo.down(self.mask(probe))
        def confirm(self, probe, position):
            save('waiting_raised' if position == 'up' else 'waiting_lowered',
                 '请确认%s针（通道%s）已%s到位' % (probe.upper(), p[probe+'_channel'], '抬起' if position == 'up' else '落下'))
            token = current['sequence']; path = folder / ('confirm_%s.json' % token); deadline = clock() + 120
            while clock() < deadline:
                if (folder / 'stop.request').exists(): return False
                if position == 'down' and cancelled(): return False
                if path.exists():
                    return json.loads(path.read_text(encoding='utf-8')) == dict(sequence=token, position='raised' if position == 'up' else 'lowered')
                sleep(.1)
            raise TimeoutError('等待实际针位确认超时')
        def move_xy(self, action):
            self.check_cancelled()
        def configure_route(self, schedule):
            send('RELAY_SET %s' % schedule['steps'][2]['relay_mask'])
            sense_identity(sense._wait_path(10), p['rs_ohm'], assignment['relay_role_bits'], 'PROBE')
        def start_stimulus(self, action):
            self.check_cancelled();send('DAC_ENABLE 1')
            identities['dac'] = SenseSequence._dac_identity(send('DAC_STATUS'))
        def select_source(self, row):
            name = {'A':'VA','B':'VB','C':'PROBE','A_check':'VA'}[row['channel']]
            send('SENSE_SELECT %s 10' % name)
            identities['sense'] = sense_identity(sense._wait_path(10), p['rs_ohm'], assignment['relay_role_bits'], name)
        def wait_settled(self, stage):
            # Debug minimum only; not a calibrated analog steady-state guarantee.
            self.check_cancelled();sleep(.01);self.check_cancelled()

    def capture(channel, row):
        result = []
        for index in range(p['frames']):
            controls.check_cancelled();save('measuring', '%s：采集第%d/16帧原码' % (channel, index+1))
            if SenseSequence._dac_identity(send('DAC_STATUS')) != identities['dac']: raise RuntimeError('组内激励改变')
            frame, packet = capture_job(p['decimation_log2'], service=lambda *_: controls.check_cancelled())
            stem = '%s_%02d' % (channel, index);(folder / (stem+'.packet')).write_bytes(packet)
            meta = frame['metadata'];validate_metadata(meta, identities['point'])
            if frame['mode'] != 0 or frame['flags'] != 8 or frame['overrange_count'] or min(frame['samples']) <= -2048 or max(frame['samples']) >= 2047:
                raise RuntimeError('原码质量检查失败；已保存原始包')
            if meta['record_id'] in records or meta['dac_tag'] != identities['dac'][0]: raise RuntimeError('重复帧或DAC身份改变')
            binding = send('ADC_SENSE_STATUS')
            if (binding.get('record_id'), binding.get('sense_generation'), binding.get('relay_mask')) != (meta['record_id'], *identities['sense']):
                raise RuntimeError('帧与采样通路不对应')
            after = sense_identity(send('SENSE_STATUS'), p['rs_ohm'], assignment['relay_role_bits'])
            if after != identities['sense'] or after[1] != row['relay_mask']: raise RuntimeError('采集通路改变')
            if SenseSequence._dac_identity(send('DAC_STATUS')) != identities['dac']: raise RuntimeError('采集期间激励改变')
            prior = previous[0]
            if prior:
                delta = meta['first_tick']-prior['first_tick']
                if delta <= prior['last_tick']-prior['first_tick'] or (meta['first_phase_word']-prior['first_phase_word']) & 0xffffffff != delta*identities['point']['dds_ftw'] & 0xffffffff or meta['inverted'] != prior['inverted']:
                    raise RuntimeError('跨帧时间或DDS相位不连续')
            records.add(meta['record_id']);previous[0] = meta
            metadata = dict(metadata=meta, binding=binding, packet_sha256=hashlib.sha256(packet).hexdigest())
            (folder / (stem+'.json')).write_text(json.dumps(metadata, indent=2), encoding='utf-8');result.append(metadata)
        return dict(frames=result, frame_count=16, calibrated=False, pl_executed=False,
                    averaged_features_generated=False, fault_diagnosis_executed=False)

    controls = Controls()
    try:
        receipt = acquire(controls, dict(frequency_hz=1, rs_ohm=p['rs_ohm'], fixed_ground_connected=True,**assignment), capture)
        current['measurement'] = dict(channels=4, frames=64, raw_only=True)
        save('completed', 'A/B/C/A_check各16帧完成，已停激励并确认双针抬起；未生成校准特征或故障诊断')
    except Exception as exc:
        receipt = exc.receipt if isinstance(exc, SequenceFailure) else dict(completed=False, failure=str(exc))
        save('cancelled' if cancelled() and not receipt.get('cleanup_errors') else 'failed', str(exc))
    (folder / 'sequence.json').write_text(json.dumps(receipt, ensure_ascii=False, indent=2), encoding='utf-8')
    import zipfile
    with zipfile.ZipFile(folder / 'staged_raw.zip', 'w', zipfile.ZIP_DEFLATED) as output:
        for path in folder.iterdir():
            if path.suffix in ('.packet', '.json') and path.name != 'request.json': output.write(path, path.name)
    return receipt
