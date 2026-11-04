/* Native V3 selection and offline plan UI. No automatic hardware requests. */
(function () {
    'use strict';
    const state = window.probeWorkbench = {online:false,design:null,queue:[],plan:null,component:null};
    const $=id=>document.getElementById(id);
    const status=$('workbench-status'), inspector=$('component-inspector'), queue=$('probe-queue');
    let sequence=0, timer, pageIndex=0, originalView=null;
    async function api(url,payload) {
        const response=await fetch(url,{credentials:'same-origin',cache:'no-store',...(payload===undefined?{}:{method:'POST',headers:{'Content-Type':'application/json','X-Requested-With':'XMLHttpRequest'},body:JSON.stringify(payload)})});
        const data=await response.json();if(!response.ok)throw Error(data.error||'请求失败');return data;
    }
    function note(text){status.textContent=text;}
    function emit(name){window.dispatchEvent(new CustomEvent(name));}
    function assign(probe,id){
        const pad=state.design?.pads?.[id]||layoutPads[id];if(!pad||!pad.is_allowed)return;
        padCandidates[probe]=id;
        $('candidates-selection-'+(probe==='left'?'first':'second')+'-label').textContent=(probe==='left'?'左针：':'右针：')+describe(id);
        state.plan=null;emit('pcb-selection-changed');
    }
    function describe(id){const p=state.design?.pads?.[id]||layoutPads[id];return p?`${p.reference}.${p.pad_number} · ${p.net||'无网络'}`:'未选';}
    function showComponent(ref) {
        state.component=ref;inspector.replaceChildren();
        const heading=document.createElement('p');heading.textContent=ref?`器件 ${ref}`:'在原理图中点击器件，或搜索位号。';inspector.append(heading);
        if(!ref)return;
        const comps=state.design.schematic.components.filter(c=>c.reference===ref);
        if(comps[0]){const value=document.createElement('p');value.textContent=comps[0].value;inspector.append(value);}
        const pads=Object.values(state.design?.pads||layoutPads).filter(p=>p.reference===ref).sort((a,b)=>a.pad_number.localeCompare(b.pad_number,undefined,{numeric:true}));
        pads.forEach(p=>{const row=document.createElement('div');row.className='pin-row';const label=document.createElement('span');label.textContent=`${p.pad_number} · ${p.net||'无网络'}`;row.append(label);
            ['left','right'].forEach(probe=>{const b=document.createElement('button');b.type='button';b.className='clickable';b.textContent=probe==='left'?'设为左针':'设为右针';b.disabled=!p.is_allowed;b.addEventListener('click',()=>assign(probe,p.id));row.append(b);});inspector.append(row);});
        const allowed=pads.filter(p=>p.is_allowed);
        if(allowed.length===2){const b=document.createElement('button');b.className='clickable';b.textContent='双针选择该器件两端';b.onclick=()=>{allowed.sort((a,b)=>a.footprint_x-b.footprint_x);assign('left',allowed[0].id);assign('right',allowed[1].id);};inspector.append(b);}
        document.querySelectorAll('.sch-component').forEach(g=>g.classList.toggle('selected',g.dataset.reference===ref));emit('workbench-selection-changed');
    }
    function drawSchematic() {
        const host=$('schematic-canvas');host.replaceChildren();
        const pages=state.design?.schematic.pages||[];if(!pages.length){host.textContent='请导入包含原理图的嘉立创V3工程。';return;}
        const page=pages[Math.min(pageIndex,pages.length-1)];
        const parsed=new DOMParser().parseFromString(page.svg,'image/svg+xml');const svg=document.importNode(parsed.documentElement,true);host.append(svg);originalView=svg.getAttribute('viewBox');
        $('schematic-count').textContent=`${page.title} · ${page.components.length}个器件 · ${page.wire_count}段导线`;
        let drag=null, moved=false;
        svg.addEventListener('pointerdown',e=>{drag={component:e.target.closest('[data-reference]')?.dataset.reference,x:e.clientX,y:e.clientY,view:svg.viewBox.baseVal?Array.from([svg.viewBox.baseVal.x,svg.viewBox.baseVal.y,svg.viewBox.baseVal.width,svg.viewBox.baseVal.height]):null};moved=false;svg.setPointerCapture(e.pointerId);});
        svg.addEventListener('pointermove',e=>{if(!drag)return;const dx=e.clientX-drag.x,dy=e.clientY-drag.y;if(Math.abs(dx)+Math.abs(dy)>4)moved=true;const b=svg.getBoundingClientRect(),v=drag.view;svg.setAttribute('viewBox',`${v[0]-dx*v[2]/b.width} ${v[1]-dy*v[3]/b.height} ${v[2]} ${v[3]}`);});
        svg.addEventListener('pointerup',e=>{const ref=drag?.component;drag=null;if(!moved&&ref)showComponent(ref);});
        svg.addEventListener('wheel',e=>{e.preventDefault();const v=svg.viewBox.baseVal,b=svg.getBoundingClientRect(),k=e.deltaY>0?1.15:1/1.15,px=(e.clientX-b.left)/b.width,py=(e.clientY-b.top)/b.height;if(v.width*k<20||v.width*k>50000)return;svg.setAttribute('viewBox',`${v.x+v.width*px*(1-k)} ${v.y+v.height*py*(1-k)} ${v.width*k} ${v.height*k}`);},{passive:false});
    }
    async function refresh() {
        const token=++sequence;
        try{const d=await api('/workbench/design');if(token!==sequence)return;if(!d.loaded){note('① 导入嘉立创V3工程，开始离线规划。');return;}
            const changed=state.design?.layout_id!==d.layout_id;state.design=d;
            if(changed){state.queue=[];state.plan=null;state.component=null;padCandidates={left:'',right:''};emit('pcb-selection-changed');renderQueue();drawSchematic();showComponent($('component-search').value.trim()||null);
                $('component-list').replaceChildren();d.schematic.components.forEach(c=>{const o=document.createElement('option');o.value=c.reference;$('component-list').append(o);});
                const ps=$('schematic-page');ps.replaceChildren();d.schematic.pages.forEach((p,i)=>{const o=document.createElement('option');o.value=i;o.textContent=p.title;ps.append(o);});
            }
            emit('workbench-design-changed');note(`工程已就绪：${d.schematic.components.length}个原理图器件，${Object.keys(d.pads).length}个焊盘/孔。选择器件或测点，预览后加入队列。`);
        }catch(e){note(e.message);}
    }
    function renderQueue(){queue.replaceChildren();state.queue.forEach((p,i)=>{const li=document.createElement('li');li.textContent=`${i+1}. ${describe(p.left)} ↔ ${describe(p.right)} `;const b=document.createElement('button');b.textContent='移除';b.className='clickable';b.onclick=()=>{state.queue.splice(i,1);state.plan=null;renderQueue();};li.append(b);queue.append(li);});$('queue-count').textContent=state.queue.length+'组';}
    $('queue-add').onclick=()=>{const left=padCandidates.left||null,right=padCandidates.right||null;if(!left&&!right)return note('请先选择至少一个焊盘。');if(left&&left===right)return note('双针不能选择同一焊盘。');if(state.queue.length>=128)return note('队列最多128组。');state.queue.push({id:'pair_'+Date.now()+'_'+state.queue.length,left,right});state.plan=null;renderQueue();note('已加入离线队列，未发送运动。');};
    async function makePlan(){if(!state.design)throw Error('请先导入工程。');const pairs=state.queue.length?state.queue:[{id:'preview',left:padCandidates.left||null,right:padCandidates.right||null}];state.plan=await api('/workbench/plan',{layout_id:state.design.layout_id,orientation:boardRotation,pairs});return state.plan;}
    $('queue-export').onclick=async()=>{try{const plan=await makePlan();const blob=new Blob([JSON.stringify(plan,null,2)],{type:'application/json'}),a=document.createElement('a');a.href=URL.createObjectURL(blob);a.download='probe-plan-v1.json';a.click();setTimeout(()=>URL.revokeObjectURL(a.href),1000);note('已导出带工程指纹、焊盘ID和接口约定的离线计划。');}catch(e){note(e.message);}};
    $('execution-mode').onchange=async function(){const enabled=this.value==='online';try{await api('/motor/mode',{enabled});state.online=enabled;note(enabled?'实机模式已开启。先检查电机/重建坐标，再进行实物对准标定。':'已进入离线规划模式。');emit('execution-mode-changed');window.motorStatus?.refresh?.();}catch(e){this.value=state.online?'online':'offline';note(e.message);}};
    $('component-search').oninput=$('component-search').onchange=function(){if(state.design)showComponent(this.value.trim());};
    $('component-search').onkeydown=function(e){if(e.key==='Enter'&&state.design)showComponent(this.value.trim());};
    $('schematic-page').onchange=function(){pageIndex=Number(this.value);drawSchematic();};
    $('schematic-focus').onclick=()=>{if(!state.component||!state.design)return;const c=state.design.schematic.components.find(c=>c.reference===state.component),svg=$('schematic-canvas').querySelector('svg');if(c?.pins.length&&svg){const xs=c.pins.map(p=>p.x),ys=c.pins.map(p=>p.y),x0=Math.min(...xs)-65,y0=Math.min(...ys)-65,x1=Math.max(...xs)+65,y1=Math.max(...ys)+65;svg.setAttribute('viewBox',`${x0} ${y0} ${x1-x0} ${y1-y0}`);}};
    $('schematic-fit').onclick=()=>{const svg=$('schematic-canvas').querySelector('svg');if(svg&&originalView)svg.setAttribute('viewBox',originalView);};
    $('pcb-fit').onclick=()=>Context2D.fitBoard();
    window.addEventListener('pcb-layout-changed',()=>{state.plan=null;clearTimeout(timer);timer=setTimeout(refresh,150);});
    window.addEventListener('pcb-selection-changed',()=>{state.plan=null;emit('workbench-selection-changed');});
    window.motorStatus?.subscribe(s=>{if(s&&typeof s.motion_enabled==='boolean'&&state.online!==s.motion_enabled){state.online=s.motion_enabled;$('execution-mode').value=s.motion_enabled?'online':'offline';emit('execution-mode-changed');}});
    state.describe=describe;state.assign=assign;state.refresh=refresh;
    refresh();
}());
