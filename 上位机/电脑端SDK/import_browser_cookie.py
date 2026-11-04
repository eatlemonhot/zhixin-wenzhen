#!/usr/bin/env python3

import argparse
import getpass
import http.cookiejar
import sys
import urllib.parse
import warnings

from probe_client import ProbeClient


def import_session_cookie(base_url, cookie_file, session_value):
    if (not isinstance(session_value, str) or not session_value
            or any(ord(char) < 0x21 or ord(char) > 0x7e or char in '\",;\\'
                   for char in session_value)):
        raise ValueError("session 值为空或含空格/换行等非法字符；请只复制 Value 列")
    client = ProbeClient(base_url, cookie_file)
    parsed = urllib.parse.urlsplit(base_url)
    host = parsed.hostname
    if not host or ":" in host:
        raise ValueError("请使用普通主机名、localhost 或 IPv4 地址")
    try:
        host.encode("ascii")
    except UnicodeEncodeError:
        raise ValueError("请使用 ASCII 主机名或 IPv4 地址") from None
    cookie = http.cookiejar.Cookie(
        version=0, name="session", value=session_value,
        port=None, port_specified=False,
        domain=host.lower(), domain_specified=False, domain_initial_dot=False,
        path="/", path_specified=True, secure=parsed.scheme == "https",
        expires=None, discard=True, comment=None, comment_url=None,
        rest={http.cookiejar.HTTPONLY_ATTR: None}, rfc2109=False)
    client.cookies.set_cookie(cookie)
    client.save_cookies()


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-url", default="http://192.168.126.49:8001")
    parser.add_argument("--cookies", required=True, help="保存到此私有 Netscape Cookie 文件")
    args, unknown = parser.parse_known_args(argv)
    if unknown:
        parser.error("不接受额外参数或明文 session 值；请在隐藏输入提示中粘贴")
    try:
        with warnings.catch_warnings():
            warnings.simplefilter("error", getpass.GetPassWarning)
            value = getpass.getpass("粘贴浏览器 session 的 Value（不会回显），然后回车：")
        import_session_cookie(args.base_url, args.cookies, value)
        print("Cookie 已保存（权限 0600）。未联网、未运行电机；请单独保管此文件。")
        return 0
    except http.cookiejar.LoadError:
        print("Cookie 导入失败：已有 Cookie 文件格式不正确，请改用新的输出文件。", file=sys.stderr)
        return 2
    except (ValueError, OSError) as exc:
        print("Cookie 导入失败：" + str(exc), file=sys.stderr)
        return 2
    except (KeyboardInterrupt, EOFError):
        print("已取消 Cookie 导入；未联网、未运行电机。", file=sys.stderr)
        return 130
    except getpass.GetPassWarning:
        print("无法保证隐藏输入，已取消。请在正常终端重新运行；未读取或保存 session。", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
