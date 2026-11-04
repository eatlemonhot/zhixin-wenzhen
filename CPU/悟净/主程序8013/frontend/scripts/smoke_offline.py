#!/usr/bin/env python3
import io
import json
import os
from pathlib import Path
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def main():
    with tempfile.TemporaryDirectory(prefix='probe-health-check-') as temporary:
        data = Path(temporary)
        upload = data / 'uploads'
        upload.mkdir()
        os.environ.update(FDW_INSTANCE_FOLDER=str(data/'instance'),
            FDW_UPLOAD_FOLDER=str(upload),FDW_WEB_SECRET='offline-smoke-test-only',
            WUJING_MOTOR_ROOT=str(data/'nonexistent-controller'))
        sys.path.insert(0,str(ROOT/'web'))
        os.chdir(str(ROOT/'web'))
        from interface import app
        app.config['TESTING']=True
        headers={'X-Requested-With':'XMLHttpRequest'}
        with app.test_client() as client:
            assert client.get('/').status_code==200
            state=client.get('/motor/status').get_json()
            assert not state['available'] and not state['busy'] and not state['motion_enabled']
            wasm=next((ROOT/'web/interface/static/js/vendor').rglob('*.wasm'))
            for asset in ('/static/'+str(wasm.relative_to(ROOT/'web/interface/static')),
                          '/static/models/fixture.json','/static/js/assembly-view.js'):
                response=client.get(asset)
                assert response.status_code==200,(asset,response.status_code)
                response.close()
            print(json.dumps(dict(passed=True,application_loaded=True,
                offline_controller_disabled=True,wasm_and_models_served=True,
                hardware_opened=False),ensure_ascii=False))


if __name__=='__main__':
    main()
