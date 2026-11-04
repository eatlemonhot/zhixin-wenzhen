"""124落针测量周期：人工确认到位，采集当前ADC通路，再抬针。"""
import json
import os
from pathlib import Path
import signal
import sys
import time

from servo_worker import driver
from measurement_cycle import MeasurementCycle


class Cancelled(RuntimeError):
    pass


def execute(folder, servo, acquisition, lock, clock=time.monotonic, sleep=time.sleep):
    """由设备控制器与采集器协同执行落针采集周期。"""
    payload = json.loads((folder / 'request.json').read_text(encoding='utf-8'))
    started = clock()
    current = {'state': 'preparing', 'sequence': 0, 'measurement_source': 'adc', 'events': [], 'position_feedback_available': False}

    def save(state, message):
        current.update(state=state, message=message, sequence=current['sequence'] + 1)
        current['events'].append({'elapsed_s': round(clock() - started, 3), 'state': state, 'message': message})
        temporary = folder / 'status.tmp'
        temporary.write_text(json.dumps(current, ensure_ascii=False, indent=2), encoding='utf-8')
        os.replace(str(temporary), str(folder / 'status.json'))

    class ControlledServo:
        def status(self):
            return servo.status()

        def _mask(self, channels):
            return servo._mask(channels)

        def down(self, channels):
            if (folder / 'cancel.request').exists() or (folder / 'stop.request').exists():
                raise Cancelled('任务已取消。')
            save('lowering', '正在提交落针指令。')
            return servo.down(channels)

        def up(self, channels):
            if (folder / 'stop.request').exists():
                servo.stop(channels)
                save('stopped', '已停止PWM；机械位置尚未确认。')
                return {'emergency_stop': True}
            save('raising', '正在提交抬针指令。')
            return servo.up(channels)

    def confirm(state, position):
        if state.get('emergency_stop'):
            return False
        waiting = 'waiting_lowered' if position == 'lowered' else 'waiting_raised'
        save(waiting, '请观察探针，确认已经' + ('落下到位。' if position == 'lowered' else '抬起到位。'))
        sequence = current['sequence']
        confirmation = folder / ('confirm_' + str(sequence) + '.json')
        deadline = clock() + 120
        while clock() < deadline:
            if (folder / 'stop.request').exists():
                servo.stop(payload['channel'])
                save('stopped', '已停止PWM；机械位置尚未确认。')
                return False
            if position == 'lowered' and (folder / 'cancel.request').exists():
                return False
            if confirmation.exists():
                data = json.loads(confirmation.read_text(encoding='utf-8'))
                return data == {'sequence': sequence, 'position': position}
            sleep(0.1)
        raise TimeoutError('等待人工确认到位超时。')

    try:
        # 通信、采集空闲和配套先检查，失败时不落针。
        preflight = acquisition.preflight()
        current['acquisition_preflight'] = preflight

        def measure():
            if (folder / 'cancel.request').exists():
                raise Cancelled('任务已取消。')
            save('measuring', '正在采集当前ADC通路的真实原码。')
            result = acquisition.capture(payload['decimation_log2'], folder, lambda: (folder / 'cancel.request').exists() or (folder / 'stop.request').exists())
            current['measurement'] = result
            return result

        cycle = MeasurementCycle(ControlledServo(), lambda state: confirm(state, 'lowered'), lambda state: confirm(state, 'raised'), lock=lock)
        result = cycle.run(measure, payload['channel'])
        save('cancelled' if (folder / 'cancel.request').exists() else 'completed', '周期完成：探针已确认抬起。')
        return result
    except Exception as exc:
        if current['state'] != 'stopped':
            save('failed', str(exc))
        return None


def main():
    folder = Path(sys.argv[1]).resolve()
    payload = json.loads((folder / 'request.json').read_text(encoding='utf-8'))
    import fcntl
    from contextlib import contextmanager
    from r4_capture_client import command, capture_job
    from icraft import xrt, zg330backend

    signal.signal(signal.SIGTERM, lambda *_: (folder / 'cancel.request').touch())
    signal.signal(signal.SIGINT, lambda *_: (folder / 'cancel.request').touch())

    @contextmanager
    def ownership():
        handles = []
        try:
            for revision in (123, 124):
                handle = open('/run/lock/fdw-servo-pair' + str(revision) + '.lock', 'a')
                handles.append(handle)
                fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            if payload.get('kind') == 'staged_abca':
                for name in ('/tmp/wujing_zdt_ch340.lock', '/run/lock/fdw_sense117.lock'):
                    handle = open(name, 'a');handles.append(handle)
                    fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            yield
        finally:
            for handle in reversed(handles):
                handle.close()

    class RealAcquisition:
        def preflight(self):
            self.info = command('INFO')
            if self.info.get('implementation_revision') != 'DIG5-R4-LOWRATE-BULK':
                raise RuntimeError('7020未运行R4真实采集配套，未落针。')
            if command('ADC_JOB_STATUS')['state'] == 1:
                raise RuntimeError('7020已有采集任务，未落针。')
            self.dac = command('DAC_STATUS')
            self.route = command('RELAY_STATUS')
            return {'route': self.route, 'excitation': self.dac, 'sample_count': 8192}

        def capture(self, log2, target, cancelled):
            def inspect(_):
                if cancelled():
                    raise Cancelled('任务已取消。')
            frame, packet = capture_job(log2, service=inspect)
            (target / 'capture.packet').write_bytes(packet)
            (target / 'capture.bin').write_bytes(frame['payload'])
            metadata = {key: value for key, value in frame.items() if key not in ('samples', 'payload')}
            (target / 'capture.json').write_text(json.dumps(metadata, ensure_ascii=False, indent=2), encoding='utf-8')
            if frame['mode'] != 0 or frame['flags'] != 8 or frame['overrange_count'] or frame['metadata']['errors']:
                raise RuntimeError('ADC数据未通过连续性或过量程检查，原码已保存。')
            after_dac, after_route = command('DAC_STATUS'), command('RELAY_STATUS')
            for name in ('enabled', 'tag', 'frequency_word', 'gain_q11', 'offset_code', 'phase_word'):
                if self.dac.get(name) != after_dac.get(name):
                    raise RuntimeError('采集中激励设置发生变化，原码已保存。')
            if self.route.get('relay_mask') != after_route.get('relay_mask'):
                raise RuntimeError('采集中测量通路发生变化，原码已保存。')
            import hashlib
            values = frame['samples']
            return dict(source='adc', samples=len(values), minimum_code=min(values), maximum_code=max(values),
                        record_id=frame['metadata']['record_id'], sha256=hashlib.sha256(frame['payload']).hexdigest(),
                        crc_verified=True, current_route_only=True, physical_probe_pair=False,
                        voltage_calibrated=False, fault_diagnosis_executed=False, pl_executed=False)

    device = xrt.Device.Open('axi://zg330aiu?npu=0x40000000&dma=0x80000000')
    try:
        servo, _ = driver(device.defaultRegRegion())
        if payload.get('kind') == 'staged_abca':
            from staged_cycle_worker import execute as staged_execute
            staged_execute(folder, servo, command, capture_job, ownership)
        else:
            execute(folder, servo, RealAcquisition(), ownership)
    finally:
        xrt.Device.Close(device)


if __name__ == '__main__':
    main()
