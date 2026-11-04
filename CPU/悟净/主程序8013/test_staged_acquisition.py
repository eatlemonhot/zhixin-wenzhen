from contextlib import nullcontext
import unittest
from probe_system.staged_acquisition import acquire,plan,SequenceFailure

ACTION=dict(action_id=0,frequency_hz=10000,rs_ohm=100,fixed_ground_connected=True)

class Controls:
    hardware=False;position_feedback_available=False;confirmation_source='synthetic'
    def __init__(self):self.pos=dict(dac='up',adc='up');self.events=[];self.stimulus=False;self.fail_confirm=None
    def ownership(self):return nullcontext()
    def preflight(self,action):plan(action['rs_ohm'],action['fixed_ground_connected'])
    def check_cancelled(self):pass
    def stop_stimulus(self):self.stimulus=False;self.events.append('off')
    def raise_probe(self,probe):
        for p in ('dac','adc') if probe=='both' else (probe,):self.pos[p]='up'
        self.events.append(('up',probe))
    def lower_probe(self,probe):self.pos[probe]='down';self.events.append(('down',probe))
    def confirm(self,probe,position):return (probe,position)!=self.fail_confirm
    def move_xy(self,action):
        if self.pos!=dict(dac='up',adc='up') or self.stimulus:raise AssertionError('XY moved with contact or excitation')
        self.events.append('xy')
    def configure_route(self,schedule):self.events.append('route')
    def start_stimulus(self,action):self.stimulus=True;self.events.append('on')
    def wait_settled(self,stage):self.events.append(('wait',stage))
    def select_source(self,row):self.events.append(('select',row['channel']))

class StagedTests(unittest.TestCase):
    def test_contacts_masks_and_one_uninterrupted_excitation(self):
        c=Controls();seen=[]
        def capture(channel,row):
            seen.append((channel,dict(c.pos),row['relay_mask']));self.assertTrue(c.stimulus);return channel
        r=acquire(c,ACTION,capture)
        self.assertEqual(seen,[('A',dict(dac='down',adc='up'),113),('B',dict(dac='down',adc='up'),49),('C',dict(dac='down',adc='down'),33),('A_check',dict(dac='down',adc='up'),113)])
        self.assertEqual(c.events.count('on'),1);self.assertFalse(c.stimulus);self.assertEqual(c.pos,dict(dac='up',adc='up'));self.assertTrue(r['completed'])
    def test_both_Rs_ranges_preserve_roles_and_no_GND_probe(self):
        for rs in (100,10000):
            p=plan(rs)
            for row in p['steps']:
                self.assertEqual(row['K'][:4],[1,0,0,0]);self.assertEqual(row['K'][5],int(rs==100))
    def test_reverse_terminal_masks_do_not_select_both_ADC_or_DAC(self):
        for rs in (100,10000):
            p=plan(rs,dac_terminal='TP_B')
            for row in p['steps']:
                self.assertEqual(row['K'][:4],[0,0,1,0]);self.assertEqual(row['relay_mask']&15,4)
        with self.assertRaises(ValueError):plan(100,dac_terminal='left')
    def test_missing_fixed_ground_fails_before_motion(self):
        c=Controls()
        with self.assertRaises(ValueError):acquire(c,dict(ACTION,fixed_ground_connected=False),lambda *a:None)
        self.assertEqual(c.events,[])
    def test_failed_contact_cannot_start_ADC(self):
        c=Controls();c.fail_confirm=('adc','down');seen=[]
        with self.assertRaises(SequenceFailure):acquire(c,ACTION,lambda name,row:seen.append(name))
        self.assertEqual(seen,['A','B']);self.assertFalse(c.stimulus);self.assertEqual(c.pos,dict(dac='up',adc='up'))
    def test_capture_exception_stops_and_raises_without_later_channels(self):
        c=Controls();seen=[]
        def capture(name,row):
            seen.append(name)
            if name=='C':raise RuntimeError('ADC_CRC_FAILED')
        with self.assertRaisesRegex(SequenceFailure,'ADC_CRC_FAILED'):acquire(c,ACTION,capture)
        self.assertEqual(seen,['A','B','C']);self.assertFalse(c.stimulus);self.assertEqual(c.pos,dict(dac='up',adc='up'))
    def test_primary_error_is_retained_if_cleanup_also_fails(self):
        c=Controls();old=c.raise_probe;calls=[0]
        def raise_probe(p):
            calls[0]+=1
            if calls[0]>1:raise RuntimeError('SERVO_OFFLINE')
            old(p)
        c.raise_probe=raise_probe
        with self.assertRaises(SequenceFailure) as error:acquire(c,ACTION,lambda *a:(_ for _ in ()).throw(RuntimeError('ADC_FAILED')))
        self.assertIn('ADC_FAILED',str(error.exception));self.assertIn('SERVO_OFFLINE',str(error.exception));self.assertFalse(c.stimulus)

if __name__=='__main__':unittest.main(verbosity=2)
