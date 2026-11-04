
import tempfile
import sys
import json
import unittest
from pathlib import Path
from unittest.mock import patch, MagicMock, call

from interface import create_app
from update_on_wujing import app_file, deployment_locks, exclusive_file, run, activate_release


class ProjectCWebTests(unittest.TestCase):
    def setUp(self):
        self.app = create_app({"TESTING": True})
        self.client = self.app.test_client()

    def test_chinese_home_without_legacy_serial_controls(self):
        response = self.client.get("/")
        self.assertEqual(response.status_code, 200)
        page = response.data.decode("utf-8")
        for text in ('lang="zh-CN"', "CircuitScout · 悟净", "探针控制", "查找候选测点", "导入嘉立创工程"):
            self.assertIn(text, page)
        self.assertLess(page.index('motor-status.js?'), page.index('motor-control.js?'))
        self.assertLess(page.index('motor-status.js?'), page.index('pcb-control.js?'))
        for text in ("输入控制命令", "选择 .pcbpt 命令文件", "串口连接", "measurements.js",
                     "components.js", "测量工作台", "同步 IQ 分析"):
            self.assertNotIn(text, page)

    def test_legacy_serial_routes_are_gone(self):
        self.assertFalse(Path("interface/serial.py").exists())
        for route in ("/serial/send_command", "/serial/upload_command",
                      "/serial/connect_device", "/serial/disconnect_device"):
            self.assertEqual(self.client.post(route, data={}).status_code, 404, route)

    def test_added_pages_api_and_assets_are_removed(self):
        for route in ("/measurements", "/probes", "/api/measurements/status", "/api/measurements/records",
                      "/api/components/status", "/api/components/example/C", "/static/js/measurements.js",
                      "/static/css/measurements.css", "/static/js/components.js", "/static/css/components.css"):
            self.assertEqual(self.client.get(route).status_code, 404, route)
        for route in ("/api/measurements/capture", "/api/components/capture"):
            self.assertEqual(self.client.post(route, json={}).status_code, 404, route)
        for asset in ("/static/js/main.js", "/static/js/socket.js", "/static/js/workbench.js", "/static/js/assembly-view.js", "/static/css/main.css", "/static/js/motor-status.js"):
            response = self.client.get(asset)
            self.assertEqual(response.status_code, 200, asset)
            response.close()

    def test_motor_api_rejects_cross_origin_writes(self):
        response = self.client.post("/motor/jog", json={"probe": "left", "direction": "left", "step_mm": 1},
                                    headers={"X-Requested-With": "XMLHttpRequest", "Origin": "http://evil.example"})
        self.assertEqual(response.status_code, 403)

    def test_update_paths_cannot_touch_persistent_data(self):
        with tempfile.TemporaryDirectory() as directory:
            app = Path(directory) / "app"
            app.mkdir()
            self.assertEqual(app_file(app, "interface/__init__.py"), app / "interface/__init__.py")
            for name in ("../data/raw.bin", "interface/static/uploads/user.kicad_pcb", str(Path(directory) / "outside.py")):
                with self.assertRaises(RuntimeError):
                    app_file(app, name)

    def test_update_refuses_active_motor_or_usb_ownership(self):
        with tempfile.TemporaryDirectory() as directory:
            previous = Path(directory) / "previous"
            active = previous / "app/instance/motor_jobs/active.lock"
            usb = Path(directory) / "usb.lock"
            for busy in (active, usb):
                with exclusive_file(busy):
                    with self.assertRaisesRegex(RuntimeError, "仍被占用"):
                        with deployment_locks(previous, usb):
                            self.fail("部署不应获得活动控制器的锁")
                with deployment_locks(previous, usb):
                    pass

    def test_update_tests_run_inside_candidate_app(self):
        with tempfile.TemporaryDirectory() as directory:
            release = Path(directory)
            app = release / "app"
            app.mkdir()
            result = run([sys.executable, "-c", "from pathlib import Path;print(Path.cwd())"],
                         release, "candidate_cwd.log", cwd=str(app))
            self.assertEqual(result.strip(), str(app))

    def activation_fixture(self, directory):
        base = Path(directory)
        release, previous = base / "new", base / "old"
        release.mkdir()
        uploads = base / "uploads"
        uploads.mkdir()
        (release / "smoke_check_result.json").write_text(json.dumps({"mechanical_commands_sent": False}))
        response = MagicMock()
        response.__enter__.return_value.status = 200
        response.__enter__.return_value.read.return_value = 'lang="zh-CN" CircuitScout · 悟净'.encode()
        return base, release, previous, uploads, response

    def test_activation_success_records_deleted_files_and_uses_readonly_smoke(self):
        with tempfile.TemporaryDirectory() as directory:
            base, release, previous, uploads, response = self.activation_fixture(directory)
            with patch("update_on_wujing.switch_current") as switch, \
                    patch("update_on_wujing.run", return_value="active\n") as commands, \
                    patch("update_on_wujing.urllib.request.urlopen", return_value=response):
                activate_release(base, release, previous, {}, ["interface/serial.py"], uploads, sys.executable)
            result = json.loads((release / "update_result.json").read_text())
            self.assertEqual(result["removed_files"], ["interface/serial.py"])
            self.assertTrue(result["dependencies_reused"])
            self.assertEqual(switch.call_args_list, [call(base, release)])
            self.assertTrue(any("--skip-upload" in c.args[0] for c in commands.call_args_list))

    def test_activation_failure_switches_back_and_restarts_previous_service(self):
        with tempfile.TemporaryDirectory() as directory:
            base, release, previous, uploads, response = self.activation_fixture(directory)
            def command(args, *unused, **kwargs):
                if "--skip-upload" in args:
                    raise RuntimeError("smoke failed")
                return "active\n"
            with patch("update_on_wujing.switch_current") as switch, \
                    patch("update_on_wujing.run", side_effect=command) as commands, \
                    patch("update_on_wujing.urllib.request.urlopen", return_value=response):
                with self.assertRaisesRegex(RuntimeError, "smoke failed"):
                    activate_release(base, release, previous, {}, [], uploads, sys.executable)
            self.assertEqual(switch.call_args_list, [call(base, release), call(base, previous)])
            self.assertTrue(any(c.args[2] == "rollback_service.log" for c in commands.call_args_list))


if __name__ == "__main__":
    unittest.main(verbosity=2)
