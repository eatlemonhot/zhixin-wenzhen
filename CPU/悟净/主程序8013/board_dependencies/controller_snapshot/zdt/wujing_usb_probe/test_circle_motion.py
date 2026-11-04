import math
import unittest

from circle_trajectory import CircleTrajectory
from circle_motion import targets_and_speeds, STREAM_ACCEL, send_frame
from fast_rebuild import validate_fast_packet,position_packet,crc8


class StreamProfileTests(unittest.TestCase):
    def fake_session(self,missing_ack=False):
        class Motor:
            pending=[b'\x01\xff\x02\xf9']
            events=[]
            def action(self,payload):self.events.append(('action',bytes(payload)))
            def send(self,payload,address=None):self.events.append(('send',bytes(payload),address))
            def receive(self,code,timeout):
                self.events.append(('receive',code))
                if missing_ack:raise TimeoutError('missing broadcast acknowledgement')
                return b'\x01\xff\x02\xf9'
            def event(self,**data):pass
        class Session:
            motor=Motor()
            def check_stop(self):pass
            def select(self,a):return self.motor
        return Session()

    def test_sync_ack_is_consumed_and_old_ack_removed_before_returning_for_telemetry(self):
        session=self.fake_session()
        send_frame(session,{a:2 for a in (1,2,3,4)},{a:5 for a in (1,2,3,4)})
        self.assertEqual(session.motor.pending,[])
        self.assertEqual([e[0]for e in session.motor.events],['action']*4+['send','receive'])

    def test_missing_sync_ack_aborts_without_repeating_broadcast(self):
        session=self.fake_session(missing_ack=True)
        with self.assertRaises(TimeoutError):
            send_frame(session,{a:2 for a in (1,2,3,4)},{a:5 for a in (1,2,3,4)})
        self.assertEqual(sum(e[0]=='send'for e in session.motor.events),1)

    def test_every_lookahead_packet_remains_finite_bounded_absolute_and_synchronized(self):
        trajectory=CircleTrajectory()
        for i in range(351):
            positions,speeds,target_time=targets_and_speeds(trajectory,i*0.04)
            self.assertLessEqual(target_time,trajectory.duration)
            for a in (1,2,3,4):
                self.assertTrue(math.isfinite(positions[a]))
                self.assertGreaterEqual(speeds[a],1)
                self.assertLessEqual(speeds[a],200)
                body=bytes([a])+position_packet(a,positions[a],speeds[a],STREAM_ACCEL)
                validate_fast_packet(body+bytes([crc8(body)]))

    def test_circle_component_turns_do_not_command_zero_vector_speed(self):
        trajectory=CircleTrajectory()
        for i in range(99):
            _,speeds,_=targets_and_speeds(trajectory,2+0.1*i)
            for x,y in ((1,4),(2,3)):
                self.assertGreater(math.hypot(speeds[x],speeds[y]),70)

    def test_late_elapsed_time_clamps_to_final_finite_park(self):
        p,s,t=targets_and_speeds(CircleTrajectory(),100)
        self.assertEqual(p,{a:2 for a in (1,2,3,4)})
        self.assertEqual(t,14)


if __name__=='__main__':unittest.main()
