#!/usr/bin/env python3
import argparse
import json
from pathlib import Path
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent/'interface'))
from pcb_import import load_pcb,ImportError


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('file',type=Path)
    parser.add_argument('--board-id')
    parser.add_argument('--output',type=Path,help='Write full normalized geometry as JSON')
    args=parser.parse_args()
    try:board=load_pcb(args.file,args.board_id)
    except (ImportError,OSError) as error:
        print(str(error),file=sys.stderr);return 1
    if args.output:
        args.output.write_text(json.dumps(board,ensure_ascii=False,allow_nan=False,indent=2),encoding='utf-8')
    summary=dict(format=board['format'],width_mm=board['dimensions']['width'],height_mm=board['dimensions']['height'],
        pads=len(board['pads']),selectable_top_pads=sum(p['is_allowed'] for p in board['pads'].values()),
        nets=len(board['nets']),metadata=board['metadata'],warnings=board['warnings'])
    print(json.dumps(summary,ensure_ascii=False,indent=2));return 0


if __name__=='__main__':raise SystemExit(main())
