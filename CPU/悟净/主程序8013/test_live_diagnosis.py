import copy
import importlib
import json
import math
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest import mock

import numpy as np

from probe_system.live_features import Calibration, FrameProcessor, aggregate, calibration_profile, point
from probe_system.live_diagnosis import diagnose, make_reference, model_actions
from probe_system.unpowered_ai.core import ACTIONS, TEMPLATES, solve
from probe_system.neural_ranker import NeuralRanker
from probe_system.position_feedback import PositionFeedback


def profile_payload():
    standards = []
    for rs in (100, 10000):
        for frequency in (2000, 5000, 10000, 20000, 50000, 100000):
            for channel in ('VA', 'VB', 'PROBE'):
                for level in (1, 2):
                    standards.append(dict(rs_ohm=rs, frequency_hz=frequency, path=channel, session_id='calibration',
                                          record_id=len(standards) + 1, interval_ticks=16, raw_sha256='a' * 64,
                                          measured_phasor_counts=[level * 100, 0], reference_phasor_V=[level * .1, 0],
                                          measured_dc_counts=(level - 1) * 100, reference_dc_V=(level - 1) * .1))
    return dict(standards=standards, station_id='station-1', left_terminal='TP_A', rs_measured_ohm={'100': 100., '10000': 10000.})


def job():
    return dict(circuit=dict(ground_net='0', components=list(TEMPLATES['rc_ladder'])),
                scope=dict(excitation_net='P'), dut_id='board-1')


def record(index, frames, features, counter, calibration):
    count = 4 * frames
    ids = list(range(counter[0], counter[0] + count))
    counter[0] += count
    return dict(source='hardware', calibrated=True, quality_passed=True, feature_contract='pl-lsq8192-dds-mean-v1',
                calibration_id=calibration.identity, acquisition_session_id='capture', action_id=index,
                frames=frames, features=list(features), frame_ids=ids, contact_profile='passive-node-loaded-v1')


class FeatureTests(unittest.TestCase):
    def test_position_feedback_debounce_and_conflict(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            channels = {}
            for channel in ('1', '2'):
                channels[channel] = {}
                for position in ('up', 'down'):
                    path = root / (channel + position)
                    path.write_text('1' if position == 'up' else '0', encoding='ascii')
                    channels[channel][position] = dict(path=str(path), active_level='1')
            config = root / 'inputs.json'
            config.write_text(json.dumps(dict(channels=channels)), encoding='utf-8')
            feedback = PositionFeedback(config)
            self.assertFalse(feedback('up', 3))
            self.assertFalse(feedback('up', 3))
            self.assertTrue(feedback('up', 3))
            (root / '1down').write_text('1', encoding='ascii')
            with self.assertRaises(ValueError):
                feedback('down', 1)

    def test_npu_only_path_does_not_evaluate_cpu(self):
        folder = Path(__file__).parent / 'probe_system/unpowered_ai/model'
        model = NeuralRanker(folder, 'npu')
        output_values = np.arange(21, dtype=np.float32)
        class Output:
            def waitForReady(self, timeout):
                return True
            def read(self, output, offset, count):
                for index, value in enumerate(output_values):
                    output[index] = float(value)
        model.session = types.SimpleNamespace(forward=lambda _: [Output()])
        model.network = types.SimpleNamespace(inputs=lambda: [types.SimpleNamespace(tensorType=lambda: None)])
        icraft = types.ModuleType('icraft')
        icraft.xrt = types.SimpleNamespace(Tensor=lambda *_: None)
        with mock.patch.dict(sys.modules, {'icraft': icraft}), mock.patch.object(model, 'reference', side_effect=AssertionError('CPU')):
            result = model(np.zeros(470, np.float32))
        np.testing.assert_array_equal(result, output_values)
        self.assertEqual(model.evidence()['actual_NPU_calls'], 1)
        self.assertEqual(model.evidence()['CPU_fallback_calls'], 0)

    def test_cpu_phase_and_cic(self):
        frequency = 2000
        expected = point(frequency)
        first = 10000
        phase = (np.arange(8192) * expected['pl_ftw'] + first) % 2**32 * (2 * math.pi / 2**32)
        amplitude, relative = 500., .4
        samples = np.rint(7 + amplitude * expected['filter_gain'] * np.sin(phase + relative + expected['filter_phase_radians'])).astype(int)
        metadata = dict(metadata_version=2, generation=1, record_id=1, sample_count=8192, complete=True, errors=0,
                        dds_ftw=expected['dds_ftw'], dac_tag=1, inverted=False, interval_ticks=16, first_tick=0,
                        last_tick=8191 * 16, first_phase_word=first, last_phase_word=(first + 8191 * expected['pl_ftw']) & 0xffffffff,
                        raw_clock_hz=25000000, decimation_log2=4, filter_id=1, pipeline_tick_compensation=2)
        frame = dict(samples=samples, metadata=metadata, flags=8, mode=0, overrange_count=0)
        value = FrameProcessor().process(frame, frequency)
        z = complex(value['real_counts'], value['imag_counts'])
        self.assertAlmostEqual(abs(z), amplitude, delta=.1)
        self.assertAlmostEqual(np.angle(z), relative, delta=.001)
        self.assertAlmostEqual(value['dc_counts'], 7, delta=.1)
        frame['metadata']['last_tick'] += 1
        with self.assertRaises(ValueError):
            FrameProcessor().process(frame, frequency)

    def test_residual_power_average(self):
        frames = [dict(record_id=i + 1, first_tick=i, real_counts=100, imag_counts=0, dc_counts=0,
                       residual_rms_counts=r, backend='cpu') for i, r in enumerate((3, 4))]
        self.assertAlmostEqual(aggregate(frames)['residual_rms_counts'], math.sqrt(12.5))

    def test_calibration_and_signature(self):
        profile = calibration_profile(profile_payload())
        calibration = Calibration(profile)
        self.assertEqual(len(calibration.rows), 36)
        profile['rows'][0]['dc_V_per_count'] = 2
        with self.assertRaises(ValueError):
            Calibration(profile)

    def test_duplicate_calibration_frame(self):
        payload = profile_payload()
        payload['standards'][1]['record_id'] = 1
        with self.assertRaises(ValueError):
            calibration_profile(payload)

    def test_calibrated_features_and_internal_path(self):
        calibration = Calibration(calibration_profile(profile_payload()))
        paths = {}
        for channel, amplitude in zip(('VA', 'VB', 'PROBE', 'VA_check'), (100, 80, 40, 100)):
            ids = list(range(len(paths) * 16 + 1, len(paths) * 16 + 17))
            paths[channel] = dict(real_counts=amplitude, imag_counts=0, dc_counts=0, residual_rms_counts=1,
                                  frame_count=16, frame_ids=ids)
        result = calibration.features(paths, 2000, 100, 16, 0, 'session')
        np.testing.assert_allclose(result['features'], [.4, 0, 0, .01, .8, 0], atol=1e-12)
        paths['VA_check']['real_counts'] = 120
        with self.assertRaises(ValueError):
            calibration.features(paths, 2000, 100, 16, 0, 'session')


class DiagnosisTests(unittest.TestCase):
    def setUp(self):
        self.job = job()
        self.calibration = Calibration(calibration_profile(profile_payload()))
        self.normal = solve(self.job['circuit']['components'])
        self.counter = [1]
        records = [record(i, 256, row, self.counter, self.calibration) for i, row in enumerate(self.normal)]
        self.reference = make_reference(self.job, self.calibration, records)

    def test_live_fault_and_fresh_confirmation(self):
        fault = solve(self.job['circuit']['components'], 1, .85)
        calls = []
        def reader(index, frames, role):
            calls.append((index, frames, role))
            return record(index, frames, fault[index], self.counter, self.calibration)
        result = diagnose(self.job, self.calibration, self.reference, reader)
        self.assertEqual(result['candidate_names'], ['R1:low'])
        self.assertTrue(result['fault_confirmed'])
        self.assertTrue(any(frames == 256 and role == 'confirmation' for _, frames, role in calls))
        self.assertFalse(result['NPU_executed'])

    def test_reference_frame_reuse(self):
        def reader(index, frames, role):
            value = copy.deepcopy(self.reference['records'][index])
            value['frames'] = frames
            value['frame_ids'] = value['frame_ids'][:frames * 4]
            return value
        with self.assertRaisesRegex(ValueError, '复用'):
            diagnose(self.job, self.calibration, self.reference, reader)

    def test_wrong_dut(self):
        changed = dict(self.job, dut_id='board-2')
        with self.assertRaises(ValueError):
            diagnose(changed, self.calibration, self.reference, lambda *_: None)

    def test_calibration_reference_mismatch(self):
        reference = copy.deepcopy(self.reference)
        reference['features'][0][0] += .1
        with self.assertRaises(ValueError):
            diagnose(self.job, self.calibration, reference, lambda *_: None)

    def test_action_geometry_includes_internal_vb(self):
        def resolve(net, probe):
            return dict(x=10, y=20, reference=net, pad_number='1')
        actions = model_actions(self.job, resolve)
        self.assertEqual(len(actions), 36)
        self.assertTrue(actions[0]['internal_vb_only'])
        self.assertEqual(set(actions[0]['motion_points']), {'left'})
        self.assertEqual(set(actions[6]['motion_points']), {'left', 'right'})


class AssetTests(unittest.TestCase):
    def test_owner_binding(self):
        package = types.ModuleType('_live_test_web')
        package.__path__ = [str(Path(__file__).parent / 'frontend/web/interface')]
        sys.modules[package.__name__] = package
        module = importlib.import_module(package.__name__ + '.closed_loop_measurements')
        with tempfile.TemporaryDirectory() as temporary:
            service = module.ClosedLoopMeasurements(temporary, None, None, None, None, None)
            profile = service.put_calibration('owner', profile_payload())
            self.assertEqual(service.asset('owner', 'cal', profile['calibration_id']), profile)
            self.assertEqual(service.catalog('other')['calibrations'], [])
            with self.assertRaises(ValueError):
                service.asset('other', 'cal', profile['calibration_id'])

    def test_capture_session_reaches_diagnosis(self):
        package = types.ModuleType('_capture_test_web')
        package.__path__ = [str(Path(__file__).parent / 'frontend/web/interface')]
        sys.modules[package.__name__] = package
        module = importlib.import_module(package.__name__ + '.closed_loop_measurements')
        calibration = Calibration(calibration_profile(profile_payload()))
        planned = job()
        planned.update(job_id='um_' + '1' * 32, analysis_mode='diagnosis', calibration=calibration.profile,
                       reference_label='suspected_fault', mechanical=dict(revision=1), gain_q11=32,
                       import_provenance=dict(layout_id='layout'), frames_per_path=16)
        planned['scope'].update(measurement_nets=['P', 'N1', 'OUT'], frequencies_hz=[2000, 5000, 10000, 20000, 50000, 100000], rs_nominal_ohm=[100, 10000])
        def resolve(net, probe):
            return dict(x={'P': 0, 'N1': 10, 'OUT': 20}[net], y=0, reference=net, pad_number='1')
        planned['actions'] = model_actions(planned, resolve)
        normal = solve(planned['circuit']['components'])
        fault = solve(planned['circuit']['components'], 1, .85)
        counter = [100000]
        planned['normal_reference'] = make_reference(planned, calibration, [record(i, 256, row, counter, calibration) for i, row in enumerate(normal)])
        class Clock:
            value = 0
            def monotonic(self):
                self.value += .05
                return self.value
            def sleep(self, seconds):
                self.value += seconds
        hardware = dict(record_id=0, mask=1, path='PROBE', generation=1, ftw=0, gain=0, enabled=False, tag=1, net='P')
        commands = []
        class Motor:
            def __init__(self, root):
                self.stop_file = root / 'stop'
            def start(self, action, context):
                target = context['points'].get('right')
                hardware['net'] = 'P' if target is None else 'N1' if target['x'] == 10 else 'OUT'
                return 'motion'
            def status(self):
                return dict(busy=False, last_job=dict(job_id='motion', state='completed'))
            def release_idle(self):
                pass
        class Servo:
            def __init__(self):
                self.positions = {1: 'up', 2: 'up'}
            def run(self, payload):
                if payload['action'] in ('up', 'down'):
                    for channel in (1, 2):
                        if payload['channel'] & channel:
                            self.positions[channel] = payload['action']
                return dict(revision=124, error_code=0, channels=[dict(channel=c, pending=False,
                            selected_position=self.positions[c], active_us=1000 if self.positions[c] == 'up' else 2000,
                            up_us=1000, down_us=2000) for c in (1, 2)])
            def prepare_cycle(self):
                pass
            def _motion_state(self, value, raised=False):
                if raised:
                    assert self.positions == {1: 'up', 2: 'up'}
        def query(command):
            commands.append(command)
            parts = command.split()
            if command == 'INFO':
                return dict(board_revision='LXB-R4-SENSE117', sense_protocol=1, adc_ready=True)
            if command == 'SENSE_CAPS':
                return dict(schema='fdw-probe-roles/1', role_masks=[1,4], hot_role_switch=False)
            if command == 'MODE_STATUS':
                return dict(mode=0, capture_active=False, output_enabled=False)
            if command == 'ADC_JOB_STATUS':
                return dict(state=0)
            if command == 'HALT':
                hardware['enabled'] = False
                return {}
            if parts[0] == 'DAC_SET':
                hardware.update(ftw=round(int(parts[1]) * 2**32 / 25000000), gain=int(parts[2]), frequency=int(parts[1]), tag=hardware['tag'] + 1)
                return {}
            if parts[0] == 'DAC_ENABLE':
                hardware['enabled'] = True
                return {}
            if command == 'DAC_STATUS':
                return dict(enabled=hardware['enabled'], frequency_word=hardware['ftw'], gain_q11=hardware['gain'], tag=hardware['tag'], offset_code=0, phase_word=0)
            if parts[0] == 'RELAY_SET':
                hardware['mask'] = int(parts[1])
                return dict(relay_mask=hardware['mask'])
            if parts[0] == 'SENSE_SELECT':
                base = hardware['mask'] & 47
                hardware.update(path=parts[1], generation=hardware['generation'] + 1,
                                mask=base | {'VA': 80, 'VB': 16, 'PROBE': 0}[parts[1]])
                return {}
            rs = 100 if hardware['mask'] & 32 else 10000
            if command == 'SENSE_STATUS':
                return dict(sense_protocol=1, generation=hardware['generation'], relay_mask=hardware['mask'],
                            selected={'VA': 1, 'VB': 2, 'PROBE': 3}[hardware['path']], rs_nominal_ohm=rs, settling=False, fault=0)
            if command == 'ADC_SENSE_STATUS':
                return dict(record_id=hardware['record_id'], sense_generation=hardware['generation'], relay_mask=hardware['mask'])
            raise AssertionError(command)
        def capture(log2, service):
            service()
            self.assertEqual(servo.positions[2], 'up' if hardware['net'] == 'P' else 'down')
            hardware['record_id'] += 1
            return dict(metadata=dict(record_id=hardware['record_id'], dac_tag=hardware['tag'], first_tick=hardware['record_id'] * 10000)), b'packet'
        class Processor:
            backend = 'cpu'
            device = None
            def process(self, frame, frequency, ratio):
                rs = 100 if hardware['mask'] & 32 else 10000
                index = ACTIONS.index((rs, hardware['net'], frequency))
                value = fault[index]
                phasor = 100 if hardware['path'] == 'VA' else complex(value[4], value[5]) * 100 if hardware['path'] == 'VB' else complex(value[0], value[1]) * 100
                return dict(real_counts=float(np.real(phasor)), imag_counts=float(np.imag(phasor)), dc_counts=0,
                            residual_rms_counts=0, record_id=frame['metadata']['record_id'], first_tick=frame['metadata']['first_tick'],
                            last_tick=frame['metadata']['first_tick'] + 8191, backend='cpu')
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            motor, servo = Motor(root), Servo()
            pcb = types.SimpleNamespace(store=types.SimpleNamespace(read=lambda: dict(revision=1)))
            service = module.ClosedLoopMeasurements(root, motor, servo, pcb, query, capture, processor=Processor(), feedback=lambda *_: True)
            folder = root / planned['job_id']
            folder.mkdir()
            (folder / 'job.json').write_text(json.dumps(planned), encoding='utf-8')
            (folder / 'status.json').write_text(json.dumps(dict(state='running')), encoding='utf-8')
            handle = (root / 'task.lock').open('a')
            with mock.patch.object(module, 'time', Clock()):
                service._run(folder, handle)
            report = json.loads((folder / 'report.json').read_text(encoding='utf-8'))
            self.assertEqual(report['state'], 'completed', report.get('error'))
            self.assertEqual(report['diagnosis']['candidate_names'], ['R1:low'])
            self.assertTrue((folder / 'measurement_bundle.zip').is_file())
            self.assertEqual(commands[-1], 'HALT')
            self.assertEqual(servo.positions, {1: 'up', 2: 'up'})
            self.assertTrue(handle.closed)


if __name__ == '__main__':
    unittest.main()
