from pathlib import Path
import hashlib
import importlib.util
import json
import math
import os
import threading
import time
import uuid
from contextlib import suppress

ROOT=Path(__file__).resolve().parents[1]

class FlowError(ValueError):pass
class Cancelled(FlowError):pass

def need(value,message):
    if not value:raise FlowError(message)

def finite(x):
    try:return type(x) in (int,float) and math.isfinite(x)
    except OverflowError:return False

def read_json(path):
    for attempt in range(20):
        try:return _read_json_once(path)
        except (PermissionError,FileNotFoundError):
            if attempt==19:raise
            time.sleep(min(.005*(attempt+1),.025))

def _read_json_once(path):
    path=Path(path)
    if os.name!='nt':return json.loads(path.read_text(encoding='utf-8'))
    import ctypes,msvcrt
    from ctypes import wintypes
    kernel=ctypes.WinDLL('kernel32',use_last_error=True)
    create=kernel.CreateFileW
    create.argtypes=[wintypes.LPCWSTR,wintypes.DWORD,wintypes.DWORD,wintypes.LPVOID,wintypes.DWORD,wintypes.DWORD,wintypes.HANDLE]
    create.restype=wintypes.HANDLE
    handle=create(str(path.resolve()),0x80000000,0x7,None,3,0x80,None)
    if handle==ctypes.c_void_p(-1).value:raise ctypes.WinError(ctypes.get_last_error())
    try:fd=msvcrt.open_osfhandle(handle,os.O_RDONLY|os.O_BINARY)
    except BaseException:
        close=kernel.CloseHandle;close.argtypes=[wintypes.HANDLE];close(handle);raise
    with os.fdopen(fd,'r',encoding='utf-8') as stream:return json.load(stream)

def atomic_replace(source,destination):
    if os.name!='nt' or not destination.exists():return source.replace(destination)
    import ctypes
    from ctypes import wintypes
    kernel=ctypes.WinDLL('kernel32',use_last_error=True);replace=kernel.ReplaceFileW
    replace.argtypes=[wintypes.LPCWSTR,wintypes.LPCWSTR,wintypes.LPCWSTR,wintypes.DWORD,wintypes.LPVOID,wintypes.LPVOID]
    replace.restype=wintypes.BOOL
    if not replace(str(destination.resolve()),str(source.resolve()),None,0,None,None):raise ctypes.WinError(ctypes.get_last_error())

def dump(path,data):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    temporary=path.with_name(path.name+'.'+uuid.uuid4().hex+'.tmp')
    try:
        temporary.write_text(json.dumps(data,ensure_ascii=False,indent=2,allow_nan=False)+'\n',encoding='utf-8')
        for attempt in range(20):
            try:
                atomic_replace(temporary,path)
                break
            except PermissionError:
                if attempt==19:raise
                time.sleep(min(.01*(attempt+1),.05))
    finally:
        with suppress(FileNotFoundError,PermissionError):temporary.unlink()

def digest(data):return hashlib.sha256(json.dumps(data,ensure_ascii=False,sort_keys=True,separators=(',',':'),allow_nan=False).encode()).hexdigest()

def load_module(name,path):
    spec=importlib.util.spec_from_file_location(name,path);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

_locks={}
def local_lock(name):return _locks.setdefault(name,threading.RLock())
