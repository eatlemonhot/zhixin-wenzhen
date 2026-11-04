import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock

from test_live_diagnosis import profile_payload

sys.path.insert(0, str(Path(__file__).parent / 'frontend/web'))


class ClosedLoopHTTPTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        with mock.patch.dict(os.environ, {'FDW_INSTANCE_FOLDER': self.directory.name}):
            from interface import create_app
            self.app = create_app(dict(TESTING=True, SECRET_KEY='test'))
        self.client = self.app.test_client()
        self.assertEqual(self.client.get('/').status_code, 200)
        self.headers = {'X-Requested-With': 'XMLHttpRequest'}

    def test_calibration_import_and_catalog(self):
        response = self.client.post('/diagnosis/unpowered/calibration', json=profile_payload(), headers=self.headers)
        self.assertEqual(response.status_code, 201, response.json)
        identity = response.json['calibration_id']
        assets = self.client.get('/diagnosis/unpowered/assets')
        self.assertEqual(assets.json['calibrations'][0]['calibration_id'], identity)
        other = self.app.test_client()
        other.get('/')
        self.assertEqual(other.get('/diagnosis/unpowered/assets').json['calibrations'], [])
        self.assertEqual(other.post('/diagnosis/unpowered/calibration', json=profile_payload(), headers=self.headers).status_code, 201)

    def test_cross_origin_calibration_is_rejected(self):
        headers = dict(self.headers, Origin='http://example.invalid')
        response = self.client.post('/diagnosis/unpowered/calibration', json=profile_payload(), headers=headers)
        self.assertEqual(response.status_code, 403)

    def test_live_entry_and_controls_are_registered(self):
        response = self.client.get('/diagnosis/unpowered/model/info')
        self.assertTrue(response.json['hardware_fault_diagnosis_available'])
        page = self.client.get('/').get_data(as_text=True)
        self.assertIn('id="job-analysis-mode"', page)
        self.assertIn('id="job-calibration"', page)
        self.assertIn('id="job-normal-reference"', page)


if __name__ == '__main__':
    unittest.main()
