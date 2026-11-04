'use strict';
const assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm'),path=require('node:path');
const source=fs.readFileSync(path.join(__dirname,'../interface/static/js/pcb-control.js'),'utf8');
const tick=()=>new Promise(r=>setImmediate(r));
async function harness(){
 const nodes=[],posts=[],requests=[],events=new Map(),intervals=[];let statusListener;
 class E{constructor(tag){this.tag=tag;this.children=[];this.value='';this.checked=false;nodes.push(this);}append(...xs){for(const x of xs){if(x.parentElement)x.parentElement.children=x.parentElement.children.filter(c=>c!==x);x.parentElement=this;this.children.push(x);if(this.tag==='select'&&this.children.length===1)this.value=x.value;}}prepend(x){if(x.parentElement)x.parentElement.children=x.parentElement.children.filter(c=>c!==x);this.children.unshift(x);x.parentElement=this;}insertAdjacentElement(_,e){this.parentElement.append(e);}setAttribute(k,v){this[k]=v;}removeAttribute(k){delete this[k];}closest(){return this.parentElement;}contains(x){return this.children.some(c=>c===x||c.contains(x));}replaceChildren(...xs){this.children=[];this.append(...xs);}}
 const get=id=>nodes.find(n=>n.id===id),root=new E('section');
 for(const id of ['probe-button','probe-left-x-offset','probe-left-y-offset','probe-right-x-offset','probe-right-y-offset']){const e=new E(id==='probe-button'?'button':'input');e.id=id;root.append(e);}
 const pads={};for(let i=0;i<5;i++)pads['p'+i]={id:'p'+i,reference:'R'+i,pad_number:'1',net:'GND',package:'R0805',is_allowed:true};
 const selected={left:'p0',right:null};
 const config={layout_id:'board',revision:1,alignment:{left:true,right:true},effective_offsets:{left:{x:2,y:3},right:{x:90,y:3}},offsets:{left:{x:0,y:0},right:{x:0,y:0}},can_restore:{left:true,right:true}};
 let draft={state:'idle'},counter=0,job={},fail=null,online=true,defer=null,nextJobState='completed',blocked=false;let unblock;
 const status={ready:true,busy:false,stopped:false,positions_mm:{'1':2,'2':2,'3':2,'4':2}};
 const window={probeWorkbench:{online,design:{layout_id:'board',pads}},addEventListener(n,cb){if(!events.has(n))events.set(n,[]);events.get(n).push(cb);},dispatchEvent(e){for(const cb of events.get(e.type)||[])cb(e);},setInterval(cb){intervals.push(cb);},motorStatus:{subscribe(cb){statusListener=cb;cb(status);},refresh(){}}};
 window.probeWorkbench.assign=(probe,id)=>{selected[probe]=id;window.dispatchEvent({type:'pcb-selection-changed'});};
 const fetch=async(url,opts={})=>{
  const body=opts.body?JSON.parse(opts.body):null;
  requests.push({url,method:opts.method||'GET'});
  if(body)posts.push({url,body});
  if(fail===url){fail=null;return {ok:false,json:async()=>({error:'simulated failure'})};}
  if(defer===url){defer=null;await new Promise(resolve=>{unblock=resolve;});}
  let value;
  if(url==='/motor/pcb/config')value=config;
  else if(url==='/motor/pcb/calibration')value=draft;
  else if(url==='/motor/status')value={...status,last_job:job};
  else if(url==='/motor/pcb/preview'){const points={};for(const probe of ['left','right'])if(body.pads[probe])points[probe]={x:body.purpose==='calibration'?10:9.6,y:20,center:{x:10,y:20},contact_mode:body.purpose==='calibration'?'center':'left_edge'};value={preview_id:'normal',can_move:!blocked,points,errors:blocked?['target outside soft limit']:[]};}
  else if(url.endsWith('/calibration/start')){draft={id:'cal',probe:body.probe,points:body.pad_ids.map((pad_id,i)=>({...pads[pad_id],pad_id,x:i+10,y:20})),state:'ready',index:0,samples:{}};value=draft;}
  else if(url.endsWith('/calibration/preview'))value={preview_id:'calpoint',can_move:true,points:{left:{...draft.points[draft.index],contact_mode:'center'}},errors:[]};
  else if(url==='/motor/pcb/move'||url==='/motor/pcb/teach'||url==='/motor/jog'||url.endsWith('/calibration/record')){
   if(url==='/motor/pcb/move'&&body.preview_id==='calpoint')draft.state='aligning';
   if(url.endsWith('/calibration/record')){draft.samples[draft.index]={};draft.index++;draft.state=draft.index===5?'complete':'ready';if(draft.state==='complete')draft.result={old:{x:2,y:3},new:{x:2.01,y:3.02},max_error_mm:.02,rms_error_mm:.01,acceptable:true,residuals:Array.from({length:5},()=>({dx_mm:0,dy_mm:0}))};}
   if(url==='/motor/pcb/teach'){config.revision++;config.alignment[body.probe]=true;}
   job={job_id:'job'+(++counter),state:nextJobState};nextJobState='completed';value={job_id:job.job_id};
  }else if(url.endsWith('/calibration/save')){config.revision++;draft.state='saved';value=config;}
  else if(url.endsWith('/calibration/cancel')){draft.state='cancelled';value=draft;}
  else if(url.endsWith('/calibration/select')){draft.state='ready';draft.index=body.index;value=draft;}
  else value={};
  return {ok:true,json:async()=>JSON.parse(JSON.stringify(value))};
 };
 const context={document:{readyState:'complete',getElementById:get,createElement:t=>new E(t)},window,fetch,
  CustomEvent:class{constructor(type,options={}){this.type=type;this.detail=options.detail;}},padCandidates:selected,layoutPads:pads,boardRotation:0,setTimeout:cb=>{queueMicrotask(cb);}};
 vm.runInNewContext(source,context);
 await tick();await tick();
 async function flush(){for(let i=0;i<6;i++)await tick();}
 return {get,posts,requests,selected,config,window,status,async pick(id){window.pcbPadInteraction.pick(id);await flush();},async select(probe='left'){get('calibration-probe').value=probe;get('calibration-probe').onchange();await flush();},async policy(value){get('pcb-pick-policy').value=value;get('pcb-pick-policy').onchange();await flush();},async event(name){window.dispatchEvent({type:name});await flush();},async poll(){for(const cb of intervals)cb();await flush();},async emitStatus(patch){Object.assign(status,patch);statusListener({...status});await flush();},async emitStatusError(message='simulated status timeout'){statusListener(null,new Error(message));await flush();},async calibrationToggle(open){const element=get('pcb-calibration-panel');element.open=open;element.ontoggle();await flush();},orientation(value){context.boardRotation=value;},defer(url){defer=url;},async release(){unblock?.();await flush();},failJob(){nextJobState='failed';},block(){blocked=true;},get draft(){return draft;},reject(url){fail=url;},async click(id){if(!get(id).disabled)get(id).onclick();await flush();},async chooseFive(){await this.select();await this.policy('select');for(let i=0;i<5;i++){selected.left='p'+i;await this.click('calibration-add');}},nodes};
}
let count=0;async function check(name,fn){await fn();count++;console.log('ok',name);}
(async()=>{
 await check('startup only reads configuration and cached state',async()=>{const h=await harness();assert.equal(h.posts.length,0);assert.equal(h.get('calibration-save').disabled,true);});
 await check('normal preview requests edge policy while calibration explicitly requests centres',async()=>{const h=await harness();await h.click('probe-button');assert.equal(h.posts.at(-1).body.purpose,'normal');assert.equal(h.window.pcbTargetPreview.points.left.x,9.6);await h.select();await h.click('calibration-centre-preview');assert.equal(h.posts.at(-1).body.purpose,'calibration');assert.equal(h.window.pcbTargetPreview.points.left.x,10);assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,0);});
 await check('five unique pad IDs, no movement when merely beginning',async()=>{const h=await harness();await h.select();await h.click('calibration-add');await h.click('calibration-add');assert.equal(h.get('calibration-pads').children.length,1);await h.click('calibration-clear');await h.chooseFive();await h.click('calibration-start');assert.equal(h.posts.at(-1).url,'/motor/pcb/calibration/start');assert.equal(h.posts.at(-1).body.pad_ids.length,5);assert.equal(h.get('calibration-single-record').disabled,true);});
 await check('record moves to the next centre only after successful read job; final save is explicit',async()=>{const h=await harness();await h.chooseFive();await h.click('calibration-start');await h.click('calibration-go');for(let i=0;i<5;i++)await h.click('calibration-record');assert.equal(h.draft.state,'complete');assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,5);assert.equal(h.posts.filter(p=>p.url.endsWith('/calibration/record')).length,5);assert.equal(h.posts.filter(p=>p.url.endsWith('/calibration/save')).length,0);assert.equal(h.get('calibration-save').disabled,false);await h.click('calibration-save');assert.equal(h.draft.state,'saved');});
 await check('failed record never launches the next point',async()=>{const h=await harness();await h.chooseFive();await h.click('calibration-start');await h.click('calibration-go');h.reject('/motor/pcb/calibration/record');await h.click('calibration-record');assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,1);});
 await check('cancel preserves profile and never calls save',async()=>{const h=await harness();await h.chooseFive();await h.click('calibration-start');await h.click('calibration-cancel');assert.equal(h.draft.state,'cancelled');assert.equal(h.config.revision,1);assert.equal(h.posts.filter(p=>p.url.endsWith('/calibration/save')).length,0);});
 await check('observation lowering is explicit and uses only selected servo channel',async()=>{const h=await harness();assert.equal(h.posts.length,0);await h.select();await h.pick('p0');await h.click('calibration-observe');assert.deepEqual(h.posts.at(-1),{url:'/motor/servo/down',body:{channel:1}});});
 await check('selecting a probe never moves; a fresh pad click automatically previews its centre and moves exactly once',async()=>{const h=await harness();await h.select();assert.equal(h.posts.length,0);await h.pick('p0');assert.deepEqual(h.posts.map(p=>p.url),['/motor/pcb/preview','/motor/pcb/move']);assert.deepEqual(h.posts[0].body.pads,{left:'p0',right:null});assert.equal(h.posts[0].body.purpose,'calibration');assert.equal(h.get('calibration-single-record').disabled,false);});
 await check('right probe clicks only request right probe; no change of compensation before confirmation',async()=>{const h=await harness();await h.select('right');await h.pick('p1');assert.deepEqual(h.posts[0].body.pads,{left:null,right:'p1'});assert.equal(h.config.revision,1);assert.equal(h.posts.some(p=>p.url==='/motor/pcb/teach'),false);});
 await check('jog then confirm saves captured centre once and disables repeat saving',async()=>{const h=await harness();await h.select();await h.pick('p2');await h.click('calibration-jog-left');assert.equal(h.posts.at(-1).body.probe,'left');await h.click('calibration-single-record');assert.deepEqual(h.posts.at(-1),{url:'/motor/pcb/teach',body:{probe:'left',pad_id:'p2',orientation:0,revision:1,layout_id:'board'}});assert.equal(h.config.revision,2);assert.equal(h.get('calibration-single-record').disabled,true);assert.match(h.get('pcb-control-error').textContent,/已保存/);});
 await check('no compensation enters manual first teach without guessing a motor target',async()=>{const h=await harness();h.config.alignment.left=false;h.config.effective_offsets.left=null;await h.select();await h.pick('p0');assert.equal(h.posts.length,0);assert.equal(h.get('calibration-single-record').disabled,false);assert.match(h.get('pcb-control-error').textContent,/首次/);await h.click('calibration-single-record');assert.equal(h.posts[0].url,'/motor/pcb/teach');});
 await check('no probe, offline, STOP, not-ready and external pending never send movement',async()=>{for(const condition of ['unselected','offline','stopped','not-ready','external']){const h=await harness();if(condition!=='unselected')await h.select();if(condition==='offline')h.window.probeWorkbench.online=false;if(condition==='stopped')await h.emitStatus({stopped:true});if(condition==='not-ready')await h.emitStatus({ready:false});if(condition==='external')h.window.dispatchEvent({type:'motor-ui-pending',detail:{pending:true}});await h.pick('p0');assert.equal(h.posts.length,0,condition);assert.equal(h.get('calibration-single-record').disabled,true,condition);}});
 await check('programmatic selection/status/polling never moves or enables saving',async()=>{const h=await harness();await h.select();h.window.probeWorkbench.assign('left','p1');await h.emitStatus({positions_mm:{'1':3}});await h.poll();assert.equal(h.posts.length,0);assert.equal(h.get('calibration-single-record').disabled,true);});
 await check('mode and layout changes discard arming and never replay an old pad',async()=>{for(const event of ['execution-mode-changed','pcb-layout-changed']){const h=await harness();await h.select();await h.pick('p0');const n=h.posts.length;await h.event(event);await h.poll();await h.pick('p0');assert.equal(h.posts.length,n);assert.equal(h.get('calibration-single-record').disabled,true);assert.equal(h.get('calibration-probe').value,'');}});
 await check('rapid clicks do not enqueue or change the target while moving',async()=>{const h=await harness();await h.select();h.defer('/motor/pcb/preview');await h.pick('p0');await h.pick('p1');assert.equal(h.selected.left,'p0');await h.release();assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,1);assert.equal(h.posts[0].body.pads.left,'p0');});
 await check('selection or mode changes during preview prevent execution',async()=>{for(const event of ['pcb-selection-changed','execution-mode-changed']){const h=await harness();await h.select();h.defer('/motor/pcb/preview');await h.pick('p0');if(event==='pcb-selection-changed')h.selected.left='p1';await h.event(event);await h.release();assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,0);assert.equal(h.get('calibration-single-record').disabled,true);}});
 await check('preview rejection, soft limits and failed moves cannot record and never retry automatically',async()=>{for(const condition of ['preview','limit','job']){const h=await harness();await h.select();if(condition==='preview')h.reject('/motor/pcb/preview');if(condition==='limit')h.block();if(condition==='job')h.failJob();await h.pick('p0');await h.poll();assert.equal(h.get('calibration-single-record').disabled,true,condition);assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,condition==='job'?1:0,condition);assert.equal(h.posts.some(p=>p.url==='/motor/pcb/teach'),false);}});
 await check('explicitly choosing another probe invalidates the previous pending confirmation',async()=>{const h=await harness();await h.select();await h.pick('p0');await h.select('right');assert.equal(h.get('calibration-single-record').disabled,true);assert.equal(h.posts.length,2);});
 await check('same pad can be intentionally clicked again to verify the saved compensation',async()=>{const h=await harness();await h.select();await h.pick('p0');await h.click('calibration-single-record');await h.pick('p0');assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/move').length,2);assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/teach').length,1);});
 await check('select-only mode supports pad assignment without motion or saving',async()=>{const h=await harness();await h.select();await h.policy('select');await h.pick('p3');assert.equal(h.selected.left,'p3');assert.equal(h.posts.length,0);assert.equal(h.get('calibration-single-record').disabled,true);});
 await check('normal edge movement cancels an earlier centre confirmation',async()=>{const h=await harness();await h.select();await h.pick('p0');await h.click('probe-button');await h.click('pcb-move-preview');assert.equal(h.get('calibration-single-record').disabled,true);});
 await check('external circle or rebuild cannot leave a stale centre confirmation',async()=>{for(const action of ['circle','rebuild']){const h=await harness();await h.select();await h.pick('p0');await h.emitStatus({busy:true,ready:false,last_job:{action}});await h.emitStatus({busy:false,ready:true});assert.equal(h.get('calibration-single-record').disabled,true,action);}});
 await check('a failed compensation save preserves the old revision without automatic retry',async()=>{const h=await harness();await h.select();await h.pick('p0');h.reject('/motor/pcb/teach');await h.click('calibration-single-record');await h.poll();assert.equal(h.config.revision,1);assert.equal(h.posts.filter(p=>p.url==='/motor/pcb/teach').length,1);});
 await check('first right-probe manual binding only reads configuration; explicit confirmation only teaches',async()=>{
  const h=await harness();h.config.alignment.right=false;h.config.effective_offsets.right=null;
  await h.select('right');h.window.probeWorkbench.assign('right','p2');await h.poll();
  assert.equal(h.get('calibration-single-record').disabled,true);assert.equal(h.get('pcb-teach-manual-bind').disabled,false);
  const first=h.requests.length;await h.click('pcb-teach-manual-bind');
  assert.equal(h.posts.length,0);assert.ok(h.requests.length>first);assert.ok(h.requests.slice(first).every(item=>item.method==='GET'));
  assert.equal(h.config.revision,1);assert.equal(h.get('calibration-single-record').disabled,false);
  await h.click('calibration-single-record');
  assert.deepEqual(h.posts,[{url:'/motor/pcb/teach',body:{probe:'right',pad_id:'p2',orientation:0,revision:1,layout_id:'board'}}]);
  assert.equal(h.config.revision,2);assert.equal(h.get('calibration-single-record').disabled,true);
 });
 await check('right-probe manual intent survives external jogging and explicit observation before confirmation',async()=>{
  const h=await harness();h.config.alignment.right=false;await h.select('right');h.window.probeWorkbench.assign('right','p1');
  await h.click('pcb-teach-manual-bind');
  await h.emitStatus({busy:true,ready:false,last_job:{action:'jog'}});
  await h.emitStatus({busy:false,ready:true,positions_mm:{'1':2,'2':4,'3':2,'4':5}});
  assert.equal(h.get('calibration-single-record').disabled,false);
  await h.click('calibration-observe');assert.deepEqual(h.posts,[{url:'/motor/servo/down',body:{channel:2}}]);
  assert.equal(h.get('calibration-single-record').disabled,false);await h.click('calibration-single-record');
  assert.deepEqual(h.posts.map(item=>item.url),['/motor/servo/down','/motor/pcb/teach']);
  assert.equal(h.posts.at(-1).body.probe,'right');assert.equal(h.posts.at(-1).body.pad_id,'p1');
 });
 await check('lost status can be recovered by explicit manual binding without moving the aligned right probe',async()=>{
  const h=await harness();h.config.alignment.right=false;await h.select('right');await h.pick('p3');
  assert.equal(h.get('calibration-single-record').disabled,false);await h.emitStatusError();
  assert.equal(h.get('calibration-single-record').disabled,true);assert.equal(h.get('pcb-teach-manual-bind').disabled,true);
  await h.emitStatus({ready:true,busy:false});assert.equal(h.get('calibration-single-record').disabled,true);
  await h.click('pcb-teach-manual-bind');assert.equal(h.posts.length,0);assert.equal(h.get('calibration-single-record').disabled,false);
  await h.click('calibration-single-record');assert.deepEqual(h.posts.map(item=>item.url),['/motor/pcb/teach']);
 });
 await check('opening five-point controls without starting a draft can recover manual centre binding',async()=>{
  const h=await harness();await h.select('right');h.window.probeWorkbench.assign('right','p4');
  await h.calibrationToggle(true);assert.equal(h.get('pcb-pick-policy').value,'select');assert.equal(h.get('calibration-single-record').disabled,true);
  await h.click('pcb-teach-manual-bind');assert.equal(h.get('pcb-pick-policy').value,'centre');
  assert.equal(h.get('calibration-single-record').disabled,false);assert.equal(h.posts.length,0);
 });
 await check('manual binding a probe with an existing compensation never previews or moves',async()=>{
  const h=await harness();await h.select();h.window.probeWorkbench.assign('left','p1');
  h.config.revision=7;await h.click('pcb-teach-manual-bind');assert.equal(h.posts.length,0);
  assert.equal(h.get('calibration-single-record').disabled,false);await h.click('calibration-single-record');
  assert.deepEqual(h.posts,[{url:'/motor/pcb/teach',body:{probe:'left',pad_id:'p1',orientation:0,revision:7,layout_id:'board'}}]);
 });
 await check('fixed-slot device scope is visible without issuing movement or saving',async()=>{
  const h=await harness();h.config.registration_scope='fixed_fixture';await h.select('right');await h.poll();
  assert.match(h.get('pcb-alignment-status').textContent,/跨工程沿用/);assert.equal(h.posts.length,0);
 });
 await check('manual binding requires selected valid pad, armed probe, online ready and exclusive idle state',async()=>{
  for(const condition of ['unarmed','no-pad','invalid-pad','offline','stopped','not-ready','busy','external','dirty']){
   const h=await harness();if(condition!=='unarmed'){await h.select('right');h.window.probeWorkbench.assign('right','p0');}
   if(condition==='no-pad')h.selected.right=null;
   if(condition==='invalid-pad')h.window.probeWorkbench.design.pads.p0.is_allowed=false;
   if(condition==='offline')h.window.probeWorkbench.online=false;
   if(condition==='stopped')await h.emitStatus({stopped:true});
   if(condition==='not-ready')await h.emitStatus({ready:false});
   if(condition==='busy')await h.emitStatus({busy:true,ready:false,last_job:{action:'jog'}});
   if(condition==='external')h.window.dispatchEvent({type:'motor-ui-pending',detail:{pending:true}});
   if(condition==='dirty')h.get('probe-right-x-offset').oninput();
   await h.poll();assert.equal(h.get('pcb-teach-manual-bind').disabled,true,condition);await h.click('pcb-teach-manual-bind');
   assert.equal(h.posts.length,0,condition);assert.equal(h.get('calibration-single-record').disabled,true,condition);
  }
  const h=await harness();await h.chooseFive();await h.click('calibration-start');
  assert.equal(h.get('pcb-teach-manual-bind').disabled,true);const count=h.posts.length;
  await h.click('pcb-teach-manual-bind');assert.equal(h.posts.length,count);assert.equal(h.get('calibration-single-record').disabled,true);
 });
 await check('target, probe, orientation or layout changes during manual binding cannot enable confirmation',async()=>{
  for(const condition of ['pad','pad-return','probe','orientation','layout']){
   const h=await harness();await h.select('right');h.window.probeWorkbench.assign('right','p0');await h.poll();
   h.defer('/motor/pcb/config');await h.click('pcb-teach-manual-bind');
   if(condition==='pad')h.window.probeWorkbench.assign('right','p1');
   if(condition==='pad-return'){h.window.probeWorkbench.assign('right','p1');h.window.probeWorkbench.assign('right','p0');}
   if(condition==='probe')await h.select('left');
   if(condition==='orientation')h.orientation(90);
   if(condition==='layout'){h.config.layout_id='replacement';h.window.probeWorkbench.design.layout_id='replacement';}
   await h.release();assert.equal(h.posts.length,0,condition);assert.equal(h.get('calibration-single-record').disabled,true,condition);
  }
 });
 console.log(count+' calibration UI checks passed (fake DOM/HTTP, no hardware).');
})().catch(e=>{console.error(e);process.exitCode=1;});
