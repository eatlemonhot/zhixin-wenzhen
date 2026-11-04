// 校验原理图、STEP初始化及焊盘点击的界面行为。
// Strict fake DOM and renderer: no browser, network or hardware access.
'use strict';
const fs=require('node:fs'),path=require('node:path'),vm=require('node:vm'),assert=require('node:assert/strict');
const source=name=>fs.readFileSync(path.join(__dirname,'../interface',name),'utf8');
const removed=['component-model-status','show-components','assembly-board','component-search','component-list','component-inspector','probe-queue','queue-add','queue-preview','queue-export','queue-count'];
class Element{
 constructor(){this.children=[];this.listeners={};this.dataset={};this.selected=false;this.value='0';this.classList={toggle:(_,on)=>{this.selected=on;}};this.attrs={viewBox:'0 0 200 100'};this.viewBox={baseVal:{x:0,y:0,width:200,height:100}};}
 addEventListener(name,fn){this.listeners[name]=fn;}
 append(...children){this.children.push(...children);}
 replaceChildren(...children){this.children=children;}
 setAttribute(name,value){this.attrs[name]=value;}
 getAttribute(name){return this.attrs[name];}
 setPointerCapture(){}
 querySelector(){return this.children[0];}
 getBoundingClientRect(){return {left:0,top:0,width:200,height:100};}
}
function dom(ids){const elements=new Map(ids.map(id=>[id,new Element()]));return {elements,document:{getElementById(id){if(removed.includes(id))throw Error('Access to removed control: '+id);return elements.get(id)||null;},createElement:()=>new Element(),importNode:n=>n,querySelectorAll:()=>[]}};}
const tick=()=>new Promise(resolve=>setImmediate(resolve));
let count=0;async function check(name,run){await run();count++;console.log('ok '+name);}
async function workbench(){
 const f=dom(['workbench-status','execution-mode','schematic-canvas','schematic-count','schematic-page','schematic-focus','schematic-fit','pcb-fit','candidates-selection-first-label','candidates-selection-second-label']);
 const events=new Map(),calls=[],svg=new Element(),component=new Element();component.dataset.reference='R1';
 f.document.querySelectorAll=()=>[component];
 const design={loaded:true,layout_id:'board',pads:{p:{id:'p',reference:'R1',pad_number:'1',net:'GND',is_allowed:true}},schematic:{components:[{reference:'R1',pins:[{x:50,y:30}]}],pages:[{svg:'svg',title:'main',components:[{}],wire_count:1}]}};
 const window={addEventListener(n,fn){if(!events.has(n))events.set(n,[]);events.get(n).push(fn);},dispatchEvent(e){for(const fn of events.get(e.type)||[])fn(e);}};
 const context={window,document:f.document,DOMParser:class{parseFromString(){return {documentElement:svg};}},CustomEvent:class{constructor(type){this.type=type;}},layoutPads:design.pads,padCandidates:{left:'',right:''},Context2D:{fitBoard(){}},setTimeout(){},clearTimeout(){},fetch:async(url,options)=>{calls.push({url,options});return {ok:true,json:async()=>design};}};
 vm.runInNewContext(source('static/js/workbench.js'),context);await tick();await tick();
 return {...f,events,calls,svg,component,window,context};
}
(async()=>{
 await check('three sidebar panels are removed while import, fixture and diagnosis remain',()=>{
  const html=source('templates/base.html');for(const id of removed)assert.ok(!html.includes('id="'+id+'"'),id);
  for(const id of ['diagnostic-panel','fixture-x','fixture-y','fixture-reset','step-file','probe-control-host'])assert.ok(html.includes('id="'+id+'"'),id);
 });
 await check('actual workbench initializes a loaded design without any removed DOM controls',async()=>{
  const f=await workbench();assert.equal(f.window.probeWorkbench.design.layout_id,'board');assert.equal(f.elements.get('schematic-canvas').children[0],f.svg);assert.equal(f.elements.get('schematic-page').children.length,1);assert.equal(f.calls.length,1);assert.equal(f.calls[0].url,'/workbench/design');assert.match(f.elements.get('workbench-status').textContent,/工程已就绪/);assert.equal(f.window.probeWorkbench.queue,undefined);
 });
 await check('schematic clicks still select and highlight components without moving or posting',async()=>{
  const f=await workbench(),event={pointerId:1,clientX:30,clientY:40,target:{closest:()=>f.component}};
  f.svg.listeners.pointerdown(event);f.svg.listeners.pointerup(event);assert.equal(f.window.probeWorkbench.component,'R1');assert.equal(f.component.selected,true);assert.equal(f.calls.length,1);
  f.elements.get('schematic-focus').onclick();assert.equal(f.svg.attrs.viewBox,'-15 -35 130 130');
 });
 await check('schematic dragging does not select a component; direct pad assignment remains available',async()=>{
  const f=await workbench(),event={pointerId:1,clientX:30,clientY:40,target:{closest:()=>f.component}};
  f.svg.listeners.pointerdown(event);f.svg.listeners.pointermove({...event,clientX:60});f.svg.listeners.pointerup(event);assert.equal(f.window.probeWorkbench.component,null);
  f.window.probeWorkbench.assign('left','p');assert.equal(f.context.padCandidates.left,'p');assert.equal(f.elements.get('candidates-selection-first-label').textContent,'左针：R1.1 · GND');assert.equal(f.calls.length,1);
 });
 const realThree=await import('../interface/static/js/vendor/three.module.js');
 async function assembly(){
  const ids=['main-pcb-3D-section','assembly-status','fixture-thickness','fixture-x','fixture-y','fixture-note','assembly-top','assembly-iso','fixture-reset','show-fixture'];
  const f=dom(ids),canvas=new Element(),events=new Map(),picks=[],T={...realThree};let renderCount=0;
  f.elements.get('main-pcb-3D-section').hidden=false;f.elements.get('fixture-thickness').value='1.6';
  T.WebGLRenderer=class{constructor(){this.domElement=canvas;}setPixelRatio(){}setSize(){}render(){renderCount++;}setAnimationLoop(fn){this.animation=fn;}};
  T.Raycaster=class{setFromCamera(){}intersectObjects(pads){return pads.length?[{object:pads[0]}]:[];}};
  const root=new T.Group(),components=new T.Group(),body=new T.Mesh(new T.BoxGeometry(1,1,1),[new T.MeshStandardMaterial()]);components.add(body);components.visible=false;root.add(components);
  const step={root,components,meta:{board_thickness_mm:1.6,component_count:1,missing_references:[]}};
  const pad={id:'p',footprint_x:5,footprint_y:5,footprint_angle:0,size_x:1,size_y:1,shape:'rect',is_allowed:true,reference:'R1'};
  const window={probeWorkbench:{design:null},pcbPadInteraction:{pick:id=>picks.push(id)},addEventListener(n,fn){events.set(n,fn);}};
  const context={T,window,document:f.document,devicePixelRatio:1,OrbitControls:class{constructor(){this.target=new T.Vector3();}update(){return false;}dispose(){}},ResizeObserver:class{observe(){}},fetch:async()=>({ok:true,json:async()=>({meshes:[]})}),fixtureDatum:()=>({origin:[0,0,0],slotMinX:0,slotMaxX:100,slotTopY:100,planeZ:0,clampInnerY:0,clampOuterY:0,railMinY:-100,railMaxY:100}),boardPlacement:()=>({x:0,y:100,z:0,width:10,height:10}),clampPlacement:()=>({y:90}),fixturePoint:(x,y,p)=>[p.x+x,p.y-y],rotateBoardPoint:(x,y)=>[x,y],selectStepModel:()=>({}),stepPose:()=>({x:0,y:0,z:0,angle:0,scaleY:1}),loadStep:async()=>step,disposeStep(){},layoutEdges:[{start:{x:0,y:0}},{start:{x:10,y:0}},{start:{x:10,y:10}},{start:{x:0,y:10}}],padCandidates:{left:'',right:''}};
  const code=source('static/js/assembly-view.js').split('\n').filter(line=>!line.startsWith('import ')).join('\n');await vm.runInNewContext('(async()=>{'+code+'})()',context);
  window.probeWorkbench.design={layout_id:'board',dimensions:{width:10,height:10,orientation:0},pads:{p:pad},graphics:[]};events.get('workbench-design-changed')();await tick();await tick();
  return {...f,canvas,picks,components,window,renderCount,events};
 }
 await check('actual assembly initializes without removed controls and automatically shows loaded STEP components',async()=>{
  const f=await assembly();assert.equal(f.components.visible,true);assert.match(f.elements.get('assembly-status').textContent,/STEP元件已显示：1个/);assert.equal(f.elements.get('fixture-thickness').disabled,true);assert.ok(f.renderCount>0);assert.equal(f.events.has('workbench-plan-changed'),false);
 });
 await check('3D fresh pad click still delegates, while dragging never selects or moves',async()=>{
  const f=await assembly(),event={button:0,pointerId:1,clientX:50,clientY:50};
  f.canvas.listeners.pointerdown(event);f.canvas.listeners.pointerup(event);assert.deepEqual(f.picks,['p']);
  f.canvas.listeners.pointerdown(event);f.canvas.listeners.pointermove({...event,clientX:100});f.canvas.listeners.pointerup(event);assert.deepEqual(f.picks,['p']);
 });
 console.log(count+' sidebar cleanup checks passed (strict fake DOM/HTTP/renderer; no hardware).');
})().catch(error=>{console.error(error);process.exitCode=1;});
