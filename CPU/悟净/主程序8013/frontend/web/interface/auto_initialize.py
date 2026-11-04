import json
from pathlib import Path
import threading
from .file_lock import fcntl
from .motor_service import ControlError


class AutoInitializer:
    def __init__(self,motor,servo,runtime,boot_id,idle=lambda:True,guard=None):
        self.motor,self.servo=motor,servo
        self.path=Path(runtime);self.boot_id=boot_id;self.idle=idle;self.guard=guard
        self.losses=0;self.closed=threading.Event();self.owner=None
        try:self.value=json.loads((self.path/'state.json').read_text())
        except (OSError,ValueError):self.value={}
        if self.value.get('boot_id')!=boot_id:self.value=dict(boot_id=boot_id,phase='waiting_devices',attempted=False,generation=0)
        motor.initialization=dict(self.value)

    def save(self,**fields):
        updated=dict(self.value,**fields)
        if updated==self.value:
            self.motor.initialization=dict(self.value);return
        self.value=updated;self.path.mkdir(parents=True,exist_ok=True)
        temp=self.path/'state.tmp';temp.write_text(json.dumps(self.value,ensure_ascii=False)+'\n');temp.replace(self.path/'state.json')
        self.motor.initialization=dict(self.value)

    def tick(self):
        state=self.motor.status()
        if state['stopped']:
            self.save(message='停车锁定中，自动初始化暂停；不会自动解除停车。');return
        if state['busy'] or not self.idle():return
        job=state.get('last_job') or {}
        if job.get('action')=='rebuild' and job.get('state')=='completed' and state.get('ready'):
            if self.value.get('job_id')!=job.get('job_id'):
                self.save(phase='ready',attempted=True,job_id=job['job_id'],message='初始化完成，已沿用当前机械参考。')
        if self.value.get('phase')=='running':
            identifier=self.value.get('job_id')
            try:result=json.loads((self.motor.runtime/(identifier+'.json')).read_text())
            except (OSError,ValueError,TypeError):result=None
            if result and result.get('passed') and result.get('ready'):
                self.save(phase='ready',message='自动抬针与坐标重建完成。')
            elif job.get('job_id')==identifier and job.get('state')=='failed':
                self.save(phase='fault',message=job.get('error','初始化失败；不会自动重试，请检查后手动重建。'))
            elif result and not result.get('passed'):
                self.save(phase='fault',message=result.get('error','初始化失败；请检查后手动重建。'))
            elif not result:
                self.save(phase='fault',message='上次初始化未完整结束；请检查后手动重建，不自动重试。')
            return
        if self.value.get('phase') in ('fault','claiming'):return
        observed=self.motor.inspect_idle()
        if observed is None:return
        if not observed.get('connected'):
            self.losses+=1
            if self.losses>=2:
                self.save(phase='waiting_devices',
                          message='等待四轴电源/USB就绪。')
            return
        self.losses=0
        needs_home=(not self.value.get('attempted') or not observed.get('reference_valid'))
        if not needs_home:
            self.save(phase='ready',message='四轴参考正常，未重复找边。');return
        try:
            servo=self.servo.run({'action':'read'})
            self.servo._motion_state(servo)
        except Exception as exc:
            self.save(phase='waiting_devices',message='等待双针PWM就绪：'+str(exc));return
        from contextlib import nullcontext
        with self.guard if self.guard is not None else nullcontext():
            if not self.idle() or self.motor.status()['busy']:return
            self.save(phase='claiming',attempted=True,message='正在自动抬针并重建四轴坐标。')
            try:identifier=self.motor.start('rebuild')
            except ControlError as exc:
                self.save(phase='waiting_devices',attempted=False,message=str(exc));return
            self.save(phase='running',job_id=identifier,generation=self.value.get('generation',0)+1)

    def loop(self):
        self.path.mkdir(parents=True,exist_ok=True)
        while not self.closed.is_set():
            if self.owner is None:
                handle=(self.path/'owner.lock').open('a')
                try:fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB);self.owner=handle
                except BlockingIOError:handle.close();self.closed.wait(1);continue
                try:self.value=json.loads((self.path/'state.json').read_text())
                except (OSError,ValueError):pass
                if self.value.get('boot_id')!=self.boot_id:self.value=dict(boot_id=self.boot_id,phase='waiting_devices',attempted=False,generation=0)
                if self.value.get('phase')=='claiming':self.save(phase='fault',message='初始化提交时中断，请检查后手动重建。')
            try:self.tick()
            except Exception as exc:self.save(phase='fault',message='自动初始化已暂停：'+str(exc))
            self.closed.wait(3 if self.value.get('phase') in ('waiting_devices','running') else 5)

    def start(self):
        threading.Thread(target=self.loop,name='probe-auto-initialize',daemon=True).start()


def register(app):
    import os
    if os.environ.get('FDW_AUTO_INITIALIZE')!='1' or app.config.get('TESTING'):return
    motor=app.extensions['motor_service'];servo=app.extensions['servo_service'];measurement_lock=app.extensions['measurement_lock']
    boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip()
    def idle():return not app.extensions['servo_cycle_service'].busy and not app.extensions['unpowered_measurements'].busy
    initializer=AutoInitializer(motor,servo,Path(app.instance_path)/'auto_initialize',boot_id,idle,measurement_lock)
    app.extensions['auto_initializer']=initializer;initializer.start()
