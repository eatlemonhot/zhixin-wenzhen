#!/usr/bin/env python3
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--node',default='node')
    parser.add_argument('--include-diagnosis',action='store_true',help='需要另行保留原诊断AI模型、训练数据和PL配套模块')
    args=parser.parse_args()
    logdir=ROOT/'runtime/checks'
    logdir.mkdir(parents=True,exist_ok=True)
    os.environ['FDW_AUTO_INITIALIZE']='0'
    os.environ['PYTHONDONTWRITEBYTECODE']='1'
    checks=[('system_shared',ROOT.parent,[sys.executable,'-B','-m','unittest','test_probe_assignment','test_status_atomic','test_staged_acquisition']),('web_python',ROOT/'web',[sys.executable,'-B','-m','unittest','discover','-s','tests','-p','test_*.py']),
            ('root_web',ROOT/'web',[sys.executable,'-B','-m','unittest','test_project_c_web','-v']),
            ('controller',ROOT,[sys.executable,'-B','-m','unittest','discover','-s','verification/controller_tests','-v']),
            ('sdk',ROOT,[sys.executable,'-B','-W','error::ResourceWarning','-m','unittest','discover','-s','sdk/tests','-v']),
            ('startup_tools',ROOT,[sys.executable,'-B','-m','unittest','discover','-s','verification','-p','test_startup_tools.py','-v']),
            ('offline_smoke',ROOT,[sys.executable,'-B','scripts/smoke_offline.py'])]
    if args.include_diagnosis:checks.insert(0,('system_diagnosis',ROOT.parent,[sys.executable,'-B','-m','unittest','discover','-s','.','-p','test_*.py']))
    node=shutil.which(args.node)
    if node:
        checks.extend([('node_geometry',ROOT/'web',[node,'--test','tests/test_fixture_geometry.mjs','tests/test_step_model.mjs','tests/test_step_converter.mjs']),
                       ('node_ui',ROOT/'web',[node,'tests/test_motor_ui.js']),
                       ('node_status',ROOT/'web',[node,'tests/test_motor_status.js'])])
        checks.extend((name,ROOT/'web',[node,'tests/'+name+'.js']) for name in ('test_native_import_ui','test_servo_pwm_ui','test_servo_staged_ui','test_calibration_ui','test_pad_click_ui','test_workbench_ui'))
    else:
        print('Node unavailable: JS checks skipped; install Node 22/24 for full verification.')
    results=[]
    for name,cwd,command in checks:
        with (logdir/(name+'.log')).open('w') as output:
            result=subprocess.run(command,cwd=str(cwd),stdout=output,stderr=subprocess.STDOUT)
        results.append(dict(check=name,passed=result.returncode==0,log=str(logdir/(name+'.log'))))
        print(name+': '+('PASS' if result.returncode==0 else 'FAIL'),flush=True)
    summary=dict(checks=results,js_skipped=not bool(node),hardware_accessed=False)
    (logdir/'result.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2))
    raise SystemExit(0 if all(item['passed'] for item in results) else 1)


if __name__=='__main__':
    main()
