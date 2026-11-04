import argparse,hashlib,io,json,sys,tempfile,types,zipfile
from pathlib import Path
from unittest import mock
ROOT=Path(__file__).resolve().parents[1]
for path in (ROOT/'.deps',ROOT/'web'):sys.path.insert(0,str(path))

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--source-dir',required=True);parser.add_argument('--out',required=True);args=parser.parse_args()
    source=Path(args.source_dir).resolve();out=Path(args.out).resolve();out.mkdir(parents=True,exist_ok=True)
    files={}
    for key,suffixes in dict(layout_file=['.epro2'],netlist_file=['.net'],bom_file=['.xlsx','.csv']).items():
        candidates=[p for p in source.iterdir() if p.is_file() and p.suffix.lower() in suffixes and not p.name.startswith('~$')]
        if len(candidates)!=1:raise ValueError('Need exactly one file for '+key)
        p=candidates[0];files[key]=(p,p.read_bytes())
    hashes={p.name:hashlib.sha256(raw).hexdigest() for p,raw in files.values()}
    from interface import create_app,kicad
    tmp_root=ROOT/'.test_tmp';tmp_root.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(dir=str(tmp_root)) as temp,mock.patch.object(kicad,'UPLOAD_FOLDER',temp),mock.patch('subprocess.Popen',side_effect=AssertionError('No processes permitted')):
        app=create_app({'TESTING':True,'SECRET_KEY':'actual-design-offline-check'})
        backend=types.SimpleNamespace(root=Path(temp)/'disabled',status=lambda:dict(busy=False,ready=False,available=False,stopped=False),start=mock.Mock(side_effect=AssertionError('No hardware permitted')))
        app.extensions['motor_service']=backend;client=app.test_client();client.get('/')
        headers={'X-Requested-With':'XMLHttpRequest','Origin':'http://localhost'}
        payload={key:(io.BytesIO(raw),p.name) for key,(p,raw) in files.items()};payload['import_mode']='diagnostic'
        response=client.post('/kicad/process_files',data=payload,headers=headers)
        if response.status_code!=200:raise RuntimeError(response.get_data(as_text=True))
        state=client.get('/design-package/status').get_json();data=state['data']
        request=dict(layout_id=state['layout_id'],ground_net='GND',excitation_net='TP_P',power_mode='powered',rails={'+5V':5,'-5V':-5},max_input_peak_V=.1)
        response=client.post('/design-package/job',json=request,headers=headers)
        if response.status_code!=200:raise RuntimeError(response.get_data(as_text=True))
        job=response.get_json();assert job['execution']['mode']=='plan_only'
        (out/'job.json').write_text(json.dumps(job,ensure_ascii=False,indent=2)+'\n',encoding='utf8')
        stream=io.BytesIO()
        with zipfile.ZipFile(stream,'w',zipfile.ZIP_DEFLATED) as z:
            for p,raw in files.values():z.writestr('dut1/'+p.name,raw)
            z.writestr('dut1/~$BOM_Board1_PCB1_2026-10-26.xlsx',b'')
        response=client.post('/kicad/process_files',data=dict(layout_file=(io.BytesIO(stream.getvalue()),'dut1.zip'),import_mode='diagnostic'),headers=headers)
        assert response.status_code==200,response.get_data(as_text=True)
        second=client.get('/design-package/status').get_json();assert second['data']['components']==data['components']
        backend.start.assert_not_called()
    report=dict(passed=True,individual_import=True,zip_import_including_excel_lock_file=True,job_export=True,report=data['report'],source_hashes=hashes,source_files_unchanged=all(hashlib.sha256(p.read_bytes()).hexdigest()==hashes[p.name] for p,_ in files.values()),U1=next(c for c in data['components'] if c['ref']=='U1')['part_number'],hardware_executed=False,NPU_executed=False,diagnosis_executed=False)
    (out/'report.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf8')
    print(json.dumps(report,ensure_ascii=False))

if __name__=='__main__':main()
