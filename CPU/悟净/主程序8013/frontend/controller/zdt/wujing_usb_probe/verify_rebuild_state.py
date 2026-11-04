"""读取坐标重建后的硬件状态，支持中断后的检查。

    --publish-reference在驱动器参数与编码器基准逐项通过后保存坐标文件；
    运动执行状态与基准验证状态分别记录。"""
import argparse
import json
from pathlib import Path

from motorctl import Machine, USBMotor, HERE, MACHINE
import coordinate_setup as core


def verify(summary_path, run_id, publish=False):
    source=json.loads(Path(summary_path).read_text())
    coordinates=source['coordinates_candidate']
    result=dict(passed=False,source=str(summary_path),motion_completed=source.get('motion_completed',False),
                motor_parameter_writes=0,motion_commands_sent=0,axes={})
    with (HERE/(run_id+'_serial.jsonl')).open('x',encoding='utf-8') as journal:
        motor=USBMotor('usb://ch340',journal)
        try:
            for a in core.AXES:
                motor.address=a
                motor.mode=0
                version=motor.consistent([0x1F])
                assert version[2:-1]==bytes.fromhex('00 ce 23 14' if a<3 else '00 ce 21 14')
                motor.options()
                original=source['original'][str(a)]
                config=motor.config()
                home=motor.consistent([0x22])
                release=motor.consistent([0x3F])
                heartbeat=motor.consistent([0x16])
                assert config[4:-1]==bytes.fromhex(original['config'])[4:-1],('config',a)
                for key,reply in [('home',home),('release',release),('heartbeat',heartbeat)]:
                    assert reply[2:-1]==bytes.fromhex(original[key])[2:-1],(key,a)
                sample=motor.snapshot(require_ready=True)
                sample['position_deg']=core.signed(motor.query([0x36]),10)
                assert abs(sample['speed_rpm'])<0.6 and not sample['motor_flags']&0x80,(a,sample)
                phase=(sample['encoder']*360/65536-sample['position_deg'])%360
                saved=coordinates['axes'][str(a)]['origin']['origin_encoder_deg']
                error=abs((phase-saved+180)%360-180)
                assert error<=1,(a,error)
                result['axes'][str(a)]=dict(sample=sample,reference_error_deg=error,
                    position_mm=core.AXES[a]['positive_mm_sign']*sample['position_deg']/9,
                    config=config.hex(' '),home=home.hex(' '),release=release.hex(' '),heartbeat=heartbeat.hex(' '))
            result['passed']=True
            if publish:
                coordinates['valid']=True
                coordinates['last_recovery_verification']=str(HERE/(run_id+'.json'))
                coordinates['last_verified_at_utc']=core.now()
                coordinates['final_positions_mm']={a:v['position_mm'] for a,v in result['axes'].items()}
                core.save(MACHINE/'coordinates.json',coordinates)
        finally:
            motor.ser.close()
    core.save(HERE/(run_id+'.json'),result)
    print(json.dumps(result,indent=2))
    return result


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--summary',required=True)
    p.add_argument('--run-id',required=True)
    p.add_argument('--controller-time')
    p.add_argument('--execute',action='store_true')
    p.add_argument('--publish-reference',action='store_true')
    args=p.parse_args()
    if not args.execute:
        print('No USB access. Use --execute for read-only driver/reference verification.')
        return
    Machine(args.run_id,args.controller_time)
    verify(args.summary,args.run_id,args.publish_reference)


if __name__=='__main__':
    main()
