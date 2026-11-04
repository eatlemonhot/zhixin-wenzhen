import hashlib
import json
import math
from pathlib import Path

MAX_DOCUMENT_BYTES = 32 * 1024 * 1024
MAX_BATCH_BYTES = 64 * 1024 * 1024
MAX_CONDITIONS = 256


class ReceiveError(ValueError):
    def __init__(self, code, detail=''):
        self.code = code
        super().__init__(code + (': ' + detail if detail else ''))


def need(ok, code, detail=''):
    if not ok:
        raise ReceiveError(code, detail)


def finite(x):
    try:
        return type(x) in (int, float) and math.isfinite(x)
    except OverflowError:
        return False


def text_id(x):
    return isinstance(x, str) and 0 < len(x) <= 256


def canonical(x):
    return json.dumps(x, ensure_ascii=False, sort_keys=True, separators=(',', ':'), allow_nan=False).encode('utf-8')


def digest(x):
    return hashlib.sha256(canonical(x)).hexdigest()


def strict_json(raw):
    need(len(raw) <= MAX_DOCUMENT_BYTES, 'DOCUMENT_TOO_LARGE')
    def pairs(items):
        out = {}
        for k, v in items:
            need(k not in out, 'DUPLICATE_JSON_KEY', k)
            out[k] = v
        return out
    def bad_constant(value):
        raise ReceiveError('NONFINITE_JSON', value)
    def floating(value):
        out = float(value)
        need(math.isfinite(out), 'NONFINITE_JSON', value)
        return out
    try:
        obj = json.loads(raw.decode('utf-8-sig'), object_pairs_hook=pairs,
                         parse_constant=bad_constant, parse_float=floating)
        need(isinstance(obj, dict), 'JSON_OBJECT_REQUIRED')
        return obj
    except (UnicodeError, json.JSONDecodeError, RecursionError) as exc:
        raise ReceiveError('INVALID_JSON', str(exc))


def read_document(path):
    with Path(path).open('rb') as stream:
        data = stream.read(MAX_DOCUMENT_BYTES + 1)
    return strict_json(data)


def write_json(path, value):
    with Path(path).open('x', encoding='utf-8') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2, allow_nan=False)
        stream.write('\n')
