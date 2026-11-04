"""Named, bounded four-axis commands executed locally on the Wujing board.

Examples: motorctl.py status --execute; motorctl.py rehome --execute;
motorctl.py move 1 10 --execute; motorctl.py stop.
No USB access on import or without --execute. No OS configuration is changed.
"""
import argparse
import json
from pathlib import Path
import re
import signal
import sys
import time
from datetime import datetime, timezone

HERE = Path(__file__).resolve().parent
MACHINE = HERE.parent / 'machine_coordinates'
sys.path.insert(0, str(MACHINE))
from ch340_serial import CH340Serial
from coordinate_setup import Session, CoordinateMotor, AXES, save
import coordinate_setup as core
from machine_control import load_coordinates, read_positions, move_to, bounded_target
from power_profile import load_power_profile, validate_power_temperature


class USBMotor(CoordinateMotor):
    def __init__(self, port, journal, serial_factory=CH340Serial):
        self.supply_profile = load_power_profile()
        self.journal = journal
        self.buffer = bytearray()
        self.pending = []
        self.emm = False
        self.address, self.mode = 1, 0
        self.accept_modes = self.accept_addresses = None
        self.bad_frames = 0
        self.ser = serial_factory(port, event=self.event)

    def snapshot(self, require_ready=False):
        # Same individual read protocol and interlocks as the original 12 V
        # snapshot; only the explicitly selected motor supply envelope differs.
        home = self.query([0x3B])[2]
        flags = self.query([0x3A])[2]
        sample = dict(home_flags=home, motor_flags=flags,
                      encoder=int.from_bytes(self.query([0x31])[2:4], 'big'),
                      speed_rpm=core.signed(self.query([0x35])) / (1 if self.emm else 10),
                      phase_current_ma=int.from_bytes(self.query([0x27])[2:4], 'big'),
                      voltage_v=int.from_bytes(self.query([0x24])[2:4], 'big') / 1000,
                      temperature_c=core.signed(self.query([0x39])))
        self.event(sample=sample, supply_profile=self.supply_profile)
        if home & 0x30 or flags & 8:
            raise RuntimeError('Protection active: %s' % sample)
        validate_power_temperature(sample, self.supply_profile)
        if not 0 <= sample['phase_current_ma'] <= 3100:
            raise RuntimeError('Current exceeds existing 3 A setting: %s' % sample)
        if require_ready and (home != 3 or not flags & 1):
            raise RuntimeError('Expected calibrated, enabled motor: %s' % sample)
        return sample

    def event(self, **data):
        self.journal.write(json.dumps(dict(time_utc=core.now(), monotonic_s=time.monotonic(), **data)) + '\n')
        self.journal.flush()

    def action(self, payload, ack_timeout=1):
        try:
            return super().action(payload, ack_timeout)
        except TimeoutError as exc:
            packet = bytes(payload)
            if (len(packet) != 5 or packet[:3] != b'\x45\x66\x00'
                    or int.from_bytes(packet[3:], 'big') not in (1000, 3000)):
                raise
            expected = int.from_bytes(packet[3:], 'big')
            observed = int.from_bytes(self.config()[16:18], 'big')
            if observed != expected:
                raise RuntimeError('Temporary current ACK missing and readback differs: '
                                   'motor %s expected %s mA, observed %s mA'
                                   % (self.address, expected, observed)) from exc
            self.event(temporary_current_ack_missing=True,
                       current_readback_verified_ma=observed, address=self.address,
                       action_sent_once=True)
            return None


class USBSession(Session):
    def __init__(self, label):
        super().__init__(label, port='usb://ch340', motor_factory=USBMotor)
        self.report['transport'] = 'CH340 userspace libusb, 115200/8N1'


class Machine:
    def __init__(self, run_id=None, controller_time=None):
        self.run_id = run_id or datetime.now().strftime('%Y%m%d_%H%M%S')
        self.controller_time = controller_time
        if not self.run_id or any(c not in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-' for c in self.run_id):
            raise ValueError('Run id must contain only letters, digits, underscores and hyphens')
        self.origin_clock = time.monotonic()
        if controller_time:
            normalized = re.sub(r'(\.\d{6})\d+', r'\1', controller_time.replace('Z', '+00:00'))
            stamp = datetime.fromisoformat(normalized)
            if stamp.tzinfo is None:
                raise ValueError('Controller time must include a timezone')
            # Log with the supplied controller clock plus local monotonic time.
            # This does not change the board's incorrect system clock.
            self.utc_origin = stamp.timestamp()
            core.now = self.now

    def now(self):
        return datetime.fromtimestamp(self.utc_origin + time.monotonic() - self.origin_clock,
                                      timezone.utc).isoformat()

    def status(self):
        journal_path = HERE / (self.run_id + '_status_serial.jsonl')
        result = dict(action='status', transport='usb://ch340', motors={},
                      motor_parameter_writes=0, motion_commands_sent=0)
        with journal_path.open('x', encoding='utf-8') as journal:
            motor = USBMotor('usb://ch340', journal)
            try:
                for address in AXES:
                    motor.address = address
                    for mode in (0, 2):
                        motor.mode = mode
                        try:
                            version = motor.consistent([0x1F])
                            break
                        except TimeoutError:
                            if mode == 2:
                                raise
                    motor.options()
                    sample = motor.snapshot(require_ready=True)
                    sample['position_deg'] = core.signed(motor.query([0x36]), 10)
                    coordinate = json.loads((MACHINE / 'coordinates.json').read_text())
                    phase = (sample['encoder'] * 360 / 65536 - sample['position_deg']) % 360
                    error = abs((phase-coordinate['axes'][str(address)]['origin']['origin_encoder_deg']+180)%360-180)
                    reference_valid = (coordinate.get('valid', False) and not sample['motor_flags'] & 0x80 and error <= 1)
                    result['motors'][str(address)] = dict(sample=sample, checksum_mode=mode,
                        version=version.hex(' '), reference_error_deg=error, reference_valid=reference_valid,
                        millimetres=AXES[address]['positive_mm_sign']*sample['position_deg']/9 if reference_valid else None)
            finally:
                motor.ser.close()
        result['all_references_valid'] = all(m['reference_valid'] for m in result['motors'].values())
        save(HERE / (self.run_id + '_status.json'), result)
        return result

    def _operate(self, action, address=None, target=None):
        if action == 'move':
            coordinates = load_coordinates()
            parked = {a: item['soft_min_mm'] for a, item in coordinates['axes'].items()}
            bounded_target(coordinates, parked, address, target)
        session = USBSession(self.run_id + '_' + action)
        session.report.update(controller_time_at_launch=self.controller_time,
                              board_system_time_at_launch=datetime.now(timezone.utc).isoformat())
        try:
            if action == 'rehome':
                session.rehome()
                candidate = session.report['coordinates_candidate']
                candidate['port'] = 'usb://ch340'
                candidate['transport'] = 'userspace CH340 libusb'
                session.report['positions_mm'], session.report['verified_samples'] = read_positions(session, candidate)
            else:
                session.initialize()
                session.report['movement'] = move_to(session, coordinates, address, target)
                session.report['positions_mm'], session.report['verified_samples'] = read_positions(session, coordinates)
        except BaseException as exc:
            session.report['error'] = '%s: %s' % (type(exc).__name__, exc)
            print(json.dumps({'operation_error': session.report['error']}), flush=True)
        finally:
            session.close()
        return {key: session.report[key] for key in ('passed', 'positions_mm', 'error',
                    'cleanup_errors', 'summary_file', 'rejected_frames') if key in session.report}

    def rehome(self):
        return self._operate('rehome')

    def move_mm(self, address, absolute_mm):
        return self._operate('move', address, absolute_mm)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('status', 'rehome', 'move', 'stop', 'clear-stop'))
    parser.add_argument('address', type=int, nargs='?', choices=(1, 2, 3, 4))
    parser.add_argument('millimetres', type=float, nargs='?')
    parser.add_argument('--run-id')
    parser.add_argument('--controller-time')
    parser.add_argument('--execute', action='store_true')
    args = parser.parse_args()
    if args.action == 'stop':
        core.STOP_FILE.write_text('Requested by motorctl\n')
        print('Stop requested for the running controller; USB is not opened by this command.')
        return 0
    if args.action == 'clear-stop':
        if core.STOP_FILE.exists():
            core.STOP_FILE.unlink()
        print('Stop request cleared. No motor command sent.')
        return 0
    if args.action == 'move' and (args.address is None or args.millimetres is None):
        parser.error('move requires an address and absolute millimetres')
    if not args.execute:
        print('No USB access. Add --execute to perform the named command.')
        return 0
    def interrupt(signum, frame):
        raise KeyboardInterrupt('Signal %s: stop and restore parameters' % signum)
    signal.signal(signal.SIGTERM, interrupt)
    machine = Machine(args.run_id, args.controller_time)
    result = (machine.move_mm(args.address, args.millimetres) if args.action == 'move'
              else getattr(machine, args.action)())
    print(json.dumps(result, ensure_ascii=False, indent=2), flush=True)
    return 0 if result.get('passed', result.get('action') == 'status') else 1


if __name__ == '__main__':
    raise SystemExit(main())
