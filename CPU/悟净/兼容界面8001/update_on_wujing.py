#!/usr/bin/env python3

import hashlib
import fcntl
import json
import os
import shutil
import subprocess
import time
import urllib.request
from datetime import datetime, timezone, timedelta
from pathlib import Path
from contextlib import contextmanager


def app_file(app, name):
    relative = Path(name)
    if relative.is_absolute() or ".." in relative.parts or not relative.parts:
        raise RuntimeError("应用文件路径不正确：" + name)
    unresolved = app / relative
    if unresolved.is_symlink():
        raise RuntimeError("拒绝修改符号链接：" + name)
    target = unresolved.resolve()
    if app.resolve() not in target.parents or "uploads" in relative.parts:
        raise RuntimeError("应用文件路径越界：" + name)
    return target


def run(command, release, log_name, timeout=45, cwd=None):
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            text=True, timeout=timeout, cwd=cwd)
    (release / log_name).write_text(result.stdout, encoding="utf-8")
    if result.returncode:
        raise RuntimeError("验证失败，查看 " + log_name + "：" + result.stdout[-2000:])
    return result.stdout


def switch_current(base, release):
    temporary = base / ("current_zh_" + release.name)
    temporary.symlink_to(release, target_is_directory=True)
    os.replace(str(temporary), str(base / "current"))


@contextmanager
def exclusive_file(path):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a") as handle:
        try:
            fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            raise RuntimeError("任务或USB仍被占用，未切换网页版本：" + str(path)) from None
        yield


@contextmanager
def deployment_locks(previous, usb_lock="/tmp/wujing_zdt_ch340.lock"):
    with exclusive_file(previous / "app/instance/motor_jobs/active.lock"), exclusive_file(usb_lock):
        yield


def main():
    release = Path(__file__).resolve().parent
    base = release.parent.parent
    if str(base) != "/root/fdw_circuitscout" or release.parent.name != "releases":
        raise RuntimeError("更新目录不属于网页部署目录")
    previous = (base / "current").resolve(strict=True)
    if previous.parent != release.parent or previous == release:
        raise RuntimeError("旧版本路径不正确")
    manifest = json.loads((release / "patch_manifest.json").read_text(encoding="utf-8"))
    if any((release / name).exists() or (release / name).is_symlink()
           for name in ("app", "venv", "fixtures")):
        raise RuntimeError("版本目录已有内容，请换一个新的版本名：" + release.name)
    for name, digest in manifest.items():
        source = (release / "patch" / name).resolve(strict=True)
        if (release / "patch") not in source.parents:
            raise RuntimeError("增量文件路径超出目录")
        if hashlib.sha256(source.read_bytes()).hexdigest() != digest:
            raise RuntimeError("增量文件校验失败：" + name)
    with deployment_locks(previous):
        update_release(base, release, previous, manifest)


def update_release(base, release, previous, manifest):
    shutil.copytree(str(previous / "app"), str(release / "app"), symlinks=True)
    (release / "venv").symlink_to((previous / "venv").resolve(strict=True), target_is_directory=True)
    shutil.copytree(str(previous / "fixtures"), str(release / "fixtures"), symlinks=True)
    delete_path = release / "delete_manifest.json"
    removed = json.loads(delete_path.read_text(encoding="utf-8")) if delete_path.exists() else []
    if not isinstance(removed, list) or not all(isinstance(name, str) for name in removed):
        raise RuntimeError("删除清单格式不正确")
    for name in removed:
        target = app_file(release / "app", name)
        if target.is_file():
            target.unlink()
        elif target.exists():
            raise RuntimeError("删除清单只允许普通文件：" + name)
    for name in manifest:
        target = release / name if name == "smoke_check.py" else app_file(release / "app", name)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(str(release / "patch" / name), str(target))
    shutil.copy2(str(Path(__file__).resolve()), str(release / "app/update_on_wujing.py"))
    uploads = release / "app/interface/static/uploads"
    if not uploads.is_symlink() or uploads.resolve() != base / "data/uploads":
        raise RuntimeError("上传目录链接不正确，拒绝切换")
    python = str(release / "venv/bin/python")
    run([python, "-m", "compileall", "-q", str(release / "app/interface"),
         str(release / "smoke_check.py")], release, "compile_check.log", cwd=str(release / "app"))
    run([python, "-B", str(release / "app/test_project_c_web.py")], release, "project_c_tests.log",
        cwd=str(release / "app"))
    with exclusive_file(release / "app/instance/motor_jobs/active.lock"):
        activate_release(base, release, previous, manifest, removed, uploads, python)


def activate_release(base, release, previous, manifest, removed, uploads, python):
    switched = False
    try:
        switch_current(base, release)
        switched = True
        run(["systemctl", "restart", "fdw-circuitscout.service"], release, "restart_service.log")
        for attempt in range(20):
            try:
                with urllib.request.urlopen("http://127.0.0.1:8001/", timeout=2) as response:
                    html = response.read().decode("utf-8")
                    if response.status == 200 and 'lang="zh-CN"' in html and "CircuitScout · 悟净" in html:
                        break
            except OSError:
                pass
            time.sleep(0.5)
        else:
            raise RuntimeError("中文网页未就绪")
        run([python, "-B", str(release / "smoke_check.py"), "--skip-upload"], release,
            "smoke_check.log", cwd=str(release / "app"))
        result = {
            "updated_at": datetime.now(timezone(timedelta(hours=8))).isoformat(),
            "release": str(release), "previous_release": str(previous),
            "language": "zh-CN", "file_sha256": manifest,
            "removed_files": removed,
            "service_active": run(["systemctl", "is-active", "fdw-circuitscout.service"], release, "active.log").strip(),
            "service_enabled": run(["systemctl", "is-enabled", "fdw-circuitscout.service"], release, "enabled.log").strip(),
            "smoke": json.loads((release / "smoke_check_result.json").read_text(encoding="utf-8")),
            "upload_directory": str(uploads.resolve()), "dependencies_reused": True,
            "updater_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        }
        (release / "update_result.json").write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
        print("FDW_WEB_UPDATE_RESULT=" + json.dumps(result, ensure_ascii=False), flush=True)
    except Exception:
        if switched:
            switch_current(base, previous)
            run(["systemctl", "restart", "fdw-circuitscout.service"], release, "rollback_service.log")
        raise


if __name__ == "__main__":
    main()
