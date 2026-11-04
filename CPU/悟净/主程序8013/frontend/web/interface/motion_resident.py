
import argparse
from contextlib import redirect_stdout
import copy
import json
import math
import os
from pathlib import Path
import selectors
import signal
import sys
import time
import uuid

if __package__:
    from . import motor_worker as worker
else:
    import motor_worker as worker


class LeaseError(RuntimeError):
    pass


def atomic_json(path, value):
    path = Path(path)
    temporary = path.with_name(path.name + '.tmp')
    temporary.write_text(json.dumps(value, ensure_ascii=False, allow_nan=False) + '\n', encoding='utf-8')
    temporary.replace(path)


def valid_identifier(value):
    return (isinstance(value, str) and 1 <= len(value) <= 128
            and all(c in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-' for c in value))


class ResidentExecutor:
    def __init__(self, controller, runtime, parent_pid, idle_seconds=30,
                 clock=time.monotonic, owner_alive=None):
        if not math.isfinite(idle_seconds) or not 0 < idle_seconds <= 60:
            raise ValueError('Idle timeout must be in (0, 60] seconds')
        self.controller = controller
        self.runtime = Path(runtime)
        self.runtime.mkdir(parents=True, exist_ok=True)
        self.parent_pid = parent_pid
        self.clock = clock
        self.owner_alive = owner_alive or (lambda: os.getppid() == parent_pid)
        self.idle_seconds = idle_seconds
        self.stop_file = controller.core.STOP_FILE
        self.fault_path = self.runtime / 'motion_executor.fault.json'
        self.lease_path = self.runtime / 'motion_executor.lease.json'
        self.lease_id = 'web_lease_' + uuid.uuid4().hex
        self.session = None
        self.coordinates = None
        self.base_report = None
        self.tasks = []
        self.request_ids = set()
        self.last_business = clock()
        self.last_scan = None
        self.idle_origin = None
        self.deadline = None
        self.closing = False
        self.closed = False
        self.failed = False
        self.current_run_id = None
        self.pending_signal = None
        self.baseline_verified = False
        self._audit('waiting')

    @property
    def warm_active(self):
        return self.session is not None and not self.closed and not self.failed

    def _audit(self, phase, **details):
        atomic_json(self.lease_path, dict(lease_id=self.lease_id, parent_pid=self.parent_pid,
                    child_pid=os.getpid(), phase=phase, warm_active=self.warm_active,
                    monotonic_s=self.clock(), tasks=list(self.tasks), **details))

    def _stop(self, message):
        self.stop_file.parent.mkdir(parents=True, exist_ok=True)
        try:
            with self.stop_file.open('x', encoding='utf-8') as handle:
                handle.write('Resident motion executor: ' + message + '\n')
        except FileExistsError:
            pass

    def _checks(self):
        if self.closing:
            return
        if self.pending_signal is not None:
            raise LeaseError('Executor received signal %s' % self.pending_signal)
        if not self.owner_alive():
            raise LeaseError('Motion owner process disappeared; no command replay')
        if self.stop_file.exists():
            raise LeaseError('Stop request exists: %s' % self.stop_file)
        if self.deadline is not None and self.clock() >= self.deadline:
            raise TimeoutError('Resident motion task deadline exceeded')

    def _coordinates(self):
        value = self.controller.load_coordinates()
        if self.coordinates is not None and value != self.coordinates:
            raise LeaseError('Coordinate reference changed during the held USB lease')
        return value

    def _open(self, run_id):
        self._checks()
        self.coordinates = self.controller.load_coordinates()
        session = self.controller.Session(run_id + '_resident', active_axes=(1, 2, 3, 4))
        self.baseline_verified = False
        self.session = session
        original_check = session.check_stop

        def checked():
            if not self.closing:
                self._checks()
                original_check()
        session.check_stop = checked
        for address in range(1, 5):
            checked()
            motor = session.select(address)
            config = motor.config()
            if motor.mode != 0 or config[24] != 0:
                raise LeaseError('Motor %s has an unrestored checksum mode; explicit recovery required' % address)
            if int.from_bytes(config[16:18], 'big') != 3000 or config[26] != 0:
                raise LeaseError('Motor %s has unrestored current/angle settings; explicit recovery required' % address)
        self.baseline_verified = True
        session.initialize()
        checked()
        self.base_report = copy.deepcopy(session.report)
        self._audit('warm')

    def _begin_report(self, payload, reused):
        session = self.session
        if getattr(session, 'active', None) is not None:
            raise LeaseError('Previous action left an active motor')
        group = getattr(session, '_web_group_motion', None)
        if group is not None and group.pending:
            raise LeaseError('Previous action left cached motor targets')
        report = copy.deepcopy(self.base_report)
        report.update(passed=False, run_id=payload['run_id'], action=payload['action'], resident_lease_id=self.lease_id,
                      parameters_retained=True, session_reused=reused,
                      summary_file=str(self.runtime / (payload['run_id'] + '.resident.json')))
        if reused:
            report['timing'] = {}
        session.report = report
        session.first_motion_monotonic_s = None
        session._web_verified_frame = None
        session._web_group_motion = None

    def _finish_report(self, result, started, reused):
        session = self.session
        timing = dict(session.report.get('timing', {}), worker_elapsed_s=self.clock()-started,
                      session_reused=reused)
        first = getattr(session, 'first_motion_monotonic_s', None)
        if first is not None:
            timing['before_first_motion_s'] = first-started
        session.report.update(passed=True, parameters_retained=True, timing=timing,
                              final_positions_mm=result['positions_mm'])
        atomic_json(session.report['summary_file'], session.report)
        result.update(parameters_retained=True, session_reused=reused,
                      resident_lease_id=self.lease_id, timing=timing,
                      summary_file=session.report['summary_file'])
        self.tasks.append(dict(run_id=self.current_run_id, passed=True,
                               summary_file=session.report['summary_file']))
        if worker.JOB_ID and session.report.get('action') != 'probe':
            self.idle_origin = dict(result['positions_mm'])
        self.last_scan = self.clock()
        self._audit('warm')
        return result

    def _fault(self, exc):
        self.failed = True
        error = '%s: %s' % (type(exc).__name__, exc)
        try:
            self._stop(error)
        except OSError:
            pass
        if self.session is not None:
            self.session.report['error'] = error
            if self.current_run_id:
                path = self.runtime / (self.current_run_id + '.resident.json')
                try:
                    atomic_json(path, dict(self.session.report, passed=False, error=error))
                except OSError:
                    pass
                self.tasks.append(dict(run_id=self.current_run_id, passed=False, summary_file=str(path)))
        restored = self.close('fault', fault_error=error)
        value = dict(passed=False, connected=False, ready=False, error=error,
                     parameters_retained=False, session_reused=False,
                     restoration_verified=restored, cleanup_verified=restored,
                     parameters_restored=restored, resident_lease_id=self.lease_id)
        previous = {}
        if self.fault_path.exists():
            try:
                previous = json.loads(self.fault_path.read_text())
            except (OSError, ValueError):
                pass
        try:
            atomic_json(self.fault_path, dict(previous, **value, run_id=self.current_run_id,
                        parent_pid=self.parent_pid, child_pid=os.getpid(), monotonic_s=self.clock()))
        except OSError:
            pass
        return value

    def close(self, reason='release', fault_error=None, keep_process=False):
        if self.closed:
            return not self.failed
        self.closing = True
        errors = []
        session = self.session
        try:
            if session is not None:
                session.report.update(resident_tasks=list(self.tasks), resident_close_reason=reason)
                if hasattr(session, 'path'):
                    session.report['summary_file'] = str(session.path)
                try:
                    session.close()
                except BaseException as exc:
                    errors.append('%s: %s' % (type(exc).__name__, exc))
                errors.extend(session.report.get('cleanup_errors') or [])
                if not self.baseline_verified:
                    errors.append('Original parameter baseline was not verified; explicit recovery required')
                if not session.report.get('passed') and not (fault_error and not errors):
                    errors.append('Original Session restoration was not verified')
        finally:
            self.session = None
            self.closed = not keep_process
            self.closing = False
            self.coordinates = None
            self.base_report = None
            self.idle_origin = None
            self.last_scan = None
        restored = not errors
        if errors:
            self.failed = True
            message = 'Parameter restoration failed: ' + '; '.join(errors)
            try:
                self._stop(message)
                atomic_json(self.fault_path, dict(passed=False, connected=False, ready=False,
                            error=message, restoration_verified=False, cleanup_verified=False, parameters_restored=False, cleanup_errors=errors,
                            resident_lease_id=self.lease_id, run_id=self.current_run_id))
            except OSError:
                pass
        try:
            self._audit('fault' if self.failed else 'cold' if keep_process else 'closed', reason=reason,
                        restoration_verified=restored, cleanup_verified=restored,
                        parameters_restored=restored, cleanup_errors=errors, error=fault_error)
        except OSError:
            self.failed = True
            self.closed = True
            try:
                self._stop('Restoration audit could not be saved')
            except OSError:
                pass
            return False
        return restored

    def handle(self, request):
        request_id = request.get('request_id') if isinstance(request, dict) else None
        if not valid_identifier(request_id):
            raise ValueError('Invalid request_id')
        if request_id in self.request_ids:
            raise ValueError('Repeated request_id; actions are never replayed')
        self.request_ids.add(request_id)
        payload = request.get('payload')
        if not isinstance(payload, dict):
            raise ValueError('Missing request payload')
        action, run_id = payload.get('action'), payload.get('run_id')
        if action not in ('jog', 'pads', 'teach', 'probe', 'release'):
            raise ValueError('Unsupported resident action')
        if not valid_identifier(run_id) or not run_id.startswith('web_'):
            raise ValueError('Invalid run_id')
        timeout = payload.get('timeout_s', 600 if action == 'pads' else 90)
        if isinstance(timeout, bool) or not isinstance(timeout, (int, float)) or not math.isfinite(timeout) or not 0 < timeout <= 600:
            raise ValueError('Invalid task timeout')
        if self.closed:
            raise LeaseError('Resident executor is closed; no automatic reconnect')
        self.current_run_id = run_id
        worker.JOB_ID = run_id
        worker.PROGRESS_PATH = self.runtime / (run_id + '.progress.json')
        self.deadline = self.clock() + timeout
        started = self.clock()
        reused = self.warm_active
        try:
            if self.fault_path.exists():
                self.failed = True
                self.closed = True
                return dict(request_id=request_id, warm_active=False, result=dict(
                    passed=False, connected=False, ready=False,
                    error='Previous executor fault requires explicit successful check/rebuild'))
            if action == 'release':
                restored = self.close('release')
                result = dict(passed=restored, connected=restored, ready=restored,
                              parameters_retained=False, session_reused=reused,
                              restoration_verified=restored, cleanup_verified=restored,
                              parameters_restored=restored, message='USB会话已恢复原参数并释放。')
                if not restored:
                    result['error'] = 'Parameter restoration failed; STOP retained'
            elif action in ('probe', 'teach') and self.session is None:
                self._checks()
                try:
                    result = (worker.probe_machine(self.controller, run_id) if action == 'probe'
                              else worker.teach_machine(self.controller, payload['context'], run_id))
                    self._checks()
                except Exception as exc:
                    result = dict(passed=False, connected=False, ready=False, reference_valid=False,
                                  read_only_failure=True, motion_commands_sent=0, motor_parameter_writes=0,
                                  error='%s: %s' % (type(exc).__name__, exc))
                result.update(parameters_retained=False, session_reused=False)
            else:
                self._checks()
                if action == 'jog':
                    worker.validate_jog(payload.get('jog'))
                if action == 'pads':
                    worker.validate_pad_context(self.controller, self._coordinates(), payload['context'])
                if self.session is None:
                    self._open(run_id)
                coordinates = self._coordinates()
                self._begin_report(payload, reused)
                if action == 'jog':
                    result = worker.jog_in_session(self.controller, self.session, coordinates, payload['jog'])
                elif action == 'pads':
                    result = worker.pads_in_session(self.controller, self.session, coordinates, payload['context'])
                elif action == 'teach':
                    result = worker.teach_in_session(self.controller, self.session, coordinates, payload['context'])
                else:
                    result = worker.read_machine_in_session(self.controller, self.session, coordinates)
                self._checks()
                result = self._finish_report(result, started, reused)
            if action != 'probe':
                self.last_business = self.clock()
            return dict(request_id=request_id, result=result, warm_active=self.warm_active)
        except BaseException as exc:
            result = self._fault(exc)
            return dict(request_id=request_id, result=result, warm_active=False)
        finally:
            self.deadline = None
            self.current_run_id = None
            worker.JOB_ID = None
            worker.PROGRESS_PATH = None

    def idle_tick(self):
        if self.closed:
            return False
        try:
            if self.session is None and (self.pending_signal is not None or not self.owner_alive()
                                         or self.stop_file.exists()):
                self.close('cold_owner_exit')
                return False
            self._checks()
            now = self.clock()
            if self.session is not None and now-self.last_business >= self.idle_seconds:
                restored = self.close('idle_timeout', keep_process=True)
                if not restored:
                    self.closed = True
                    return False
                return True
            if self.session is not None and (self.last_scan is None or now-self.last_scan >= .1):
                coordinates = self._coordinates()
                result = worker.read_machine_in_session(self.controller, self.session, coordinates)
                if self.idle_origin is not None and any(
                        abs(result['positions_mm'][a]-self.idle_origin[a]) > .15 for a in self.idle_origin):
                    raise LeaseError('Unexpected movement while USB lease was idle')
                self.last_scan = self.clock()
            return True
        except BaseException as exc:
            self._fault(exc)
            return False


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', required=True)
    parser.add_argument('--runtime', required=True)
    parser.add_argument('--parent-pid', type=int, required=True)
    parser.add_argument('--idle-seconds', type=float, default=30)
    parser.add_argument('--execute', action='store_true')
    args = parser.parse_args(argv)
    if not args.execute:
        print('No USB access. Add --execute to own a bounded warm session.')
        return 0
    if args.parent_pid <= 1:
        parser.error('A live parent process is required')
    protocol = sys.stdout
    with redirect_stdout(sys.stderr):
        controller = worker.load_controller(Path(args.root))
        executor = ResidentExecutor(controller, args.runtime, args.parent_pid, args.idle_seconds)
        for signum in (signal.SIGTERM, signal.SIGINT):
            signal.signal(signum, lambda number, frame: setattr(executor, 'pending_signal', number))
        selector = selectors.DefaultSelector()
        selector.register(sys.stdin.fileno(), selectors.EVENT_READ)
        buffer = bytearray()
        try:
            while executor.idle_tick():
                if not selector.select(.05):
                    continue
                data = os.read(sys.stdin.fileno(), 16384)
                if not data:
                    if buffer:
                        executor._fault(ValueError('Partial request at EOF'))
                    else:
                        executor.close('parent_eof')
                    break
                buffer.extend(data)
                if len(buffer) > 65536:
                    executor._fault(ValueError('Resident request exceeds size limit'))
                    break
                if buffer.count(b'\n') > 1:
                    executor._fault(ValueError('Queued resident requests are forbidden'))
                    break
                if b'\n' not in buffer:
                    continue
                line, _, remaining = buffer.partition(b'\n')
                buffer = bytearray(remaining)
                try:
                    response = executor.handle(json.loads(line))
                except BaseException as exc:
                    executor._fault(exc)
                    break
                protocol.write(json.dumps(response, ensure_ascii=False, allow_nan=False) + '\n')
                protocol.flush()
                if executor.closed:
                    break
        finally:
            selector.close()
            if not executor.closed:
                executor.close('process_exit')
        return 1 if executor.failed else 0


if __name__ == '__main__':
    raise SystemExit(main())
