import argparse
import hashlib
import shutil
import sqlite3
import sys
import time
from pathlib import Path
from .common import ReceiveError, read_document, write_json, need, canonical, MAX_BATCH_BYTES
from .service import receive_results
from .transport import decode_file, receive_socket


def main(argv=None):
    parser = argparse.ArgumentParser(description='PS/CPU receive and align native PL LSQ F6. No motor, hardware configuration or NPU calls.')
    sub = parser.add_subparsers(dest='command', required=True)
    for name in ('import', 'receive'):
        p = sub.add_parser(name)
        p.add_argument('--out', type=Path, required=True, help='New output directory; never overwrite prior results.')
        p.add_argument('--ledger', type=Path, required=True, help='Reuse one ledger across fit and independent confirmation.')
        p.add_argument('--requests', type=Path, help='CPU-owned request index, optional for archive-only import.')
        p.add_argument('--framing', choices=['json','ndjson'], default='json')
        if name == 'import':
            p.add_argument('--input', type=Path, required=True)
        else:
            p.add_argument('--host', required=True)
            p.add_argument('--port', type=int, required=True)
            p.add_argument('--listen', action='store_true')
            p.add_argument('--timeout-s', type=float, default=30.)
            p.add_argument('--messages', type=int, default=1, help='Expected NDJSON message count; one message may be a session.')
    args = parser.parse_args(argv)
    if args.out.exists():
        print('REJECTED OUTPUT_EXISTS', args.out)
        return 2
    args.out.mkdir(parents=True, exist_ok=False)
    started = time.perf_counter()
    try:
        requests = read_document(args.requests) if args.requests else None
        if args.command == 'import':
            need(args.input.stat().st_size <= MAX_BATCH_BYTES, 'INPUT_TOO_LARGE')
            source = args.out/'received_input.bin'
            shutil.copyfile(str(args.input), str(source))
            documents = decode_file(source, args.framing)
        else:
            source = args.out/'received_input.bin'
            with source.open('xb') as wire:
                documents = receive_socket(args.host, args.port, args.timeout_s, args.framing,
                                           args.messages, wire, args.listen,
                                           lambda address:print('LISTENING', address, flush=True))
        receive_done = time.perf_counter()
        aligned = receive_results(documents, args.ledger, requests)
        results, matrix, binary = aligned['full_results'], aligned['observations'], aligned['aligned_f6_le']
        repeats = aligned['retransmissions_not_new_measurements']
        processing_done = time.perf_counter()
        write_json(args.out/'full_results.json', dict(schema='zhixin.pl-feature-session/v1', conditions=results))
        write_json(args.out/'observations.json', matrix)
        with (args.out/'aligned_f6.f32').open('xb') as stream:
            stream.write(binary)
        if requests:
            write_json(args.out/'cpu_requests.json', requests)
        report = dict(schema='cpu-pl-receive-report/1.0', received_and_aligned=True, condition_count=len(results),
                      feature_contract=matrix['feature_contract'], supported_Rs_ohm=[100,10000], matrix_shape=matrix['shape'],
                      complete_retransmissions_not_new_measurements=repeats, source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                      full_results_sha256=hashlib.sha256((args.out/'full_results.json').read_bytes()).hexdigest(),
                      f32_sha256=hashlib.sha256(binary).hexdigest(), source_mode=args.command,
                      timing_seconds=dict(receive_or_read=receive_done-started, validate_align_ledger=processing_done-receive_done,
                                          total=time.perf_counter()-started),
                      model_usable=False, reason='当前输出为接收、校验和对齐后的PL F6特征。',
                      hardware_measurement_triggered=False, motor_command_sent=False, npu_executed=False)
        write_json(args.out/'receive_report.json', report)
        print('RECEIVED_AND_ALIGNED', len(results), args.out/'observations.json')
        print('MODEL_PENDING: 已输出对齐的PL F6特征。')
        return 0
    except (ReceiveError, OSError, KeyError, TypeError, ValueError, OverflowError, sqlite3.Error) as exc:
        code = exc.code if isinstance(exc, ReceiveError) else 'INVALID_INPUT_OR_IO'
        write_json(args.out/'rejection.json', dict(received_and_aligned=False, error=dict(code=code, detail=str(exc)),
                                                model_usable=False, npu_executed=False))
        print('REJECTED', code, str(exc))
        return 2


if __name__ == '__main__':
    raise SystemExit(main())
