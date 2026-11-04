(function(){
 'use strict';
 const el=id=>document.getElementById(id),panel=el('diagnosis-dashboard'),host=el('main-view'),tabs=el('main-display-selection'),button=el('open-diagnosis-dashboard');
 if(!panel||!host||!tabs||!button)return;
 const views=['main-schematics-section','main-pcb-3D-section','main-pcb-2D-section'].map(el).filter(Boolean);
 panel.classList.add('main-display-section','dd-inline');panel.setAttribute('role','region');panel.removeAttribute('aria-modal');host.append(panel);
 let active=null,latest=null,logJob=null,waveKey=null,currentJob=null;
 const jobs=new Map();
 const rendered=new Map(),f=(value,n=1)=>Number.isFinite(value)?value.toFixed(n):'—';
 const clean=text=>String(text??'').trim();
 const node=(tag,text,cls)=>{const item=document.createElement(tag);item.textContent=text;if(cls)item.className=cls;return item;};
 function leave(){panel.hidden=true;button.classList.remove('main-display-button-selected');}
 function show(){views.forEach(view=>view.hidden=true);tabs.querySelectorAll('.main-display-button-selected').forEach(item=>item.classList.remove('main-display-button-selected'));panel.hidden=false;button.classList.add('main-display-button-selected');}
 function hide(){leave();if(views.every(view=>view.hidden)&&typeof window.switchToPCB==='function')window.switchToPCB('2D');}
 for(const name of ['switchToSchematics','switchToPCB']){const previous=window[name];if(typeof previous==='function')window[name]=function(...args){leave();return previous.apply(this,args);};}
 function table(){
  const body=el('dd-conditions');body.replaceChildren();if(!latest)return;
  const labels={measured:'已完成',planned:'待执行',acquiring:'采集中',optional:'未执行',interrupted:'已中断'},filter=el('dd-filter').value;
  for(const row of latest.conditions||[]){
   if(filter==='measured'&&row.value===null||filter==='waiting'&&!['planned','acquiring'].includes(row.state)||filter==='optional'&&row.state!=='optional')continue;
   const tr=node('tr','');tr.dataset.action=row.action;
   [row.point,row.frequency_hz/1000+' kHz',row.rs_ohm===10000?'10kΩ':row.rs_ohm+'Ω',row.value===null?'—':f(row.gain,4)+' / '+f(row.phase_deg,1)+'°',row.frames===null?'—':String(row.frames)].forEach(value=>tr.append(node('td',value)));
   const status=node('td','');status.append(node('span',labels[row.state]||row.state,'dd-state '+row.state));tr.append(status);body.append(tr);
  }
 }
 function logs(data){
  const list=el('dd-logs');
  if(logJob!==data.job_id){list.replaceChildren();rendered.clear();logJob=data.job_id;}
  const bottom=list.scrollHeight-list.scrollTop-list.clientHeight<40;
  const rows=data.logs?.length?data.logs:[{sequence:0,elapsed_s:0,actor:'方案',message:'测量方案已生成，等待开始。'}];
  const keys=new Set(rows.map(row=>String(row.sequence)));
  for(const [key,item]of rendered)if(!keys.has(key)){item.remove();rendered.delete(key);}
  for(const row of rows){const key=String(row.sequence),signature=[row.elapsed_s,row.actor,row.message].join('|');let item=rendered.get(key);if(item?.dataset.signature===signature)continue;if(!item){item=node('li','');item.dataset.sequence=key;rendered.set(key,item);list.append(item);}item.dataset.signature=signature;item.replaceChildren(node('time',f(row.elapsed_s)+'s'),node('b',row.actor),node('span',clean(row.message)));}
  if(bottom)requestAnimationFrame(()=>{list.scrollTop=list.scrollHeight;});
 }
 function wave(data){
  if(!window.ProbeWaveforms)return;
  if(data.waveform_pair===undefined)return;
  const phase=data.activity?.phase,pair=data.waveform_pair;
  const showPair=pair&&(data.state==='completed'||data.state==='running'&&['capturing','condition_completed','analyzing'].includes(phase));
  const key=[data.job_id,data.state,phase,data.activity?.action_id,data.activity?.path,showPair?pair.reference_id:'empty',showPair?pair.sequence:''].join(':');
  if(key===waveKey)return;waveKey=key;
  if(!showPair){window.ProbeWaveforms.clear(data.state==='planned'?'等待开始采集':clean(data.activity?.message||data.next?.reason||'等待采集'));return;}
  const c=pair.context||{},stage=data.state==='completed'?'本轮已结束':phase==='analyzing'?'分析中':c.path==='VA_check'?'参考复核':'VC采集';
  window.ProbeWaveforms.setPair({...pair,status_text:[c.measurement_net,c.frequency_hz/1000+'kHz','Rs '+(c.rs_ohm===10000?'10k':c.rs_ohm)+'Ω',stage].join(' · ')});
 }
 function update(data){
  if(!data||active&&active!==data.job_id||latest&&latest.job_id===data.job_id&&data.event_sequence<latest.event_sequence)return;
  latest=data;active=data.job_id;
  const m=data.metrics||{},p=data.plan||{},a=data.activity||{},busy=['running','finishing'].includes(data.state),waiting=busy&&a.phase==='waiting_clearance';
  el('dd-headline').textContent=waiting?'等待双针离板确认':clean(data.headline);
  panel.querySelector('.dd-pill').textContent=data.execution_kind==='unpowered'?'断电实测':'电路诊断';
  el('dd-elapsed').textContent=waiting?'等待确认':'用时 '+f(m.elapsed_s)+'s';
  el('dd-start').disabled=data.state!=='planned';el('dd-cancel').disabled=!busy;
  el('dd-progress').textContent='已完成 '+m.measured_conditions+'/'+m.available_conditions+' 条件'+(m.frames?' · '+m.frames+' 帧':'');
  el('dd-progress-bar').max=m.available_conditions||36;el('dd-progress-bar').value=m.measured_conditions||0;
  el('dd-live').textContent=data.state==='planned'?'方案就绪，点击开始测量。':data.state==='completed'?'本轮测量流程已完成，结果和下载见下方。':clean(a.message||data.next?.reason||'等待执行状态');
  const nets=p.point_nets||[],frequency=p.frequencies_hz||[],ranges=p.rs_ohm||[];
  el('dd-plan-label').textContent='测量方案 · '+nets.length+'测点 / '+m.available_conditions+'条件'+(p.contact_policy==='pad_center_v1'?' · 焊盘中心':'');
  el('dd-plan').textContent=(p.excitation_nets||[]).join('/')+' → '+nets.join(' / ')+'；'+frequency.map(v=>v/1000).join('/')+' kHz；Rs '+ranges.map(v=>v===10000?'10kΩ':v+'Ω').join('/');
  el('dd-data-count').textContent=(Number.isFinite(m.frames)?m.frames+'帧':'采集 '+(m.captures||0)+'次')+' · '+(data.conditions||[]).length+'个方案条件';
  const ranks=(data.neural||[]).filter((row,i)=>i===0||row.probability>0).slice(0,3),section=el('dd-result-section'),ranking=el('dd-ranking');
  section.hidden=!ranks.length;el('dd-result-title').textContent=data.state==='completed'?'诊断结果':'候选分析';ranking.replaceChildren();
  for(const row of ranks){const item=node('div','','dd-rank');item.append(node('span',row.name),node('strong',f(row.probability*100)+'%'));ranking.append(item);}
  el('dd-note').textContent=data.note;logs(data);table();wave(data);
 }
 function normalizeUnpowered(data,job){
  const r=data.result||data,rows=r.conditions||[],byId=new Map(rows.map(row=>[row.action_id,row])),actions=job.actions||[],done=['completed','failed','cancelled'].includes(data.state);
  const conditions=actions.map(a=>{const row=byId.get(a.action_id),t=row?.raw_transfer||{};return {action:a.action_id,point:a.measurement_net,frequency_hz:a.frequency_hz,rs_ohm:a.rs_ohm,value:row?[]:null,gain:t.magnitude,phase_deg:t.phase_degrees,frames:row?4*(job.frames_per_path||16):null,state:row?'measured':a.action_id===data.action_id&&data.phase==='capturing'?'acquiring':done?'optional':'planned'};});
  const logs=[],labels={servo_up:'双针抬针指令完成。',servo_down:'双针落针指令完成。',operator_clearance_confirmed:'操作者已确认双针离板。'};
  for(const event of r.events||[]){let message=labels[event.kind];if(event.kind==='positioned')message='已定位到 '+event.measurement_net+'。';if(message)logs.push({elapsed_s:event.elapsed_seconds,actor:'机械',message});}
  for(const row of rows)logs.push({elapsed_s:row.elapsed_seconds??null,actor:'采集',message:'条件'+(row.action_id+1)+'完成：'+row.measurement_net+' · '+row.frequency_hz/1000+'kHz · Rs '+(row.rs_nominal_ohm??row.rs_ohm)+'Ω。'});
  if(logs.every(row=>Number.isFinite(row.elapsed_s)))logs.sort((a,b)=>a.elapsed_s-b.elapsed_s);
  if(done)logs.push({elapsed_s:data.elapsed_seconds,actor:'结果',message:r.error||data.message||'本轮结束。'});logs.forEach((row,i)=>row.sequence=i+1);
  const scope=job.scope||{},state=data.state||'planned';
  return {schema:'diagnostic-dashboard/1.0',job_id:job.job_id,state,mode:'hardware_measurement',execution_kind:'unpowered',event_sequence:Math.round((data.elapsed_seconds||0)*1000),
   headline:state==='planned'?'测量方案已生成':state==='completed'?'实物测量完成':state==='failed'?'实物测量失败':state==='cancelled'?'测量已取消':'正在执行实物测量',
   metrics:{measured_conditions:Math.max(rows.length,data.completed_conditions||0),available_conditions:actions.length,frames:data.frames_captured||0,captures:rows.length*4,elapsed_s:data.elapsed_seconds||0},
   plan:{family:job.expert?.family||'断电',contact_policy:job.contact_policy,excitation_nets:[scope.excitation_net||job.planning_payload?.excitation_net||''],point_nets:scope.measurement_nets||[],frequencies_hz:scope.frequencies_hz||[],rs_ohm:scope.rs_nominal_ohm||[]},
   activity:{phase:data.phase,message:data.message,action_id:data.action_id,path:data.path},next:{reason:data.message},conditions,logs,total_logs:logs.length,neural:[],waveform_pair:data.waveform_pair,
   note:r.hardware_sampled?'数据来源：实物采集。'+(r.fault_diagnosis_executed?'诊断状态以本次记录为准。':'本轮未执行故障分类，不能据此判定正常或故障。'):'该任务尚未取得完整实物采集数据；执行状态以接口记录为准。'};
 }
 async function updateUnpowered(data){
  if(data.dashboard){update(data.dashboard);return;}
  let job=data.job||jobs.get(data.job_id)||currentJob;
  if(!job||job.job_id!==data.job_id){try{const response=await fetch('/diagnosis/unpowered/'+encodeURIComponent(data.job_id)+'/plan',{credentials:'same-origin'});if(!response.ok)return;job=await response.json();}catch(_){return;}}
  jobs.set(job.job_id,job);update(normalizeUnpowered(data,job));
 }
 async function planned(job){active=null;latest=null;waveKey=null;currentJob=job;jobs.set(job.job_id,job);window.ProbeWaveforms?.clear('方案就绪，等待采集');show();if(job.dashboard){update(job.dashboard);return;}update(normalizeUnpowered({state:'planned',job_id:job.job_id},job));}
 function restore(data){active=null;latest=null;waveKey=null;update(data);show();}
 el('dd-close').onclick=hide;button.onclick=show;el('dd-filter').onchange=table;
  el('dd-start').onclick=()=>el('diagnostic-unpowered-start').click();el('dd-cancel').onclick=()=>el('diagnostic-unpowered-cancel').click();
 window.diagnosisDashboard={update,updateUnpowered,planned,restore,show,hide};
}());
