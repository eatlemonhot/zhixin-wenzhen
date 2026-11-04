import argparse
import json
import math
from pathlib import Path

import numpy as np


PAIRS = {'left': (2, 3), 'right': (1, 4)}
AXES = (1, 2, 3, 4)


def resolve_raw(summary_path, summary, raw=None):
    if raw is not None:
        path = Path(raw).expanduser()
        if not path.is_file():
            raise FileNotFoundError('Requested raw log does not exist: %s' % path)
        return path.resolve()
    recorded = str(summary.get('raw_serial_file', ''))
    basename = recorded.replace('\\', '/').rsplit('/', 1)[-1]
    candidates = []
    if recorded:
        candidates.extend((Path(recorded), summary_path.parent / basename,
                           summary_path.parent / recorded))
    candidates.append(summary_path.with_name(summary_path.stem.replace('_summary', '_serial') + '.jsonl'))
    for candidate in candidates:
        if candidate.is_file():
            return candidate.resolve()
    raise FileNotFoundError('Raw log was not found beside the summary; specify --raw')


def load_feedback(path, summary):
    rows = {a: [] for a in AXES}
    statistics = dict(lines=0, invalid_json_lines=0, invalid_feedback_rows=0,
                      feedback_rows=0, duplicate_axis_timestamps=0)
    stream_start = summary.get('circle_stream_start_monotonic_s')
    with Path(path).open(encoding='utf-8-sig') as source:
        for line in source:
            statistics['lines'] += 1
            try:
                event = json.loads(line)
            except json.JSONDecodeError:
                statistics['invalid_json_lines'] += 1
                continue
            sample = event.get('circle_feedback')
            if not isinstance(sample, dict):
                continue
            try:
                address = int(sample['address'])
                elapsed = sample.get('stream_elapsed_s')
                if elapsed is None and stream_start is not None:
                    elapsed = sample.get('monotonic_s', event.get('monotonic_s')) - stream_start
                position, speed = float(sample['position_mm']), float(sample['speed_rpm'])
                elapsed = float(elapsed)
                if address not in AXES or not all(math.isfinite(v) for v in (elapsed, position, speed)):
                    raise ValueError('Invalid feedback fields')
            except (KeyError, TypeError, ValueError):
                statistics['invalid_feedback_rows'] += 1
                continue
            rows[address].append((elapsed, position, speed))
            statistics['feedback_rows'] += 1
    result = {}
    for a, items in rows.items():
        unique = {row[0]: row for row in items}
        statistics['duplicate_axis_timestamps'] += len(items) - len(unique)
        if len(unique) < 3:
            raise ValueError('At least three valid circle-feedback samples are required for axis %s' % a)
        result[a] = np.asarray([unique[t] for t in sorted(unique)], dtype=float)
    return result, statistics


def interpolate_pair(feedback, axes, step_s=0.02, extra_times=()):
    if not math.isfinite(step_s) or step_s <= 0:
        raise ValueError('Interpolation interval must be finite and positive')
    x, y = (feedback[a] for a in axes)
    start, end = max(x[0, 0], y[0, 0]), min(x[-1, 0], y[-1, 0])
    if end <= start:
        raise ValueError('The two axes do not have overlapping feedback timestamps')
    count = max(1, math.ceil((end - start) / step_s))
    t = np.unique(np.concatenate((np.linspace(start, end, count + 1),
                                 [value for value in extra_times if start <= value <= end])))
    # Interpolate the coordinates and signed component velocities separately.
    # A fixed motor-direction sign would not change the resulting speed norm.
    return dict(time=t, x=np.interp(t, x[:, 0], x[:, 1]), y=np.interp(t, y[:, 0], y[:, 1]),
                vx=np.interp(t, x[:, 0], x[:, 2]) * (40 / 60),
                vy=np.interp(t, y[:, 0], y[:, 2]) * (40 / 60))


def fit_circle(x, y):
    if len(x) < 6:
        return dict(available=False, reason='Fewer than six interpolated points')
    matrix = np.column_stack((2 * x, 2 * y, np.ones_like(x)))
    coefficients, _, rank, _ = np.linalg.lstsq(matrix, x * x + y * y, rcond=None)
    cx, cy, offset = coefficients
    radius2 = offset + cx * cx + cy * cy
    if rank < 3 or radius2 <= 0:
        return dict(available=False, reason='Circle fit was rank deficient or nonphysical')
    radius = math.sqrt(radius2)
    residual = np.hypot(x - cx, y - cy) - radius
    return dict(available=True, method='algebraic_least_squares', center_x_mm=float(cx),
                center_y_mm=float(cy), radius_mm=radius,
                radial_rms_mm=float(np.sqrt(np.mean(residual * residual))),
                radial_max_abs_mm=float(np.max(np.abs(residual))))


def window_metrics(pair, start, end, cx, cy, radius, low_speed):
    mask = (pair['time'] >= start) & (pair['time'] <= end)
    if np.count_nonzero(mask) < 6:
        return dict(available=False, requested_window_s=[start, end],
                    reason='Insufficient overlapping timestamps in this window')
    t, x, y = (pair[key][mask] for key in ('time', 'x', 'y'))
    distances = np.hypot(x - cx, y - cy)
    error = distances - radius
    speed = np.hypot(pair['vx'][mask], pair['vy'][mask])
    return dict(available=True, requested_window_s=[start, end],
                analyzed_window_s=[float(t[0]), float(t[-1])],
                interpolation_points=len(t), duration_covered_s=float(t[-1] - t[0]),
                requested_duration_s=end - start,
                fixed_circle=dict(center_x_mm=cx, center_y_mm=cy, radius_mm=radius,
                    radial_error_mean_mm=float(np.mean(error)),
                    radial_error_rms_mm=float(np.sqrt(np.mean(error * error))),
                    radial_error_min_mm=float(np.min(error)), radial_error_max_mm=float(np.max(error)),
                    radial_error_max_abs_mm=float(np.max(np.abs(error))),
                    radial_error_abs_p95_mm=float(np.percentile(np.abs(error), 95))),
                fitted_circle=fit_circle(x, y),
                driver_xy_speed_mm_s=dict(minimum=float(np.min(speed)), maximum=float(np.max(speed)),
                    median=float(np.median(speed)), low_speed_threshold=low_speed,
                    low_speed_sample_fraction=float(np.mean(speed < low_speed)),
                    low_speed_interpolated_samples=int(np.count_nonzero(speed < low_speed))),
                end_to_start_feedback_distance_mm=float(math.hypot(x[-1] - x[0], y[-1] - y[0])))


def _axis_statistics(data, start, end):
    times = data[:, 0]
    circular = times[(times >= start) & (times <= end)]
    return dict(samples=len(data), first_elapsed_s=float(times[0]), last_elapsed_s=float(times[-1]),
                maximum_sample_gap_s=float(np.max(np.diff(times))),
                median_sample_gap_s=float(np.median(np.diff(times))),
                circle_samples=len(circular),
                circle_maximum_sample_gap_s=(float(np.max(np.diff(circular))) if len(circular) > 1 else None))


def create_plot(path_prefix, pairs, geometry, report):
    try:
        import matplotlib
    except ModuleNotFoundError:
        report['plot_renderer'] = 'Pillow and SVG; matplotlib is not installed in the existing runtime'
        return _fallback_plot(path_prefix, pairs, geometry, report)
    report['plot_renderer'] = 'matplotlib Agg'
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt

    cx, cy, radius = (geometry[key] for key in ('center_x_mm', 'center_y_mm', 'radius_mm'))
    start, end = geometry['circle_start_s'], geometry['circle_end_s']
    colors = {'left': '#1976a3', 'right': '#d7672c'}
    fig, axes = plt.subplots(2, 2, figsize=(12, 9), constrained_layout=True)
    angle = np.linspace(0, 2 * np.pi, 361)
    for column, (name, pair) in enumerate(pairs.items()):
        ax = axes[0, column]
        t, x, y = pair['time'], pair['x'], pair['y']
        ax.plot(cx + radius * np.cos(angle), cy + radius * np.sin(angle),
                '--', color='0.35', linewidth=1.4, label='Planned circle')
        for mask, color, label in ((t < start, '#bf8d21', 'Entry feedback'),
                                  ((t >= start) & (t <= end), colors[name], 'Circle feedback'),
                                  (t > end, '#8753a0', 'Exit feedback')):
            ax.plot(x[mask], y[mask], color=color, linewidth=1.2, label=label)
        for time_value, marker, color, label in ((start, '^', '#208440', 'Circle entry'),
                                                 (end, 'v', '#b42b72', 'Circle exit')):
            if t[0] <= time_value <= t[-1]:
                ax.scatter(np.interp(time_value, t, x), np.interp(time_value, t, y),
                           s=52, marker=marker, color=color, edgecolors='white', linewidths=0.6,
                           label=label, zorder=5)
        ax.scatter(x[0], y[0], marker='s', color='black', s=20, label='Start park', zorder=4)
        x_axis, y_axis = PAIRS[name]
        ax.set(title='%s arm: motors %s / %s' % (name.capitalize(), x_axis, y_axis),
               xlabel='Independent inward X (mm)', ylabel='Front-to-back Y (mm)')
        ax.set_aspect('equal', adjustable='box')
        ax.grid(alpha=0.2)
        ax.legend(fontsize=7, loc='upper left')
        mask = (t >= start) & (t <= end)
        radial = np.hypot(x[mask] - cx, y[mask] - cy) - radius
        axes[1, 0].plot(t[mask], radial, color=colors[name], label=name.capitalize(), linewidth=1)
        axes[1, 1].plot(t[mask], np.hypot(pair['vx'][mask], pair['vy'][mask]),
                        color=colors[name], label=name.capitalize(), linewidth=1)
    axes[1, 0].axhline(0, color='0.4', linewidth=0.8, linestyle='--')
    axes[1, 0].set(title='Fixed-center radial error', xlabel='Stream time (s)',
                   ylabel='Radius minus %.3g mm (mm)' % radius)
    axes[1, 1].axhline(report['nominal_circle_speed_mm_s'], color='0.4', linestyle='--',
                      linewidth=0.8, label='Nominal')
    axes[1, 1].set(title='XY speed from driver feedback', xlabel='Stream time (s)', ylabel='XY speed (mm/s)')
    for ax in axes[1]:
        ax.grid(alpha=0.2)
        ax.legend(fontsize=8)
    fig.suptitle('Mirrored circles — driver feedback aligned by per-axis timestamps\n'
                 'Linear interpolation; independent carriage coordinates; external accuracy not measured',
                 fontsize=12)
    png, svg = Path(str(path_prefix) + '.png'), Path(str(path_prefix) + '.svg')
    fig.savefig(png, dpi=180)
    fig.savefig(svg)
    plt.close(fig)
    return str(png.resolve()), str(svg.resolve())


def _fallback_plot(path_prefix, pairs, geometry, report):
    from html import escape
    from PIL import Image, ImageDraw, ImageFont
    image = Image.new('RGB', (1500, 1120), 'white')
    draw = ImageDraw.Draw(image)
    svg = ['<svg xmlns="http://www.w3.org/2000/svg" width="1500" height="1120" viewBox="0 0 1500 1120">',
           '<rect width="1500" height="1120" fill="white"/>']
    fonts = {}
    def text(x, y, label, size=20, color='#263746'):
        if size not in fonts:
            try:
                fonts[size] = ImageFont.truetype('C:/Windows/Fonts/segoeui.ttf', size)
            except OSError:
                fonts[size] = ImageFont.load_default()
        draw.text((x, y), str(label), font=fonts[size], fill=color)
        svg.append('<text x="%s" y="%s" dominant-baseline="hanging" font-family="Segoe UI,Arial,sans-serif" '
                   'font-size="%s" fill="%s">%s</text>' % (x, y + 3, size, color, escape(str(label))))
    def line(points, color, width=2):
        points = [(float(x), float(y)) for x, y in points]
        if len(points) < 2:
            return
        draw.line(points, fill=color, width=width)
        svg.append('<polyline points="%s" fill="none" stroke="%s" stroke-width="%s"/>' %
                   (' '.join('%.2f,%.2f' % point for point in points), color, width))
    def marker(point, color, triangle=False):
        x, y = point
        if triangle:
            vertices = [(x, y - 7), (x - 7, y + 6), (x + 7, y + 6)]
            draw.polygon(vertices, fill=color)
            svg.append('<polygon points="%s" fill="%s"/>' %
                       (' '.join('%.2f,%.2f' % p for p in vertices), color))
        else:
            draw.ellipse((x - 5, y - 5, x + 5, y + 5), fill=color)
            svg.append('<circle cx="%.2f" cy="%.2f" r="5" fill="%s"/>' % (x, y, color))
    def panel(box, limits, title, xlabel, ylabel):
        x0, y0, x1, y1 = box
        lo_x, hi_x, lo_y, hi_y = limits
        def transform(x, y):
            return (x0 + (x - lo_x) / (hi_x - lo_x) * (x1 - x0),
                    y1 - (y - lo_y) / (hi_y - lo_y) * (y1 - y0))
        text(x0, y0 - 41, title, 24)
        text(x0, y0 - 14, ylabel, 15, '#607080')
        for fraction in np.linspace(0, 1, 6):
            xp, yp = x0 + fraction * (x1 - x0), y1 - fraction * (y1 - y0)
            line(((xp, y0 + 9), (xp, y1)), '#e5eaf0', 1)
            line(((x0, yp), (x1, yp)), '#e5eaf0', 1)
            text(xp - 15, y1 + 7, '%.3g' % (lo_x + fraction * (hi_x - lo_x)), 16)
            text(x0 - 53, yp - 10, '%.3g' % (lo_y + fraction * (hi_y - lo_y)), 16)
        line(((x0, y0 + 9), (x0, y1), (x1, y1)), '#71808d', 1)
        text(x0 + 115, y1 + 35, xlabel, 18)
        return transform
    text(75, 20, 'Mirrored circles | time-aligned driver feedback', 32)
    text(75, 65, 'Motor encoders; independent carriage coordinates. External tool-tip accuracy not measured.', 20)
    cx, cy, r = (geometry[k] for k in ('center_x_mm', 'center_y_mm', 'radius_mm'))
    start, end = geometry['circle_start_s'], geometry['circle_end_s']
    colors = {'left': '#1976a3', 'right': '#d7672c'}
    radial, speeds = {}, {}
    for index, (name, pair) in enumerate(pairs.items()):
        x0 = 100 + 750 * index
        mapping = panel((x0, 155, x0 + 500, 655), (0, 125, 0, 125),
                        '%s arm | motors %s / %s' % (name.capitalize(), *PAIRS[name]),
                        'Inward X (mm)', 'Front-to-back Y (mm)')
        theta = np.linspace(0, 2 * np.pi, 361)
        line([mapping(x, y) for x, y in zip(cx + r * np.cos(theta), cy + r * np.sin(theta))], '#a3aab1', 2)
        t = pair['time']
        for mask, color in ((t < start, '#bf8d21'), ((t >= start) & (t <= end), colors[name]),
                            (t > end, '#8753a0')):
            line([mapping(x, y) for x, y in zip(pair['x'][mask], pair['y'][mask])], color, 2)
        for value, color in ((start, '#208440'), (end, '#b42b72')):
            if t[0] <= value <= t[-1]:
                marker(mapping(np.interp(value, t, pair['x']), np.interp(value, t, pair['y'])), color, True)
        text(x0, 717, 'Gray: plan   Gold: entry   Purple: exit', 16, '#607080')
        text(x0, 742, 'Green / pink triangles: circle entry / exit', 16, '#607080')
        mask = (t >= start) & (t <= end)
        radial[name] = (t[mask], np.hypot(pair['x'][mask] - cx, pair['y'][mask] - cy) - r)
        speeds[name] = (t[mask], np.hypot(pair['vx'][mask], pair['vy'][mask]))
    error_max = max((float(np.max(np.abs(values[1]))) for values in radial.values() if len(values[1])), default=0.1)
    error_max = max(0.05, error_max * 1.15)
    speed_values = [values[1] for values in speeds.values() if len(values[1])]
    speed_low = min((float(np.min(values)) for values in speed_values), default=0)
    speed_high = max((float(np.max(values)) for values in speed_values), default=1)
    speed_pad = max(1, (speed_high - speed_low) * 0.15)
    error_map = panel((100, 855, 690, 1040), (start, end, -error_max, error_max),
                      'Fixed-center radial error', 'Stream time (s)', 'Radius minus %.3g mm (mm)' % r)
    speed_map = panel((850, 855, 1440, 1040), (start, end, speed_low - speed_pad, speed_high + speed_pad),
                      'XY speed from driver feedback', 'Stream time (s)', 'XY speed (mm/s)')
    line((error_map(start, 0), error_map(end, 0)), '#87929c', 1)
    for name in pairs:
        line([error_map(t, value) for t, value in zip(*radial[name])], colors[name], 2)
        line([speed_map(t, value) for t, value in zip(*speeds[name])], colors[name], 2)
    text(100, 1090, 'Blue: left    Orange: right    Each axis was interpolated from its own timestamp.', 17)
    svg.append('</svg>')
    png, vector = Path(str(path_prefix) + '.png'), Path(str(path_prefix) + '.svg')
    image.save(png)
    vector.write_text('\n'.join(svg), encoding='utf-8')
    return str(png.resolve()), str(vector.resolve())


def analyze(summary_path, raw=None, output_prefix=None, interpolation_step_s=0.02):
    summary_path = Path(summary_path).expanduser().resolve()
    summary = json.loads(summary_path.read_text(encoding='utf-8-sig'))
    raw_path = resolve_raw(summary_path, summary, raw)
    feedback, parsing = load_feedback(raw_path, summary)
    source = summary.get('circle_geometry', {})
    geometry = dict(center_x_mm=float(source.get('center_x_mm', 50)),
                    center_y_mm=float(source.get('center_y_mm', 78)),
                    radius_mm=float(source.get('radius_mm', 40)),
                    period_s=float(source.get('period_s', 5)),
                    circle_start_s=float(source.get('circle_start_s', source.get('entry_s', 2))),
                    circle_end_s=float(source.get('circle_end_s', 12)))
    if (not all(math.isfinite(value) for value in geometry.values())
            or geometry['radius_mm'] <= 0 or geometry['period_s'] <= 0
            or geometry['circle_end_s'] <= geometry['circle_start_s'] + 0.6):
        raise ValueError('Summary has invalid circle geometry')
    start, end = geometry['circle_start_s'], geometry['circle_end_s']
    nominal = geometry['radius_mm'] * 2 * math.pi / geometry['period_s']
    low_speed = 0.1 * nominal
    boundaries = (start, end, start + 0.3, end - 0.3)
    pairs = {name: interpolate_pair(feedback, axes, interpolation_step_s, boundaries)
             for name, axes in PAIRS.items()}
    report = dict(analysis_completed=True, source_summary=str(summary_path), raw_serial_file=str(raw_path),
                  source_passed=summary.get('passed'), source_motion_completed=summary.get('motion_completed'),
                  geometry=geometry, parsing=parsing, nominal_circle_speed_mm_s=nominal,
                  interpolation=dict(method='per-axis linear interpolation to common times; no extrapolation',
                                     requested_grid_interval_s=interpolation_step_s,
                                     adds_measurement_information=False,
                                     limitation='Radial metrics include interpolation error; motion between raw samples is unresolved'),
                  feedback_scope='internal motor driver encoders and speeds; external tool-tip accuracy unmeasured',
                  axis_sampling={a: _axis_statistics(data, start, end) for a, data in feedback.items()},
                  arms={})
    for name, pair in pairs.items():
        cx, cy, r = geometry['center_x_mm'], geometry['center_y_mm'], geometry['radius_mm']
        report['arms'][name] = dict(axes=list(PAIRS[name]),
            full_circle=window_metrics(pair, start, end, cx, cy, r, low_speed),
            steady_circle=window_metrics(pair, start + 0.3, end - 0.3, cx, cy, r, low_speed))
    prefix = Path(output_prefix).expanduser() if output_prefix else summary_path.with_name(summary_path.stem + '_circle_analysis')
    prefix.parent.mkdir(parents=True, exist_ok=True)
    png, svg = create_plot(prefix, pairs, geometry, report)
    report['artifacts'] = dict(png=png, svg=svg, json=str(Path(str(prefix) + '.json').resolve()))
    Path(str(prefix) + '.json').write_text(json.dumps(report, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('summary', help='Circle run summary/result JSON')
    parser.add_argument('--raw', help='Override the raw JSONL location, for downloaded archives')
    parser.add_argument('--output-prefix', help='Output path prefix, without extension')
    args = parser.parse_args()
    report = analyze(args.summary, args.raw, args.output_prefix)
    print(json.dumps(dict(analysis_completed=report['analysis_completed'], artifacts=report['artifacts'],
                          axis_sampling=report['axis_sampling'], arms=report['arms']), indent=2))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
