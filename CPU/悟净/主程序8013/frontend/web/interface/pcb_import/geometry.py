"""Polyline geometry; source coordinates use Y up, output uses screen Y down."""
import math
from .model import ImportError, number


def arc(start, end, degrees):
    a=math.radians(number(degrees,'圆弧角度'))
    if not 0 < abs(a) < math.tau: raise ImportError('圆弧角度必须在0至360度之间。')
    dx,dy=end[0]-start[0],end[1]-start[1]
    length=math.hypot(dx,dy)
    if length==0: raise ImportError('圆弧起止点重合。')
    offset=length/(2*math.tan(a/2))
    cx=(start[0]+end[0])/2-dy/length*offset
    cy=(start[1]+end[1])/2+dx/length*offset
    radius=math.hypot(start[0]-cx,start[1]-cy)
    angle=math.atan2(start[1]-cy,start[0]-cx)
    step=min(math.pi/36,2*math.acos(max(-1,min(1,1-0.01/0.0254/max(radius,1e-9)))))
    count=max(1,min(2000,math.ceil(abs(a)/max(step,1e-5))))
    fractions=[i/count for i in range(count+1)]
    for quarter in range(-8,9):
        t=(quarter*math.pi/2-angle)/a
        if 0<t<1:fractions.append(t)
    result=[(cx+radius*math.cos(angle+a*t),cy+radius*math.sin(angle+a*t)) for t in sorted(set(fractions))]
    result[0],result[-1]=start,end
    return result


def paths(tokens):
    if not isinstance(tokens,list) or not tokens or len(tokens)>50000:
        raise ImportError('板框路径格式无效。')
    if isinstance(tokens[0],list):
        return [loop for part in tokens for loop in paths(part)]
    if tokens[0]=='R':
        if len(tokens) not in (6,7,8):raise ImportError('矩形板框字段数量未知。')
        x,y,w,h,angle=map(lambda v:number(v,'矩形参数'),tokens[1:6])
        radius=number(tokens[-1],'圆角半径') if len(tokens)>6 else 0
        if angle%360 or min(w,h)<=0 or not 0<=radius<=min(w,h)/2:
            raise ImportError('暂不支持该旋转/圆角矩形板框。')
        if radius==0:return [[(x,y),(x+w,y),(x+w,y-h),(x,y-h),(x,y)]]
        result=[]
        for cx,cy,start in ((x+radius,y-h+radius,180),(x+w-radius,y-h+radius,270),
                             (x+w-radius,y-radius,0),(x+radius,y-radius,90)):
            for i in range(17):
                angle=math.radians(start+i*90/16)
                result.append((cx+radius*math.cos(angle),cy+radius*math.sin(angle)))
        result.append(result[0]);return [result]
    if tokens[0]=='CIRCLE':
        if len(tokens)!=4:raise ImportError('圆形板框字段错误。')
        x,y,r=map(lambda v:number(v,'圆形参数'),tokens[1:])
        if r<=0:raise ImportError('圆形半径无效。')
        result=[(x+r*math.cos(math.tau*i/128),y+r*math.sin(math.tau*i/128)) for i in range(128)]
        return [result+[result[0]]]
    result=[(number(tokens[0],'路径X'),number(tokens[1],'路径Y'))];i=2;command='L'
    while i<len(tokens):
        if isinstance(tokens[i],str):
            command=tokens[i];i+=1
            if command not in ('L','ARC','CARC'):raise ImportError('暂不支持板框路径命令：'+command)
            if i==len(tokens):raise ImportError('板框路径命令缺少参数。')
        take=2 if command=='L' else 3
        values=tokens[i:i+take]
        if len(values)!=take:raise ImportError('板框路径缺少坐标。')
        values=[number(v,'路径参数') for v in values];i+=take
        if command=='L':result.append(tuple(values))
        else:result.extend(arc(result[-1],tuple(values[1:]),values[0])[1:])
    return [result]


def segments_of(loops, scale=0.0254):
    result=[]
    for points in loops:
        for a,b in zip(points,points[1:]):
            if math.dist(a,b)>1e-8:
                result.append(((a[0]*scale,-a[1]*scale),(b[0]*scale,-b[1]*scale)))
    return result
