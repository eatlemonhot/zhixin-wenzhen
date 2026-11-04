import hashlib
import io
from pathlib import Path, PurePosixPath
import stat
import zipfile
from .model import ImportError

MAX_FILE_BYTES=16*1024*1024
MAX_EXPANDED_BYTES=64*1024*1024


def text(raw):
    try:
        return raw.decode('utf-16') if raw.startswith((b'\xff\xfe',b'\xfe\xff')) else raw.decode('utf-8-sig')
    except UnicodeError:raise ImportError('文件不是UTF-8/UTF-16文本，请重新导出工程。') from None


def load_bytes(raw,filename='',board_id=None):
    if not raw or len(raw)>MAX_FILE_BYTES:raise ImportError('PCB文件为空或超过16 MB。')
    try:
        if raw.startswith(b'PK'):
            with zipfile.ZipFile(io.BytesIO(raw)) as z:
                infos=z.infolist()
                if len(infos)>2048 or sum(i.file_size for i in infos)>MAX_EXPANDED_BYTES:
                    raise ImportError('工程压缩包解压大小超过64 MB或条目过多。')
                names=set()
                for info in infos:
                    name=info.filename;parts=PurePosixPath(name)
                    if (parts.is_absolute() or '..' in parts.parts or '\\' in name or
                            stat.S_ISLNK(info.external_attr>>16) or info.flag_bits&1):
                        raise ImportError('工程压缩包路径或加密方式不支持。')
                    if name.casefold() in names:raise ImportError('工程压缩包中有重复文件名。')
                    names.add(name.casefold())
                logs=[i for i in infos if i.filename.lower().endswith('.epru')]
                if any(PurePosixPath(i.filename).name=='project2.json' for i in infos):
                    if not logs:raise ImportError('V3工程缺少EPRU文档。')
                    from .easyeda_pro import parse
                    value=parse([text(z.read(i)) for i in logs],board_id)
                else:
                    raise ImportError('请选择嘉立创专业版V3原生.epro2工程，压缩包缺少project2.json。')
        elif str(filename).lower().endswith('.epru'):
            from .easyeda_pro import parse
            value=parse([text(raw)],board_id)
        else:
            raise ImportError('仅支持嘉立创专业版V3 .epro2/.epru原生工程。')
    except ImportError:raise
    except (ValueError,KeyError,TypeError,IndexError,OverflowError,RecursionError,zipfile.BadZipFile) as exc:
        raise ImportError('工程结构不支持或文件损坏：%s'%type(exc).__name__) from None
    value['dimensions']['layout_id']=hashlib.sha256(raw+(board_id or '').encode()).hexdigest()
    return value


def load_pcb(path,board_id=None):
    path=Path(path)
    if path.stat().st_size>MAX_FILE_BYTES:raise ImportError('PCB文件超过16 MB。')
    return load_bytes(path.read_bytes(),path.name,board_id)
