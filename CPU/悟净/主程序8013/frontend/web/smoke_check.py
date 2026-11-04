#!/usr/bin/env python3

import http.cookiejar
import argparse
import importlib.util
import urllib.error
import json
import time
import urllib.request
import uuid
import sys
import hashlib
from pathlib import Path

from simple_websocket import Client


def main():
    """使用项目C硬件样例验证解析功能。"""
    root = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-url", default="http://127.0.0.1:8001")
    parser.add_argument("--skip-upload", action="store_true",
                        help="只读核验线上服务；完整上传解析在隔离候选服务执行")
    args = parser.parse_args()
    sys.path.insert(0, str(root / "app"))
    jar = http.cookiejar.CookieJar()
    opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(jar))
    base_url = args.base_url.rstrip("/")
    with opener.open(base_url + "/", timeout=8) as response:
        body = response.read()
        assert response.status == 200 and b"/static/js/main.js" in body, "原项目C网页未就绪"
    assert b'lang="zh-CN"' in body and "CircuitScout · 悟净".encode("utf-8") in body, "原项目C汉化界面未恢复"
    for text in ("输入控制命令", "选择 .pcbpt 命令文件", "console-output"):
        assert text.encode("utf-8") not in body, "旧串口控件仍在页面中：" + text
    for path in ("/measurements", "/probes", "/api/measurements/status", "/api/measurements/records",
                 "/api/components/status", "/api/components/example/C", "/static/js/components.js",
                 "/static/js/measurements.js", "/serial/send_command", "/serial/upload_command",
                 "/serial/connect_device", "/serial/disconnect_device"):
        try:
            opener.open(base_url + path, timeout=8).close()
        except urllib.error.HTTPError as error:
            assert error.code == 404, "已撤下的入口应返回404：" + path
        else:
            raise AssertionError("已撤下的入口仍可访问：" + path)
    with opener.open(base_url + "/motor/status", timeout=8) as response:
        assert response.status == 200, "电机状态接口不可用"
        motor_status = json.loads(response.read().decode("utf-8"))
    assert motor_status.get("available") is True, "电机运行时脚本缺失"
    for name in ("interface.serial", "interface.__main__"):
        if importlib.util.find_spec(name) is not None:
            raise AssertionError("已删除模块仍可导入：" + name)
    checked_assets = []
    for path in ("/static/js/socket.io.min.js", "/static/js/p5.min.js", "/static/js/main.js", "/static/js/socket.js", "/static/js/motor-status.js", "/static/js/motor-control.js", "/static/js/pcb-control.js", "/static/js/pcb-upload.js", "/static/css/main.css", "/static/js/workbench.js", "/static/js/assembly-view.js", "/static/js/fixture-geometry.js", "/static/js/vendor/three.module.js", "/static/js/vendor/three.core.js", "/static/js/vendor/OrbitControls.js", "/static/models/fixture.json", "/static/models/fixture_0.stl", "/static/models/fixture_1.stl"):
        with opener.open(base_url + path, timeout=8) as response:
            assert response.status == 200 and response.read(), "静态资源缺失"
        checked_assets.append(path)
    for path in ("/static/js/step-model.js", "/static/js/step-model-geometry.js", "/static/models/boards/catalog.json"):
        with opener.open(base_url + path, timeout=8) as response:
            assert response.status == 200 and response.read(), "STEP静态资源缺失"
        checked_assets.append(path)
    for path in ("/static/js/step-converter.js", "/static/js/step-upload-worker.js",
                 "/static/js/vendor/occt/occt-import-js.js", "/static/js/vendor/occt/occt-import-js.wasm"):
        with opener.open(base_url + path, timeout=8) as response:
            assert response.status == 200 and response.read(), "联合上传解析器资源缺失"
            if path.endswith('.wasm'):
                assert 'application/wasm' in response.headers.get('Content-Type', ''), "WASM类型不正确"
        checked_assets.append(path)
    with opener.open(base_url + "/static/models/boards/catalog.json", timeout=8) as response:
        model_catalog = json.load(response)
    checked_models = []
    for layout_id, entry in model_catalog["models"].items():
        manifest_path = "/static/models/" + entry["manifest"]
        with opener.open(base_url + manifest_path, timeout=8) as response:
            model = json.load(response)
        assert model["layout_id"] == layout_id and model["source_sha256"] == entry["source_sha256"], "STEP工程绑定不一致"
        with opener.open(base_url + manifest_path.rsplit("/", 1)[0] + "/" + model["binary"], timeout=8) as response:
            binary = response.read()
        assert len(binary) == model["binary_bytes"] and hashlib.sha256(binary).hexdigest() == model["binary_sha256"], "STEP网格校验失败"
        assert sum(part["kind"] == "component" for part in model["parts"]) == model["component_count"]
        checked_models.append(dict(layout_id=layout_id, components=model["component_count"], binary_bytes=len(binary)))
    cookie = "; ".join(item.name + "=" + item.value for item in jar)
    websocket_url = base_url.replace("http://", "ws://", 1).replace("https://", "wss://", 1)
    connection = Client.connect(websocket_url + "/socket.io/?EIO=4&transport=websocket", headers={"Cookie": cookie})
    result = {"http_home": 200, "interface_language": "zh-CN", "original_project_c_restored": True,
              "added_interfaces_removed": True, "legacy_serial_path_removed": True,
              "motor_status": motor_status, "static_assets": checked_assets, "step_models": checked_models,
              "websocket_connected": False, "upload_and_parse": False,
              "mechanical_commands_sent": False, "user_dut_uploaded": False}

    def finish(**values):
        result.update(values)
        (root / "smoke_check_result.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print("FDW_SMOKE_RESULT=" + json.dumps(result, ensure_ascii=False), flush=True)

    try:
        opened = connection.receive(timeout=8)
        assert isinstance(opened, str) and opened.startswith("0"), "WebSocket未收到Engine.IO握手"
        connection.send("40")
        connected = connection.receive(timeout=8)
        assert isinstance(connected, str) and connected.startswith("40"), "Socket.IO未完成连接"
        result["websocket_connected"] = True
        if args.skip_upload:
            finish(upload_skipped=True)
            return
        boundary = "FDWUpload" + uuid.uuid4().hex
        parts = []
        for field, name in (("layout_file", "sample.epro2"),):
            parts.extend([
                ("--" + boundary + "\r\n").encode(),
                ('Content-Disposition: form-data; name="%s"; filename="%s"\r\n' % (field, name)).encode(),
                b"Content-Type: application/octet-stream\r\n\r\n",
                (root / "app/fixtures" / name).read_bytes(),
                b"\r\n",
            ])
        parts.append(("--" + boundary + "--\r\n").encode())
        request = urllib.request.Request(base_url + "/kicad/process_files", data=b"".join(parts), headers={"Content-Type": "multipart/form-data; boundary=" + boundary})
        with opener.open(request, timeout=15) as response:
            assert response.status == 200 and response.read() == "文件已处理".encode("utf-8"), "上传或解析失败"
        events = {}
        deadline = time.monotonic() + 15
        while time.monotonic() < deadline and not {"schematic", "nets", "edges", "pads", "dimensions"}.issubset(events):
            packet = connection.receive(timeout=5)
            if packet == "2":
                connection.send("3")
            elif isinstance(packet, str) and packet.startswith("42"):
                event = json.loads(packet[2:])
                events[event[0]] = event[1]
        assert {"schematic", "nets", "edges", "pads", "dimensions"}.issubset(events), "上传后没有收到完整测点事件"
        assert events['schematic']['pages'], 'V3原理图未解析'
        with opener.open(base_url+'/workbench/design',timeout=8) as response:
            design=json.loads(response.read().decode())
        pad=next(iter(design['pads']))
        payload=dict(layout_id=design['layout_id'],orientation=0,pairs=[dict(id='smoke',left=pad,right=None)])
        req=urllib.request.Request(base_url+'/workbench/plan',data=json.dumps(payload).encode(),headers={'Content-Type':'application/json','X-Requested-With':'XMLHttpRequest'})
        with opener.open(req,timeout=8) as response:
            plan=json.loads(response.read().decode());assert not plan['execution']['executable']
        result['v3_schematic_parsed']=True;result['offline_plan_verified']=True
        finish(upload_and_parse=True, nets_count=len(events["nets"]), pads_count=len(events["pads"]),
               allowed_pads_count=sum(bool(item["is_allowed"]) for item in events["pads"].values()),
               edges_count=len(events["edges"]), dimensions=events["dimensions"])
    finally:
        connection.close()


if __name__ == "__main__":
    main()
