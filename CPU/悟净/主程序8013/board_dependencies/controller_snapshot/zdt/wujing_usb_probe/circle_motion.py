"""同步更新有限圆形轨迹的CD位置指令。

    复用CRC、电流限制、看门狗、遥测与清理流程，中间点连续更新，终点等待到位。"""
import json
import math
import statistics
import time

from motorctl import core
from coordinate_setup import AXES
from synchronous_speed_trial import CAPS, position_packet
from circle_trajectory import CircleTrajectory, validate_trajectory

FRAME_PERIOD = 0.08
LOOKAHEAD = 0.24
STREAM_ACCEL = 600
MAX_FRAME_GAP = 0.20


def targets_and_speeds(trajectory, elapsed, lookahead=LOOKAHEAD, speed_boost=0, maximum_rpm=200):
    target_time = min(trajectory.duration,max(0,elapsed)+lookahead)
    positions,_,_ = trajectory.sample(target_time)
    _,velocities,_ = trajectory.sample(min(trajectory.duration,max(0,elapsed)+lookahead/2))
    speeds = {a:max(1.0,min(maximum_rpm,abs(velocities[a])*1.5+speed_boost)) for a in AXES}
    return positions,speeds,target_time


def send_frame(session, positions, speeds, elapsed=None, target_time=None):
    session.check_stop()
    started = time.monotonic()
    session.moving = set(AXES)
    for a in AXES:
        session.select(a).action(position_packet(a,positions[a],speeds[a],
                                                 getattr(session,'stream_accel',STREAM_ACCEL)))
        if time.monotonic()-started > 0.15:
            raise TimeoutError('Circle cache batch delayed; do not broadcast a stale frame')
    motor=session.select(1)
    # A broadcast acknowledges as address 1 on this hardware. Consume that
    # ACK before issuing telemetry: otherwise a 3A query can overlap it and
    # lose its reply, creating read retries in the motion update schedule.
    motor.pending=[r for r in motor.pending if r[1]!=0xFF]
    broadcast_at=time.monotonic()
    motor.send([0xFF,0x66],address=0)
    reply=motor.receive(0xFF,timeout=0.05)
    if reply[2]!=2:
        raise RuntimeError('Circle synchronization rejected; do not repeat the frame')
    time.sleep(0.003)
    frame=dict(elapsed_s=elapsed,target_time_s=target_time,
               positions_mm=positions,speeds_rpm=speeds,
               broadcast_monotonic_s=broadcast_at,cache_elapsed_s=broadcast_at-started,
               sync_ack_elapsed_s=time.monotonic()-broadcast_at)
    session.motor.event(circle_frame=frame)
    return frame


def feedback_pair(session,index,stream_start=None,bounds=None):
    pair = (1,4) if index%2==0 else (2,3)
    samples={}
    for a in pair:
        s=session.sample(a)
        if s['motor_flags']&0x80 or s['home_flags']!=3:
            raise RuntimeError('Circle reference/home state changed')
        if abs(s['speed_rpm'])>getattr(session,'motion_rpm',200)+20:
            raise RuntimeError('Circle speed outside validated ceiling')
        axis=session.coordinates['axes'][str(a)]
        lo,hi=axis['soft_min_mm']-0.3,axis['soft_max_mm']+0.3
        if not lo<=s['position_mm']<=hi:
            raise RuntimeError('Circle feedback crossed a software travel boundary')
        if bounds:
            region=bounds[str(a)] if str(a) in bounds else bounds[a]
            if not region[0]-1<=s['position_mm']<=region[1]+1:
                raise RuntimeError('Circle feedback left the prevalidated trajectory envelope')
        if s['sample_gap_s'] is not None and s['sample_gap_s']>0.6:
            raise TimeoutError('Circle axis telemetry gap exceeded 0.6 seconds')
        s=dict(s,address=a)
        if stream_start is not None:
            s['stream_elapsed_s']=s['monotonic_s']-stream_start
        session.motor.event(circle_feedback=s)
        samples[a]=s
    return samples


def benchmark(session,count=8):
    durations=[]
    session.last_sample.clear()
    session.announce('stationary_park_communication_benchmark')
    for i in range(count):
        t=time.monotonic()
        send_frame(session,{a:2.0 for a in AXES},{a:5.0 for a in AXES})
        feedback_pair(session,i)
        durations.append(time.monotonic()-t)
    final=session.scan()
    if any(abs(s['position_mm']-2)>0.15 or abs(s['speed_rpm'])>0.6 for s in final.values()):
        raise RuntimeError('Stationary benchmark park was not maintained')
    session.moving.clear()
    result=dict(cycles=count,median_frame_work_s=statistics.median(durations),
                maximum_frame_work_s=max(durations),frame_period_s=FRAME_PERIOD)
    session.report['communication_benchmark']=result
    print(json.dumps(result),flush=True)
    if max(durations)>0.16:
        raise RuntimeError('Measured USB cycle cannot support the bounded circle schedule')
    return result


def run_circle(session):
    scale=getattr(session,'time_scale',1.0)
    trajectory=CircleTrajectory(period=5.0/scale,transition_s=2.0/scale)
    maximum_rpm=getattr(session,'motion_rpm',200)
    validation=validate_trajectory(session.coordinates,trajectory,maximum_rpm=maximum_rpm)
    contact_homing=not getattr(session,'circle_only',False)
    session.report.update(style='continuous_mirrored_circles',endstop_homing_passes=int(contact_homing),
        repeated_endstop_contacts=False,circle_geometry=dict(center_x_mm=trajectory.center_x,
        center_y_mm=trajectory.center_y,radius_mm=trajectory.radius,period_s=trajectory.period,
        turns=trajectory.turns,entry_s=trajectory.circle_start,circle_end_s=trajectory.circle_end,
        duration_s=trajectory.duration),trajectory_validation=validation,
        stream_frame_period_s=FRAME_PERIOD,stream_lookahead_s=LOOKAHEAD,
        stream_acceleration_rpm_s=getattr(session,'stream_accel',STREAM_ACCEL),intermediate_arrival_waits=False)
    if contact_homing:
        session.prepare_cold_start()
    else:
        session.prepare()
        session.report.update(startup_reference_mode='verified_existing_reference',
                              contact_homing_skipped=True)
    session.motion_start=time.monotonic()
    session.announce('reference_verified_at_park')
    for a in AXES:
        session.set_cap(a,CAPS[a])
    current=session.scan()
    if any(abs(s['position_mm']-2)>0.15 or abs(s['speed_rpm'])>0.8 for s in current.values()):
        raise RuntimeError('Circle must start at the verified 2 mm stationary park')
    session.last_sample.clear()
    session.announce('continuous_entry_two_mirrored_circles_and_return')
    start=time.monotonic()
    previous=None
    index=0
    frames=[]
    bounds={a:(validation['position_min_mm'][a],validation['position_max_mm'][a])for a in AXES}
    session.report.update(circle_stream_start_monotonic_s=start,circle_frames=frames)
    frame_gaps=[]
    work_times=[]
    while True:
        session.check_stop()
        clock=time.monotonic()
        elapsed=clock-start
        if previous is not None:
            gap=clock-previous
            if gap>MAX_FRAME_GAP:
                raise TimeoutError('Circle scheduling gap; stop without catching up')
            frame_gaps.append(gap)
        previous=clock
        positions,speeds,target_time=targets_and_speeds(trajectory,elapsed,
            speed_boost=getattr(session,'speed_boost',0),maximum_rpm=maximum_rpm)
        frames.append(send_frame(session,positions,speeds,elapsed,target_time))
        feedback_pair(session,index,start,bounds)
        work_times.append(time.monotonic()-clock)
        index+=1
        if elapsed>=trajectory.duration:
            break
        until=clock+FRAME_PERIOD
        while time.monotonic()<until:
            session.check_stop()
            time.sleep(min(0.005,max(0,until-time.monotonic())))
    session.report.update(circle_stream_start_monotonic_s=start,circle_frames=frames,
        circle_stream_frames=len(frames),circle_stream_elapsed_s=time.monotonic()-start,
        maximum_frame_gap_s=max(frame_gaps),median_frame_gap_s=statistics.median(frame_gaps),
        maximum_frame_work_s=max(work_times))
    send_frame(session,{a:2.0 for a in AXES},{a:5.0 for a in AXES})
    deadline=time.monotonic()+2
    stable=None
    while time.monotonic()<deadline:
        session.check_stop()
        current=session.scan()
        done=all(abs(s['position_mm']-2)<=0.12 and abs(s['speed_rpm'])<0.6
                 and s['motor_flags']&2 and not s['motor_flags']&0x80 for s in current.values())
        if done:
            stable=stable or time.monotonic()
            if time.monotonic()-stable>0.1:
                break
        else:
            stable=None
    else:
        raise TimeoutError('Circle final park did not settle')
    session.moving.clear()
    final={a:session.verify_reference(a,session.coordinates['axes'][str(a)]) for a in AXES}
    session.motion_end=time.monotonic()
    session.report.update(motion_elapsed_s=session.motion_end-session.motion_start,
        positions_mm={a:s['position_mm'] for a,s in final.items()},motion_completed=True,
        x_outer_boundaries_touched=contact_homing,full_travel_limits_remeasured=False)
    if contact_homing:
        session.coordinates['last_rehomed_at_utc']=core.now()
    session.coordinates['last_display_at_utc']=core.now()
