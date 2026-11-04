import copy
from interface.file_lock import fcntl
import io
import json
import math
import struct
import tempfile
import types
import unittest
from pathlib import Path
from unittest import mock
from test_pcb_import import fixture, pack, row
from pcb_import import load_bytes


def assembly(board, dx=0, angle=0, sign=1, ref='R1'):
    c=board['components'][0];ox,oy=board['dimensions']['origin']
    x=c['x']+ox+dx;y=-c['y']-oy
    a=math.radians(angle)
    return ("""ISO-10303-21;
HEADER;FILE_DESCRIPTION(('fixture; name #999'),'2;1');ENDSEC;DATA;
#1=PRODUCT('Root; test #999','Root','',());
#2=PRODUCT_DEFINITION_FORMATION('','',#1);#3=PRODUCT_DEFINITION('','',#2,#999);
#4=PRODUCT('Board~test','Board','',());#5=PRODUCT_DEFINITION_FORMATION('','',#4);#6=PRODUCT_DEFINITION('','',#5,#999);
#7=PRODUCT('%s~part','part','',());#8=PRODUCT_DEFINITION_FORMATION('','',#7);#9=PRODUCT_DEFINITION('','',#8,#999);
#20=AXIS2_PLACEMENT_3D('',#21,#22,#23);#21=CARTESIAN_POINT('',(0.,0.,0.));#22=DIRECTION('',(0.,0.,1.));#23=DIRECTION('',(1.,0.,0.));
#24=AXIS2_PLACEMENT_3D('',#25,#26,#27);#25=CARTESIAN_POINT('',(%.10f,%.10f,1.6));#26=DIRECTION('',(0.,0.,%d.));#27=DIRECTION('',(%.12f,%.12f,0.));
#31=(LENGTH_UNIT() NAMED_UNIT(*) SI_UNIT(.MILLI.,.METRE.));
#40=NEXT_ASSEMBLY_USAGE_OCCURRENCE('1','','',#3,#6,$);#41=PRODUCT_DEFINITION_SHAPE('','',#40);#42=ITEM_DEFINED_TRANSFORMATION('','',#20,#20);
#43=(REPRESENTATION_RELATIONSHIP('','',#50,#51) REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION(#42) SHAPE_REPRESENTATION_RELATIONSHIP());#44=CONTEXT_DEPENDENT_SHAPE_REPRESENTATION(#43,#41);
#45=NEXT_ASSEMBLY_USAGE_OCCURRENCE('2','','',#3,#9,$);#46=PRODUCT_DEFINITION_SHAPE('','',#45);#47=ITEM_DEFINED_TRANSFORMATION('','',#20,#24);
#48=(REPRESENTATION_RELATIONSHIP('','',#52,#51) REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION(#47) SHAPE_REPRESENTATION_RELATIONSHIP());#49=CONTEXT_DEPENDENT_SHAPE_REPRESENTATION(#48,#46);
ENDSEC;END-ISO-10303-21;
"""%(ref,x,y,sign,math.cos(a),math.sin(a))).encode()


def mesh(board):
    d=board['dimensions'];c=board['components'][0];parts=[];chunks=[];offset=0
    for ref,kind,points in [('Board','board',[[0,0,0],[d['width'],0,1.6],[0,d['height'],1.6]]),
                            ('R1','component',[[c['x'],c['y'],1.6],[c['x']+.5,c['y'],2],[c['x'],c['y']+.5,2]])]:
        part=dict(reference=ref,kind=kind,name=ref,colors=[[.5,.5,.5]],groups=[dict(start=0,count=3,material=0)],
                  bounds={label:[fun(p[i] for p in points) for i in range(3)] for label,fun in [('min',min),('max',max)]})
        for field,values,fmt,typ in [('position',[n for p in points for n in p],'f','f32'),('normal',[0,0,1]*3,'f','f32'),('index',[0,1,2],'I','u32')]:
            binary=struct.pack('<'+fmt*len(values),*values);part[field]=dict(offset=offset,count=len(values),type=typ);chunks.append(binary);offset+=len(binary)
        parts.append(part)
    return dict(schema='circuitscout.step-mesh/v1',layout_id=d['layout_id'],units='mm',coordinate_frame='unrotated_pcb_mm_z_from_board_bottom',
                source_origin_mm=d['origin'],width_mm=d['width'],height_mm=d['height'],binary_bytes=offset,parts=parts),b''.join(chunks)


class StepUploadTests(unittest.TestCase):
    def setUp(self):
        from interface import create_app,kicad,sio
        self.kicad=kicad;self.app=create_app({'TESTING':True,'SECRET_KEY':'joint-test'});self.client=self.app.test_client();self.client.get('/')
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        patch=mock.patch.object(kicad,'UPLOAD_FOLDER',self.tmp.name);patch.start();self.addCleanup(patch.stop)
        self.service=types.SimpleNamespace(status=mock.Mock(return_value=dict(busy=False)),start=mock.Mock(side_effect=AssertionError('no hardware')))
        self.app.extensions['motor_service']=self.service
        self.socket=sio.test_client(self.app,flask_test_client=self.client);self.socket.get_received()
        self.addCleanup(lambda:self.socket.disconnect() if self.socket.is_connected() else None)
        self.headers={'X-Requested-With':'XMLHttpRequest','Origin':'http://localhost'}
        self.project=pack(fixture());self.board=load_bytes(self.project,'fixture.epro2');self.model,self.binary=mesh(self.board)
        with self.client.session_transaction() as session:self.user=session['user_id']
    def upload(self,step=None,model=None,binary=None,project=None,client=None):
        data={'layout_file':(io.BytesIO(project or self.project),'board.epro2'),
              'step_file':(io.BytesIO(step if step is not None else assembly(self.board)),'board.step'),
              'step_manifest':(io.BytesIO(json.dumps(model if model is not None else self.model).encode()),'model.json'),
              'step_mesh':(io.BytesIO(binary if binary is not None else self.binary),'meshes.bin')}
        return (client or self.client).post('/kicad/process_files',data=data,headers=self.headers)
    def plain(self,project=None):
        return self.client.post('/kicad/process_files',data={'layout_file':(io.BytesIO(project or self.project),'b.epro2')})
    def snapshot(self):
        with self.client.session_transaction() as session:s=dict(session)
        return s,self.client.get('/workbench/design').get_json()
    def assert_old(self,before):
        self.assertEqual(self.snapshot(),before)
        self.assertEqual(list((Path(self.tmp.name)/self.user).glob('pending_*')),[])
    def test_inspection_returns_candidates_without_publishing_or_sending_events(self):
        r=self.client.post('/kicad/inspect_project',data={'layout_file':(io.BytesIO(self.project),'b.epro2')},headers=self.headers)
        self.assertEqual(r.status_code,200);self.assertEqual(r.get_json()['dimensions'],self.board['dimensions'])
        self.assertFalse(self.client.get('/workbench/design').get_json()['loaded']);self.assertEqual(self.socket.get_received(),[])
    def test_joint_success_saves_source_and_private_model_with_server_hashes(self):
        r=self.upload();self.assertEqual(r.status_code,200,r.data)
        design=self.client.get('/workbench/design').get_json();entry=design['step_model'];self.assertEqual(entry['component_count'],1)
        response=self.client.get(entry['manifest_url']);m=response.get_json();response.close()
        self.assertEqual(len(m['source_sha256']),64);self.assertEqual(len(m['binary_sha256']),64)
        self.assertEqual(m['alignment']['checked_components'],1)
        response=self.client.get(entry['manifest_url'].replace('model.json','meshes.bin'));self.assertEqual(response.data,self.binary);response.close()
    def test_identical_project_without_step_reuses_saved_binding(self):
        self.assertEqual(self.upload().status_code,200);before=self.client.get('/workbench/design').get_json()['step_model']
        self.assertEqual(self.plain().status_code,200);after=self.client.get('/workbench/design').get_json()['step_model'];self.assertEqual(before,after)
        response=self.client.get(after['manifest_url']);self.assertEqual(response.status_code,200);response.close()
    def test_different_project_without_step_clears_old_binding_and_access(self):
        self.upload();entry=self.client.get('/workbench/design').get_json()['step_model']
        self.plain(pack(fixture(angle=90)));self.assertIsNone(self.client.get('/workbench/design').get_json()['step_model'])
        self.assertEqual(self.client.get(entry['manifest_url']).status_code,404)
    def test_cache_reload_restores_model_and_project_without_usb(self):
        self.upload();self.kicad.layouts_data.pop(self.user);self.kicad.pads_data.pop(self.user)
        design=self.client.get('/workbench/design').get_json();self.assertEqual(design['step_model']['component_count'],1)
        response=self.client.get(design['step_model']['manifest_url']);self.assertEqual(response.status_code,200);response.close()
    def test_another_browser_cannot_fetch_private_models(self):
        self.upload();url=self.client.get('/workbench/design').get_json()['step_model']['manifest_url'];other=self.app.test_client();other.get('/')
        self.assertEqual(other.get(url).status_code,404);self.assertEqual(other.get(url.replace('model.json','meshes.bin')).status_code,404)
        self.assertEqual(self.client.get(url.replace('model.json','source.step')).status_code,404)
        generation=url.split('/')[-2]
        for suffix in [generation+'/step/model.json',generation+'/step/meshes.bin',generation+'/step/source.step','step_bindings.json']:
            self.assertEqual(other.get('/static/uploads/'+self.user+'/'+suffix).status_code,404)
    def test_replacing_step_for_same_project_changes_model_revision(self):
        self.upload();a=self.client.get('/workbench/design').get_json()['step_model']
        self.upload(step=assembly(self.board)+b'\n');b=self.client.get('/workbench/design').get_json()['step_model']
        self.assertNotEqual(a['manifest_url'],b['manifest_url']);self.assertNotEqual(a['source_sha256'],b['source_sha256'])
    def test_same_names_and_board_size_do_not_hide_position_angle_or_side_mismatch(self):
        self.plain();before=self.snapshot()
        for kwargs in [dict(dx=1),dict(angle=90),dict(sign=-1),dict(ref='R2')]:
            with self.subTest(kwargs=kwargs):
                r=self.upload(step=assembly(self.board,**kwargs));self.assertEqual(r.status_code,400,r.data);self.assert_old(before)
    def test_old_step_is_refused_for_changed_layout_even_with_same_references_and_dimensions(self):
        self.plain();before=self.snapshot();changed=pack(fixture()+[row('COMPONENT','c',dict(layerId=1,x=600,y=-300,angle=0),ticket=2)])
        new=load_bytes(changed,'new.epro2');m,b=mesh(new)
        r=self.upload(project=changed,model=m,binary=b);self.assertEqual(r.status_code,400);self.assert_old(before)
    def test_changed_footprint_is_refused_even_when_positions_and_board_size_match(self):
        self.plain();before=self.snapshot();lines=fixture();lines.insert(1,row('META','META',dict(title='DifferentPackage')))
        changed=pack(lines);m,b=mesh(load_bytes(changed,'changed.epro2'))
        r=self.upload(project=changed,model=m,binary=b);self.assertEqual(r.status_code,400);self.assertIn('封装',r.data.decode());self.assert_old(before)
    def test_raw_step_header_units_and_unterminated_records_are_checked(self):
        self.plain();before=self.snapshot();good=assembly(self.board)
        for data in [b'broken',good.replace(b'.MILLI.',b'$'),good.replace(b'#25=CARTESIAN_POINT',b'#25=BROKEN')]:
            r=self.upload(step=data);self.assertEqual(r.status_code,400,r.data);self.assert_old(before)
    def test_invalid_mesh_buffers_indices_normals_bounds_and_json_are_rejected(self):
        self.plain();before=self.snapshot()
        for field,change in [('position',lambda m:m['parts'][0]['position'].update(offset=1)),('bounds',lambda m:m['parts'][0]['bounds']['max'].__setitem__(0,999))]:
            m=copy.deepcopy(self.model);change(m);self.assertEqual(self.upload(model=m).status_code,400,field);self.assert_old(before)
        for data in [self.binary[:-4],struct.pack('<f',float('nan'))+self.binary[4:]]:
            self.assertEqual(self.upload(binary=data).status_code,400);self.assert_old(before)
        bad=bytearray(self.binary);struct.pack_into('<I',bad,self.model['parts'][0]['index']['offset'],999)
        self.assertEqual(self.upload(binary=bytes(bad)).status_code,400);self.assert_old(before)
        for model in [[],dict(self.model,parts=[None,None])]:
            self.assertEqual(self.upload(model=model).status_code,400);self.assert_old(before)
    def test_missing_converted_file_does_not_publish(self):
        data={'layout_file':(io.BytesIO(self.project),'b.epro2'),'step_manifest':(io.BytesIO(b'{}'),'model.json')}
        self.assertEqual(self.client.post('/kicad/process_files',data=data,headers=self.headers).status_code,400)
        self.assertFalse(self.client.get('/workbench/design').get_json()['loaded'])
    def test_cross_origin_inspection_and_commit_are_rejected(self):
        r=self.client.post('/kicad/inspect_project',data={},headers=dict(self.headers,Origin='http://other'));self.assertEqual(r.status_code,403)
        r=self.client.post('/kicad/process_files',data={},headers=dict(self.headers,Origin='http://other'));self.assertEqual(r.status_code,403)
    def test_file_size_limit_leaves_no_candidate_design(self):
        self.plain();before=self.snapshot()
        with mock.patch.object(self.kicad,'MAX_STEP_BYTES',16):self.assertEqual(self.upload().status_code,400)
        self.assert_old(before)
    def test_motor_starting_during_validation_prevents_commit(self):
        self.plain();before=self.snapshot();self.service.status.side_effect=[dict(busy=False),dict(busy=True)]
        r=self.upload();self.assertEqual(r.status_code,409);self.service.status.side_effect=None;self.assert_old(before)
    def test_existing_task_file_lock_prevents_commit_without_usb_access(self):
        self.service.runtime=Path(self.tmp.name)/'jobs';self.service.runtime.mkdir()
        with (self.service.runtime/'active.lock').open('a') as handle:
            fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB);self.assertEqual(self.upload().status_code,409)
        self.assertFalse(self.client.get('/workbench/design').get_json()['loaded'])
    def test_index_write_failure_preserves_previous_design_and_binding(self):
        self.upload();before=self.snapshot()
        with mock.patch.object(self.kicad.os,'replace',side_effect=OSError('disk full')):self.assertEqual(self.upload().status_code,400)
        self.assert_old(before);self.assertEqual(list((Path(self.tmp.name)/self.user).glob('step_bindings_*.tmp')),[])
    def test_disconnected_socket_still_leaves_a_successful_http_import(self):
        with mock.patch.object(self.kicad,'emit_owned',side_effect=OSError('socket gone')):self.assertEqual(self.upload().status_code,200)
        self.assertTrue(self.client.get('/workbench/design').get_json()['loaded'])
    def test_conversion_upload_never_starts_a_subprocess_or_motor_task(self):
        with mock.patch('subprocess.Popen',side_effect=AssertionError('no subprocess')):self.assertEqual(self.upload().status_code,200)
        self.service.start.assert_not_called()


if __name__=='__main__':unittest.main()
