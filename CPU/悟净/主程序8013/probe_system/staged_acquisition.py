
from .common import need,finite,digest

PROTOCOL='fixed-ground-staged-ABCA/1.0'

def plan(rs_ohm, fixed_ground_connected=True, dac_terminal='TP_A'):
    need(type(rs_ohm) in (int,float) and rs_ohm in (100,10000),'Rs只支持100Ω和10kΩ')
    need(fixed_ground_connected is True,'ADC针抬起及落下测量都必须保留独立固定共地')
    need(dac_terminal in ('TP_A','TP_B'),'DAC角色必须对应一个明确的电气探针端子')
    role_bits=1 if dac_terminal=='TP_A' else 4
    r=32 if rs_ohm==100 else 0
    rows=[]
    for channel,adc_position,k5,k7 in [('A','up',1,1),('B','up',1,0),('C','down',0,0),('A_check','up',1,1)]:
        mask=role_bits+r+(16 if k5 else 0)+(64 if k7 else 0)
        rows.append(dict(channel=channel,dac_probe='down',adc_probe=adc_position,relay_mask=mask,
                         K=[(mask>>i)&1 for i in range(7)],source='internal_VA' if channel in ('A','A_check') else 'internal_VB' if channel=='B' else 'ADC_probe'))
    return dict(protocol=PROTOCOL,fixed_ground_connected=True,probe_roles=dict(dac='DAC',adc='ADC'),
                dac_terminal=dac_terminal,adc_terminal='TP_B' if dac_terminal=='TP_A' else 'TP_A',relay_role_bits=role_bits,rs_ohm=rs_ohm,steps=rows,
                digital_mode_implemented=False,physical_feedback_required=True,
                contact_loading_profile='A/B/A_check: ADC probe lifted; C: ADC probe touching',hardware_qualified=False)

class SequenceFailure(RuntimeError):
    def __init__(self,primary,cleanup_errors,receipt):
        self.primary=primary;self.cleanup_errors=cleanup_errors;self.receipt=receipt
        super().__init__(str(primary)+('；清理未完成：'+'；'.join(cleanup_errors) if cleanup_errors else ''))

def acquire(controls,action,capture,emit=None):
    need(callable(capture),'缺少分通道采集回调')
    for key in ('frequency_hz','rs_ohm'):need(finite(action.get(key)) and action[key]>0,'无效测量条件：'+key)
    schedule=plan(action['rs_ohm'],action.get('fixed_ground_connected',True),action.get('dac_terminal','TP_A'));events=[];captures={};contact={'dac':'unknown','adc':'unknown'}
    def event(kind,**data):
        row=dict(kind=kind,**data);events.append(row)
        if emit:emit(kind,**data)
    receipt=dict(protocol=PROTOCOL,plan=schedule,events=events,captures=captures,completed=False,
                 hardware_executed=bool(getattr(controls,'hardware',False)),mechanical_feedback_available=bool(getattr(controls,'position_feedback_available',False)))
    def confirm(probe,position):
        need(controls.confirm(probe,position) is True,'未确认%s探针%s到位'%(probe,position));contact[probe]=position
        event('probe_position_confirmed',probe=probe,position=position,confirmation_source=getattr(controls,'confirmation_source','external_callback'))
    with controls.ownership():
        controls.preflight(action)
        primary=None;cleanup=[]
        try:
            controls.check_cancelled();controls.stop_stimulus()
            controls.raise_probe('both');confirm('dac','up');confirm('adc','up')
            controls.move_xy(action);event('positioned',condition=action.get('action_id'))
            controls.configure_route(schedule)
            controls.lower_probe('dac');confirm('dac','down')
            controls.start_stimulus(action);controls.wait_settled('DUT')
            for row in schedule['steps']:
                controls.check_cancelled()
                if row['channel']=='C':
                    controls.lower_probe('adc');confirm('adc','down')
                elif row['channel']=='A_check':
                    controls.select_source(row)
                    controls.raise_probe('adc');confirm('adc','up')
                if row['channel']!='A_check':controls.select_source(row)
                controls.wait_settled(row['channel'])
                need(contact==dict(dac='down',adc=row['adc_probe']),'实际探针状态与采样阶段不一致')
                sample=capture(row['channel'],row)
                captures[row['channel']]=sample
                event('channel_captured',channel=row['channel'],dac_probe=contact['dac'],adc_probe=contact['adc'],relay_mask=row['relay_mask'])
        except BaseException as exc:
            primary=exc
        finally:
            try:controls.stop_stimulus()
            except BaseException as exc:cleanup.append('停激励失败：'+str(exc))
            try:
                controls.raise_probe('both');confirm('dac','up');confirm('adc','up')
            except BaseException as exc:cleanup.append('抬针/到位确认失败：'+str(exc))
        receipt.update(final_contact_state=dict(contact),stimulus_stop_attempted=True,cleanup_errors=cleanup)
        if primary is not None or cleanup:
            receipt['failure']=str(primary) if primary is not None else '收尾未确认'
            raise SequenceFailure(primary or RuntimeError('收尾未确认'),cleanup,receipt)
        receipt['completed']=True;receipt['identity_sha256']=digest(dict(protocol=PROTOCOL,action=action,steps=schedule['steps']))
        return receipt
