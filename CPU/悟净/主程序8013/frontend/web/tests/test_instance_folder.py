import os
from pathlib import Path
import tempfile
import unittest
from unittest import mock


class ExternalInstanceTests(unittest.TestCase):
    def test_absolute_instance_keeps_jobs_and_alignment_in_external_runtime(self):
        from interface import create_app
        with tempfile.TemporaryDirectory() as temporary:
            runtime = Path(temporary) / 'outside-package' / 'instance'
            offline_motor = Path(temporary) / 'nonexistent-offline-motor'
            with mock.patch.dict(os.environ, {'FDW_INSTANCE_FOLDER': str(runtime),
                                             'WUJING_MOTOR_ROOT': str(offline_motor)}):
                with mock.patch('subprocess.Popen', side_effect=AssertionError('hardware forbidden')):
                    app = create_app({'TESTING': True, 'SECRET_KEY': 'isolated-runtime-test'})
                    service = app.extensions['motor_service']
                    self.assertEqual(Path(app.instance_path), runtime)
                    self.assertEqual(service.runtime, runtime / 'motor_jobs')
                    self.assertEqual(service.root, offline_motor)
                    store = app.extensions['pcb_control'].store
                    self.assertEqual(store.path, runtime / 'pcb_alignment.json')
                    store.save_offsets({'left': {'x': 1, 'y': 2},
                                        'right': {'x': 0, 'y': 0}}, revision=0)
                    self.assertTrue((runtime / 'pcb_alignment.json').is_file())
                    self.assertEqual(store.read()['offsets']['left'], {'x': 1, 'y': 2})
                    client = app.test_client()
                    client.get('/')
                    state = client.get('/motor/status').get_json()
                    self.assertFalse(state['available'])
                    self.assertFalse(state['motion_enabled'])
                    self.assertFalse(offline_motor.exists())

    def test_relative_and_empty_instance_override_are_rejected_explicitly(self):
        from interface import create_app
        for value in ('', 'runtime/instance', './runtime/instance'):
            with self.subTest(path=value), mock.patch.dict(os.environ, {'FDW_INSTANCE_FOLDER': value}):
                with self.assertRaisesRegex(ValueError, 'FDW_INSTANCE_FOLDER.*绝对路径'):
                    create_app({'TESTING': True})


if __name__ == '__main__':
    unittest.main()
