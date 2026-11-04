import copy
import importlib.util
import io
from pathlib import Path
import tempfile
import types
import unittest
from unittest import mock

from test_pcb_import import pack,fixture
HAS_WEB=all(importlib.util.find_spec(m) is not None for m in ('flask','flask_socketio'))

@unittest.skipUnless(HAS_WEB,'Run in the existing board venv for Flask/kiutils')
class UploadTests(unittest.TestCase):
    def setUp(self):
        from interface import create_app,sio
        from interface import kicad
        self.app=create_app({'TESTING':True,'SECRET_KEY':'offline-upload-test'})
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.patch=mock.patch.object(kicad,'UPLOAD_FOLDER',self.tmp.name);self.patch.start();self.addCleanup(self.patch.stop)
        self.module=kicad;self.sio=sio
        self.client=self.app.test_client();self.client.get('/')
        self.busy=False
        self.app.extensions['motor_service']=types.SimpleNamespace(status=lambda:dict(busy=self.busy))
        self.socket=sio.test_client(self.app,flask_test_client=self.client)
        self.addCleanup(lambda:self.socket.disconnect() if self.socket.is_connected() else None)
        self.socket.get_received()
        with self.client.session_transaction() as session:self.user=session['user_id']
    def post(self,data=None,name='pcb.epro2'):
        return self.client.post('/kicad/process_files',data={'layout_file':(io.BytesIO(data if data is not None else pack(fixture())),name)},content_type='multipart/form-data')
    def test_one_project_without_schematic_publishes_expected_data(self):
        response=self.post();self.assertEqual(response.status_code,200,response.data)
        self.assertEqual(response.data,'文件已处理'.encode())
        self.assertEqual(len(self.module.pads_data[self.user]),1)
        self.assertAlmostEqual(self.module.dimensions_data[self.user]['width'],25.4)
        self.assertIsNone(self.module.schematics_data[self.user]['path'])
        events={e['name'] for e in self.socket.get_received()}
        self.assertTrue({'pads','nets','edges','dimensions','pcb_import_info'}.issubset(events))
    def test_second_browser_never_receives_another_users_design(self):
        other=self.app.test_client();other.get('/')
        socket=self.sio.test_client(self.app,flask_test_client=other)
        try:
            socket.get_received();self.post()
            self.assertEqual(socket.get_received(),[])
            self.assertTrue(self.socket.get_received())
        finally:socket.disconnect()
    def test_failed_parse_preserves_previous_design_session_and_events(self):
        self.post();self.socket.get_received()
        before=copy.deepcopy(self.module.dimensions_data[self.user])
        with self.client.session_transaction() as session:path=session['layout_filename']
        response=self.post(b'broken');self.assertEqual(response.status_code,400)
        self.assertEqual(self.module.dimensions_data[self.user],before)
        with self.client.session_transaction() as session:self.assertEqual(session['layout_filename'],path)
        self.assertEqual(self.socket.get_received(),[])
        self.assertEqual(list((Path(self.tmp.name)/self.user).glob('pending_*')),[])
    def test_parser_failure_on_first_import_cannot_publish_empty_design(self):
        self.assertEqual(self.post(b'broken').status_code,400)
        self.assertNotIn(self.user,self.module.pads_data)
    def test_cache_reload_restores_uploaded_project_without_usb(self):
        self.post();self.module.layouts_data.pop(self.user)
        self.module.pads_data.pop(self.user)
        self.socket.disconnect()
        self.socket=self.sio.test_client(self.app,flask_test_client=self.client)
        self.socket.emit('list_pads')
        self.assertEqual(len(self.module.pads_data[self.user]),1)
        self.assertTrue(any(e['name']=='pads' for e in self.socket.get_received()))
    def test_missing_and_unsupported_uploads_fail_cleanly(self):
        self.assertEqual(self.client.post('/kicad/process_files',data={}).status_code,400)
        self.assertEqual(self.post(b'x','file.net').status_code,400)
    def test_busy_motor_refuses_import_without_changing_design(self):
        self.busy=True
        self.assertEqual(self.post().status_code,409)
        self.assertNotIn(self.user,self.module.pads_data)
    def test_import_does_not_call_a_motor_operation(self):
        with mock.patch('subprocess.Popen',side_effect=AssertionError('must not start controller')):
            self.assertEqual(self.post().status_code,200)
    def test_native_project_rejects_unrelated_schematic(self):
        response=self.client.post('/kicad/process_files',data={'layout_file':(io.BytesIO(pack(fixture())),'b.epro2'),
              'schematics_file':(io.BytesIO(b'unrelated'),'old.kicad_sch')},content_type='multipart/form-data')
        self.assertEqual(response.status_code,400)

if __name__=='__main__':unittest.main()
