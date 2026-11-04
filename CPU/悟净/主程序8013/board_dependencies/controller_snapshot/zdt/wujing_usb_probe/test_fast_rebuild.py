import unittest
from fast_rebuild import (independent_envelope, continuous_pair_envelope,
                          motion_corridor, validate_fast_packet,
                          motion_time, position_packet, crc8,
                          showcase_plan, relay_direction, immediate_y_packet)
from ch340_serial import validate_packet


def frame(body):
    body=bytes(body)
    return body+bytes([crc8(body)])


class FastPlanTests(unittest.TestCase):
    def setUp(self):
        self.c={'axes':{str(a):{'soft_min_mm':2,'soft_max_mm':199.2 if a<3 else 157}
                        for a in range(1,5)},'joint_x_limit':{'max_combined_inward_mm':201.2}}

    def test_one_large_pair_translation_is_rejected_if_one_arm_stalls(self):
        with self.assertRaises(ValueError):
            independent_envelope(self.c,{1:178,2:2,3:2,4:2},{1:2,2:178})

    def test_whole_continuous_legs_have_heartbeat_braking_reserve(self):
        for initial,target in [({1:80,2:80},{1:158,2:2}),({1:158,2:2},{1:2,2:158})]:
            result=continuous_pair_envelope(self.c,initial,target)
            self.assertLessEqual(result['nominal_sum_mm']+result['stopping_reserve_mm'],201.2)
        for initial,target in [({1:90,2:90},{1:178,2:2}),({1:80,2:80},{1:2,2:150})]:
            with self.assertRaises(ValueError):
                continuous_pair_envelope(self.c,initial,target)

    def test_fast_profile_is_opt_in_and_400rpm_is_blocked(self):
        packet=frame(bytes([1])+position_packet(1,90,200,1200))
        validate_fast_packet(packet)
        with self.assertRaises(ValueError):
            validate_packet(packet)
        with self.assertRaises(ValueError):
            validate_fast_packet(frame(bytes([1])+position_packet(1,90,400,1800)))

    def test_mirrored_y_and_y_speed_cap_are_enforced(self):
        validate_fast_packet(frame(bytes([3])+position_packet(3,150,200,2000)))
        with self.assertRaises(ValueError):
            validate_fast_packet(frame(bytes([3])+position_packet(3,150,300,2000)))

    def test_flash_and_address_commands_remain_prohibited(self):
        for body in ('01 ae 4b 01 02','01 45 66 01 03 e8','01 06 45'):
            with self.subTest(body=body),self.assertRaises(ValueError):
                validate_fast_packet(frame(bytes.fromhex(body)))

    def test_partial_trigger_does_not_justify_resending_sync(self):
        validate_fast_packet(frame(bytes.fromhex('00 ff 66')))
        with self.assertRaises(ValueError):
            validate_fast_packet(bytes.fromhex('00 ff 66'))

    def test_motion_corridor_retains_one_mm_interior_and_point_three_at_soft_limits(self):
        axis=self.c['axes']['1']
        self.assertEqual(motion_corridor(axis,148.7,138.9),(137.9,149.7))
        self.assertEqual(motion_corridor(axis,80,2),(1.7,81))
        self.assertEqual(motion_corridor(axis,0,2),(-0.3,3))

    def test_triangular_small_parking_moves_are_accounted_for(self):
        self.assertAlmostEqual(motion_time(10,300,2200),0.1651445647689541,places=6)
        self.assertLess(motion_time(10,300,2200),motion_time(80,300,2200))

    def test_complete_showcase_stays_inside_the_two_x_envelopes(self):
        start={a:2.0 for a in range(1,5)}
        relays=[]
        for step in showcase_plan(self.c):
            if step.get('continuous_pair'):
                continuous_pair_envelope(self.c,start,step['targets'])
            else:
                independent_envelope(self.c,start,step['targets'])
            if step.get('relay'):
                relays.append(relay_direction(start,step['targets'],step['relay']))
            start.update(step['targets'])
        self.assertEqual(start,{a:2 for a in range(1,5)})
        self.assertEqual(relays,[1,-1])

    def test_relay_rejects_x_follower_and_endpoint_trigger(self):
        for relay in (dict(leader=3,follower=1,trigger_mm=80),
                      dict(leader=3,follower=4,trigger_mm=2),
                      dict(leader=3,follower=4,trigger_mm=157)):
            with self.assertRaises(ValueError):
                relay_direction({3:2,4:2},{3:157,4:157},relay)

    def test_immediate_start_is_available_only_to_bounded_y_followers(self):
        for a in (3,4):
            packet=frame(bytes([a])+immediate_y_packet(a,120))
            self.assertEqual(packet[13:15],b'\x01\x00')
            validate_fast_packet(packet)
            with self.assertRaises(ValueError):
                validate_packet(packet)
        with self.assertRaises(ValueError):
            immediate_y_packet(1,80)
        payload=bytearray(position_packet(1,80,200,1200));payload[13]=0
        with self.assertRaises(ValueError):
            validate_fast_packet(frame(bytes([1])+payload))


if __name__=='__main__':
    unittest.main()
