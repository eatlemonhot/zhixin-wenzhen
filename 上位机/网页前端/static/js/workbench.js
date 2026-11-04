(function () {
    'use strict';
    const state = window.probeWorkbench = {online:false,design:null,component:null};
    const $=id=>document.getElementById(id);
    const status=$('workbench-status');
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
        emit('pcb-selection-changed');
    }
    function describe(id){const p=state.design?.pads?.[id]||layoutPads[id];return p?`${p.reference}.${p.pad_number} · ${p.net||'无网络'}`:'未选';}
    function showComponent(ref) {
        state.component=ref;
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
        try{const d=await api('/workbench/design');if(token!==sequence)return;if(!d.loaded){note('① 导入嘉立创V3工程，然后选择探针和PCB焊盘。');return;}
            const changed=state.design?.layout_id!==d.layout_id;state.design=d;
            if(changed){state.component=null;padCandidates={left:'',right:''};emit('pcb-selection-changed');drawSchematic();showComponent(null);
                const ps=$('schematic-page');ps.replaceChildren();d.schematic.pages.forEach((p,i)=>{const o=document.createElement('option');o.value=i;o.textContent=p.title;ps.append(o);});
            }
            emit('workbench-design-changed');note(`工程已就绪：${d.schematic.components.length}个原理图器件，${Object.keys(d.pads).length}个焊盘/孔。先在右栏选择探针，再点击PCB焊盘进行中心标定。离线模式只选点，不运动。`);
        }catch(e){note(e.message);}
    }
    $('execution-mode').onchange=async function(){const enabled=this.value==='online';try{await api('/motor/mode',{enabled});state.online=enabled;note(enabled?'实机模式已开启。先检查电机/重建坐标，再进行实物对准标定。':'已进入离线规划模式。');emit('execution-mode-changed');window.motorStatus?.refresh?.();}catch(e){this.value=state.online?'online':'offline';note(e.message);}};
    $('schematic-page').onchange=function(){pageIndex=Number(this.value);drawSchematic();};
    $('schematic-focus').onclick=()=>{if(!state.component||!state.design)return;const c=state.design.schematic.components.find(c=>c.reference===state.component),svg=$('schematic-canvas').querySelector('svg');if(c?.pins.length&&svg){const xs=c.pins.map(p=>p.x),ys=c.pins.map(p=>p.y),x0=Math.min(...xs)-65,y0=Math.min(...ys)-65,x1=Math.max(...xs)+65,y1=Math.max(...ys)+65;svg.setAttribute('viewBox',`${x0} ${y0} ${x1-x0} ${y1-y0}`);}};
    $('schematic-fit').onclick=()=>{const svg=$('schematic-canvas').querySelector('svg');if(svg&&originalView)svg.setAttribute('viewBox',originalView);};
    $('pcb-fit').onclick=()=>Context2D.fitBoard();
    window.addEventListener('pcb-layout-changed',()=>{clearTimeout(timer);timer=setTimeout(refresh,150);});
    window.addEventListener('pcb-selection-changed',()=>emit('workbench-selection-changed'));
    window.motorStatus?.subscribe(s=>{if(s&&typeof s.motion_enabled==='boolean'&&state.online!==s.motion_enabled){state.online=s.motion_enabled;$('execution-mode').value=s.motion_enabled?'online':'offline';emit('execution-mode-changed');}});
    state.describe=describe;state.assign=assign;state.refresh=refresh;
    refresh();
}());
