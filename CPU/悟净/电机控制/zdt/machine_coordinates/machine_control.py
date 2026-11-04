"""Millimetre coordinates with per-axis references and a shared X collision bound.

X values are each arm's inward distance from its outer reference, and Y values
are distance toward the back from the front reference. These are carriage
coordinates; probe-tip offsets and a PCB coordinate transform are not calibrated.
"""
import argparse
import json
import math

from coordinate_setup import Session, AXES, ROOT, DEG_PER_MM

COORDINATES = ROOT / 'coordinates.json'


def local_mm(address, sample):
    return AXES[address]['positive_mm_sign'] * sample['position_deg'] / DEG_PER_MM


def bounded_target(coordinates, current, address, requested):
    if isinstance(requested, bool) or not isinstance(requested, (int, float)) or not math.isfinite(requested):
        raise ValueError('Target must be a finite millimetre value')
    if address not in AXES:
        raise ValueError('Motor address must be 1, 2, 3 or 4')
    axis = coordinates['axes'][str(address)]
    wire_deg = round(requested * DEG_PER_MM * 10) / 10
    wire_mm = wire_deg / DEG_PER_MM
    if (not axis['soft_min_mm'] <= requested <= axis['soft_max_mm']
            or not axis['soft_min_mm'] <= wire_mm <= axis['soft_max_mm']):
        raise ValueError(f'Target outside {axis["soft_min_mm"]} .. {axis["soft_max_mm"]} mm')
    if address in (1, 2):
        other = 3 - address
        total = wire_mm + current[str(other)]
        if total > coordinates['joint_x_limit']['max_combined_inward_mm']:
            raise ValueError('Requested move would violate the two-arm X clearance')
    return wire_mm


def load_coordinates():
    coordinates = json.loads(COORDINATES.read_text(encoding='utf-8'))
    if not coordinates['valid'] or set(coordinates['axes']) != {'1', '2', '3', '4'}:
        raise RuntimeError('Complete verified coordinates are required')
    return coordinates


def read_positions(session, coordinates):
    samples = {str(a): session.verify_reference(a, coordinates['axes'][str(a)]) for a in AXES}
    return {a: local_mm(int(a), sample) for a, sample in samples.items()}, samples


def move_to(session, coordinates, address, requested):
    current, _ = read_positions(session, coordinates)
    target = bounded_target(coordinates, current, address, requested)
    initial = current[str(address)]
    segments = []
    while abs(target - current[str(address)]) > 0.05:
        remaining = target - current[str(address)]
        distance = max(-50, min(50, remaining))
        result = session.move_relative(address,
            AXES[address]['positive_mm_sign'] * distance * DEG_PER_MM, maximum_mm=50)
        segments.append(result)
        sample = session.verify_reference(address, coordinates['axes'][str(address)])
        previous = current[str(address)]
        current[str(address)] = local_mm(address, sample)
        if abs(current[str(address)] - previous) < min(0.02, abs(distance) / 2):
            raise RuntimeError('Coordinate move made no measured progress')
        if len(segments) > 8:
            raise RuntimeError('Coordinate move exceeded segment bound')
    return dict(address=address, requested_mm=requested, target_mm=target,
        initial_mm=initial, final_mm=current[str(address)], segments=segments)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['status', 'move'])
    parser.add_argument('motor', type=int, nargs='?', choices=[1, 2, 3, 4])
    parser.add_argument('millimetres', type=float, nargs='?')
    parser.add_argument('--execute', action='store_true')
    args = parser.parse_args()
    coordinates = load_coordinates()
    if args.action == 'move' and (args.motor is None or args.millimetres is None):
        parser.error('move requires a motor address and target millimetres')
    if args.action == 'move':
        parked = {a: axis['soft_min_mm'] for a, axis in coordinates['axes'].items()}
        bounded_target(coordinates, parked, args.motor, args.millimetres)
    if not args.execute:
        print('No serial access. Add --execute to read live coordinates or move.')
        return 0
    session = Session('control_' + args.action)
    try:
        session.initialize()
        current, samples = read_positions(session, coordinates)
        if args.action == 'status':
            session.report.update(positions_mm=current, samples=samples)
        else:
            session.report['movement'] = move_to(session, coordinates, args.motor, args.millimetres)
            session.report['positions_mm'], _ = read_positions(session, coordinates)
    except (Exception, KeyboardInterrupt) as exc:
        session.report['error'] = f'{type(exc).__name__}: {exc}'
    finally:
        session.close()
    print(json.dumps({k:v for k,v in session.report.items()
        if k in ('passed', 'positions_mm', 'error', 'cleanup_errors', 'summary_file')}, indent=2))
    return 0 if session.report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
