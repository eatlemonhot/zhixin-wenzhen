import math
import re
from .model import ImportError,number,normalize,stable_id
from .geometry import segments_of

MEASURE=re.compile(r'^\s*([+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)\s*(mm|mil|in|inch)?\s*$',re.I)


def measure(value):
    match=MEASURE.fullmatch(str(value))
    if not match:raise ImportError('AD尺寸单位不支持：%s'%str(value)[:40])
    scale={'mm':1.,'mil':.0254,'in':25.4,'inch':25.4}
    return number(float(match[1]),'AD尺寸')*scale[(match[2] or 'mil').lower()]


def parse(source):
    records=[]
    for line in source.splitlines():
        line=line.strip()
        if not line:continue
        if len(line)>4*1024*1024 or len(records)>250000:raise ImportError('AD文件过大。')
        values={}
        for field in line.strip('|').split('|'):
            if '=' not in field:continue
            key,value=field.split('=',1);key=key.upper()
            if key in values and values[key]!=value:raise ImportError('AD记录字段重复：'+key)
            values[key]=value
        if 'RECORD' in values:records.append(values)
    boards=[r for r in records if r['RECORD'].upper()=='BOARD']
    if len(boards)!=1 or boards[0].get('KIND','').upper()!='PROTEL_ADVANCED_PCB':
        raise ImportError('不是受支持的AD PCB ASCII 5.x文件。')
    nets=[r.get('NAME','') for r in records if r['RECORD'].upper()=='NET']
    components=[r for r in records if r['RECORD'].upper()=='COMPONENT']
    pads=[];segments=[];board=boards[0]
    ids=sorted(int(k[2:]) for k in board if re.fullmatch(r'VX\d+',k))
    if ids:
        if ids!=list(range(len(ids))):raise ImportError('AD板框顶点编号不连续。')
        points=[]
        for i in ids:
            if board.get('KIND'+str(i),'0')!='0':raise ImportError('AD圆弧板框暂未验证，请使用嘉立创原工程。')
            points.append((measure(board['VX'+str(i)]),measure(board['VY'+str(i)])))
        if points[-1]!=points[0]:points.append(points[0])
        segments=segments_of([points],1)
    else:
        layers=set()
        for k,v in board.items():
            match=re.fullmatch(r'LAYER(\d+)NAME',k)
            if match and v.replace(' ','').lower() in ('boardoutlinelayer','boardoutline'):
                layers.add('MECHANICAL'+match[1])
        for r in records:
            layer=r.get('LAYER','').replace(' ','').upper()
            if r['RECORD'].upper()=='TRACK' and (layer in layers or layer=='BOARDOUTLINELAYER'):
                segments.extend(segments_of([[(measure(r['X1']),measure(r['Y1'])),(measure(r['X2']),measure(r['Y2']))]],1))
    shapes={'ROUND':'oval','RECTANGLE':'rect','OCTAGONAL':'custom','ROUNDRECT':'roundrect'}
    for r in records:
        if r['RECORD'].upper()!='PAD':continue
        idx=len(pads);netid=int(r.get('NET','-1'));compid=int(r.get('COMPONENT','-1'))
        if netid not in (-1,65535) and not 0<=netid<len(nets):raise ImportError('AD焊盘关联未知网络。')
        if compid not in (-1,65535) and not 0<=compid<len(components):raise ImportError('AD焊盘关联未知器件。')
        layer=r.get('LAYER','').replace(' ','').upper()
        if layer not in ('TOP','TOPLAYER','BOTTOM','BOTTOMLAYER','MULTILAYER'):
            raise ImportError('AD焊盘图层未知。')
        shape=shapes.get(r.get('SHAPE','').upper())
        if shape is None:raise ImportError('AD焊盘形状尚未支持。')
        width,height=measure(r['XSIZE']),measure(r['YSIZE'])
        angle=number(float(r.get('ROTATION','0')),'AD焊盘角度')
        reference=components[compid].get('SOURCEDESIGNATOR','') if 0<=compid<len(components) else ''
        hole=measure(r.get('HOLESIZE','0'))
        allowed=layer in ('TOP','TOPLAYER','MULTILAYER') and (hole==0 or r.get('PLATED','').upper()=='TRUE') and shape!='custom'
        if shape=='oval' and width==height:shape='circle'
        pads.append(dict(id=stable_id('altium',idx),source_id=str(idx),reference=reference,
            number=r.get('NAME',''),x=measure(r['X']),y=-measure(r['Y']),width=width,height=height,
            angle=angle,net=nets[netid] if 0<=netid<len(nets) else '',shape=shape,
            roundrect_ratio=.25 if shape=='roundrect' else 0,allowed=allowed,
            side='both' if layer=='MULTILAYER' else 'top' if layer in ('TOP','TOPLAYER') else 'bottom'))
    return normalize(pads,segments,'AD ASCII 5.x',dict(component_count=len(components),source_units='mil/mm'),
        ['仅导入板框和焊盘；原理图、走线与铺铜不在本解析范围内。'])
