from pathlib import Path
import sys,subprocess,json,hashlib,platform,shutil
ROOT=Path(__file__).resolve().parent
windows=sys.platform=='win32';compiler=shutil.which('g++')
if compiler is None:raise RuntimeError('g++ not available')
arch='windows' if windows else platform.machine()
name='ps_diagnostic.dll' if windows else 'libps_diagnostic_'+arch+'.so';library=ROOT/name
command=[compiler,'-std=c++17','-O3','-fno-fast-math','-ffp-contract=off','-shared']
if windows:command+=['-static-libstdc++','-static-libgcc']
else:command+=['-fPIC','-fvisibility=hidden']
command += [str(ROOT/'ps_diagnostic.cpp'),'-o',str(library)]
cp=subprocess.run(command,capture_output=True);(ROOT/'build.log').write_bytes(cp.stdout+cp.stderr)
if cp.returncode:raise RuntimeError(cp.stderr.decode('utf-8','replace'))
report=dict(ABI=1,precision='IEEE FP64; no fast-math; FP contraction disabled',compiler=subprocess.check_output([compiler,'--version'],universal_newlines=True).splitlines()[0],compiler_target=subprocess.check_output([compiler,'-dumpmachine'],universal_newlines=True).strip(),command=command,architecture=arch,library=name,source_sha256=hashlib.sha256((ROOT/'ps_diagnostic.cpp').read_bytes()).hexdigest(),library_sha256=hashlib.sha256(library.read_bytes()).hexdigest())
(ROOT/('build_manifest_'+arch+'.json')).write_text(json.dumps(report,indent=2));print(report)
