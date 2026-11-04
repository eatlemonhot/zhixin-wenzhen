"""Native C checks with register/DMA stubs; no board access or flashing."""
from pathlib import Path
import argparse,json,os,shutil,subprocess

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--cc');parser.add_argument('--out',type=Path,required=True);p=parser.parse_args()
    fw=Path(__file__).resolve().parent;app=fw.parents[1];stub=app/'teammate_pl/tests/fixtures/7020_stubs'
    cc=Path(p.cc or shutil.which('gcc') or 'gcc');out=p.out.resolve();out.mkdir(parents=True,exist_ok=True)
    local=out/'stubs';local.mkdir(exist_ok=True)
    (local/'xil_io.h').write_text('#include <stdint.h>\nuint32_t Xil_In32(uintptr_t);\nvoid Xil_Out32(uintptr_t,uint32_t);\n')
    (local/'sleep.h').write_text('void usleep(unsigned long);\n')
    env=dict(os.environ,PATH=str(cc.parent)+os.pathsep+os.environ['PATH'])
    common=[str(cc),'-std=c11','-D__USE_MINGW_ANSI_STDIO=1','-Wall','-Wextra','-Werror','-O2','-I'+str(local),'-I'+str(stub/'adc'),'-I'+str(stub),'-I'+str(fw/'src')]
    executable=out/('sense_roles.exe' if os.name=='nt' else 'sense_roles')
    rows=[]
    for name,command in [('native_compile',common+[str(fw/'tests/test_sense_control.c'),str(fw/'src/fdw_lxb_io.c'),'-o',str(executable)]),('native_run',[str(executable)]),('tcp_syntax',common+['-fsyntax-only',str(fw/'src/tcp_server.c')])]:
        cp=subprocess.run(command,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
        (out/(name+'.log')).write_bytes(cp.stdout);rows.append(dict(name=name,passed=cp.returncode==0))
        if cp.returncode:raise RuntimeError(name+' failed: '+cp.stdout.decode(errors='replace'))
    report=dict(passed=True,tests=rows,scope='Host C with register/DMA stubs, not ARM build or hardware qualification',physical_hardware_executed=False)
    (out/'report.json').write_text(json.dumps(report,indent=2));print(json.dumps(report))

if __name__=='__main__':main()
