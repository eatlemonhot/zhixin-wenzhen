#!/usr/bin/env python3

import argparse
import http.client
import http.cookiejar
import json
import math
import os
from pathlib import Path
import sys
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request


FRAMES = ("pcb_mm", "rotated_pcb_mm")


class ProbeError(RuntimeError):
    pass


class APIError(ProbeError):
    def __init__(self, message, status=None, payload=None):
        super().__init__(message)
        self.status = status
        self.payload = payload


class MotionRejected(ProbeError):
    pass


class MotionFailed(ProbeError):
    def __init__(self, message, job_id, state=None):
        super().__init__(message)
        self.job_id = job_id
        self.state = state


class MotionOutcomeUnknown(ProbeError):
    """操作结果不确定时，先检查任务与硬件状态，再决定下一步操作。"""
    def __init__(self, message, job_id=None):
        super().__init__(message)
        self.job_id = job_id


class NoRedirects(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


class HostOnlyCookiePolicy(http.cookiejar.DefaultCookiePolicy):
    def __init__(self):
        super().__init__(strict_ns_domain=self.DomainStrictNonDomain)

    def return_ok_domain(self, cookie, request):
        if not cookie.domain_specified:
            host = urllib.parse.urlsplit(request.full_url).hostname
            if host and cookie.domain.lower() == host.lower():
                return True
        return super().return_ok_domain(cookie, request)


def finite_positive(value, name):
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        raise ValueError(name + " must be a positive finite number")
    if not math.isfinite(value) or value <= 0:
        raise ValueError(name + " must be a positive finite number")
    return float(value)


def normalize_points(points):
    if not isinstance(points, dict) or set(points) != {"left", "right"}:
        raise ValueError("points must contain exactly left and right")
    result = {}
    for probe in ("left", "right"):
        point = points[probe]
        if point is None:
            result[probe] = None
            continue
        if not isinstance(point, dict) or set(point) != {"x", "y"}:
            raise ValueError(probe + " must be null or an object containing x and y")
        result[probe] = {}
        for axis in ("x", "y"):
            value = point[axis]
            if isinstance(value, bool) or not isinstance(value, (int, float)):
                raise ValueError(probe + "." + axis + " must be a finite number")
            try:
                value = float(value)
            except OverflowError:
                raise ValueError(probe + "." + axis + " must be a finite number") from None
            if not math.isfinite(value):
                raise ValueError(probe + "." + axis + " must be a finite number")
            result[probe][axis] = value
    if all(point is None for point in result.values()):
        raise ValueError("at least one probe target is required")
    return result


def strict_json(raw):
    def invalid_constant(value):
        raise ValueError("non-finite JSON number: " + value)
    return json.loads(raw, parse_constant=invalid_constant)


class ProbeClient:
    def __init__(self, base_url, cookie_file=None, http_timeout=5.0):
        parsed = urllib.parse.urlsplit(base_url)
        if (parsed.scheme not in ("http", "https") or not parsed.netloc
                or parsed.username or parsed.password or parsed.query or parsed.fragment):
            raise ValueError("base_url must be an HTTP(S) service URL without credentials/query/fragment")
        self.base_url = base_url.rstrip("/")
        self.origin = parsed.scheme + "://" + parsed.netloc
        self.http_timeout = finite_positive(http_timeout, "http_timeout")
        self.cookie_file = Path(cookie_file).expanduser() if cookie_file else None
        self.cookies = http.cookiejar.MozillaCookieJar(
            str(self.cookie_file) if self.cookie_file else None)
        self.cookies.set_policy(HostOnlyCookiePolicy())
        if self.cookie_file and self.cookie_file.exists():
            self.cookies.load(ignore_discard=True, ignore_expires=False)
        self.opener = urllib.request.build_opener(
            urllib.request.HTTPCookieProcessor(self.cookies), NoRedirects())
        self._submitted_previews = set()
        self.last_submitted_job_id = None

    def save_cookies(self, path=None):
        target = Path(path).expanduser() if path else self.cookie_file
        if target is None:
            raise ValueError("cookie path is required")
        target.parent.mkdir(parents=True, exist_ok=True)
        descriptor, temporary = tempfile.mkstemp(prefix=".probe-cookies-", dir=str(target.parent))
        os.close(descriptor)
        try:
            self.cookies.save(temporary, ignore_discard=True, ignore_expires=False)
            os.chmod(temporary, 0o600)
            os.replace(temporary, str(target))
        finally:
            if os.path.exists(temporary):
                os.unlink(temporary)

    def _request(self, method, path, payload=None, timeout=None):
        data = None
        headers = {"Accept": "application/json"}
        if payload is not None:
            data = json.dumps(payload, allow_nan=False, separators=(",", ":")).encode("utf-8")
            headers.update({"Content-Type": "application/json", "Origin": self.origin,
                            "X-Requested-With": "XMLHttpRequest"})
        request = urllib.request.Request(self.base_url + path, data=data,
                                         headers=headers, method=method)
        request_timeout = self.http_timeout if timeout is None else min(self.http_timeout, timeout)
        try:
            with self.opener.open(request, timeout=request_timeout) as response:
                status = response.status
                raw = response.read(32 * 1024 * 1024 + 1)
                if len(raw) > 32 * 1024 * 1024:
                    raise APIError("API response exceeded 32 MiB", status=status)
                try:
                    body = strict_json(raw.decode("utf-8"))
                except (UnicodeError, ValueError):
                    raise APIError("API returned invalid JSON", status=status) from None
                if not isinstance(body, dict):
                    raise APIError("API response must be a JSON object", status=status)
                return status, body
        except urllib.error.HTTPError as exc:
            try:
                try:
                    body = strict_json(exc.read(64 * 1024).decode("utf-8"))
                except (UnicodeError, ValueError):
                    body = None
            finally:
                exc.close()
            message = body.get("error") if isinstance(body, dict) else None
            raise APIError(message or "HTTP " + str(exc.code), status=exc.code, payload=body) from None
        except (urllib.error.URLError, TimeoutError, OSError, http.client.HTTPException) as exc:
            raise APIError("API transport failed: " + str(exc)) from None

    def get_design(self):
        _, design = self._request("GET", "/workbench/design")
        dimensions = design.get("dimensions")
        if design.get("loaded") is not True or not isinstance(dimensions, dict):
            raise APIError("No design is loaded in this Cookie session; upload in that session first")
        if not isinstance(design.get("layout_id"), str) or not design["layout_id"]:
            raise APIError("Design response has no layout_id")
        if type(dimensions.get("orientation")) is not int or dimensions["orientation"] not in (0, 90, 180, 270):
            raise APIError("Design response has an invalid orientation")
        return design

    def preview_xy(self, points, coordinate_frame="pcb_mm", design=None):
        """预览目标点，默认单位为原始PCB毫米坐标。

        points格式为{left: {x: 10, y: 20}, right: None}。
        服务端对pcb_mm应用当前方向；rotated_pcb_mm直接使用已旋转坐标。"""
        if coordinate_frame not in FRAMES:
            raise ValueError("coordinate_frame must be pcb_mm or rotated_pcb_mm")
        points = normalize_points(points)
        if design is None:
            design = self.get_design()
        try:
            layout_id = design["layout_id"]
            orientation = design["dimensions"]["orientation"]
        except (KeyError, TypeError):
            raise ValueError("design must be a get_design() result") from None
        if not isinstance(layout_id, str) or not layout_id or type(orientation) is not int or orientation not in (0, 90, 180, 270):
            raise ValueError("design has an invalid layout_id/orientation")
        _, preview = self._request("POST", "/motor/pcb/preview-xy", {
            "layout_id": layout_id, "orientation": orientation,
            "coordinate_frame": coordinate_frame, "points": points})
        if not isinstance(preview.get("preview_id"), str) or not preview["preview_id"]:
            raise APIError("Preview response has no preview_id")
        if type(preview.get("can_move")) is not bool:
            raise APIError("Preview response has no boolean can_move")
        return preview

    def get_status(self):
        return self._request("GET", "/motor/status")[1]

    def submit_preview(self, preview):
        if not isinstance(preview, dict) or preview.get("can_move") is not True:
            raise MotionRejected("Preview did not pass; inspect errors and do not move")
        token = preview.get("preview_id")
        if not isinstance(token, str) or not token:
            raise MotionRejected("Preview has no valid preview_id")
        if token in self._submitted_previews:
            raise MotionRejected("This SDK instance already submitted that preview; do not repeat it")
        self._submitted_previews.add(token)
        try:
            status, result = self._request("POST", "/motor/pcb/move", {"preview_id": token})
        except APIError as exc:
            if exc.status is not None and 400 <= exc.status < 500:
                raise MotionRejected("Server rejected the move: " + str(exc)) from exc
            raise MotionOutcomeUnknown("Move submission outcome is UNKNOWN; do not retry. " + str(exc)) from exc
        if status != 202 or not isinstance(result.get("job_id"), str) or not result["job_id"]:
            raise MotionOutcomeUnknown("Move response did not identify an accepted job; outcome is UNKNOWN; do not retry")
        self.last_submitted_job_id = result["job_id"]
        return result["job_id"]

    def wait_for_job(self, job_id, timeout=600.0, poll_interval=0.25):
        if not isinstance(job_id, str) or not job_id:
            raise ValueError("job_id is required")
        timeout = finite_positive(timeout, "timeout")
        poll_interval = finite_positive(poll_interval, "poll_interval")
        deadline = time.monotonic() + timeout
        while True:
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                raise MotionOutcomeUnknown("Timed out waiting for this move; outcome is UNKNOWN; do not resend", job_id)
            try:
                _, state = self._request("GET", "/motor/status", timeout=remaining)
            except APIError as exc:
                raise MotionOutcomeUnknown("Lost this move's status; outcome is UNKNOWN; do not resend. " + str(exc), job_id) from exc
            job = state.get("last_job")
            if not isinstance(job, dict) or job.get("job_id") != job_id:
                raise MotionOutcomeUnknown("Status no longer identifies this job (replaced or service restarted); outcome is UNKNOWN; do not resend", job_id)
            job_state = job.get("state")
            if job_state in ("failed", "limited"):
                raise MotionFailed("Move did not complete: " + str(job.get("error") or job.get("notice") or state.get("message") or job_state), job_id, state)
            if job_state == "completed" and state.get("busy") is False:
                if state.get("stopped") is True or state.get("ready") is not True:
                    raise MotionFailed("Job completed but controller is stopped/not ready; do not proceed to measurement", job_id, state)
                return state
            if job_state not in ("running", "completed"):
                raise MotionOutcomeUnknown("Unrecognized job state; outcome is UNKNOWN; do not resend", job_id)
            time.sleep(min(poll_interval, max(0.0, deadline - time.monotonic())))

    def execute_preview(self, preview, timeout=600.0, poll_interval=0.25):
        timeout = finite_positive(timeout, "timeout")
        poll_interval = finite_positive(poll_interval, "poll_interval")
        job_id = self.submit_preview(preview)
        return self.wait_for_job(job_id, timeout=timeout, poll_interval=poll_interval)


def main(argv=None):
    parser = argparse.ArgumentParser(description="XY preview client; movement requires --execute")
    parser.add_argument("--base-url", default="http://192.168.126.49:8001")
    parser.add_argument("--cookies", required=True, help="Netscape Cookie file from the design's existing session")
    parser.add_argument("--points", required=True, help="JSON file containing exactly left and right targets")
    parser.add_argument("--coordinate-frame", choices=FRAMES, default="pcb_mm")
    parser.add_argument("--execute", action="store_true", help="submit this preview once and wait; may move real hardware")
    parser.add_argument("--http-timeout", type=float, default=5.0)
    parser.add_argument("--wait-timeout", type=float, default=600.0)
    parser.add_argument("--poll-interval", type=float, default=0.25)
    arguments = parser.parse_args(argv)
    client = None
    try:
        finite_positive(arguments.wait_timeout, "wait_timeout")
        finite_positive(arguments.poll_interval, "poll_interval")
        with open(arguments.points, encoding="utf-8") as handle:
            points = strict_json(handle.read())
        client = ProbeClient(arguments.base_url, arguments.cookies, arguments.http_timeout)
        preview = client.preview_xy(points, arguments.coordinate_frame)
        print(json.dumps({"submitted": False, "preview": preview}, ensure_ascii=False, indent=2), flush=True)
        if arguments.execute:
            job_id = client.submit_preview(preview)
            print(json.dumps({"submitted": True, "job_id": job_id, "state": "accepted"},
                             ensure_ascii=False), flush=True)
            state = client.wait_for_job(job_id, arguments.wait_timeout, arguments.poll_interval)
            print(json.dumps({"submitted": True, "result": state}, ensure_ascii=False, indent=2), flush=True)
        return 0
    except MotionOutcomeUnknown as exc:
        print(json.dumps({"error": str(exc), "outcome": "unknown", "job_id": exc.job_id,
                          "retry_allowed": False}, ensure_ascii=False), file=sys.stderr)
        return 3
    except (ProbeError, ValueError, OSError) as exc:
        print(json.dumps({"error": str(exc), "retry_allowed": False}, ensure_ascii=False), file=sys.stderr)
        return 2
    except KeyboardInterrupt:
        print(json.dumps({"error": "Client interrupted; inspect hardware/status before any further command",
                          "outcome": "unknown" if arguments.execute else "preview_interrupted",
                          "job_id": client.last_submitted_job_id if client else None,
                          "retry_allowed": False}, ensure_ascii=False), file=sys.stderr)
        return 130
    finally:
        if client is not None:
            try:
                client.save_cookies()
            except OSError as exc:
                print("Could not save Cookie file: " + str(exc), file=sys.stderr)


if __name__ == "__main__":
    sys.exit(main())
