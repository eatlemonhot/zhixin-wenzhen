import copy
import csv
from .file_lock import fcntl
import hashlib
import json
import math
from pathlib import Path
import re
import shutil
import threading
import time
import uuid
import zipfile

FREQUENCIES = (2000, 5000, 10000, 20000, 50000, 100000)
RANGES = (10000, 100)
TERMINAL = ('completed', 'cancelled', 'failed')


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(value, ensure_ascii=False, indent=2, allow_nan=False), encoding='utf-8')
    temporary.replace(path)


def route_masks(rs):
    base = 1 | (32 if rs == 100 else 0)
    return [('VA', base | 16 | 64), ('VB', base | 16), ('PROBE', base), ('VA_check', base | 16 | 64)]


def analyze_frame(samples, metadata):
    import numpy as np
    values = np.asarray(samples, dtype=float)
    ticks = np.arange(len(values), dtype=np.int64) * metadata['interval_ticks']
    words = (metadata['first_phase_word'] + ticks * metadata['dds_ftw']) % 2**32
    phase = words.astype(float) * (2 * math.pi / 2**32)
    matrix = np.column_stack((np.cos(phase), np.sin(phase), np.ones(len(values))))
    coefficients = np.linalg.lstsq(matrix, values, rcond=None)[0]
    error = values - matrix @ coefficients
    return dict(real_counts=float(coefficients[0]), imag_counts=float(-coefficients[1]),
                dc_counts=float(coefficients[2]),
                residual_rms_counts=float(np.sqrt(np.mean(error**2))),
                minimum_code=int(min(samples)), maximum_code=int(max(samples)))


def aggregate(frames):
    vectors = [complex(f['real_counts'], f['imag_counts']) for f in frames]
    mean = sum(vectors) / len(vectors)
    deviation = math.sqrt(sum(abs(v-mean)**2 for v in vectors) / len(vectors))
    return dict(real_counts=mean.real, imag_counts=mean.imag, peak_counts=abs(mean),
                phase_degrees=math.degrees(math.atan2(mean.imag, mean.real)),
                repeatability_counts=deviation,
                dc_counts=sum(f['dc_counts'] for f in frames)/len(frames),
                residual_rms_counts=sum(f['residual_rms_counts'] for f in frames)/len(frames),
                frame_count=len(frames))


def finish_condition(action, paths):
    summary = dict(action_id=action['action_id'], measurement_net=action['measurement_net'],
                   measurement_pad=action['measurement']['reference']+'.'+action['measurement']['pad_number'],
                   frequency_hz=action['frequency_hz'], rs_nominal_ohm=action['rs_ohm'], paths=paths,
                   voltage_calibrated=False, transfer_calibrated=False, warnings=[])
    vectors = {name: complex(p['real_counts'], p['imag_counts']) for name,p in paths.items()}
    va, vb, vc, check = (vectors[k] for k in ('VA','VB','PROBE','VA_check'))
    if abs(va) > 1e-9:
        transfer = vc/va
        vb_ratio = vb/va
        drift = abs(check-va)/abs(va)
        summary.update(raw_transfer=dict(real=transfer.real, imag=transfer.imag, magnitude=abs(transfer),
                                        phase_degrees=math.degrees(math.atan2(transfer.imag, transfer.real))),
                       raw_vb_over_va=dict(real=vb_ratio.real, imag=vb_ratio.imag), va_complex_drift_fraction=drift)
        if drift > .01:summary['warnings'].append('VA复读复数偏差超过1%，需检查稳定性或接触；此阈值不是精度验收规格。')
    else:
        summary['raw_transfer']=None
        summary['warnings'].append('VA基波过弱，未计算比值。')
    noise = paths['VA']['repeatability_counts'] + paths['VB']['repeatability_counts']
    if abs(va-vb) > max(1e-6, 3*noise):
        estimate = action['rs_ohm'] * vb/(va-vb)
        summary['uncalibrated_nominal_impedance_ohm'] = [estimate.real, estimate.imag]
    else:
        summary['uncalibrated_nominal_impedance_ohm'] = None
        summary['warnings'].append('VA与VB差值不足以稳定估算阻抗。')
    if paths['PROBE']['peak_counts'] < 3*paths['PROBE']['residual_rms_counts']:
        summary['warnings'].append('测点基波相对残差较弱，幅相只作原码观测。')
    return summary


class Cancelled(RuntimeError):
    pass


class UnpoweredMeasurements:
    def __init__(self, root, motor, servo, pcb, query, capture):
        self.root=Path(root);self.root.mkdir(parents=True,exist_ok=True)
        self.motor,self.servo,self.pcb= motor,servo,pcb
        self.query,self.capture=query,capture
        self.lock=threading.RLock();self.active=None;self.cancel_event=threading.Event();self.emergency=False
        self.clearance_event=threading.Event();self.clearance_token=None

    @property
    def busy(self):
        return self.active is not None

    def create(self, owner, job):
        with self.lock:
            if self.busy:raise ValueError('已有断电实测正在执行。')
            job=copy.deepcopy(job);job['job_id']='um_'+uuid.uuid4().hex
            folder=self.root/job['job_id'];folder.mkdir(mode=0o700)
            write_json(folder/'owner.json',dict(owner=owner))
            write_json(folder/'job.json',job)
            write_json(folder/'status.json',dict(state='planned',job_id=job['job_id'],completed_conditions=0,
                                               total_conditions=len(job['actions']),frames_captured=0,
                                               message='真实测量方案已保存，尚未执行。'))
            return job

    def owned(self, owner, key):
        if not isinstance(key,str) or not re.fullmatch(r'um_[a-f0-9]{32}',key):raise ValueError('测量任务编号无效。')
        folder=self.root/key
        try:record=json.loads((folder/'owner.json').read_text())
        except (OSError,ValueError):raise ValueError('测量任务不存在。') from None
        if record.get('owner')!=owner:raise ValueError('测量任务不属于当前会话。')
        return folder

    def status(self, owner, key):
        folder=self.owned(owner,key)
        value=json.loads((folder/'status.json').read_text(encoding='utf-8'))
        if value['state'] in TERMINAL and (folder/'report.json').exists():
            value['result']=json.loads((folder/'report.json').read_text(encoding='utf-8'))
        value['job']=json.loads((folder/'job.json').read_text(encoding='utf-8'))
        if 'result' not in value and (folder/'report.partial.json').exists():
            partial=json.loads((folder/'report.partial.json').read_text(encoding='utf-8'))
            value['conditions']=partial.get('conditions',[])
            value['events']=[event for event in partial.get('events',[]) if event['kind'] in ('servo_up','servo_down','operator_clearance_confirmed','positioned')]
            value['hardware_sampled']=bool(partial.get('hardware_sampled'))
        return value

    def start(self, owner, key, resume=False):
        with self.lock:
            folder=self.owned(owner,key)
            if self.busy:raise ValueError('已有断电实测正在执行。')
            state=json.loads((folder/'status.json').read_text(encoding='utf-8'))
            if resume:
                old=json.loads((folder/'report.json').read_text(encoding='utf-8'))
                job=json.loads((folder/'job.json').read_text(encoding='utf-8'))
                allowed=('已有网页电机任务正在执行。','控制器锁在8秒内未释放，尚未提交移动指令。')
                complete_frames=len(old['conditions'])*4*job['frames_per_path']
                transient_lock=state['state']=='failed' and old.get('error') in allowed
                cancelled_at_boundary=(state['state']=='cancelled' and old.get('error')=='收到取消或停车请求。'
                                       and not old.get('emergency_stop'))
                if not (transient_lock or cancelled_at_boundary) or old['frames_captured']!=complete_frames:
                    raise ValueError('只有未提交移动且没有半组数据的控制器锁占用失败可续测。')
                attempt=folder/'attempts'/('attempt_'+str(len(list((folder/'attempts').glob('*')))+1))
                attempt.mkdir(parents=True,exist_ok=False)
                for name in ('job.json','report.json','report.md','measurements.csv','measurement_bundle.zip','status.json'):
                    if (folder/name).exists():shutil.copy2(folder/name,attempt/name)
                if job.get('movement_profile')!='measurement_slow_v1':
                    job.setdefault('plan_amendments',[]).append(dict(kind='measurement_motion_envelope',
                        max_rpm=30,accel_rpm_s=90,reason='续测改用低速移位，保留原有0.15mm走廊及全部保护。'))
                    job['movement_profile']='measurement_slow_v1';write_json(folder/'job.json',job)
            elif state['state']!='planned':raise ValueError('每份方案只能执行一次，请重新生成。')
            handle=(self.root/'active.lock').open('a')
            try:fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            except BlockingIOError:
                handle.close();raise ValueError('另一执行进程正在持有测量任务。') from None
            self.active=dict(key=key,owner=owner,folder=folder)
            self.cancel_event.clear();self.emergency=False
            self.clearance_event.clear();self.clearance_token=None
            state.update(state='running',message='正在读取实际硬件并执行方案。');write_json(folder/'status.json',state)
            threading.Thread(target=self._run,args=(folder,handle,resume),daemon=True,name='unpowered-measurements').start()
            return state

    def cancel(self, owner=None, emergency=False):
        with self.lock:
            if not self.active:return
            if owner is not None and owner!=self.active['owner']:raise ValueError('任务不属于当前会话。')
            self.emergency=self.emergency or emergency;self.cancel_event.set()
        try:self.query('HALT')
        finally:
            if self.motor.status()['busy']:self.motor.stop()

    def confirm_clearance(self, owner, key, token):
        """只接受本任务当前这一轮的人工离板确认，旧确认不能用于下一次移位。"""
        self.owned(owner,key)
        with self.lock:
            if (not self.active or self.active['key']!=key or self.active['owner']!=owner
                    or self.clearance_token is None or token!=self.clearance_token
                    or self.clearance_event.is_set() or self.cancel_event.is_set()):
                raise ValueError('离板确认阶段已变化，请等待页面刷新后重新确认。')
            self.clearance_event.set()
        return dict(accepted=True,message='已记录本轮目视离板确认。')

    def _run(self, folder, task_handle, resume=False):
        job=json.loads((folder/'job.json').read_text(encoding='utf-8'))
        state=json.loads((folder/'status.json').read_text(encoding='utf-8'))
        report=dict(schema='unpowered-measurement-report/1.0',job_id=job['job_id'],
                    reference_label=job['reference_label'],source_layout_id=job['import_provenance']['layout_id'],
                    scope=job['scope'],conditions=[],frames_captured=0,hardware_sampled=False,
                    model_inference_executed=False,fault_diagnosis_executed=False,
                    board_health_conclusion='未作故障判定；正常板身份为用户声明。',
                    voltage_calibrated=False,mechanical_contact_feedback=False,
                    processing_backend='CPU浮点相量分析；未调用悟净PL特征计算或NPU',
                    motion_envelope=dict(profile='measurement_slow_v1',max_rpm=30,accel_rpm_s=90,corridor_mm=.15),
                    limitations=job['limitations'],events=[])
        offset=0.
        if resume:
            report=json.loads((folder/'report.json').read_text(encoding='utf-8'))
            report.setdefault('previous_attempts',[]).append(dict(state=report['state'],error=report.pop('error'),
                completed_conditions=report['completed_conditions'],elapsed_seconds=report['elapsed_seconds']))
            offset=report['elapsed_seconds']
            for key in ('cleanup_error','raise_error','final_dac_status','final_servo'):report.pop(key,None)
            report['motion_envelope']=dict(profile='measurement_slow_v1',max_rpm=30,accel_rpm_s=90,corridor_mm=.15)
        start=time.monotonic();owned=False;servo_touched=False;sense_handle=None;records=set()
        if resume:
            for line in (folder/'frame_index.jsonl').read_text(encoding='utf-8').splitlines():
                records.add(json.loads(line)['metadata']['record_id'])
        frame_index=(folder/'frame_index.jsonl').open('a',encoding='utf-8')
        raw=folder/'raw';raw.mkdir(exist_ok=resume)

        def save(phase=None,message=None,**extra):
            if phase:state['phase']=phase
            if message:state['message']=message
            state.update(extra,frames_captured=report['frames_captured'],elapsed_seconds=offset+time.monotonic()-start)
            write_json(folder/'status.json',state)

        def event(kind,**fields):
            report['events'].append(dict(kind=kind,elapsed_seconds=offset+time.monotonic()-start,**fields))

        def check():
            if self.cancel_event.is_set() or self.motor.stop_file.exists():raise Cancelled('收到取消或停车请求。')

        def send(text):
            answer=self.query(text);event('command',command=text,reply=answer);return answer

        def wait(seconds):
            end=time.monotonic()+seconds
            while time.monotonic()<end:
                check();time.sleep(min(.05,max(0,end-time.monotonic())))

        def servo_position(position):
            nonlocal servo_touched
            servo_touched=True
            result=self.servo.run(dict(action=position,channel=3))
            wait(.65)
            result=self.servo.run(dict(action='read'))
            if result.get('error_code') or result.get('revision')!=124:raise RuntimeError('舵机身份或错误状态异常。')
            for row in result['channels']:
                if row.get('pending') or row.get('selected_position')!=position or row.get('active_us')!=row[position+'_us']:
                    raise RuntimeError('抬落针指令回读不一致。')
            event('servo_'+position,command_sequence=result['command_sequence'],position_feedback_available=False)
            return result

        try:
            sense_handle=open('/run/lock/fdw_sense117.lock','a')
            fcntl.flock(sense_handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            check();info=send('INFO')
            if info.get('implementation_revision')!='DIG5-R4-LOWRATE-BULK' or not info.get('adc_ready'):
                raise RuntimeError('需要配套R4原码采集固件。')
            if send('ADC_JOB_STATUS').get('state')==1:raise RuntimeError('ADC已有其他采集任务。')
            mode=send('MODE_STATUS');dac=send('DAC_STATUS')
            if mode.get('mode')!=0 or mode.get('capture_active') or mode.get('output_enabled') or dac.get('enabled') or dac.get('busy'):
                raise RuntimeError('板卡不是停激励的空闲模拟状态，不覆盖已有输出。')
            self.servo.prepare_cycle()
            owned=True
            report['hardware_info']=info
            previous_group=None
            for action in job['actions'][len(report['conditions']):]:
                check()
                if self.pcb.store.read()['revision']!=job['mechanical']['revision']:raise RuntimeError('机械对准配置已变化。')
                group=(action['measurement_net'],action['rs_ohm'])
                if group!=previous_group:
                    save('positioning','正在抬针并移动到 '+action['measurement_net'],action_id=action['action_id'])
                    send('HALT');servo_position('up')
                    # PWM回读不是机械位置反馈；每次提交XY运动前等待操作者目视确认。
                    with self.lock:
                        self.clearance_event.clear();self.clearance_token=uuid.uuid4().hex
                        token=self.clearance_token
                    save('waiting_clearance','双针已发抬起指令，请目视确认离板后继续移位。',
                         clearance_token=token,clearance_target=action['measurement_net'],clearance_rs_ohm=action['rs_ohm'])
                    deadline=time.monotonic()+600
                    while not self.clearance_event.is_set():
                        check()
                        if time.monotonic()>deadline:raise TimeoutError('等待目视确认离板超过10分钟，未提交本轮XY移动。')
                        wait(.05)
                    check()
                    with self.lock:self.clearance_token=None
                    event('operator_clearance_confirmed',measurement_net=action['measurement_net'],rs_ohm=action['rs_ohm'])
                    save('positioning','已记录离板确认，正在低速移动到 '+action['measurement_net'],clearance_token=None)
                    context=dict(points=action['motion_points'],profile=job['mechanical'],movement_profile='measurement_slow_v1')
                    lock_deadline=time.monotonic()+8
                    while True:
                        check()
                        try:
                            identifier=self.motor.start('pads',context=context)
                            break
                        except Exception as exc:
                            if str(exc)!='已有网页电机任务正在执行。' or self.motor.status()['busy']:raise
                            if time.monotonic()>lock_deadline:
                                raise RuntimeError('控制器锁在8秒内未释放，尚未提交移动指令。') from exc
                            save('waiting_controller','正在等待控制器短事务释放锁，尚未提交移动。')
                            wait(.1)
                    deadline=time.monotonic()+70
                    while True:
                        check();motion=self.motor.status();last=motion.get('last_job') or {}
                        if last.get('job_id')!=identifier:raise RuntimeError('运动任务被其他任务替换。')
                        if not motion['busy']:
                            if last.get('state')!='completed':raise RuntimeError('移动失败：'+str(last))
                            break
                        if time.monotonic()>deadline:
                            self.motor.stop();raise TimeoutError('测点移动超时，已请求停车。')
                        wait(.1)
                    self.motor.release_idle()
                    base=route_masks(action['rs_ohm'])[2][1]
                    if send('RELAY_SET '+str(base)).get('relay_mask')!=base:raise RuntimeError('探针角色/Rs档回读不一致。')
                    wait(.1);servo_position('down');previous_group=group
                    event('positioned',measurement_net=action['measurement_net'],rs_ohm=action['rs_ohm'],motion=motion)
                send('HALT')
                send('DAC_SET %d %d 2048 0 0' % (action['frequency_hz'],job['gain_q11']))
                paths={}
                for path,mask in route_masks(action['rs_ohm']):
                    check();send('HALT')
                    if send('RELAY_SET '+str(mask)).get('relay_mask')!=mask:raise RuntimeError('采样选路回读不一致。')
                    wait(.03);send('DAC_ENABLE 1');identity=send('DAC_STATUS')
                    ftw=round(action['frequency_hz']*2**32/25000000)
                    if not identity.get('enabled') or identity.get('frequency_word')!=ftw or identity.get('gain_q11')!=job['gain_q11']:
                        raise RuntimeError('DAC设置与实际激励身份不一致。')
                    wait(max(.05,20/action['frequency_hz']))
                    frames=[];anchor=None
                    for index in range(job['frames_per_path']):
                        check();save('capturing','%s，%dHz，%dΩ，%s：%d/%d帧' %
                                     (action['measurement_net'],action['frequency_hz'],action['rs_ohm'],path,index+1,job['frames_per_path']),
                                     action_id=action['action_id'],path=path)
                        frame,packet=self.capture(job['decimation_log2'],service=lambda *_:check())
                        meta=frame['metadata'];stem='%02d_%s_%02d' % (action['action_id'],path,index)
                        (raw/(stem+'.packet')).write_bytes(packet)
                        (raw/(stem+'.bin')).write_bytes(frame['payload'])
                        entry=dict(action_id=action['action_id'],path=path,index=index,metadata=meta,
                                   packet='raw/'+stem+'.packet',binary='raw/'+stem+'.bin',
                                   raw_sha256=hashlib.sha256(frame['payload']).hexdigest(),
                                   flags=frame['flags'],overrange_count=frame['overrange_count'])
                        frame_index.write(json.dumps(entry,ensure_ascii=False)+'\n');frame_index.flush()
                        report['frames_captured']+=1;report['hardware_sampled']=True
                        if (frame['flags']!=8 or frame['mode']!=0 or frame['overrange_count'] or meta['errors']
                                or min(frame['samples'])<=-2048 or max(frame['samples'])>=2047):
                            raise RuntimeError('原码质量检查失败，已保存原始数据；不继续输出。')
                        if meta['record_id'] in records:raise RuntimeError('收到重复记录。')
                        records.add(meta['record_id'])
                        if (meta['metadata_version']!=2 or meta['dac_tag']!=identity['tag'] or meta['dds_ftw']!=ftw
                                or meta['interval_ticks']!=16 or meta['last_tick']-meta['first_tick']!=8191*16):
                            raise RuntimeError('整帧相位/采样/激励身份不一致。')
                        if (meta['last_phase_word']-meta['first_phase_word'])&0xffffffff != ((meta['last_tick']-meta['first_tick'])*ftw)&0xffffffff:
                            raise RuntimeError('帧内DDS相位步进不一致。')
                        current_anchor=(meta['first_phase_word']-meta['first_tick']*ftw)&0xffffffff
                        if anchor is not None and anchor!=current_anchor:raise RuntimeError('连续帧DDS相位参考发生变化。')
                        anchor=current_anchor;frames.append(analyze_frame(frame['samples'],meta))
                    after=send('DAC_STATUS')
                    if any(after.get(k)!=identity.get(k) for k in ('enabled','tag','frequency_word','phase_word','gain_q11','offset_code')):
                        raise RuntimeError('测量组中途激励变化。')
                    if send('RELAY_STATUS').get('relay_mask')!=mask:raise RuntimeError('测量组中途选路变化。')
                    paths[path]=aggregate(frames);send('HALT')
                report['conditions'].append(finish_condition(action,paths))
                report['conditions'][-1]['elapsed_seconds']=offset+time.monotonic()-start
                write_json(folder/'report.partial.json',report)
                save('condition_completed','已完成%d/%d个真实测量条件。' % (len(report['conditions']),len(job['actions'])),
                     completed_conditions=len(report['conditions']))
            state['state']='completed';state['message']='方案全部真实采集完成，正在整理结果。'
        except Cancelled as exc:
            state.update(state='cancelled',message=str(exc));report['error']=str(exc)
        except BaseException as exc:
            state.update(state='cancelled' if self.cancel_event.is_set() else 'failed',message=str(exc));report['error']=str(exc)
        finally:
            frame_index.close()
            if owned:
                try:send('HALT');report['final_dac_status']=send('DAC_STATUS')
                except Exception as exc:report['cleanup_error']=str(exc);state['state']='failed'
            if servo_touched and not self.emergency:
                try:
                    self.servo.run(dict(action='up',channel=3));time.sleep(.7)
                    report['final_servo']=self.servo.run(dict(action='read'))
                    self.servo._motion_state(report['final_servo'],raised=True)
                except Exception as exc:report['raise_error']=str(exc);state['state']='failed'
            elif self.emergency:
                report['emergency_stop']=True;report['mechanical_position']='急停后未自动发送位置指令。'
            if sense_handle:sense_handle.close()
            report.update(state=state['state'],completed_conditions=len(report['conditions']),
                          total_conditions=len(job['actions']),elapsed_seconds=offset+time.monotonic()-start)
            state.update(completed_conditions=len(report['conditions']),frames_captured=report['frames_captured'],
                         elapsed_seconds=report['elapsed_seconds'],message='真实测量任务'+{'completed':'完成','failed':'失败','cancelled':'已取消'}[state['state']]
                         +'；'+str(len(report['conditions']))+'/'+str(len(job['actions']))+'条件，详细结果已保存。')
            try:
                write_json(folder/'report.json',report)
                write_json(folder/'status.json',dict(state,state='running',phase='exporting',message='采集已结束，正在打包原始数据。'))
                self._export(folder,job,report)
            except Exception as exc:
                state.update(state='failed',message='报告导出失败，已保留原始数据：'+str(exc))
            finally:
                state['phase']='finished'
                try:write_json(folder/'status.json',state)
                finally:
                    with self.lock:self.active=None;self.clearance_token=None
                    task_handle.close()

    @staticmethod
    def _export(folder,job,report):
        rows=[]
        for condition in report['conditions']:
            transfer=condition.get('raw_transfer') or {}
            rows.append(dict(measurement_net=condition['measurement_net'],frequency_hz=condition['frequency_hz'],
                             rs_nominal_ohm=condition['rs_nominal_ohm'],
                             va_peak_counts=condition['paths']['VA']['peak_counts'],
                             vb_peak_counts=condition['paths']['VB']['peak_counts'],
                             measured_peak_counts=condition['paths']['PROBE']['peak_counts'],
                             transfer_magnitude=transfer.get('magnitude'),phase_degrees=transfer.get('phase_degrees'),
                             dc_counts=condition['paths']['PROBE']['dc_counts'],
                             residual_rms_counts=condition['paths']['PROBE']['residual_rms_counts'],
                             va_drift_fraction=condition.get('va_complex_drift_fraction'),warnings='；'.join(condition['warnings'])))
        columns=list(rows[0]) if rows else ['measurement_net','frequency_hz','rs_nominal_ohm']
        with (folder/'measurements.csv').open('w',encoding='utf-8-sig',newline='') as output:
            writer=csv.DictWriter(output,fieldnames=columns);writer.writeheader();writer.writerows(rows)
        lines=['# 断电测量报告','',
               '任务：'+job['job_id'],'','状态：'+report['state'],
               '','真实完成：%d/%d条件，%d帧，%.2f秒。' % (len(rows),len(job['actions']),report['frames_captured'],report['elapsed_seconds']),
               '','板况：'+job['reference_label']+'。该记录来自用户声明，不是模型故障判定。',
               '','激励网络：'+job['scope']['excitation_net']+'；测量网络：'+'、'.join(job['scope']['measurement_nets'])+'。',
               '','数据单位：ADC码及原码通路比值；计算路径：CPU相量分析。','',
               '|测点|频率/Hz|Rs/Ω|VA峰值/码|测点峰值/码|原码幅比|相位/°|残差RMS/码|',
               '|---|---:|---:|---:|---:|---:|---:|---:|']
        for r in rows:
            def text(value):return '无有效值' if value is None else '%.6g'%value
            lines.append('|%s|%d|%d|%s|%s|%s|%s|%s|' % (r['measurement_net'],r['frequency_hz'],r['rs_nominal_ohm'],
                         text(r['va_peak_counts']),text(r['measured_peak_counts']),text(r['transfer_magnitude']),
                         text(r['phase_degrees']),text(r['residual_rms_counts'])))
        lines+=['','## 质量检查与限制','']
        lines+=['方案由CPU按导入工程与本次测量条件生成。',
                'VC来自ADC探针通路实采原码；当前曲线为VC/VA原码幅相比，不是未上电运放的工作增益。',
                'VA在Rs之前，VB在Rs之后。校准后才可用I=(VA−VB)/Rs、Zin=Rs×VB/(VA−VB)计算输入电流和阻抗。',
                '弱信号点在网页报告中默认断线，原始估计保留在CSV和JSON。','']
        lines.extend('- '+message for message in report['limitations'])
        for r in rows:
            if r['warnings']:lines.append('- %s / %dHz / %dΩ：%s' % (r['measurement_net'],r['frequency_hz'],r['rs_nominal_ohm'],r['warnings']))
        if report.get('error'):lines+=['','任务错误：'+report['error']]
        lines+=['','原始包和逐帧校验记录在raw/及frame_index.jsonl；详细结果见report.json和measurements.csv。']
        (folder/'report.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
        from .unpowered_report import render_report
        (folder/'report.html').write_text(render_report(report,download_base='/diagnosis/unpowered/'+job['job_id']+'/files/'),encoding='utf-8')
        with zipfile.ZipFile(folder/'measurement_bundle.zip','w',compression=zipfile.ZIP_DEFLATED,compresslevel=1) as archive:
            for path in folder.rglob('*'):
                if path.is_file() and 'attempts' not in path.relative_to(folder).parts and path.name not in ('measurement_bundle.zip','owner.json','status.json','report.partial.json') and not path.name.endswith('.tmp'):
                    archive.write(path,str(path.relative_to(folder)))
