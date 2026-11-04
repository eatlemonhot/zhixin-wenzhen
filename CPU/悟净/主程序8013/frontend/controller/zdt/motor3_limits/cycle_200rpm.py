
import argparse
import json
import math
import time
from datetime import datetime, timezone

from motor3 import ROOT, Motor, bounded_target, check_reference, signed_value

RPM = 200
ACCELERATION = 240
POSITIONING_RPM = 15


def utc_now():
    return datetime.now(timezone.utc).isoformat()


def validate_plan(calibration, cycles):
    if isinstance(cycles, bool) or not isinstance(cycles, int) or cycles < 1:
        raise ValueError("Cycles must be a positive integer")
    limits = calibration["limits"]
    low = bounded_target(limits["min_deg"], limits)
    high = bounded_target(limits["max_deg"], limits)
    if low >= high or not math.isfinite(calibration["origin_encoder_deg"]):
        raise ValueError("Invalid calibrated limits/origin")
    if calibration.get("mm_per_rev") != 40:
        raise ValueError("Expected the calibrated GT2 / 20-tooth / 40 mm-per-rev axis")
    return dict(cycles=cycles, full_stroke_legs=2 * cycles, rpm=RPM,
                acceleration_rpm_s=ACCELERATION, positioning_rpm=POSITIONING_RPM,
                min_deg=low, max_deg=high, stroke_mm=(high - low) / 9,
                nominal_supply_v=12, final_target_deg=low)


class CycleMotor(Motor):
    def __init__(self, limits):
        self.limits = limits
        self.run_samples = []
        self.sample_sink = None
        super().__init__("cycle_200rpm_raw")

    def snapshot(self):
        sample = super().snapshot()
        sample["voltage_v"] = int.from_bytes(self.command([0x24], 5)[2:4], "big") / 1000
        sample["temperature_c"] = signed_value(self.command([0x39], 5))
        return sample

    def check_sample(self, sample):
        self.run_samples.append(dict(sample))
        if self.sample_sink is not None:
            self.sample_sink(sample)
        Motor.check_sample(sample)
        if sample["motor_flags"] & 0x80:
            raise RuntimeError("Coordinate invalid after power loss. Rehome with: .\\motor3.ps1 home 1")
        if sample["home_flags"] != 3 or sample["motor_flags"] & 0x8C:
            raise RuntimeError(f"Unexpected motor state: {sample}")
        if not self.limits["min_deg"] - 1 <= sample["position_deg"] <= self.limits["max_deg"] + 1:
            raise RuntimeError(f"Observed position outside soft-limit tolerance: {sample}")
        if not 10.5 <= sample["voltage_v"] <= 13.5:
            raise RuntimeError(f"12 V supply outside 10.5 .. 13.5 V: {sample}")
        if not -20 <= sample["temperature_c"] < 60:
            raise RuntimeError(f"Temperature outside -20 .. <60 C: {sample}")
        if not 0 <= sample["current_ma"] < 1200:
            raise RuntimeError(f"Unexpected phase current during free motion: {sample}")
        if not abs(sample["speed_rpm"]) <= RPM * 1.15:
            raise RuntimeError(f"Unexpected excessive speed: {sample}")

    def stop(self):
        # Ordinary motion only: never issue home-abort/reset to clear protection.
        try:
            flags = self.command([0x3C], 5)
        except Exception:
            flags = None
        if flags is None or not flags[3] & 8:
            self.command([0xFE, 0x98, 0])
        deadline = time.monotonic() + 1
        while True:
            if abs(signed_value(self.command([0x35], 6), 10)) < 0.6:
                return
            if time.monotonic() >= deadline:
                raise RuntimeError("Could not verify standstill after stop")
            time.sleep(0.025)


def checked_idle(motor, calibration):
    sample = motor.snapshot()
    motor.check_sample(sample)
    try:
        check_reference(sample, calibration)
    except RuntimeError as exc:
        raise RuntimeError(f"{exc}. Rehome with: .\\motor3.ps1 home 1") from exc
    if sample["motor_flags"] & 3 != 3 or abs(sample["speed_rpm"]) > 1:
        raise RuntimeError(f"Expected enabled, settled motor before next movement: {sample}")
    return sample


def run_cycles(calibration, cycles=100, output_dir=ROOT, motor_factory=CycleMotor, emit=print):
    plan = validate_plan(calibration, cycles)
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S_%f")
    summary_path = output_dir / f"{stamp}_cycle_200rpm_summary.json"
    events_path = output_dir / f"{stamp}_cycle_200rpm_events.jsonl"
    report = dict(started_at_utc=utc_now(), plan=plan, completed_cycles=0,
                  completed_motion_legs=0, legs=[], passed=False, stage="open",
                  events_file=str(events_path), summary_file=str(summary_path),
                  telemetry_note="Prior transient flag anomalies remain unexplained; any protection frame aborts.")
    motor = None
    finished = False
    started = time.monotonic()
    with events_path.open("x", encoding="utf-8") as journal:
        def event(kind, **data):
            journal.write(json.dumps(dict(time_utc=utc_now(), kind=kind,
                                          stage=report["stage"], **data), ensure_ascii=False) + "\n")
            journal.flush()

        def leg(cycle, direction, target, rpm, acceleration):
            report["stage"] = f"cycle_{cycle}_{direction}" if cycle else "initial_positioning"
            entry = dict(cycle=cycle, direction=direction, target_deg=target,
                         requested_rpm=rpm, passed=False)
            report["legs"].append(entry)
            motor.run_samples = []
            leg_start = time.monotonic()
            try:
                before = checked_idle(motor, calibration)
                target = bounded_target(target, calibration["limits"])
                entry["start_deg"] = before["position_deg"]
                event("leg_started", leg=entry)
                samples = motor.move(target, rpm=rpm, acceleration_rpm_s=acceleration)
                after = checked_idle(motor, calibration)
                peak = max(abs(s["speed_rpm"]) for s in samples)
                entry.update(peak_rpm=peak, peak_current_ma=max(s["current_ma"] for s in samples),
                             min_voltage_v=min(s["voltage_v"] for s in samples),
                             max_voltage_v=max(s["voltage_v"] for s in samples),
                             max_temperature_c=max(s["temperature_c"] for s in samples),
                             final_error_deg=after["position_deg"] - target, final=after)
                if abs(entry["final_error_deg"]) > 0.5:
                    raise RuntimeError("Settled position error exceeds 0.5 degree")
                if cycle and not RPM * 0.95 <= peak <= RPM * 1.15:
                    raise RuntimeError(f"200 RPM leg speed acceptance failed: {peak} RPM")
                entry["passed"] = True
                if cycle:
                    report["completed_motion_legs"] += 1
            finally:
                entry["elapsed_s"] = time.monotonic() - leg_start
                event("leg_finished", leg=entry)

        try:
            event("run_started", plan=plan)
            motor = motor_factory(calibration["limits"])
            report["serial_port"] = getattr(motor, "port", "COM5")
            report["raw_serial_file"] = str(motor.log.name)
            motor.sample_sink = lambda sample: event("sample", sample=sample)
            report["stage"] = "prepare"
            motor.prepare()
            report["initial"] = checked_idle(motor, calibration)
            emit(f"{report['serial_port']} / 115200 | 200 RPM | {cycles} cycles = {cycles * 2} full-stroke legs", flush=True)
            emit("Positioning at 15 RPM; then MIN -> MAX -> MIN. Ctrl+C stops the run.", flush=True)
            leg(0, "positioning", plan["min_deg"], POSITIONING_RPM, 60)
            for cycle in range(1, cycles + 1):
                leg(cycle, "outbound", plan["max_deg"], RPM, ACCELERATION)
                leg(cycle, "return", plan["min_deg"], RPM, ACCELERATION)
                report["completed_cycles"] = cycle
                event("cycle_completed", completed_cycles=cycle)
                emit(f"Completed {cycle}/{cycles} | position={report['legs'][-1]['final']['position_deg']:.1f} deg"
                     f" | temperature={report['legs'][-1]['max_temperature_c']:.0f} C", flush=True)
            report["stage"] = "final_check"
            report["final"] = checked_idle(motor, calibration)
            if abs(report["final"]["position_deg"] - plan["min_deg"]) > 0.5:
                raise RuntimeError("Final position disagrees with MIN endpoint")
            finished = True
        except (Exception, KeyboardInterrupt) as exc:
            report["error"] = f"{type(exc).__name__}: {exc}"
            report["failed_stage"] = report["stage"]
            report["interrupted"] = isinstance(exc, KeyboardInterrupt)
            if motor is not None and motor.run_samples:
                report["last_checked_sample"] = motor.run_samples[-1]
        finally:
            if motor is not None:
                try:
                    motor.close()
                except (Exception, KeyboardInterrupt) as exc:
                    report["cleanup_error"] = f"{type(exc).__name__}: {exc}"
            report["passed"] = finished and "cleanup_error" not in report
            report["finished_at_utc"] = utc_now()
            report["elapsed_s"] = time.monotonic() - started
            summary_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cycles", type=int, default=100, help="Complete out-and-back cycles (default: 100)")
    parser.add_argument("--dry-run", action="store_true", help="Show plan without opening a serial port or moving")
    args = parser.parse_args()
    try:
        calibration = json.loads((ROOT / "calibration.json").read_text(encoding="utf-8"))
        plan = validate_plan(calibration, args.cycles)
    except (ValueError, KeyError, OSError) as exc:
        parser.error(str(exc))
    if args.dry_run:
        print(json.dumps(plan, ensure_ascii=False, indent=2))
        return 0
    report = run_cycles(calibration, args.cycles)
    print(f"{'PASS' if report['passed'] else 'STOPPED'}: {report['completed_cycles']}/{args.cycles} cycles")
    for key in ("error", "cleanup_error"):
        if key in report:
            print(report[key])
    print(f"Summary: {report['summary_file']}")
    print(f"Samples: {report['events_file']}")
    return 0 if report["passed"] else (130 if report.get("interrupted") else 1)


if __name__ == "__main__":
    raise SystemExit(main())
