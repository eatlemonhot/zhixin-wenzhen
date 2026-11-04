import copy
import unittest
from pathlib import Path
from probe_system.common import load_module
from probe_system.probe_assignment import roles,choose,MECHANICAL
G=load_module('_role_test_geometry',Path(__file__).resolve().parent/'frontend/web/interface/pcb_coordinates.py')

class AssignmentTests(unittest.TestCase):
    def setUp(self):
        self.action=dict(excitation=dict(position_mm=dict(x=10,y=10)),measurement=dict(position_mm=dict(x=20,y=20)))
        self.profile=dict(anchors={p:dict(x=1000,y=1000) for p in ('left','right')},offsets={p:dict(x=0,y=0) for p in ('left','right')})
        self.coordinates=dict(axes={str(a):dict(soft_min_mm=0,soft_max_mm=2000) for a in range(1,5)},joint_x_limit=dict(max_combined_inward_mm=5000))
    def test_fixed_mechanical_channel_and_independent_electrical_mapping(self):
        self.assertEqual(MECHANICAL['left']['servo_channel'],1);self.assertEqual(MECHANICAL['right']['servo_channel'],2)
        self.assertEqual(roles('left','TP_A')['relay_role_bits'],1)
        self.assertEqual(roles('left','TP_B')['relay_role_bits'],4)
        self.assertEqual(roles('right','TP_A')['dac_channel'],2)
    def test_CPU_chooses_shorter_legal_assignment_from_current_axes(self):
        current={'1':1020,'2':990,'3':980,'4':990}
        r=choose(self.action,current,self.profile,self.coordinates,G,left_terminal='TP_A')
        self.assertEqual(r['assignment']['dac_probe'],'right');self.assertEqual(r['axis_travel_mm'],0)
        self.assertFalse(r['collision_clearance_verified']);self.assertEqual(len(r['considered']),2)
    def test_unreachable_shorter_choice_is_rejected(self):
        current={'1':1010,'2':990,'3':980,'4':990}
        self.coordinates['axes']['1']['soft_max_mm']=1015
        r=choose(self.action,current,self.profile,self.coordinates,G,left_terminal='TP_A')
        self.assertEqual(r['assignment']['dac_probe'],'left');self.assertEqual(len(r['rejected']),1)
    def test_missing_terminal_mapping_does_not_guess_from_servo_pins(self):
        with self.assertRaises(ValueError):choose(self.action,{'1':1000,'2':1000,'3':1000,'4':1000},self.profile,self.coordinates,G)
    def test_legacy_firmware_capability_blocks_shorter_reverse_assignment(self):
        r=choose(self.action,{'1':1020,'2':990,'3':980,'4':990},self.profile,self.coordinates,G,left_terminal='TP_A',allowed_role_bits=[1])
        self.assertEqual(r['assignment']['dac_probe'],'left')
        self.assertIn('固件',r['rejected'][0]['reason'])

if __name__=='__main__':unittest.main()
