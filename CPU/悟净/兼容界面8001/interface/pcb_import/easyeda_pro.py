
import json
from collections import defaultdict
from .model import ImportError, number, normalize, rotate, stable_id
from .geometry import paths, arc, segments_of

WANTED={'DOCHEAD','DELETE_DOC','CANVAS','LAYER','META','NET','COMPONENT','PAD','PAD_NET','ATTR','POLY','LINE','ARC','PART','PIN','WIRE','TEXT','RECT','CIRCLE','ELLIPSE','BEZIER','TABLE','OBJ','VIA'}


def read_documents(logs):
    docs={};decoder=json.JSONDecoder();total=0
    for text in logs:
        current=None
        for index,line in enumerate(text.splitlines(),1):
            line=line.strip()
            if not line:continue
            total+=1
            if total>250000 or len(line)>4*1024*1024:raise ImportError('工程记录超过读取上限。')
            try:head,end=decoder.raw_decode(line)
            except (ValueError,RecursionError):raise ImportError('EPRU第%d行记录头损坏。'%index) from None
            if not isinstance(head,dict) or not isinstance(head.get('type'),str) or line[end:end+2]!='||':
                raise ImportError('EPRU第%d行不是V3记录。'%index)
            typ=head['type']
            if typ not in WANTED:continue
            tail=line[end+2:]
            if tail in ('','|'):payload=None
            else:
                try:payload,used=decoder.raw_decode(tail)
                except (ValueError,RecursionError):raise ImportError('EPRU第%d行%s数据损坏。'%(index,typ)) from None
                if tail[used:] not in ('','|') or not isinstance(payload,dict):
                    raise ImportError('EPRU第%d行数据结尾无效。'%index)
            ticket=head.get('ticket')
            if type(ticket) is not int or ticket<0:raise ImportError('EPRU版本号无效。')
            if typ=='DOCHEAD':
                if not payload or not payload.get('uuid') or not payload.get('docType'):
                    raise ImportError('工程文档标识缺失。')
                key=(payload['docType'],payload['uuid'])
                current=docs.setdefault(key,dict(head=payload,records={}))
                continue
            if current is None:raise ImportError('工程记录出现在文档头之前。')
            uid=head.get('id','DELETE_DOC' if typ=='DELETE_DOC' else '')
            if not isinstance(uid,str) or not uid:raise ImportError('V3图元缺少编号。')
            key=(typ,uid);old=current['records'].get(key)
            if old is not None and ticket==old[0] and payload!=old[1]:
                raise ImportError('同版本的图元记录冲突。')
            if old is None or ticket>=old[0]:current['records'][key]=(ticket,payload)
    return docs


def rows(doc,typ):
    return [(uid,data) for (kind,uid),(_,data) in doc['records'].items() if kind==typ and data is not None]


def active(doc):
    markers=rows(doc,'DELETE_DOC')
    return not any(p.get('isDelete') is True for _,p in markers)


def read_pad(uid,p,origin=(0,0),angle=0,bottom=False,net=None,reference='',component=''):
    x,y=number(p.get('centerX'),'焊盘中心X'),number(p.get('centerY'),'焊盘中心Y')
    px,py=rotate(x,-y if bottom else y,angle)
    shape=p.get('defaultPad')
    if not isinstance(shape,dict):raise ImportError('焊盘形状定义缺失。')
    kind=shape.get('padType');supported=kind in ('RECT','ELLIPSE','OVAL')
    if not supported:raise ImportError('暂不支持焊盘形状%s。'%kind)
    width,height=number(shape.get('width'),'焊盘宽度'),number(shape.get('height'),'焊盘高度')
    layer=p.get('layerId')
    if type(layer) is not int or layer not in (1,2,12):raise ImportError('焊盘图层不是顶层、底层或多层。')
    if bottom and layer in (1,2):layer=3-layer
    hole=p.get('hole');has_hole=isinstance(hole,dict) and any(number(hole.get(k,0),'孔尺寸')>0 for k in ('width','height'))
    plated=p.get('plated') is True
    copper=not has_hole or plated
    pad_angle=number(p.get('padAngle',0),'焊盘旋转角度')
    rotation=angle+(-pad_angle if bottom else pad_angle)
    radius=number(shape.get('radius',0),'焊盘圆角')/100
    if not 0<=radius<=0.5:raise ImportError('焊盘圆角比例未知。')
    allowed=layer in (1,12) and copper and not p.get('specialPad') and p.get('padType','NORMAL')!='MARKER'
    return dict(id=stable_id(component,uid),source_id=uid,reference=reference,number=str(p.get('num','')),
        x=(origin[0]+px)*.0254,y=-(origin[1]+py)*.0254,width=width*.0254,height=height*.0254,
        angle=rotation,net=p.get('netName','') if net is None else net,
        shape=('roundrect' if radius else 'rect') if kind=='RECT' else 'circle' if width==height else 'oval',
        roundrect_ratio=radius,allowed=bool(allowed),side='both' if layer==12 else 'top' if layer==1 else 'bottom')


def parse(logs, board_id=None):
    docs=read_documents(logs)
    pcbs=[d for (typ,_),d in docs.items() if typ=='PCB' and active(d)]
    if board_id is not None:pcbs=[d for d in pcbs if d['head']['uuid']==board_id]
    if len(pcbs)!=1:raise ImportError('工程中有%d块PCB，请导出单块PCB或指定board_id。'%len(pcbs))
    board=pcbs[0];attrs=defaultdict(dict)
    for _,p in rows(board,'ATTR'):
        parent,key=p.get('parentId'),p.get('key')
        if not isinstance(parent,str) or not isinstance(key,str):raise ImportError('器件属性格式错误。')
        old=attrs[parent].get(key)
        if old is not None and old!=p.get('value'):raise ImportError('器件属性冲突：'+key)
        attrs[parent][key]=p.get('value')
    footprints={uuid:d for (typ,uuid),d in docs.items() if typ=='FOOTPRINT' and active(d)}
    nets={};numbers=defaultdict(set)
    for uid,p in rows(board,'PAD_NET'):
        try:key=json.loads(uid)
        except ValueError:raise ImportError('PAD_NET关联编号损坏。') from None
        if not isinstance(key,list) or len(key) not in (3,4) or key[0]!='PAD_NET':raise ImportError('PAD_NET编号格式未知。')
        net=p.get('padNet')
        if not isinstance(net,str):raise ImportError('焊盘网络名称缺失。')
        comp,num=key[1:3]
        numbers[(comp,str(num))].add(net)
        if len(key)==4:
            pair=(comp,key[3])
            if pair in nets and nets[pair]!=net:raise ImportError('同一焊盘关联多个网络。')
            nets[pair]=net
    pads=[];components=rows(board,'COMPONENT');component_ids={c for c,_ in components}
    for comp,p in components:
        if type(p.get('layerId')) is not int or p.get('layerId') not in (1,2):raise ImportError('器件图层不是顶层或底层。')
        if p.get('layerIdReplacements'):raise ImportError('暂不支持器件自定义图层替换。')
        fp=footprints.get(attrs[comp].get('Footprint'))
        if fp is None:raise ImportError('器件%s缺少封装，无法确定焊盘坐标。'%attrs[comp].get('Designator',comp))
        origin=(number(p.get('x'),'器件X'),number(p.get('y'),'器件Y'));angle=number(p.get('angle',0),'器件角度')
        if any(c.get('originX',0) or c.get('originY',0) for _,c in rows(fp,'CANVAS')):
            raise ImportError('暂不支持非零封装原点，请在嘉立创中将封装原点归零后重试。')
        for uid,pad in rows(fp,'PAD'):
            possible=numbers.get((comp,str(pad.get('num',''))),set())
            net=nets.get((comp,uid))
            if net is None:
                if len(possible)>1:raise ImportError('同编号的多个焊盘网络不明确。')
                net=next(iter(possible),'')
            pads.append(read_pad(uid,pad,origin,angle,p['layerId']==2,net,
                                 str(attrs[comp].get('Designator',comp)),comp))
    for uid,pad in rows(board,'PAD'):pads.append(read_pad(uid,pad,component='free'))
    segments=[]
    layers={int(json.loads(uid)[1]):p.get('layerType') for uid,p in rows(board,'LAYER')}
    for uid,p in rows(board,'POLY'):
        if layers.get(p.get('layerId'))=='OUTLINE':segments.extend(segments_of(paths(p.get('path'))))
    for uid,p in rows(board,'LINE'):
        if layers.get(p.get('layerId'))=='OUTLINE':
            segments.extend(segments_of([[(number(p.get('startX'),'板框X'),number(p.get('startY'),'板框Y')),
                 (number(p.get('endX'),'板框X'),number(p.get('endY'),'板框Y'))]]))
    for uid,p in rows(board,'ARC'):
        if layers.get(p.get('layerId'))=='OUTLINE':
            segments.extend(segments_of([arc((number(p.get('startX'),'圆弧X'),number(p.get('startY'),'圆弧Y')),
                (number(p.get('endX'),'圆弧X'),number(p.get('endY'),'圆弧Y')),number(p.get('angle'),'圆弧角度'))]))
    dangling={comp for comp,_ in numbers if comp not in component_ids}
    warnings=[]
    if dangling:warnings.append('%d条已无对应器件的网络关联已忽略。'%len(dangling))
    disabled=sum(not p['allowed'] for p in pads)
    if disabled:warnings.append('%d个底面焊盘、非金属化孔或特殊焊盘不可定位。'%disabled)
    declared=set()
    for uid,_ in rows(board,'NET'):
        item=json.loads(uid)
        if not isinstance(item,list) or len(item)!=2 or item[0]!='NET' or not isinstance(item[1],str):
            raise ImportError('网络编号格式损坏。')
        declared.add(item[1])
    if any(p['net'] and p['net'] not in declared for p in pads):raise ImportError('焊盘引用了未声明的网络。')
    result = normalize(pads,segments,'嘉立创专业版 V3',dict(board_id=board['head']['uuid'],
        source_units='mil',display_units=next((p.get('unit') for _,p in rows(board,'CANVAS')),None),
        component_count=len(components),footprint_count=len(footprints),
        live_pad_net_records=len(rows(board,'PAD_NET')),declared_net_count=len(declared-{''})),warnings)

    ox,oy=result['dimensions']['origin']
    graphics=[]
    for _,line in rows(board,'LINE'):
        if line.get('layerId') in (1,2):
            graphics.append(dict(kind='line',layer=line['layerId'],net=line.get('netName',''),
                points=[[(line['startX']*.0254)-ox,(-line['startY']*.0254)-oy],[(line['endX']*.0254)-ox,(-line['endY']*.0254)-oy]],
                width=number(line.get('width',1),'走线宽度')*.0254))
    for _,via in rows(board,'VIA'):
        graphics.append(dict(kind='via',x=via['centerX']*.0254-ox,y=-via['centerY']*.0254-oy,
                             diameter=via['viaDiameter']*.0254,hole=via['holeDiameter']*.0254,net=via.get('netName','')))
    result['graphics']=graphics
    footprint_titles={uid:next((m.get('title','') for _,m in rows(fp,'META')),'') for uid,fp in footprints.items()}
    result['components']=[dict(id=c,reference=attrs[c].get('Designator',c),footprint=footprint_titles.get(attrs[c].get('Footprint'),''),x=p['x']*.0254-ox,y=-p['y']*.0254-oy,
                               angle=p.get('angle',0),side='top' if p['layerId']==1 else 'bottom',value=p.get('attrs',{}).get('Value','')) for c,p in components]
    from .schematic import parse as parse_schematic
    result['schematic'] = parse_schematic(docs,board,rows,active)
    result['warnings'].extend(result['schematic']['warnings'])
    return result
