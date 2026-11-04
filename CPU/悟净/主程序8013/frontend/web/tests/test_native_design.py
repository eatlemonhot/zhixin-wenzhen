import copy
import io
import json
from pathlib import Path
import sys
import unittest
from unittest import mock

import test_design_package as legacy
from interface import kicad
from interface.native_design import analyze_native
from interface.pcb_import import load_bytes, load_pcb
from interface.pcb_import.attributes import merge


class NativeParameterTests(unittest.TestCase):
    def setUp(self):
        self.raw = legacy.files()['project.epro2']
        self.board = load_bytes(self.raw, 'one.epro2')

    def analyze(self):
        return analyze_native(self.board, 'one.epro2')

    def test_native_connections_and_si_values_without_companions(self):
        data = self.analyze()
        self.assertTrue(data['report']['diagnostic_ready'])
        self.assertEqual(data['source_mode'], 'native_epro2')
        self.assertFalse(data['report']['independent_netlist_checked'])
        self.assertEqual(data['report']['checked_pins'], 4)
        parts = {p['ref']: p for p in data['components']}
        self.assertEqual(parts['R1']['pins'], {'1': 'IN', '2': 'OUT'})
        self.assertEqual(parts['R1']['nominal']['value'], 1000)
        self.assertAlmostEqual(parts['C1']['nominal']['value'], 4.7e-9)
        self.assertNotIn('netlist', data['source_files'])
        self.assertNotIn('bom', data['source_files'])

    def test_attribute_references_are_bounded_text_not_executed(self):
        self.assertEqual(merge({'Value': '10K', 'Name': '={Value}'} )['Name'], '10K')
        self.assertEqual(merge({'A': '={B}', 'B': '={A}'})['A'], '')
        self.assertEqual(merge({'A': '={missing}'})['A'], '')
        self.assertEqual(merge({'A': "__import__('os').system('false')"})['A'], "__import__('os').system('false')")
        self.assertEqual(merge({'Value': '10K'}, {'Value': None})['Value'], '10K')
        self.assertEqual(merge({'Value': '10K'}, {'Value': ''})['Value'], '')

    def test_unknown_capacitor_value_is_retained_but_not_guessed(self):
        for c in self.board['components'] + self.board['schematic']['components']:
            if c['reference'] == 'C1':
                c.update(value='104', attributes={'Value': '104'})
        data = self.analyze()
        self.assertFalse(data['report']['diagnostic_ready'])
        self.assertIn('C1', data['report']['missing_nominal_values'])
        self.assertIsNone(next(p for p in data['bom'] if p['reference'] == 'C1')['nominal'])

    def test_conflicting_pcb_schematic_values_block_diagnosis_without_erasing_geometry(self):
        self.board['components'][1].update(value='47nF', attributes={'Value': '47nF'})
        data = self.analyze()
        self.assertFalse(data['report']['diagnostic_ready'])
        self.assertTrue(any('C1' in s for s in data['report']['blocking_issues']))
        self.assertEqual(len(self.board['pads']), 4)

    def test_unlinked_schematic_and_duplicate_reference_are_explicit(self):
        self.board['schematic']['components'][0]['pcb_component_id'] = None
        self.assertFalse(self.analyze()['report']['diagnostic_ready'])
        self.board['components'].append(copy.deepcopy(self.board['components'][0]))
        self.assertTrue(any('重复' in s for s in self.analyze()['report']['blocking_issues']))

    def test_inconsistent_same_number_pads_never_become_a_valid_netlist(self):
        pad = copy.deepcopy(next(iter(self.board['pads'].values())))
        pad['net'] = 'OTHER'
        self.board['pads']['duplicate'] = pad
        self.assertFalse(self.analyze()['report']['diagnostic_ready'])

    def test_no_connectivity_is_not_a_diagnostic_ready_board(self):
        for p in self.board['pads'].values(): p['net'] = ''
        self.assertFalse(self.analyze()['report']['diagnostic_ready'])

    def test_invalid_tolerance_retains_preview_and_marks_issue(self):
        self.board['components'][0]['attributes']['Tolerance'] = 'unknown'
        data = self.analyze()
        self.assertFalse(data['report']['diagnostic_ready'])
        self.assertIn('工程容差无法解析：R1', data['report']['blocking_issues'])

    def test_missing_tolerance_is_not_filled_with_one_percent(self):
        data = self.analyze()
        self.assertIsNone(next(c for c in data['bom'] if c['reference'] == 'C1')['tolerance_relative'])
        self.assertIn('C1', data['report']['missing_tolerances'])

    def test_actual_ldo_sample_extracts_library_and_instance_properties(self):
        sample = Path('/home/lemon/something/lceda_project/ProPrj_ldo大招_2026-10-23.epro2')
        if not sample.is_file():
            sample = Path(__file__).resolve().parent / 'fixtures/native_ldo.epro2'
        self.assertTrue(sample.is_file(), 'Native project fixture required')
        board = load_pcb(sample)
        data = analyze_native(board, sample.name)
        self.assertEqual(len(board['components']), 72)
        self.assertEqual(len(board['pads']), 235)
        self.assertEqual(len(data['nets']), 25)
        self.assertEqual(len(board['schematic']['pages']), 1)
        self.assertTrue(data['report']['diagnostic_ready'])
        values = {c['reference']: c for c in data['bom']}
        self.assertAlmostEqual(values['C1']['nominal']['value'], 10e-6)
        self.assertEqual(values['R1']['nominal']['value'], 10000)
        self.assertEqual(values['C9']['part_number'], 'ERG25V220M6X11')
        self.assertEqual(values['C9']['tolerance_relative'], .2)
        self.assertEqual(values['U2']['part_number'], 'TPS5430DDAR')


class NativeHTTPTests(unittest.TestCase):
    def setUp(self):
        legacy.HTTPTests.setUp(self)
        import threading
        self.service._lock = threading.RLock()
    state = legacy.HTTPTests.state
    payload = legacy.HTTPTests.payload
    postjob = legacy.HTTPTests.postjob

    def upload_native(self, raw=None):
        return self.client.post('/kicad/process_files', data={'layout_file': (io.BytesIO(raw or self.contents['project.epro2']), 'board.epro2')}, headers=self.headers)

    def test_only_epro2_upload_and_reload_restore_circuit_and_schematic(self):
        with mock.patch('subprocess.Popen', side_effect=AssertionError('no hardware')):
            self.assertEqual(self.upload_native().status_code, 200)
            before = self.state()
            self.assertTrue(before['complete'])
            self.assertTrue(before['data']['report']['diagnostic_ready'])
            with self.client.session_transaction() as session: user = session['user_id']
            with kicad.cache_lock:
                for cache in (kicad.layouts_data,kicad.schematics_data,kicad.nets_data,kicad.edges_data,kicad.pads_data,kicad.dimensions_data,kicad.import_info_data): cache.pop(user, None)
            self.assertEqual(self.state(), before)
            design = self.client.get('/workbench/design').get_json()
            self.assertEqual(len(design['schematic']['pages']), 1)
            self.assertEqual(len(design['pads']), 4)
        self.service.start.assert_not_called()

    def test_electrical_conflict_can_preview_but_both_planning_endpoints_refuse(self):
        raw = self.contents['project.epro2']
        import zipfile
        stream = io.BytesIO()
        with zipfile.ZipFile(io.BytesIO(raw)) as original, zipfile.ZipFile(stream, 'w') as archive:
            for item in original.infolist():
                data = original.read(item)
                if item.filename.endswith('.epru'):
                    data = data.replace(b'4.7nF', b'unknown')
                archive.writestr(item, data)
        self.assertEqual(self.upload_native(stream.getvalue()).status_code, 200)
        self.assertTrue(self.state()['complete'])
        self.assertFalse(self.state()['data']['report']['diagnostic_ready'])
        self.assertEqual(self.postjob().status_code, 422)
        self.assertEqual(self.client.post('/diagnosis/plan', json=self.payload(), headers=self.headers).status_code, 422)
        self.assertTrue(self.client.get('/workbench/design').get_json()['loaded'])
        self.service.start.assert_not_called()

    def test_native_import_keeps_motor_mode_offline_and_no_task(self):
        self.assertEqual(self.upload_native().status_code, 200)
        with self.client.session_transaction() as session:
            self.assertFalse(session.get('motion_enabled', False))
        self.service.start.assert_not_called()

    def test_bad_origin_and_corrupt_epro2_preserve_prior_design(self):
        self.upload_native()
        before = self.state()
        response = self.client.post('/kicad/process_files', data={'layout_file': (io.BytesIO(self.contents['project.epro2']), 'x.epro2')}, headers=dict(self.headers, Origin='http://bad.invalid'))
        self.assertEqual(response.status_code, 403)
        self.assertEqual(self.upload_native(b'corrupt').status_code, 400)
        self.assertEqual(self.state(), before)

    def test_offline_pcb_point_preview_still_works_after_native_import(self):
        self.upload_native()
        design = self.client.get('/workbench/design').get_json()
        pad = next(iter(design['pads']))
        response = self.client.post('/workbench/plan', json=dict(layout_id=design['layout_id'], orientation=0,
                                    pairs=[dict(id='one', left=pad, right=None)]), headers=self.headers)
        self.assertEqual(response.status_code, 200, response.data)
        self.assertFalse(response.get_json()['execution']['executable'])
        self.service.start.assert_not_called()


if __name__ == '__main__': unittest.main()
