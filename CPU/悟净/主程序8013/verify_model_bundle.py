from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parent
rows=[]
for family in ('A','B','NE'):
    source=ROOT/'ai/models'/family/'ranker_npu.onnx'
    folder=ROOT/'compiled'/family
    report=json.loads((folder/'report.json').read_text(encoding='utf-8'))
    graph_path=next((folder/'generated').glob('*.json'))
    graph=json.loads(graph_path.read_text(encoding='utf-8'))
    ops=[op for op in graph['ops'] if op['_type_key'] not in ('icraft::xir::Input','icraft::xir::Output')]
    assert ops and all(op['_type_key']=='icraft::xir::HardOp' and op.get('compile_target')=='@zhuget(330)' for op in ops)
    assert graph_path.with_suffix('.raw').is_file()
    assert hashlib.sha256(source.read_bytes()).hexdigest()==report['source_sha256']
    assert report['completed'] and all(row['exit']==0 for row in report['stages'])
    rows.append(dict(family=family,source_sha256=report['source_sha256'],compiled_json=graph_path.relative_to(ROOT).as_posix(),compute_ops=len(ops),all_compute_ZG330=True))
result=dict(passed=True,rows=rows,NPU_executed=False,scope='Static model and five-stage compile provenance only; new B model needs board numerical qualification')
(ROOT/'MODEL_BUNDLE_CHECK.json').write_text(json.dumps(result,indent=2),encoding='utf-8');print(json.dumps(result,indent=2))
