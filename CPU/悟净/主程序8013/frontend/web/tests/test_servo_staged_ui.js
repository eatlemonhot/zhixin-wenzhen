// Execute the actual UI against a small DOM and mocked requests. No hardware.
'use strict';
const assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm'),path=require('node:path');
const source=fs.readFileSync(path.join(__dirname,'../interface/static/js/servo-control.js'),'utf8');
async function harness(revision){
 const nodes=[],posts=[];
 class Element{
  constructor(tag){this.tag=tag;this.children=[];this.value='';this.dataset={};this.checked=false;nodes.push(this);}
  append(...rows){for(const row of rows){row.parentElement=this;this.children.push(row);if(this.tag==='select'&&this.children.length===1)this.value=row.value;}}
  prepend(row){row.parentElement=this;this.children.unshift(row);}
  setAttribute(key,value){this[key]=value;}
  removeAttribute(key){delete this[key];}
  insertAdjacentElement(_,row){this.parentElement.append(row);}
 }
 const document={readyState:'complete',createElement:tag=>new Element(tag),getElementById:id=>nodes.find(n=>n.id===id)};
 const root=new Element('section');root.id='control-section';
 for(const side of ['left','right'])for(const name of ['probe','bottom']){const wrapper=new Element('div');root.append(wrapper);const button=new Element('button');button.id=side+'-move-'+name+'-button';wrapper.append(button);}
 const state={available:!!revision,revision,frequency_hz:333,error_code:0,channels:[1,2].map(channel=>({channel,up_us:900,down_us:2100,active_us:900,selected_position:'up',enabled:false,pending:false}))};
 const cycle={state:'idle',busy:false};
 const fetch=async(url,options={})=>{
  if(options.method){posts.push({url,body:JSON.parse(options.body)});return {ok:true,json:async()=>({state:'preparing',busy:true})};}
  return {ok:true,json:async()=>url.endsWith('/status')?state:cycle};
 };
 vm.runInNewContext(source,{document,window:{probeWorkbench:{online:true},addEventListener(){}},fetch,setTimeout(){}});
 await new Promise(resolve=>setImmediate(resolve));
 return {get:document.getElementById,posts};
}
(async()=>{
 const unknown=await harness(0);assert.equal(unknown.get('servo-staged-start').disabled,true);assert.deepEqual(unknown.posts,[]);
 const old=await harness(123);assert.equal(old.get('servo-staged-start').disabled,true);
 const ready=await harness(124);assert.equal(ready.get('servo-staged-start').disabled,true);assert.deepEqual(ready.posts,[]);
 ready.get('servo-staged-dac').value='2';ready.get('servo-staged-dac').onchange();assert.equal(ready.get('servo-staged-start').disabled,true);
 ready.get('servo-staged-ground').checked=true;ready.get('servo-staged-ground').onchange();assert.equal(ready.get('servo-staged-start').disabled,true);
 ready.get('servo-staged-positioned').checked=true;ready.get('servo-staged-positioned').onchange();assert.equal(ready.get('servo-staged-start').disabled,true);
 ready.get('servo-left-terminal').value='TP_A';ready.get('servo-left-terminal').onchange();assert.equal(ready.get('servo-staged-start').disabled,false);
 ready.get('servo-staged-rs').value='10000';ready.get('servo-cycle-window').value='4';
 await ready.get('servo-staged-start').onclick();await new Promise(resolve=>setImmediate(resolve));
 assert.equal(ready.posts.length,1);
 assert.deepEqual(ready.posts[0],{url:'/motor/servo/cycle/start',body:{kind:'staged_abca',dac_channel:2,adc_channel:1,left_terminal:'TP_A',rs_ohm:10000,decimation_log2:4,frames:16,fixed_ground_confirmed:true,xy_position_confirmed:true}});
 assert.equal(ready.get('servo-staged-start').disabled,true);
 console.log('8 staged servo UI interlock/payload checks passed (mocked DOM/HTTP).');
})().catch(error=>{console.error(error);process.exitCode=1;});
