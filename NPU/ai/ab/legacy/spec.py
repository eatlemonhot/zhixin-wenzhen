import hashlib
import json
from pathlib import Path
import sys
import numpy as np

ROOT=Path(__file__).resolve().parent
DESIGN_ROOT=ROOT.parent/'two_board_redesign_20261015'
DESIGNS=json.loads((ROOT/'board_designs.json').read_text())

SEED=2026101801
FREQUENCIES=np.array([10000.,20000.,50000.,100000.])
RS_RANGES=(100,1000)
FEATURE_NAMES=['amp1_over_source_peak','amp2_over_source_peak','amp3_over_source_peak',
               'relative_h2_real','relative_h2_imag','relative_h3_real','relative_h3_imag']
ACTION_COUNT=12
CHANNELS=len(FEATURE_NAMES)
FEATURES=2+1+ACTION_COUNT*CHANNELS+ACTION_COUNT
FS=25e6
FRAME_SAMPLES=8192
SOURCE_PEAK=.1
MODEL=ROOT.parent/'vendor/OPAx197.LIB'


def catalog(board):
    rows=[{'id':0,'name':'normal','ref':None,'mode':'normal'}]
    def add(ref,modes):
        for mode in modes:rows.append({'id':len(rows),'name':f'{ref}_{mode}','ref':ref,'mode':mode})
    if board=='A':
        for r in ('R3','R6'):add(r,('low','high'))
        add('R5',('low','high','open','short'))
        add('R8',('open','short'))
        for c in ('C1','C2'):add(c,('low','high','open','short'))
        add('C3',('low','high','open'))
        for r in ('R10','R2'):add(r,('low','high'))
    else:
        for r in ('R2','R5'):add(r,('low','high'))
        add('R3',('low','high','open','short'))
        add('R6',('open','short'))
        add('C1',('low','high','open','short'))
        for c in ('C3','C6'):add(c,('low','high','open'))
        add('R1',('low','high','open'))
        add('D1',('open',));add('D2',('open',))
    return rows


CATALOGS={b:catalog(b) for b in DESIGNS}
CLASSES=max(map(len,CATALOGS.values()))


def action_info(board,action):
    pi,fi=divmod(int(action),len(FREQUENCIES))
    return DESIGNS[board]['main_probes'][pi],float(FREQUENCIES[fi])


def encode(board,rs,values,mask):
    values=np.asarray(values,dtype=np.float32).reshape(ACTION_COUNT,CHANNELS)
    mask=np.asarray(mask,dtype=bool).reshape(ACTION_COUNT)
    clean=np.zeros_like(values);clean[mask]=values[mask]
    if not np.isfinite(clean).all():raise ValueError('Nonfinite measured feature')
    return np.concatenate([[board=='A',board=='B',np.log(rs/100.)],clean.ravel(),mask.astype(float)]).astype(np.float32)


def sample_physics(board,group,seed=SEED,stress=False):
    rng=np.random.default_rng(seed+group*1009+(0 if board=='A' else 400000))
    vals={}
    for c in DESIGNS[board]['parts']:
        if c['kind'] in ('R','C'):
            tol=.01 if c['kind']=='R' else (.10 if stress else .05)
            vals[c['ref']]=float(c['value']*rng.uniform(1-tol,1+tol))
    nuisance={'rs_factor':float(rng.uniform(.999,1.001)), 'rin':float(75*rng.uniform(.995,1.005)),
              'cin':float(20e-12*rng.uniform(.9,1.1)), 'supply':float(5*rng.uniform(.99,1.01)),
              'source':float(SOURCE_PEAK*rng.uniform(.99,1.01)),
              'diode_Is':float(2.52e-9*np.exp(rng.normal(0,.08))),
              'diode_N':float(1.752*rng.uniform(.99,1.01))}
    return vals,nuisance


def fault_values(board,event,base,seed):
    rng=np.random.default_rng(seed)
    values=dict(base); extra=[];factor=None
    if event['mode']=='normal':return values,extra,factor
    part=next(c for c in DESIGNS[board]['parts'] if c['ref']==event['ref'])
    mode=event['mode'];ref=part['ref']
    if mode in ('low','high'):
        lo,hi=(.10,.35) if part['kind']=='R' else (.20,.50)
        factor=1+(-1 if mode=='low' else 1)*rng.uniform(lo,hi)
        values[ref]=float(part['value']*factor)
    elif mode=='open':
        if part['kind']=='R':values[ref]=1e9
        else:
            values[ref]=None
            extra.append(f"ROPEN_{ref} {part['a']} {part['b']} 1e9")
    elif mode=='short':
        if part['kind']=='R':values[ref]=.1
        else:
            values[ref]=None
            extra.append(f"RSHORT_{ref} {part['a']} {part['b']} .1")
    return values,extra,factor


def metadata():
    return {'schema':'two-active-board-v1','input_name':'F','input_shape':[1,FEATURES],
            'output_name':'fault_logits','output_shape':[1,CLASSES],
            'deployment_input_name':'Z','deployment_input_shape':[1,FEATURES],
            'deployment_preprocess':'Z=(F-mean)*inv_std, CPU FP32, parameters from normalization.npz',
            'input_layout':'board_A,board_B,ln(Rs/100),12x7 feature values (masked=0),12 mask flags',
            'action_order':'probe-major, then frequency-major',
            'frequencies_Hz':FREQUENCIES.tolist(),'probes':{b:d['main_probes'] for b,d in DESIGNS.items()},
            'feature_channels':FEATURE_NAMES,'Rs_ranges_ohm':list(RS_RANGES),'source_peak_nominal_V':SOURCE_PEAK,
            'fs_Hz':FS,'frame_samples':FRAME_SAMPLES,'catalogs':CATALOGS,
            'design_sha256':hashlib.sha256((ROOT/'board_designs.json').read_bytes()).hexdigest(),
            'opamp_macro_sha256':json.loads((ROOT/'source_manifest.json').read_text())['opamp_macro_sha256'],
            'diode_model':'representative assumed switch model, not vendor-qualified 1N4148W',
            'topology_scope':'known A/B templates only, no arbitrary unseen PCB generalization',
            'fault_scope':'single fault only; normal plus listed modes; no IC/power-rail fault coverage'}


if __name__=='__main__':
    (ROOT/'interface.json').write_text(json.dumps(metadata(),indent=2)+'\n')
    print('F=',FEATURES,'classes=',CLASSES,'catalogs=',{b:len(c) for b,c in CATALOGS.items()})
