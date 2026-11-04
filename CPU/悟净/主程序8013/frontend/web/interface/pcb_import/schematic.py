"""解析V3原理图图形及PCB引脚关联。

    原理图采用0.01英寸单位、屏幕Y向下、逆时针正旋转。
    PCB网络身份来自PAD_NET，几何连线推断带有独立来源标识。"""
import math
import re
from collections import defaultdict
from html import escape
from .model import number, ImportError
from .attributes import merge

GRAPHICS = {'LINE','POLY','RECT','CIRCLE','ELLIPSE','ARC','BEZIER','TEXT','PIN','TABLE'}


def transform(x,y,component):
    if component.get('isMirror'): x=-x
    a=math.radians(-number(component.get('rotation',0),'原理图旋转'))
    return (component.get('x',0)+x*math.cos(a)-y*math.sin(a),
            component.get('y',0)+x*math.sin(a)+y*math.cos(a))


def parse(docs, board, rows, active):
    symbols={uid:d for (t,uid),d in docs.items() if t=='SYMBOL' and active(d)}
    devices={uid:dict(rows(d,'META')).get('META',{}).get('attributes',{}) for (t,uid),d in docs.items() if t=='DEVICE' and active(d)}
    board_meta=dict(rows(board,'META')).get('META',{})
    sch_ids={uid for (t,uid),d in docs.items() if t=='SCH' and active(d)
             and dict(rows(d,'META')).get('META',{}).get('board')==board_meta.get('board')}
    pages=[d for (t,_),d in docs.items() if t=='SCH_PAGE' and active(d)
           and dict(rows(d,'META')).get('META',{}).get('schematic') in sch_ids]
    if not pages and not sch_ids: pages=[d for (t,_),d in docs.items() if t=='SCH_PAGE' and active(d)]
    def attributes(doc):
        out=defaultdict(dict)
        for _,p in rows(doc,'ATTR'):out[p.get('parentId','')][p.get('key','')]=p
        return out
    pcb_attrs=attributes(board); pcb_by_uid=defaultdict(list);pcb_by_ref=defaultdict(list)
    for uid,placement in rows(board,'COMPONENT'):
        a=dict(placement.get('attrs',{}),**{k:p.get('value') for k,p in pcb_attrs[uid].items()})
        pcb_by_uid[a.get('Unique ID')].append((uid,a));pcb_by_ref[a.get('Designator')].append((uid,a))
    pcb_nets=defaultdict(set)
    import json
    for uid,p in rows(board,'PAD_NET'):
        key=json.loads(uid);pcb_nets[(key[1],str(key[2]))].add(p['padNet'])
    output=[];all_components=[];warnings=[]
    for page in pages:
        attrs=attributes(page); parts=[];bounds=[];pins=[];components=[];wire_segments=[]
        def n(p,k,default=0):return number(p.get(k) if p.get(k) is not None else default,'原理图'+k)
        def color(v,default):return v if isinstance(v,str) and re.fullmatch(r'#[0-9a-fA-F]{6}',v) else default
        def xy(x,y):bounds.append((x,y));return '%g,%g'%(x,y)
        def text(p,value=None):
            value=p.get('value') if value is None else value
            if value is None or p.get('x') is None or p.get('y') is None:return ''
            x,y=n(p,'x'),n(p,'y');size=n(p,'fontSize',10);size=max(3,min(size,100))
            align=p.get('align') or 'LEFT_BOTTOM';anchor='end' if align.startswith('RIGHT') else 'middle' if align.startswith('CENTER') else 'start'
            baseline='central' if align.endswith('MIDDLE') else 'hanging' if align.endswith('TOP') else 'auto'
            xy(x,y);bounds.extend([(x-size,y-size),(x+len(str(value))*size*.55,y+size)])
            return '<text x="%g" y="%g" font-size="%g" text-anchor="%s" dominant-baseline="%s" fill="%s" stroke="none" transform="rotate(%g %g %g)">%s</text>'%(x,y,size,anchor,baseline,color(p.get('color'),'#263956'),-n(p,'rotation'),x,y,escape(str(value)))
        def draw(typ,p):
            sw=max(.3,min(n(p,'strokeWidth',1),20));stroke=color(p.get('strokeColor'),'#9e3d39');fill=color(p.get('fillColor'),'none')
            style='stroke="%s" stroke-width="%g" fill="%s" stroke-linecap="round" stroke-linejoin="round"'%(stroke,sw,fill)
            if typ=='LINE':
                a=(n(p,'startX'),n(p,'startY'));b=(n(p,'endX'),n(p,'endY'));xy(*a);xy(*b)
                group=p.get('lineGroup');net=attrs.get(group,{}).get('NET',{}).get('value') or ''
                if group:wire_segments.append(dict(a=a,b=b,group=group,net=net))
                return '<path d="M%s L%s" %s/>'%(xy(*a),xy(*b),style if not group else style.replace(stroke,'#21815c'))
            if typ=='POLY':
                points=p.get('points',[])
                if not points:return ''
                s='M'+' L'.join(xy(n(v,'x'),n(v,'y')) for v in points)
                return '<path d="%s%s" %s/>'%(s,' Z' if p.get('closed') else '',style)
            if typ=='RECT':
                x1,y1,x2,y2=[n(p,k) for k in ('dotX1','dotY1','dotX2','dotY2')];xy(x1,y1);xy(x2,y2)
                return '<rect x="%g" y="%g" width="%g" height="%g" rx="%g" %s/>'%(min(x1,x2),min(y1,y2),abs(x2-x1),abs(y2-y1),abs(n(p,'radiusX')),style)
            if typ in ('CIRCLE','ELLIPSE'):
                x,y=n(p,'centerX'),n(p,'centerY');rx=abs(n(p,'radius' if typ=='CIRCLE' else 'radiusX'));ry=rx if typ=='CIRCLE' else abs(n(p,'radiusY'));xy(x-rx,y-ry);xy(x+rx,y+ry)
                return '<ellipse cx="%g" cy="%g" rx="%g" ry="%g" %s/>'%(x,y,rx,ry,style)
            if typ=='ARC':
                ax,ay,bx,by,cx,cy=[n(p,k) for k in ('startX','startY','referX','referY','endX','endY')]
                det=2*(ax*(by-cy)+bx*(cy-ay)+cx*(ay-by))
                if abs(det)<1e-9:return ''
                ux=((ax*ax+ay*ay)*(by-cy)+(bx*bx+by*by)*(cy-ay)+(cx*cx+cy*cy)*(ay-by))/det
                uy=((ax*ax+ay*ay)*(cx-bx)+(bx*bx+by*by)*(ax-cx)+(cx*cx+cy*cy)*(bx-ax))/det
                r=math.hypot(ax-ux,ay-uy);a,b,c=[math.atan2(y-uy,x-ux) for x,y in ((ax,ay),(bx,by),(cx,cy))]
                sweep=1 if (b-a)%(2*math.pi)<(c-a)%(2*math.pi) else 0
                delta=(c-a)%(2*math.pi) if sweep else (a-c)%(2*math.pi)
                xy(ux-r,uy-r);xy(ux+r,uy+r)
                return '<path d="M%s A%g,%g 0 %d %d %s" %s/>'%(xy(ax,ay),r,r,delta>math.pi,sweep,xy(cx,cy),style)
            if typ=='BEZIER':
                v=p.get('controls',[])
                if len(v) in (6,8):
                    return '<path d="M%s %s%s" %s/>'%(xy(v[0],v[1]),'Q' if len(v)==6 else 'C',' '.join(xy(v[i],v[i+1]) for i in range(2,len(v),2)),style)
            if typ=='TEXT':return text(p)
            if typ=='PIN':
                if p.get('display') is False:return ''
                x,y=n(p,'x'),n(p,'y');a=math.radians(n(p,'rotation'));length=n(p,'length')
                return '<path d="M%s L%s" %s/>'%(xy(x,y),xy(x+length*math.cos(a),y-length*math.sin(a)),style)
            return ''
        page_id=page['head']['uuid']
        for uid,c in rows(page,'COMPONENT'):
            a={k:p.get('value') for k,p in attrs[uid].items()};sym=symbols.get(a.get('Symbol'))
            ref=a.get('Designator') or '';matches=pcb_by_uid.get(a.get('Unique ID'),[]) if a.get('Unique ID') else pcb_by_ref.get(ref,[]) if ref else []
            linked=matches[0] if len(matches)==1 and matches[0][1].get('Designator')==ref else None
            if ref and not linked:warnings.append('原理图器件%s无法唯一关联PCB。'%ref)
            comp=dict(id=uid,page_id=page_id,reference=ref,value=a.get('Value') or a.get('Manufacturer Part') or a.get('Name') or '',
                      pcb_component_id=linked[0] if linked else None,pins=[])
            if not sym:
                warnings.append('原理图符号缺失：'+(ref or uid));continue
            sa=attributes(sym);part=c.get('partId');graphics=[]
            # Local symbol coordinates are transformed once by the SVG group.
            before=len(bounds)
            for (typ,sid),(_,p) in sym['records'].items():
                if p is None or typ not in GRAPHICS or p.get('partId') not in (None,part):continue
                graphics.append(draw(typ,p))
                if typ=='PIN':
                    pa={k:v.get('value') for k,v in sa[sid].items()};num=str(pa.get('Pin Number',''));netset=pcb_nets.get((linked[0],num),set()) if linked else set()
                    net=next(iter(netset)) if len(netset)==1 else (str(a.get('Global Net Name') or '') if not ref else '')
                    x,y=transform(n(p,'x'),n(p,'y'),c)
                    pin=dict(id=sid,number=num,name=pa.get('Pin Name',''),x=x,y=y,net=net,pcb_component_id=linked[0] if linked else None)
                    comp['pins'].append(pin);pins.append(pin)
                    for _,ap in sa[sid].items():
                        if ap.get('valueVisible'):graphics.append(text(ap))
            local=bounds[before:];del bounds[before:];bounds.extend(transform(x,y,c) for x,y in local)
            if ref and local:
                lx=min(x for x,y in local)-3;ly=min(y for x,y in local)-3
                lw=max(x for x,y in local)-lx+3;lh=max(y for x,y in local)-ly+3
                graphics.insert(0,'<rect class="sch-hit" x="%g" y="%g" width="%g" height="%g" fill="transparent" stroke="none" pointer-events="all"/>'%(lx,ly,lw,lh))
            tr='translate(%g %g) rotate(%g) scale(%d 1)'%(n(c,'x'),n(c,'y'),-n(c,'rotation'),-1 if c.get('isMirror') else 1)
            parts.append('<g class="sch-component" data-component="%s" data-reference="%s" transform="%s">%s</g>'%(escape(uid,quote=True),escape(ref,quote=True),tr,''.join(graphics)))
            template=dict(sa[''],**sa[part])
            defaults=dict(devices.get(a.get('Device'),{}),**{k:v.get('value') for k,v in template.items()})
            values=dict(defaults,**{k:v for k,v in a.items() if v is not None})
            comp['attributes']=merge(values)
            comp['value']=comp['attributes'].get('Value') or comp['attributes'].get('Name') or comp['attributes'].get('Manufacturer Part','')
            def expand(value):
                return re.sub(r'=\{([^{}]+)\}',lambda m:str(values.get(m.group(1)) or ''),str(value or ''))
            for key in set(template)|set(attrs[uid]):
                base=template.get(key,{})
                ap=dict(base,**{k:v for k,v in attrs[uid].get(key,{}).items() if v is not None})
                if ap.get('valueVisible') or ap.get('keyVisible'):
                    if attrs[uid].get(key,{}).get('x') is None and base.get('x') is not None:
                        ap['x'],ap['y']=transform(n(base,'x'),n(base,'y'),c)
                        ap['rotation']=n(base,'rotation')+n(c,'rotation')
                    value=expand(values.get(key))
                    if ap.get('keyVisible'):value=key+': '+value
                    parts.append(text(ap,value))
            if ref:components.append(comp);all_components.append(comp)
        for (typ,uid),(_,p) in page['records'].items():
            if p is not None and typ in GRAPHICS and typ!='PIN':parts.append(draw(typ,p))
            elif p is not None and typ=='ATTR' and p.get('parentId') not in attrs and p.get('valueVisible'):parts.append(text(p))
        annotated=0;conflicts=0;wire_output=[]
        for w in wire_segments:
            ax,ay=w['a'];bx,by=w['b'];dx,dy=bx-ax,by-ay
            incident=[]
            for pin in pins:
                x,y=pin['x'],pin['y']
                if abs(dx*(y-ay)-dy*(x-ax))<1e-4 and min(ax,bx)-1e-4<=x<=max(ax,bx)+1e-4 and min(ay,by)-1e-4<=y<=max(ay,by)+1e-4 and pin['net']:incident.append(pin['net'])
            nets=set(incident)
            if len(nets)==1:w['net']=next(iter(nets));annotated+=1
            if len(nets)>1:conflicts+=1
            wire_output.append(w)
        if conflicts:warnings.append('%s中%d段导线与PCB引脚网络不一致，请核对工程版本。'%(page_id,conflicts))
        if not bounds:continue
        x0=min(x for x,y in bounds)-25;y0=min(y for x,y in bounds)-25;x1=max(x for x,y in bounds)+25;y1=max(y for x,y in bounds)+25
        svg='<svg xmlns="http://www.w3.org/2000/svg" viewBox="%g %g %g %g" font-family="Noto Sans CJK SC, sans-serif">%s</svg>'%(x0,y0,x1-x0,y1-y0,''.join(parts))
        output.append(dict(id=page_id,title=dict(rows(page,'META')).get('META',{}).get('title','原理图'),svg=svg,
                           components=components,wires=wire_output,pin_count=len(pins),wire_count=len(wire_segments),linked_wire_segments=annotated,wire_conflicts=conflicts))
    return dict(pages=output,components=all_components,warnings=list(dict.fromkeys(warnings)),
                units='0.01 inch',coordinate_system='screen_y_down',net_source='PCB PAD_NET + Unique ID/Designator + pin number')

