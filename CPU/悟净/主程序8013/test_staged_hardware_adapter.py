import contextlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest import mock
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent/'frontend/web/interface'))
from staged_cycle_worker import execute, validate


class AdapterTests(unittest.TestCase):
    def setUp(self):
        self.presets=mock.patch('servo_positions.load_presets',return_value={1:dict(up_us=960,down_us=1980),2:dict(up_us=960,down_us=1980)})
        self.presets.start()
        self.addCleanup(self.presets.stop)
    def run_group(self, bad_frame=False, bad_route=False, bad_servo=False, dac_channel=1, left_terminal='TP_A', role_support=True, rs=100):
        with tempfile.TemporaryDirectory() as directory:
            folder=Path(directory)
            payload=dict(kind='staged_abca',dac_channel=dac_channel,adc_channel=3-dac_channel,rs_ohm=rs,left_terminal=left_terminal,
                         decimation_log2=0,frames=16,fixed_ground_confirmed=True,xy_position_confirmed=True)
            (folder/'request.json').write_text(json.dumps(payload))
            commands=[];moves=[];contacts={1:'up',2:'up'};captured=[]
            state=dict(mask=33,path=3,generation=1,record=0,enabled=0)
            role_bits=1 if (dac_channel==1)==(left_terminal=='TP_A') else 4
            r=32 if rs==100 else 0
            ftw=17179869
            class Servo:
                def status(self):return dict(revision=0 if bad_servo else 124,error_code=0,channels=[dict(channel=c,up_us=960,down_us=1980) for c in (1,2)])
                def up(self,mask):
                    moves.append(('up',mask))
                    for ch in (1,2):
                        if mask & ch: contacts[ch]='up'
                def down(self,mask):contacts[mask]='down';moves.append(('down',mask))
            def send(command):
                commands.append(command)
                if command=='INFO':return dict(board_revision='LXB-R4-SENSE117',sense_protocol=1)
                if command=='SENSE_CAPS':return dict(schema='fdw-probe-roles/1',role_masks=[1,4] if role_support else [1],hot_role_switch=False)
                if command=='ADC_JOB_STATUS':return dict(state=0)
                if command=='MODE_STATUS':return dict(mode=0,capture_active=False,output_enabled=False,settling=False)
                if command=='HALT':state['enabled']=0;return {}
                if command=='DAC_ENABLE 1':state['enabled']=1;return {}
                if command=='DAC_STATUS':return dict(ready=1,enabled=state['enabled'],configured=1,waveform_active=state['enabled'],busy=0,error_code=0,clipped=0,tag=7,frequency_word=ftw,gain_q11=100,offset_code=0,phase_word=0)
                if command.startswith('RELAY_SET '):state['mask']=int(command.split()[1]);return {}
                if command.startswith('SENSE_SELECT '):
                    name=command.split()[1];state['path']={'VA':1,'VB':2,'PROBE':3}[name]
                    state['mask']=role_bits+r+{'VA':80,'VB':16,'PROBE':0}[name];state['generation']+=1;return {}
                if command=='SENSE_STATUS':return dict(sense_protocol=1,fault=0,settling=False,generation=state['generation'],rs_nominal_ohm=rs,relay_mask=state['mask'],selected=state['path'])
                if command=='ADC_SENSE_STATUS':return dict(record_id=state['record'],sense_generation=state['generation']+int(bad_route),relay_mask=state['mask'])
                raise AssertionError(command)
            def capture(log2,service):
                service();state['record']+=1;r=state['record'];tick=r*10000
                captured.append((state['path'],dict(contacts)))
                meta=dict(metadata_version=2,generation=1,record_id=r,sample_count=8192,complete=True,errors=0,dds_ftw=ftw,dac_tag=7,inverted=False,interval_ticks=1,first_tick=tick,last_tick=tick+8191,first_phase_word=(tick*ftw)&0xffffffff,last_phase_word=((tick+8191)*ftw)&0xffffffff,raw_clock_hz=25000000,decimation_log2=0,filter_id=0,pipeline_tick_compensation=0)
                return dict(metadata=meta,mode=0,flags=0 if bad_frame else 8,overrange_count=0,samples=[0]*8192),b'raw-evidence'
            def sleep(_):
                status=json.loads((folder/'status.json').read_text(encoding='utf-8'))
                if status['state'] in ('waiting_raised','waiting_lowered'):
                    (folder/('confirm_%s.json'%status['sequence'])).write_text(json.dumps(dict(sequence=status['sequence'],position='raised' if status['state']=='waiting_raised' else 'lowered')))
            receipt=execute(folder,Servo(),send,capture,contextlib.nullcontext,sleep=sleep)
            return receipt,commands,moves,captured,json.loads((folder/'status.json').read_text(encoding='utf-8'))

    def test_full_64_raw_frames_contact_and_continuous_source(self):
        receipt,commands,moves,frames,status=self.run_group()
        self.assertTrue(receipt['completed']);self.assertEqual(len(frames),64)
        self.assertTrue(all(c=={1:'down',2:'up'} for _,c in frames[:32]))
        self.assertTrue(all(c=={1:'down',2:'down'} for _,c in frames[32:48]))
        self.assertTrue(all(c=={1:'down',2:'up'} for _,c in frames[48:]))
        self.assertEqual(commands.count('DAC_ENABLE 1'),1)
        self.assertEqual(commands[-1],'HALT');self.assertEqual(moves[-1],('up',3))
        self.assertFalse(status['fault_diagnosis_executed'])

    def test_bad_frame_stops_and_raises_without_other_channels(self):
        receipt,commands,moves,frames,status=self.run_group(bad_frame=True)
        self.assertFalse(receipt['completed']);self.assertEqual(len(frames),1)
        self.assertEqual(commands[-1],'HALT');self.assertEqual(moves[-1],('up',3))

    def test_wrong_sense_binding_rejected(self):
        receipt,_,_,_,_=self.run_group(bad_route=True)
        self.assertFalse(receipt['completed']);self.assertIn('通路不对应',receipt['failure'])

    def test_unknown_servo_no_actuator_or_network_commands(self):
        receipt,commands,moves,frames,_=self.run_group(bad_servo=True)
        self.assertFalse(receipt['completed']);self.assertEqual((commands,moves,frames),([],[],[]))

    def test_missing_ground_and_same_channels_rejected(self):
        for change in (dict(fixed_ground_confirmed=False),dict(adc_channel=1)):
            payload=dict(kind='staged_abca',dac_channel=1,adc_channel=2,left_terminal='TP_A',rs_ohm=100,decimation_log2=0,frames=16,fixed_ground_confirmed=True,xy_position_confirmed=True)
            payload.update(change)
            with self.assertRaises(ValueError):validate(payload)

    def test_both_physical_assignments_and_terminal_maps_with_both_Rs(self):
        for dac in (1,2):
            for terminal in ('TP_A','TP_B'):
                for rs in (100,10000):
                    receipt,commands,_,frames,_=self.run_group(dac_channel=dac,left_terminal=terminal,rs=rs)
                    self.assertTrue(receipt['completed']);self.assertEqual(len(frames),64)
                    self.assertTrue(all(c[dac]=='down' and c[3-dac]=='up' for _,c in frames[:32]+frames[48:]))
                    self.assertTrue(all(c=={1:'down',2:'down'} for _,c in frames[32:48]))
                    self.assertEqual(commands.count('DAC_ENABLE 1'),1)
                    reverse=(dac==1)!=(terminal=='TP_A')
                    self.assertEqual('SENSE_CAPS' in commands,reverse)

    def test_reverse_role_not_supported_causes_zero_actuation(self):
        receipt,commands,moves,frames,_=self.run_group(dac_channel=2,role_support=False)
        self.assertFalse(receipt['completed']);self.assertEqual(moves,[]);self.assertEqual(frames,[])
        self.assertNotIn('HALT',commands);self.assertFalse(any(c.startswith('RELAY_SET') for c in commands))

if __name__=='__main__':unittest.main()
