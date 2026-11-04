"""仅从已保存结果生成网页；生成与查看报告都不访问硬件。"""
import html
import json
import math


def render_report(report, download_base=''):
    conditions=report.get('conditions',[])
    points=[];rows=[]
    for row in conditions:
        transfer=row.get('raw_transfer') or {}
        paths=row.get('paths',{});probe=paths.get('PROBE',{});va=paths.get('VA',{})
        weak=probe.get('peak_counts',0)<3*probe.get('residual_rms_counts',0)
        valid=bool(transfer) and not weak and va.get('peak_counts',0)>0
        points.append(dict(net=row['measurement_net'],frequency=row['frequency_hz'],rs=row['rs_nominal_ohm'],
                           magnitude=transfer.get('magnitude'),phase=transfer.get('phase_degrees'),valid=valid))
        def number(value):
            return '—' if value is None or not math.isfinite(value) else '%.6g'%value
        quality='；'.join(row.get('warnings',[])) or '未触发自动提示；尚未校准'
        if weak:quality='弱信号：不作为有效频响连线。'+quality
        cells=[row['measurement_net'],row['frequency_hz'],row['rs_nominal_ohm'],
               number(va.get('peak_counts')),number(paths.get('VB',{}).get('peak_counts')),
               number(probe.get('peak_counts')),number(transfer.get('magnitude')),
               number(transfer.get('phase_degrees')),number(probe.get('residual_rms_counts')),quality]
        rows.append('<tr'+(' class="weak"' if weak else '')+'>'+''.join('<td>'+html.escape(str(v))+'</td>' for v in cells)+'</tr>')
    payload=json.dumps(points,ensure_ascii=False,allow_nan=False).replace('<','\\u003c')
    complete=report.get('completed_conditions',len(conditions));total=report.get('total_conditions',len(conditions))
    weak_count=sum(not p['valid'] for p in points)
    weak_groups={}
    for p in points:
        if not p['valid']:weak_groups[(p['net'],p['rs'])]=weak_groups.get((p['net'],p['rs']),0)+1
    quality='；'.join('%s / %s Ω：%d个条件未作为有效曲线点'%(net,rs,n) for (net,rs),n in weak_groups.items()) or '本次数据未触发弱信号质量标记。'
    scope=report.get('scope',{});nets=scope.get('measurement_nets',sorted({r['measurement_net'] for r in conditions}))
    source=scope.get('excitation_net','未记录');frequencies=scope.get('frequencies_hz',sorted({r['frequency_hz'] for r in conditions}));ranges=scope.get('rs_nominal_ohm',sorted({r['rs_nominal_ohm'] for r in conditions}))
    frame_counts=sorted({p['frame_count'] for row in conditions for p in row.get('paths',{}).values()
                         if type(p.get('frame_count')) is int and p['frame_count']>0})
    links=' '.join('<a href="'+html.escape(download_base+name,quote=True)+'">'+label+'</a>' for name,label in
                   [('report.json','详细JSON'),('report.md','Markdown报告'),('measurements.csv','测量表格'),('measurement_bundle.zip','全部原码')])
    page='''<!doctype html><html lang="zh-CN"><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>断电测量结果与测量原理</title><style>
body{font:16px/1.7 system-ui,sans-serif;background:#f3f6fa;color:#172435;margin:0}main{max-width:1180px;margin:auto;padding:24px}
section{background:white;padding:20px;margin:18px 0;border:1px solid #d7e0ec;border-radius:12px}h1{font-size:28px}h2{font-size:22px}
a{color:#0758a5;margin-right:18px}table{border-collapse:collapse;width:100%;font-size:14px}th,td{border:1px solid #d7e0ec;padding:8px;text-align:left}
.scroll{overflow:auto}.note{background:#fff4df;border-left:5px solid #d88814;padding:14px}.weak{background:#fff3e9}pre{white-space:pre-wrap;background:#eff3f9;padding:12px}
canvas{display:block;width:100%;height:auto;background:white}.legend{display:flex;gap:8px 20px;flex-wrap:wrap}button,select{font:inherit;padding:6px}label{margin-right:16px}
</style><main><nav><a href="/?workflow=unpowered#diagnostic-panel">← 返回测量控制台</a>__LINKS__</nav>
<h1>断电测量报告</h1><p>任务：__KEY__ · 完整条件 __COMPLETE__/__TOTAL__ · 完整条件所用帧 __FRAMES__</p><p>__AUDIT__</p>
<p class="note">已保存测量数据。曲线采用原码相量比 C/A，包含源串联电阻及采集通路影响。共 __WEAK__ 个条件未作为有效曲线点，原始估计保留在表格与JSON中。</p>
<section><h2>这一轮实际测了什么</h2><p>__SCOPE__</p>
<p>__SAMPLING__</p></section>
<section><h2>幅频、相频与测量量</h2><p>幅频横轴是激励频率，纵轴是 |C/A|；相频是 arg(C/A)。幅比和相位按本次记录的通路、选路与校准条件解释。</p>
<pre>源到测点观测：Hobs = VC / VA  （当前绘制）
校准后的DUT输入到测点：HDUT = VC / VB
校准后的输入电流：I = (VA − VB) / Rs
校准后的输入阻抗：Zin = Rs × VB / (VA − VB)</pre>
<p>以上量均为带幅度和相位的复相量。VA−VB不能直接用两个Vpp相减。Rs须实测，VA/VB/VC各通路须进行幅相标定，并确认探针接触、固定地及实际选路正确。</p></section>
<section><h2>曲线：默认断开弱信号点</h2><p>下列开关只影响已保存数据的显示，不触发硬件。弱信号标准为基波峰值小于3倍拟合残差RMS，是当前数据质量与曲线显示规则。</p>
<label>幅度单位 <select id="unit"><option value="linear">线性幅比 |C/A|</option><option value="db">20 log10(|C/A|)，dB</option></select></label>
<label><input id="show-weak" type="checkbox">显示弱信号的原始估计（仅点标记）</label><div id="legend" class="legend"></div>
<canvas id="gain" width="1100" height="340" aria-label="幅频原码观测曲线"></canvas><canvas id="phase" width="1100" height="340" aria-label="相频原码观测曲线"></canvas></section>
<section><h2>数据处理与参考条件</h2><p>数据处理记录原码包完整性、记录身份和DDS相位参考，并按测点、频率及Rs汇总观测结果。</p>
<p>__QUALITY__ 对比结果使用相同的接线、参考、选路与标定配置；数值按表中单位及质量字段解释。</p>
<p>计算路径为CPU测量规划与相量分析。模型推理使用相应的数据合同及器件域。</p>
<p><strong>断电器件响应与带电放大工作状态分别建模，C/A按当前断电接线解释。</strong></p></section>
<section><h2>全部条件的原始估计与质量提示</h2><p>橙色行不作为有效频响连线；表中幅值单位为ADC码。</p><div class="scroll"><table><thead><tr><th>测点</th><th>Hz</th><th>Rs/Ω</th><th>A峰/码</th><th>B峰/码</th><th>C峰/码</th><th>|C/A|原始估计</th><th>相位/°原始估计</th><th>C残差RMS/码</th><th>质量提示</th></tr></thead><tbody>__ROWS__</tbody></table></div></section>
<p><a href="/?workflow=unpowered#diagnostic-panel">返回测量控制台</a>报告仅供查看；重新开始测试需要生成本次方案、检查设备并明确点击开始。</p></main>
<script type="application/json" id="points">__POINTS__</script><script>
// 曲线只读取本报告内的数据；弱信号不跨点连线。
const points=JSON.parse(document.getElementById('points').textContent),colors=['#0769b2','#c85216','#218258','#8736aa','#be3456','#6c6530'];
const frequencyTicks=[...new Set(points.map(p=>p.frequency).filter(f=>Number.isFinite(f)&&f>0))].sort((a,b)=>a-b);
const groups=[...new Set(points.map(p=>p.net+' / '+p.rs+' Ω'))].map((key,i)=>({key,color:colors[i%colors.length],enabled:true,points:points.filter(p=>p.net+' / '+p.rs+' Ω'===key).sort((a,b)=>a.frequency-b.frequency)}));
const legend=document.getElementById('legend');groups.forEach(g=>{const l=document.createElement('label'),c=document.createElement('input');c.type='checkbox';c.checked=true;c.onchange=()=>{g.enabled=c.checked;draw();};l.style.color=g.color;l.append(c,document.createTextNode(g.key));legend.append(l);});
function chart(id,phase){
 const canvas=document.getElementById(id),ctx=canvas.getContext('2d'),db=document.getElementById('unit').value==='db',showWeak=document.getElementById('show-weak').checked;
 const val=p=>phase?p.phase:db?20*Math.log10(p.magnitude):p.magnitude,all=groups.filter(g=>g.enabled).flatMap(g=>g.points).filter(p=>(p.valid||showWeak)&&Number.isFinite(val(p)));
 let lo=Math.min(0,...all.map(val)),hi=Math.max(phase?1:db?1:1.05,...all.map(val));if(hi-lo<.1)hi=lo+1;const pad=(hi-lo)*.12;lo-=pad;hi+=pad;
 const firstLog=Math.log10(frequencyTicks[0]||1),lastLog=Math.log10(frequencyTicks[frequencyTicks.length-1]||10);
 const left=85,top=45,width=980,height=240,x=f=>left+(frequencyTicks.length===1?.5:(Math.log10(f)-firstLog)/(lastLog-firstLog||1))*width,y=v=>top+height-(v-lo)/(hi-lo)*height;
 ctx.clearRect(0,0,1100,340);ctx.font='16px sans-serif';ctx.fillStyle='#172435';ctx.fillText(phase?'相频：arg(C/A)，度':db?'幅频：20 log10(|C/A|)，dB':'幅频：|C/A|，原码幅比',left,25);
 for(let i=0;i<=4;i++){const v=lo+(hi-lo)*i/4,yy=y(v);ctx.strokeStyle='#dce4ed';ctx.beginPath();ctx.moveTo(left,yy);ctx.lineTo(left+width,yy);ctx.stroke();ctx.fillStyle='#43566b';ctx.fillText(v.toFixed(2),4,yy+5);}
 for(const f of frequencyTicks){const xx=x(f);ctx.strokeStyle='#e5ebf2';ctx.beginPath();ctx.moveTo(xx,top);ctx.lineTo(xx,top+height);ctx.stroke();ctx.fillStyle='#43566b';ctx.fillText(f>=1000?f/1000+'k':String(f),xx-15,top+height+25);}ctx.fillText('频率 / Hz（对数）',880,330);
 groups.filter(g=>g.enabled).forEach(g=>{ctx.strokeStyle=g.color;ctx.fillStyle=g.color;ctx.lineWidth=2;ctx.setLineDash(g.points[0]?.rs===10000?[7,4]:[]);ctx.beginPath();let last=false;for(const p of g.points){const v=val(p);if(!p.valid||!Number.isFinite(v)){last=false;continue;}if(last)ctx.lineTo(x(p.frequency),y(v));else ctx.moveTo(x(p.frequency),y(v));last=true;}ctx.stroke();ctx.setLineDash([]);for(const p of g.points){const v=val(p);if(!Number.isFinite(v)||(!p.valid&&!showWeak))continue;ctx.beginPath();if(p.valid){ctx.arc(x(p.frequency),y(v),4,0,Math.PI*2);ctx.fill();}else{const xx=x(p.frequency),yy=y(v);ctx.moveTo(xx-5,yy-5);ctx.lineTo(xx+5,yy+5);ctx.moveTo(xx-5,yy+5);ctx.lineTo(xx+5,yy-5);ctx.stroke();}}});
}
function draw(){chart('gain',false);chart('phase',true);}document.getElementById('unit').onchange=draw;document.getElementById('show-weak').onchange=draw;draw();
</script></html>'''
    replacements={'__LINKS__':links,'__KEY__':html.escape(str(report.get('job_id',''))),
                  '__COMPLETE__':str(complete),'__TOTAL__':str(total),'__FRAMES__':str(report.get('valid_condition_frames',report.get('frames_captured',0))),
                  '__SCOPE__':html.escape('激励网络：%s；测量网络：%s。频率/Hz：%s；Rs/Ω：%s。方案共%d个条件。'%(source,'、'.join(nets),'、'.join(map(str,frequencies)),'、'.join(map(str,ranges)),total)),
                  '__SAMPLING__':html.escape('通路汇总帧数：'+('、'.join(map(str,frame_counts))+'帧。' if frame_counts else '未记录。')),
                  '__QUALITY__':html.escape(quality),'__WEAK__':str(weak_count),'__ROWS__':''.join(rows),'__POINTS__':payload}
    replacements['__AUDIT__']=html.escape('另外保留%d帧未完成条件的历史数据，不用于完整条件曲线。'%report['excluded_partial_frames'] if report.get('excluded_partial_frames') else '完整条件帧数表示数据记录完整，不代表这些帧都满足模拟幅相精度要求。')
    for key,value in replacements.items():page=page.replace(key,value)
    return page
