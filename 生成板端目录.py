import argparse
import hashlib
import json
from pathlib import Path
import tarfile

ROOT = Path(__file__).resolve().parent


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--pack', type=Path, help='输出板端原目录tar.gz；不覆盖已有文件')
    args = parser.parse_args()
    rows = json.loads((ROOT/'源码清单.json').read_text(encoding='utf-8'))
    bad = [r['path'] for r in rows if not (ROOT/r['path']).is_file() or sha(ROOT/r['path']) != r['sha256']]
    if bad:
        raise SystemExit('校验失败：'+str(bad[:10]))
    print('源码与配套文件校验通过：'+str(len(rows))+'个文件')
    if not args.pack:
        return
    target = args.pack.resolve()
    if target.exists():
        raise FileExistsError('目标归档已存在')
    target.parent.mkdir(parents=True, exist_ok=True)
    with tarfile.open(target, 'w:gz', format=tarfile.PAX_FORMAT) as bundle:
        for row in rows:
            if not row.get('board_path'):
                continue
            path = ROOT/row['path']
            info = bundle.gettarinfo(str(path), arcname=row['board_path'].lstrip('/'))
            info.mode = row['mode']
            info.uid = info.gid = 0
            info.uname = info.gname = 'root'
            with path.open('rb') as stream:
                bundle.addfile(info, stream)
    print('已生成板端原目录归档；未连接板卡或执行部署。')


if __name__ == '__main__':
    main()
