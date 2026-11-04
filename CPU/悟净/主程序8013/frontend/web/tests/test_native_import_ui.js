/* No browser or hardware: verify the single-project upload and optional STEP contract. */
const fs=require('node:fs'),path=require('node:path'),vm=require('node:vm'),assert=require('node:assert/strict');
const code=fs.readFileSync(path.join(__dirname,'../interface/static/js/design-package.js'),'utf8');
function fixture(state={loaded:false,complete:false}){
 const elements=new Map(),listeners={},posts=[];
 class Element{
  constructor(){this.files=[];this.children=[];this.value='';this.disabled=false;this.textContent='';this.hidden=false;this.dataset={};this.classList={add(){},remove(){}};}
  addEventListener(name,fn){this[name]=fn;}
  setAttribute(k,v){this[k]=v;}
  removeAttribute(k){delete this[k];}
  append(...v){this.children.push(...v);}
  appendChild(v){this.children.push(v);}
  replaceChildren(...v){this.children=v;}
  add(v){this.children.push(v);}
  querySelector(){return this.table||(this.table=new Element());}
 }
 function el(id){if(!elements.has(id))elements.set(id,new Element());return elements.get(id);}
 const document={getElementById:el,createElement:()=>new Element()};
 class DataTransfer{constructor(){this.files=[];this.items={add:f=>this.files.push(f)};}}
 class FormData{constructor(){this.rows=[];}append(...r){this.rows.push(r);}}
 const window={addEventListener:(n,fn)=>listeners[n]=fn};
 const cache=new Map(),sessionStorage={getItem:key=>cache.get(key)||null,setItem:(key,value)=>cache.set(key,value),removeItem:key=>cache.delete(key)};
 const context={window,document,DataTransfer,FormData,sessionStorage,URLSearchParams,location:{search:''},Option:function(t,v){this.text=t;this.value=v;},fetch:async(url)=>{posts.push(url);return {ok:true,json:async()=>state};},setTimeout(){},clearTimeout(){},console};
 vm.runInNewContext(code,context);
 async function settle(){for(let i=0;i<6;i++)await Promise.resolve();}
 function drop(files){el('design-dropzone').ondrop({preventDefault(){},dataTransfer:{files}});}
 return {el,window,posts,drop,settle,listeners};
}
let count=0;
async function test(name,run){await run();count++;console.log('ok '+name);}
(async()=>{
 await test('single epro2 uploads without mode radios, netlist or BOM inputs',async()=>{
  const f=fixture();await f.settle();f.drop([{name:'板.epro2',size:42}]);
  const upload=f.window.designPackage.upload();assert.equal(upload.layout.name,'板.epro2');
  assert.deepEqual(upload.body.rows.map(r=>r[0]),['layout_file','import_mode']);
  assert.equal(upload.body.rows[1][1],'native');assert.equal(upload.maxSize,16*1024*1024);
  assert.deepEqual(f.posts,['/design-package/status']);
 });
 await test('project and STEP can be selected together and remain paired',async()=>{
  const f=fixture();f.drop([{name:'one.epro2',size:2},{name:'one.step',size:3}]);
  assert.equal(f.el('layout-file').files[0].name,'one.epro2');assert.equal(f.el('step-file').files[0].name,'one.step');
  assert.equal(f.window.designPackage.upload().layout.name,'one.epro2');
 });
 await test('selecting another project clears the stale STEP',async()=>{
  const f=fixture();f.drop([{name:'one.epro2',size:2},{name:'one.stp',size:3}]);f.drop([{name:'two.epro2',size:2}]);
  assert.equal(f.el('layout-file').files[0].name,'two.epro2');assert.equal(f.el('step-file').files.length,0);
 });
 await test('separate STEP selection retains the current project',async()=>{
  const f=fixture();f.drop([{name:'one.epro2',size:2}]);f.drop([{name:'one.stp',size:3}]);
  assert.equal(f.el('layout-file').files[0].name,'one.epro2');assert.equal(f.el('step-file').files[0].name,'one.stp');
 });
 await test('multiple projects or unrelated files reject atomically',async()=>{
  for(const files of [[{name:'a.epro2'},{name:'b.epro2'}],[{name:'a.epro2'},{name:'bom.csv'}]]){
   const f=fixture();f.drop(files);assert.equal(f.el('layout-file').files.length,0);assert.throws(()=>f.window.designPackage.upload());
  }
 });
 await test('clearing files only changes selection and does not POST or import',async()=>{
  const f=fixture();await f.settle();f.drop([{name:'one.epro2',size:2}]);f.el('design-clear-files').onclick();
  assert.equal(f.el('layout-file').files.length,0);assert.deepEqual(f.posts,['/design-package/status']);
 });
 await test('locked import prevents replacing files',async()=>{
  const f=fixture();f.window.designPackage.setLocked(true);f.drop([{name:'one.epro2',size:2}]);
  assert.equal(f.el('layout-file').files.length,0);assert.equal(f.el('step-file').disabled,true);
 });
 await test('incomplete native parameters disable diagnosis without asking for companion uploads',async()=>{
  const f=fixture({loaded:true,complete:true,layout_id:'x',data:{source_mode:'native_epro2',nets:['GND'],bom:[],report:{component_count:2,net_count:1,checked_pins:2,warnings:['元件数值缺失：R1'],missing_nominal_values:['R1'],diagnostic_ready:false}}});
  await f.settle();assert.equal(f.el('download-diagnostic-job').disabled,true);
  assert.match(f.el('design-readiness').textContent,/工程可查看和定位/);assert.doesNotMatch(f.el('design-readiness').textContent,/需补充网表|上传BOM/);
 });
 await test('导入工程不自动选择样板激励网络',async()=>{
  const f=fixture({loaded:true,complete:true,layout_id:'new-board',data:{nets:['GND','TP_P','INPUT_X'],bom:[],report:{component_count:1,net_count:3,checked_pins:2,warnings:[],missing_nominal_values:[],diagnostic_ready:true}}});
  await f.settle();assert.equal(f.el('job-excitation').value,'');
  assert.equal(f.el('job-ground').value,'GND');
 });
 console.log(count+' native import UI checks passed (mock DOM/HTTP; no hardware).');
})().catch(e=>{console.error(e);process.exit(1);});
