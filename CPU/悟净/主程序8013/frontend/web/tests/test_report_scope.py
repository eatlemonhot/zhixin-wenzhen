import ast
import csv
import importlib.util
import json
from pathlib import Path
import tempfile
import types
import unittest
from unittest import mock
import zipfile


WEB = Path(__file__).resolve().parents[1] / 'interface'
PACKAGE = '_report_scope_test'


def load_report():
    spec = importlib.util.spec_from_file_location(PACKAGE + '.unpowered_report', WEB/'unpowered_report.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class ReportScopeTests(unittest.TestCase):
    def report(self):
        paths = {name: dict(peak_counts=100, residual_rms_counts=1, frame_count=7)
                 for name in ('VA', 'VB', 'PROBE')}
        return dict(job_id='任务甲', state='completed', conditions=[
            dict(action_id=0, measurement_net='OUTPUT_Y', frequency_hz=3150, rs_nominal_ohm=330,
                 paths=paths, raw_transfer=dict(magnitude=.75, phase_degrees=-12),warnings=[])],
            frames_captured=21, elapsed_seconds=1,reference_label='unknown', limitations=[],
            scope=dict(excitation_net='INPUT_X',measurement_nets=['OUTPUT_Y'],
                       frequencies_hz=[3150],rs_nominal_ohm=[330]))

    def test_report_uses_recorded_networks_frames_and_frequencies(self):
        page = load_report().render_report(self.report())
        self.assertIn('激励网络：INPUT_X', page)
        self.assertIn('测量网络：OUTPUT_Y', page)
        self.assertIn('通路汇总帧数：7帧', page)
        self.assertIn('frequencyTicks', page)
        self.assertNotIn('DUT1', page)
        self.assertNotIn('TP_P', page)
        self.assertNotIn('每个通路16帧', page)
        self.assertNotIn('[2000,5000,10000,20000,50000,100000]', page)
        self.assertNotIn('0.909', page)

    def test_scope_is_escaped_and_missing_frames_are_not_invented(self):
        report = self.report()
        report['scope']['excitation_net'] = '<script>源</script>'
        report['conditions'] = []
        page = load_report().render_report(report)
        self.assertIn('&lt;script&gt;源&lt;/script&gt;', page)
        self.assertNotIn('<script>源</script>', page)
        self.assertIn('通路汇总帧数：未记录', page)
        self.assertNotIn('__SAMPLING__', page)

    def test_markdown_export_uses_the_same_job_scope(self):
        tree = ast.parse((WEB/'unpowered_measurements.py').read_text(encoding='utf-8'))
        cls = next(n for n in tree.body if isinstance(n,ast.ClassDef) and n.name=='UnpoweredMeasurements')
        export = next(n for n in cls.body if isinstance(n,ast.FunctionDef) and n.name=='_export')
        export.decorator_list = []
        namespace = dict(csv=csv, zipfile=zipfile,__package__=PACKAGE)
        exec(compile(ast.Module(body=[export],type_ignores=[]),str(WEB/'unpowered_measurements.py'),'exec'),namespace)
        renderer = load_report()
        package = types.ModuleType(PACKAGE)
        package.__path__ = [str(WEB)]
        with mock.patch.dict('sys.modules',{PACKAGE:package,PACKAGE+'.unpowered_report':renderer}):
            with tempfile.TemporaryDirectory() as folder:
                path = Path(folder)
                report = self.report()
                report['conditions'] = []
                job = dict(job_id=report['job_id'],actions=[],reference_label='unknown',scope=report['scope'])
                namespace['_export'](path,job,report)
                text = (path/'report.md').read_text(encoding='utf-8')
                self.assertIn('激励网络：INPUT_X；测量网络：OUTPUT_Y', text)
                self.assertNotIn('DUT1',text)
                self.assertNotIn('TP_P',text)


if __name__ == '__main__':
    unittest.main()
