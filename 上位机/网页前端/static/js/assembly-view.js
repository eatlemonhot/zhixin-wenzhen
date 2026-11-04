import * as T from './vendor/three.module.js';
import {fixtureDatum,boardPlacement,fixturePoint,clampPlacement,rotateBoardPoint} from './fixture-geometry.js?v=corner-20261025';
import { OrbitControls } from './vendor/OrbitControls.js';
import {selectStepModel,stepPose} from './step-model-geometry.js?v=joint-20261025-1';
import {loadStep,disposeStep} from './step-model.js?v=joint-20261025-1';
const host=document.getElementById('main-pcb-3D-section');
const scene=new T.Scene();scene.background=new T.Color('#101d2a');
const camera=new T.PerspectiveCamera(40,1,.1,3000);camera.up.set(0,0,1);camera.position.set(225,-265,245);
const renderer=new T.WebGLRenderer({antialias:true});renderer.setPixelRatio(Math.min(devicePixelRatio,2));host.append(renderer.domElement);
let controls=new OrbitControls(camera,renderer.domElement);controls.target.set(0,25,0);controls.enableDamping=true;controls.minDistance=30;controls.maxDistance=900;controls.update();
scene.add(new T.HemisphereLight(0xe5f4ff,0x243344,2));const light=new T.DirectionalLight(0xffffff,3);light.position.set(100,-80,300);scene.add(light);
const fixture=new T.Group(),pcb=new T.Group(),paths=new T.Group();scene.add(fixture,pcb,paths);
const grid=new T.GridHelper(420,42,0x3b6174,0x253b4b);grid.rotation.x=Math.PI/2;grid.position.z=-8.4;scene.add(grid);
const material=color=>new T.MeshStandardMaterial({color,roughness:.67,metalness:.15,side:T.DoubleSide});
let config=null,datum=null,clamp=null,z=0,thickness=1.6,shownLayout=null;
let pickablePads=[];
let modelCatalog={models:{}},stepModel=null,modelKey=null,modelSequence=0,sceneDirty=true;
const assemblyStatus=document.getElementById('assembly-status');
let fixtureStatus='加载机械模型…';
function modelStatus(message){assemblyStatus.textContent=fixtureStatus+(message?' · '+message:'');}
function clean(g){while(g.children.length){const c=g.children[0];g.remove(c);c.traverse(o=>{o.geometry?.dispose();if(Array.isArray(o.material))o.material.forEach(m=>m.dispose());else o.material?.dispose();});}}
async function loadSTL(file){const b=await(await fetch('/static/models/'+file)).arrayBuffer(),v=new DataView(b),n=v.getUint32(80,true),p=new Float32Array(n*9);for(let i=0;i<n;i++)for(let j=0;j<9;j++)p[i*9+j]=v.getFloat32(84+i*50+12+j*4,true);const g=new T.BufferGeometry();g.setAttribute('position',new T.BufferAttribute(p,3));g.computeVertexNormals();return g;}
try{config=await(await fetch('/static/models/fixture.json')).json();
 datum=fixtureDatum(config);const center=datum.origin;z=center[2];
 for(let i=0;i<config.meshes.length;i++){const g=await loadSTL(config.meshes[i].file),mesh=new T.Mesh(g,material(i===0?0xe89039:0x607689));mesh.position.set(-center[0],-center[1],-z);fixture.add(mesh);if(i===0)clamp=mesh;}
 fixtureStatus='真实STEP装配 · 毫米比例 · 底板/挡板已加载';modelStatus('');
}catch(e){fixtureStatus='机械模型加载失败：'+e.message;modelStatus('');}
try{const response=await fetch('/static/models/boards/catalog.json?v=step-20261025-1');if(!response.ok)throw Error('模型目录加载失败');modelCatalog=await response.json();}
catch(e){modelStatus(e.message+'，仍可查看PCB焊盘。');}
async function syncStepModel(){
 const d=window.probeWorkbench?.design;if(!d)return;
 let entry;
 try{entry=selectStepModel(modelCatalog,d);}catch(e){modelStatus(e.message);return;}
 const key=d.layout_id+'|'+(entry?.manifest_url||entry?.manifest||'')+'|'+(entry?.source_sha256||'');if(modelKey===key)return;modelKey=key;const token=++modelSequence;
 if(stepModel){scene.remove(stepModel.root);disposeStep(stepModel);stepModel=null;}
 document.getElementById('fixture-thickness').disabled=false;rebuild();
 try{
  if(!entry){modelStatus('当前工程没有匹配的STEP模型，显示板框和焊盘。');return;}
  modelStatus('正在加载整板STEP元件模型…');
  const model=await loadStep(entry);
  if(token!==modelSequence||window.probeWorkbench?.design?.layout_id!==d.layout_id){disposeStep(model);return;}
  stepModel=model;scene.add(model.root);
  document.getElementById('fixture-thickness').value=model.meta.board_thickness_mm.toFixed(3);document.getElementById('fixture-thickness').disabled=true;
  modelStatus(`STEP元件已显示：${model.meta.component_count}个`+(model.meta.missing_references.length?'，缺少位号：'+model.meta.missing_references.join('、'):''));
  rebuild();
 }catch(e){if(token===modelSequence)modelStatus('元件模型加载失败：'+e.message);}
}
const rotate=rotateBoardPoint;
function localPoint(p,d){return rotate(p.footprint_x,p.footprint_y,d);}
function meshPlane(shape,color,zv){const m=new T.Mesh(new T.ShapeGeometry(shape),material(color));m.position.z=zv;pcb.add(m);return m;}
function rebuild(){const wb=window.probeWorkbench,d=wb?.design;if(!d||!datum)return;const dims=d.dimensions,edges=layoutEdges;
 let placement;
 try{placement=boardPlacement(dims,datum,{x:Number(document.getElementById('fixture-x').value),y:Number(document.getElementById('fixture-y').value)});
 thickness=stepModel?.meta.board_thickness_mm??Number(document.getElementById('fixture-thickness').value);if(!Number.isFinite(thickness)||thickness<=0)throw Error('板厚必须大于0。');
 }catch(e){document.getElementById('fixture-note').textContent=e.message;return;}
 clean(pcb);clean(paths);pickablePads=[];sceneDirty=true;const top=placement.z+thickness,slide=clampPlacement(placement,datum);
 if(clamp)clamp.position.y=-datum.origin[1]+slide.y;
 const world=(x,y)=>fixturePoint(...rotate(x,y,dims),placement);
 const shape=new T.Shape();edges.forEach((e,i)=>{const a=world(e.start.x,e.start.y);if(i===0)shape.moveTo(...a);else shape.lineTo(...a);});shape.closePath();
 Object.values(d.pads).filter(p=>!p.is_allowed&&p.shape==='circle').forEach(p=>{const a=world(p.footprint_x,p.footprint_y),hole=new T.Path();hole.absarc(a[0],a[1],p.size_x/2,0,Math.PI*2,false);shape.holes.push(hole);});
 if(stepModel){
  const pose=stepPose(dims,placement);stepModel.root.position.set(pose.x,pose.y,pose.z);stepModel.root.rotation.z=pose.angle;stepModel.root.scale.set(1,pose.scaleY,1);stepModel.components.visible=true;
  for(const mesh of stepModel.components.children)for(const m of mesh.material)m.emissive.setHex(mesh.name===wb.component?0x153d45:0);
 }else{const board=new T.Mesh(new T.ExtrudeGeometry(shape,{depth:thickness,bevelEnabled:false}),material(0x17684e));board.position.z=placement.z;pcb.add(board);}
 for(const g of d.graphics||[]){if(g.kind==='line'&&g.layer===1){const a=world(...g.points[0]),b=world(...g.points[1]);const dx=b[0]-a[0],dy=b[1]-a[1],l=Math.hypot(dx,dy);const line=new T.Mesh(new T.PlaneGeometry(l,g.width),material(0x369979));line.position.set((a[0]+b[0])/2,(a[1]+b[1])/2,top+.015);line.rotation.z=Math.atan2(dy,dx);pcb.add(line);}}
 const groups=new Map();
 for(const p of Object.values(d.pads)){
  const a=world(p.footprint_x,p.footprint_y);const s=new T.Shape(),sx=p.size_x,sy=p.size_y;
  if(p.shape==='circle'||p.shape==='oval')s.absellipse(0,0,sx/2,sy/2,0,Math.PI*2,false,0);else{s.moveTo(-sx/2,-sy/2);s.lineTo(sx/2,-sy/2);s.lineTo(sx/2,sy/2);s.lineTo(-sx/2,sy/2);s.closePath();}
  if(!p.is_allowed)continue;
  const selected=padCandidates.left===p.id?0x53d8f4:padCandidates.right===p.id?0xfa80be:0xd4bd76;
  const pad=meshPlane(s,selected,top+.035);pad.position.x=a[0];pad.position.y=a[1];pad.rotation.z=(p.footprint_angle-dims.orientation)*Math.PI/180;pad.userData.padId=p.id;pickablePads.push(pad);
  if(p.reference){if(!groups.has(p.reference))groups.set(p.reference,[]);groups.get(p.reference).push(a);}
 }
 const mat=new T.LineBasicMaterial({color:0x96aabe});
 for(const [ref,points] of groups){if(ref!==wb.component)continue;const x0=Math.min(...points.map(p=>p[0]))-1,y0=Math.min(...points.map(p=>p[1]))-1,x1=Math.max(...points.map(p=>p[0]))+1,y1=Math.max(...points.map(p=>p[1]))+1;
 const line=new T.LineLoop(new T.BufferGeometry().setFromPoints([[x0,y0],[x1,y0],[x1,y1],[x0,y1]].map(p=>new T.Vector3(...p,top+.1))),mat.clone());pcb.add(line);}
 const legs={left:[],right:[]};
 for(const probe of ['left','right']){const target=window.pcbTargetPreview?.points?.[probe];if(target){legs[probe].push(new T.Vector3(...fixturePoint(target.x,target.y,placement),top+20));const mark=new T.Mesh(new T.RingGeometry(.2,.28,24),new T.MeshBasicMaterial({color:0xffe38a,side:T.DoubleSide}));mark.position.set(...fixturePoint(target.center?.x??target.x,target.center?.y??target.y,placement),top+.15);pcb.add(mark);continue;}const p=d.pads[padCandidates[probe]];if(p){const a=localPoint(p,dims);legs[probe].push(new T.Vector3(...fixturePoint(...a,placement),top+20));}}
 for(const [probe,targets]of Object.entries(legs)){if(!targets.length)continue;const color=probe==='left'?0x53d8f4:0xfa80be,start=new T.Vector3(probe==='left'?-105:105,-35,top+20);const vertices=[start,...targets];
 const line=new T.Line(new T.BufferGeometry().setFromPoints(vertices),new T.LineDashedMaterial({color,dashSize:2,gapSize:1}));line.computeLineDistances();paths.add(line);
 const tip=new T.Mesh(new T.ConeGeometry(.8,12,16),material(color));tip.rotation.x=-Math.PI/2;tip.position.copy(targets[0]);paths.add(tip);
 }
 const issues=[];
 if(placement.x<datum.slotMinX-.01||placement.x+placement.width>datum.slotMaxX+.01)issues.push('PCB宽度或横移超出安装槽开口，请核对夹持位置。');
 if(datum.clampOuterY+slide.y<datum.railMinY-.01||datum.clampInnerY+slide.y>datum.railMaxY+.01)issues.push('挡板已超出底板范围，请核对PCB高度。');
 if(Math.abs(placement.x-datum.slotMinX)>.01||Math.abs(placement.y-datum.slotTopY)>.01)issues.push('已设置装夹偏移，可恢复槽口左上角基准。');
 document.getElementById('fixture-note').textContent=(issues.join(' ')||'PCB左上角对齐槽口左上角，挡板自动贴合PCB下边缘。')+' 仅为三维装夹示意；实机仍以对准标定为准。';
 if(shownLayout!==d.layout_id){shownLayout=d.layout_id;homeView(false);}

}
const raycaster=new T.Raycaster(),pointer=new T.Vector2();let press=null;
renderer.domElement.addEventListener('pointerdown',e=>{press=e.button===0?{id:e.pointerId,x:e.clientX,y:e.clientY,moved:false}:null;});
renderer.domElement.addEventListener('pointermove',e=>{if(press&&Math.hypot(e.clientX-press.x,e.clientY-press.y)>4)press.moved=true;});
renderer.domElement.addEventListener('pointercancel',()=>{press=null;});
renderer.domElement.addEventListener('pointerup',e=>{
 const origin=press;press=null;
 if(!origin||origin.id!==e.pointerId||origin.moved||e.button!==0||host.hidden||Math.hypot(e.clientX-origin.x,e.clientY-origin.y)>4)return;
 const b=renderer.domElement.getBoundingClientRect();pointer.set((e.clientX-b.left)/b.width*2-1,-(e.clientY-b.top)/b.height*2+1);
 scene.updateMatrixWorld(true);camera.updateMatrixWorld();raycaster.setFromCamera(pointer,camera);
 const hit=raycaster.intersectObjects(pickablePads,false)[0];if(hit)window.pcbPadInteraction?.pick(hit.object.userData.padId);
});
window.addEventListener('pcb-target-preview-changed',rebuild);
window.assemblyView={resize(){const w=host.clientWidth,h=host.clientHeight;if(w&&h){renderer.setSize(w,h);camera.aspect=w/h;camera.updateProjectionMatrix();sceneDirty=true;}},rebuild};
new ResizeObserver(()=>window.assemblyView.resize()).observe(host);
window.addEventListener('workbench-design-changed',()=>{rebuild();syncStepModel();});
window.addEventListener('workbench-selection-changed',rebuild);
for(const id of ['fixture-x','fixture-y','fixture-thickness'])document.getElementById(id).addEventListener('change',rebuild);
function homeView(top) {
 const bounds=new T.Box3().setFromObject(fixture);if(pcb.children.length)bounds.union(new T.Box3().setFromObject(pcb));if(stepModel)bounds.union(new T.Box3().setFromObject(stepModel.root));if(bounds.isEmpty())bounds.setFromObject(fixture);
 const center=bounds.getCenter(new T.Vector3()),size=bounds.getSize(new T.Vector3());
 const distance=Math.max(330,size.length()/2/Math.sin(camera.fov*Math.PI/360)*1.08);
 controls.dispose();
 if(top){camera.up.set(0,1,0);camera.position.copy(center).add(new T.Vector3(0,0,distance));}
 else{camera.up.set(0,0,1);camera.position.copy(center).add(new T.Vector3(.65,-1,.86).normalize().multiplyScalar(distance));}
 controls=new OrbitControls(camera,renderer.domElement);controls.enableDamping=true;controls.minDistance=30;controls.maxDistance=Math.max(900,distance*1.5);controls.target.copy(center);controls.update();renderer.render(scene,camera);
}
document.getElementById('assembly-top').onclick=()=>homeView(true);
document.getElementById('assembly-iso').onclick=()=>homeView(false);
document.getElementById('fixture-reset').onclick=()=>{for(const id of ['fixture-x','fixture-y'])document.getElementById(id).value='0';rebuild();homeView(false);};
document.getElementById('show-fixture').onchange=e=>{fixture.visible=e.target.checked;sceneDirty=true;};
renderer.setAnimationLoop(()=>{
 if(host.hidden)return;if(controls.update())sceneDirty=true;
 if(sceneDirty){renderer.render(scene,camera);sceneDirty=false;}
});
rebuild();
syncStepModel();
