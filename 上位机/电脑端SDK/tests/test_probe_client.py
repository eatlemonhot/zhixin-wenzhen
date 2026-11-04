import contextlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import io
import json
import os
from pathlib import Path
import socket
import sys
import tempfile
import threading
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from probe_client import (APIError, MotionFailed, MotionOutcomeUnknown,
                          MotionRejected, ProbeClient, main)


DESIGN = {"loaded": True, "layout_id": "a" * 64,
          "dimensions": {"orientation": 90, "width": 100, "height": 80}}
POINTS = {"left": {"x": 10, "y": 20}, "right": None}
PREVIEW = {"preview_id": "token-1", "can_move": True, "errors": []}


def state(job_id="job-1", phase="completed", busy=False, ready=True, stopped=False):
    return {"last_job": {"job_id": job_id, "state": phase}, "busy": busy,
            "ready": ready, "stopped": stopped, "positions_mm": {"1": 12}}


class FakeService:
    def __init__(self):
        self.records = []
        self.routes = {
            ("GET", "/workbench/design"): (200, DESIGN, {"Set-Cookie": "session=fake; Path=/; HttpOnly"}),
            ("POST", "/motor/pcb/preview-xy"): (200, PREVIEW, {}),
            ("POST", "/motor/pcb/move"): (202, {"job_id": "job-1"}, {}),
            ("GET", "/motor/status"): (200, state(), {}),
        }
        outer = self

        class Handler(BaseHTTPRequestHandler):
            def log_message(self, *_):
                pass

            def do_GET(self):
                self.handle_api()

            def do_POST(self):
                self.handle_api()

            def handle_api(self):
                raw = self.rfile.read(int(self.headers.get("Content-Length", "0")))
                record = {"method": self.command, "path": self.path,
                          "headers": dict(self.headers),
                          "json": json.loads(raw) if raw else None}
                outer.records.append(record)
                response = outer.routes.get((self.command, self.path), (404, {"error": "Not found"}, {}))
                if callable(response):
                    response = response(record)
                if response is None:
                    self.connection.shutdown(socket.SHUT_RDWR)
                    self.connection.close()
                    return
                code, body, headers = response
                raw_body = body if isinstance(body, bytes) else json.dumps(body).encode()
                self.send_response(code)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(raw_body)))
                for name, value in headers.items():
                    self.send_header(name, value)
                self.end_headers()
                self.wfile.write(raw_body)

        self.server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        self.thread = threading.Thread(target=self.server.serve_forever,
                                       kwargs={"poll_interval": 0.01}, daemon=True)
        self.thread.start()
        self.url = "http://127.0.0.1:" + str(self.server.server_port)

    def close(self):
        self.server.shutdown()
        self.server.server_close()
        self.thread.join(timeout=2)

    def count(self, method, path):
        return sum(r["method"] == method and r["path"] == path for r in self.records)


class ClientTests(unittest.TestCase):
    def setUp(self):
        self.fake = FakeService()
        self.addCleanup(self.fake.close)
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.cookie_file = Path(self.temporary.name) / "private.cookies.txt"
        self.client = ProbeClient(self.fake.url, self.cookie_file)

    def test_preview_only_uses_current_design_orientation_and_cookie(self):
        preview = self.client.preview_xy(POINTS)
        self.assertTrue(preview["can_move"])
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 0)
        posted = self.fake.records[-1]
        self.assertEqual(posted["json"], {"layout_id": "a" * 64, "orientation": 90,
                                         "coordinate_frame": "pcb_mm", "points": POINTS})
        self.assertEqual(posted["headers"]["Cookie"], "session=fake")
        self.assertEqual(posted["headers"]["Origin"], self.fake.url)
        self.assertEqual(posted["headers"]["X-Requested-With"], "XMLHttpRequest")

    def test_netscape_cookies_persist_with_private_permissions(self):
        self.client.get_design()
        self.client.save_cookies()
        self.assertIn("Netscape", self.cookie_file.read_text())
        self.assertEqual(os.stat(str(self.cookie_file)).st_mode & 0o777, 0o600)
        loaded = ProbeClient(self.fake.url, self.cookie_file)
        loaded.get_design()
        self.assertEqual(self.fake.records[-1]["headers"]["Cookie"], "session=fake")

    def test_rotated_frame_does_not_change_coordinates_in_sdk(self):
        self.client.preview_xy(POINTS, "rotated_pcb_mm")
        self.assertEqual(self.fake.records[-1]["json"]["points"], POINTS)
        self.assertEqual(self.fake.records[-1]["json"]["coordinate_frame"], "rotated_pcb_mm")

    def test_invalid_targets_are_rejected_before_http(self):
        values = [{}, {"left": None, "right": None},
                  {"left": {"x": True, "y": 1}, "right": None},
                  {"left": {"x": float("nan"), "y": 1}, "right": None},
                  {"left": {"x": float("inf"), "y": 1}, "right": None},
                  {"left": {"x": 1, "y": 2, "z": 3}, "right": None}]
        for value in values:
            with self.subTest(value=value), self.assertRaises(ValueError):
                self.client.preview_xy(value)
        with self.assertRaises(ValueError):
            self.client.preview_xy(POINTS, "motor_steps")
        self.assertEqual(self.fake.records, [])

    def test_missing_design_reports_cookie_session_problem(self):
        self.fake.routes[("GET", "/workbench/design")] = (200, {"loaded": False}, {})
        with self.assertRaisesRegex(APIError, "Cookie session"):
            self.client.preview_xy(POINTS)
        self.assertEqual(self.fake.count("POST", "/motor/pcb/preview-xy"), 0)

    def test_preview_failure_never_posts_move(self):
        with self.assertRaises(MotionRejected):
            self.client.execute_preview(dict(PREVIEW, can_move=False))
        self.assertEqual(self.fake.records, [])

    def test_execute_posts_once_then_waits_for_matching_job(self):
        replies = [state(phase="running", busy=True, ready=False), state()]
        self.fake.routes[("GET", "/motor/status")] = lambda _: (200, replies.pop(0), {})
        result = self.client.execute_preview(PREVIEW, poll_interval=0.001)
        self.assertEqual(result["last_job"]["job_id"], "job-1")
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)
        self.assertEqual(self.fake.count("GET", "/motor/status"), 2)
        self.assertFalse(any(record["path"] in ("/motor/mode", "/motor/clear-stop", "/motor/rebuild", "/motor/stop")
                             for record in self.fake.records))
        with self.assertRaises(MotionRejected):
            self.client.submit_preview(PREVIEW)
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)

    def test_completed_but_still_cleaning_up_waits(self):
        replies = [state(busy=True), state()]
        self.fake.routes[("GET", "/motor/status")] = lambda _: (200, replies.pop(0), {})
        self.client.execute_preview(PREVIEW, poll_interval=0.001)
        self.assertEqual(self.fake.count("GET", "/motor/status"), 2)

    def test_failed_job_is_not_completion(self):
        self.fake.routes[("GET", "/motor/status")] = (200, state(phase="failed", ready=False), {})
        with self.assertRaises(MotionFailed) as caught:
            self.client.execute_preview(PREVIEW)
        self.assertEqual(caught.exception.job_id, "job-1")
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)

    def test_limited_job_is_not_completion(self):
        self.fake.routes[("GET", "/motor/status")] = (200, state(phase="limited"), {})
        with self.assertRaises(MotionFailed):
            self.client.execute_preview(PREVIEW)

    def test_replaced_job_has_unknown_outcome(self):
        self.fake.routes[("GET", "/motor/status")] = (200, state(job_id="someone-else"), {})
        with self.assertRaisesRegex(MotionOutcomeUnknown, "replaced") as caught:
            self.client.execute_preview(PREVIEW)
        self.assertEqual(caught.exception.job_id, "job-1")
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)

    def test_restarted_service_without_last_job_is_unknown(self):
        self.fake.routes[("GET", "/motor/status")] = (200, {"last_job": None, "busy": False}, {})
        with self.assertRaises(MotionOutcomeUnknown):
            self.client.execute_preview(PREVIEW)

    def test_timeout_is_unknown_and_never_reposts_or_stops(self):
        self.fake.routes[("GET", "/motor/status")] = (200, state(phase="running", busy=True, ready=False), {})
        with self.assertRaisesRegex(MotionOutcomeUnknown, "Timed out"):
            self.client.execute_preview(PREVIEW, timeout=0.025, poll_interval=0.003)
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)
        self.assertEqual(self.fake.count("POST", "/motor/stop"), 0)

    def test_invalid_wait_settings_fail_before_submitting(self):
        for kwargs in ({"timeout": 0}, {"poll_interval": -1}, {"timeout": float("inf")}):
            with self.subTest(kwargs=kwargs), self.assertRaises(ValueError):
                self.client.execute_preview(PREVIEW, **kwargs)
        self.assertEqual(self.fake.records, [])

    def test_disconnected_move_response_is_unknown_and_token_is_spent(self):
        self.fake.routes[("POST", "/motor/pcb/move")] = None
        with self.assertRaises(MotionOutcomeUnknown):
            self.client.submit_preview(PREVIEW)
        with self.assertRaises(MotionRejected):
            self.client.submit_preview(PREVIEW)
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)

    def test_server_409_is_explicit_rejection(self):
        self.fake.routes[("POST", "/motor/pcb/move")] = (409, {"error": "preview expired"}, {})
        with self.assertRaisesRegex(MotionRejected, "expired"):
            self.client.submit_preview(PREVIEW)
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)

    def test_server_500_may_follow_an_accepted_move_is_unknown(self):
        self.fake.routes[("POST", "/motor/pcb/move")] = (500, {"error": "lost result"}, {})
        with self.assertRaises(MotionOutcomeUnknown):
            self.client.submit_preview(PREVIEW)

    def test_accepted_without_job_id_is_unknown(self):
        self.fake.routes[("POST", "/motor/pcb/move")] = (202, {"ok": True}, {})
        with self.assertRaises(MotionOutcomeUnknown):
            self.client.submit_preview(PREVIEW)

    def test_invalid_accepted_json_is_unknown(self):
        self.fake.routes[("POST", "/motor/pcb/move")] = (202, b"not-json", {})
        with self.assertRaises(MotionOutcomeUnknown):
            self.client.submit_preview(PREVIEW)

    def test_disconnected_status_is_unknown_with_original_job_id(self):
        self.fake.routes[("GET", "/motor/status")] = None
        with self.assertRaises(MotionOutcomeUnknown) as caught:
            self.client.execute_preview(PREVIEW)
        self.assertEqual(caught.exception.job_id, "job-1")

    def test_completed_but_stopped_or_unready_does_not_allow_measurement(self):
        for value in (state(stopped=True), state(ready=False)):
            with self.subTest(value=value):
                self.fake.routes[("GET", "/motor/status")] = (200, value, {})
                with self.assertRaises(MotionFailed):
                    self.client.wait_for_job("job-1")

    def test_http_redirects_are_not_followed(self):
        self.fake.routes[("GET", "/workbench/design")] = (302, {}, {"Location": "/unexpected"})
        with self.assertRaises(APIError) as caught:
            self.client.get_design()
        self.assertEqual(caught.exception.status, 302)
        self.assertEqual(self.fake.count("GET", "/unexpected"), 0)

    def test_cli_defaults_to_preview_only(self):
        points_file = Path(self.temporary.name) / "points.json"
        points_file.write_text(json.dumps(POINTS))
        with contextlib.redirect_stdout(io.StringIO()) as output:
            code = main(["--base-url", self.fake.url, "--cookies", str(self.cookie_file),
                         "--points", str(points_file)])
        self.assertEqual(code, 0)
        self.assertFalse(json.loads(output.getvalue())["submitted"])
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 0)

    def test_cli_unknown_outcome_has_distinct_exit_code(self):
        points_file = Path(self.temporary.name) / "points.json"
        points_file.write_text(json.dumps(POINTS))
        self.fake.routes[("GET", "/motor/status")] = (200, state(job_id="replacement"), {})
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()) as errors:
            code = main(["--base-url", self.fake.url, "--cookies", str(self.cookie_file),
                         "--points", str(points_file), "--execute"])
        self.assertEqual(code, 3)
        self.assertEqual(json.loads(errors.getvalue())["outcome"], "unknown")
        self.assertFalse(json.loads(errors.getvalue())["retry_allowed"])
        self.assertEqual(self.fake.count("POST", "/motor/pcb/move"), 1)


if __name__ == "__main__":
    unittest.main()
