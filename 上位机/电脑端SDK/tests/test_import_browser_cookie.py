import contextlib
import getpass
import http.cookiejar
import io
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock
import urllib.request
import warnings

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import import_browser_cookie
from probe_client import ProbeClient


SECRET = ".private-test-cookie.signature"


class CookieImportTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.path = Path(self.directory.name) / "session.cookies.txt"
        patcher = mock.patch.object(urllib.request.OpenerDirector, "open",
                                    side_effect=AssertionError("Cookie import must not make HTTP requests"))
        self.network = patcher.start()
        self.addCleanup(patcher.stop)

    def test_host_only_cookie_round_trip_for_localhost_ipv4_and_hostnames(self):
        for index, host in enumerate(("localhost", "127.0.0.1", "192.168.126.49", "wujing.example")):
            with self.subTest(host=host):
                path = Path(self.directory.name) / (str(index) + ".cookies")
                url = "http://" + host + ":8001"
                import_browser_cookie.import_session_cookie(url, path, SECRET)
                client = ProbeClient(url, path)
                cookies = list(client.cookies)
                self.assertEqual(len(cookies), 1)
                cookie = cookies[0]
                self.assertEqual(cookie.domain, host)
                self.assertFalse(cookie.domain_specified)
                self.assertFalse(cookie.domain_initial_dot)
                self.assertEqual(cookie.path, "/")
                self.assertIsNone(cookie.expires)
                self.assertTrue(cookie.discard)
                self.assertTrue(cookie.has_nonstandard_attr(http.cookiejar.HTTPONLY_ATTR))
                self.assertIn("#HttpOnly_" + host + "\tFALSE\t/\t", path.read_text())
                self.assertEqual(os.stat(str(path)).st_mode & 0o777, 0o600)
                request = urllib.request.Request(url + "/workbench/design")
                client.cookies.add_cookie_header(request)
                self.assertEqual(request.get_header("Cookie"), "session=" + SECRET)
                subdomain = urllib.request.Request("http://sub." + host + ":8001/workbench/design")
                client.cookies.add_cookie_header(subdomain)
                self.assertIsNone(subdomain.get_header("Cookie"))
        self.network.assert_not_called()

    def test_https_cookie_is_secure_and_is_not_sent_to_http(self):
        import_browser_cookie.import_session_cookie("https://wujing.example", self.path, SECRET)
        client = ProbeClient("https://wujing.example", self.path)
        self.assertTrue(next(iter(client.cookies)).secure)
        request = urllib.request.Request("http://wujing.example/workbench/design")
        client.cookies.add_cookie_header(request)
        self.assertIsNone(request.get_header("Cookie"))

    def test_cli_uses_getpass_and_never_prints_the_cookie_value(self):
        with mock.patch.object(import_browser_cookie.getpass, "getpass", return_value=SECRET) as prompt:
            with contextlib.redirect_stdout(io.StringIO()) as output, contextlib.redirect_stderr(io.StringIO()) as errors:
                code = import_browser_cookie.main(["--base-url", "http://localhost:8001",
                                                  "--cookies", str(self.path)])
        self.assertEqual(code, 0)
        prompt.assert_called_once()
        self.assertNotIn(SECRET, output.getvalue() + errors.getvalue())
        self.assertIn("0600", output.getvalue())
        self.network.assert_not_called()

    def test_getpass_echo_fallback_is_refused_before_reading(self):
        def unsafe_prompt(_prompt):
            warnings.warn("Password input may be echoed", getpass.GetPassWarning)
            raise AssertionError("Input fallback must never be reached")
        with mock.patch.object(import_browser_cookie.getpass, "getpass", side_effect=unsafe_prompt):
            with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()) as errors:
                code = import_browser_cookie.main(["--cookies", str(self.path)])
        self.assertEqual(code, 2)
        self.assertFalse(self.path.exists())
        self.assertIn("无法保证隐藏输入", errors.getvalue())

    def test_no_plaintext_cli_argument_is_supported_or_echoed(self):
        with mock.patch.object(import_browser_cookie.getpass, "getpass") as prompt:
            with contextlib.redirect_stderr(io.StringIO()) as errors:
                with self.assertRaises(SystemExit) as caught:
                    import_browser_cookie.main(["--cookies", str(self.path), "--session", SECRET])
        self.assertEqual(caught.exception.code, 2)
        self.assertNotIn(SECRET, errors.getvalue())
        prompt.assert_not_called()
        self.assertFalse(self.path.exists())

    def test_invalid_cookie_does_not_echo_value_or_create_file(self):
        invalid = SECRET + "\nCookie: another=value"
        with mock.patch.object(import_browser_cookie.getpass, "getpass", return_value=invalid):
            with contextlib.redirect_stderr(io.StringIO()) as errors:
                code = import_browser_cookie.main(["--cookies", str(self.path)])
        self.assertEqual(code, 2)
        self.assertNotIn(SECRET, errors.getvalue())
        self.assertNotIn("another=value", errors.getvalue())
        self.assertFalse(self.path.exists())

    def test_reimport_replaces_value_and_fixes_file_permissions(self):
        import_browser_cookie.import_session_cookie("http://127.0.0.1:8001", self.path, "old.value")
        os.chmod(str(self.path), 0o644)
        import_browser_cookie.import_session_cookie("http://127.0.0.1:8001", self.path, SECRET)
        self.assertEqual(os.stat(str(self.path)).st_mode & 0o777, 0o600)
        client = ProbeClient("http://127.0.0.1:8001", self.path)
        self.assertEqual([cookie.value for cookie in client.cookies], [SECRET])

    def test_existing_corrupt_cookie_file_is_not_echoed_in_error(self):
        self.path.write_text("# Netscape HTTP Cookie File\n" + SECRET + "\n")
        with mock.patch.object(import_browser_cookie.getpass, "getpass", return_value="new.value"):
            with contextlib.redirect_stdout(io.StringIO()) as output, contextlib.redirect_stderr(io.StringIO()) as errors:
                code = import_browser_cookie.main(["--cookies", str(self.path)])
        self.assertEqual(code, 2)
        self.assertNotIn(SECRET, output.getvalue() + errors.getvalue())
        self.assertNotIn("new.value", output.getvalue() + errors.getvalue())


if __name__ == "__main__":
    unittest.main()
