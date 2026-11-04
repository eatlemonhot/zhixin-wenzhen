(function () {
    'use strict';
    function init() {
        const $=id=>document.getElementById(id), previewButton=$('probe-button');
        if(!previewButton || $('pcb-motor-controls'))return;
        let config=null,status=null,preview=null,draft={state:'idle'},selected=[],busy=false,dirty=false,error='',sequence=0,lastLayout='';
        let teaching=null,armed=false,selectionOnly=false,message='',externalPending=false;
        const offsets={},enabled={};
        const make=(tag,text,id)=>{const e=document.createElement(tag);if(text)e.textContent=text;if(id)e.id=id;return e;};
        const panel=make('section',null,'pcb-motor-controls');panel.className='pannel-section workbench-panel';
        const host=$('probe-control-host');if(host)host.append(panel);else previewButton.insertAdjacentElement('afterend',panel);
        panel.append(make('h2','探针定位与中心标定'));
        panel.append(make('p','选择探针 → 点击焊盘自动到中心 → 微调 → 确认保存','pcb-teach-guide'));
        const primary=make('div',null,'pcb-teach-primary');panel.append(primary);
        const advanced=make('details',null,'pcb-other-controls');advanced.append(make('summary','其他：靠边定位、五点精调与补偿管理'));panel.append(advanced);
        const line=make('p',null,'pcb-control-error');line.setAttribute('role','status');primary.append(line);
        const choices=make('div');advanced.append(choices);
        for(const probe of ['left','right']){
            const label=make('label',probe==='left'?'移动左探针':'移动右探针');const box=make('input',null,'pcb-use-'+probe);box.type='checkbox';box.checked=probe==='left';label.prepend(box);choices.append(label);enabled[probe]=box;box.onchange=invalidate;
            offsets[probe]={};for(const axis of ['x','y']){const input=$('probe-'+probe+'-'+axis+'-offset');offsets[probe][axis]=input;if(input){input.removeAttribute('onchange');input.onchange=null;input.oninput=()=>{dirty=true;invalidate();};}}
        }
        const summary=make('p',null,'pcb-alignment-status'),target=make('pre',null,'pcb-target-preview');primary.append(summary,target);
        function button(text,id,host=panel){const b=make('button',text,id);b.type='button';b.className='clickable';host.append(b);return b;}
        advanced.append(previewButton);const move=button('移动到预览位置','pcb-move-preview',advanced);
        const legacy=$('pcb-legacy-selection');if(legacy)advanced.append(legacy);
        const inset=make('input',null,'pcb-edge-inset');inset.type='number';inset.min='.01';inset.max='1';inset.step='.01';inset.value='.1';
        const insetLabel=make('label','正常定位距左右边界内缩（mm）');insetLabel.append(inset);advanced.append(insetLabel);inset.oninput=invalidate;
        const oldInputs=$('probe-left-x-offset')?.closest('.probe-offset-inputs') || $('probe-left-x-offset')?.parentElement?.parentElement;
        if(oldInputs && oldInputs!==panel && !oldInputs.contains(panel)){advanced.append(oldInputs);}
        advanced.append(make('p','附加补偿通常为0；单点或五点保存后合并为一组有效XY补偿。'));
        const saveOffsets=button('保存附加补偿','pcb-save-offsets',advanced);
        const calibration=make('details',null,'pcb-calibration-panel');calibration.append(make('summary','五点精调与补偿管理'));advanced.append(calibration);
        const probe=make('select',null,'calibration-probe');probe.setAttribute('aria-label','选择标定探针');for(const [v,t]of[['','请选择探针'],['left','左针'],['right','右针']]){const o=make('option',t);o.value=v;probe.append(o);}const probeLabel=make('label','① 选择探针');probeLabel.append(probe);const selectors=make('div',null,'pcb-teach-selects');if($('execution-mode-label'))selectors.append($('execution-mode-label'));selectors.append(probeLabel);primary.prepend(selectors);
        const pickPolicy=make('select',null,'pcb-pick-policy');pickPolicy.setAttribute('aria-label','焊盘点击行为');for(const [v,t]of[['centre','点选后自动移动到中心'],['select','仅选点（靠边定位 / 五点）']]){const o=make('option',t);o.value=v;pickPolicy.append(o);}advanced.prepend(pickPolicy);
        const current=make('p',null,'pcb-teach-target');primary.append(current);
        const retry=button('重新移到所选焊盘中心','pcb-teach-retry',primary);
        const manualBind=button('已手动对准：使用当前位置（不移动）','pcb-teach-manual-bind',primary);
        manualBind.title='只绑定当前探针和所选焊盘中心；随后确认保存时只读取位置，不执行XY或升降。';
        calibration.append(make('p','标定全部对准焊盘中心。正常定位左针靠左、右针靠右；边缘偏移不计入补偿。'));
        const centrePreview=button('预览所选焊盘中心','calibration-centre-preview',calibration);
        const single=button('③ 确认已在中心，保存新补偿','calibration-single-record',primary);single.className+=' pcb-primary-action';
        const saveReason=make('p',null,'pcb-teach-save-reason');saveReason.setAttribute('role','status');
        const observe=button('落针观察','calibration-observe',primary);
        const raise=button('抬起探针','calibration-raise',primary);
        const restore=button('恢复该针上一版补偿','calibration-restore',calibration);
        const reset=button('针尖/夹具位置改变：清除该针设备补偿','calibration-invalidate',calibration);
        calibration.append(make('p','换工程无需重标：PCB左上角贴齐固定槽口，页面方向与实物一致。仅针尖、固定槽口或机构改变时才清除设备补偿。'));
        const add=button('将所选焊盘加入五点','calibration-add',calibration),clear=button('清空待选五点','calibration-clear',calibration);
        const list=make('ol',null,'calibration-pads');calibration.append(list);
        const tol=make('input',null,'calibration-tolerance');tol.type='number';tol.min='.02';tol.max='.5';tol.step='.01';tol.value='.1';
        const tl=make('label','允许点间残差（mm，可调；不代表机械精度）');tl.append(tol);calibration.append(tl);
        const start=button('用旧补偿开始五点标定','calibration-start',calibration);
        const stateLine=make('p',null,'calibration-state');calibration.append(stateLine);
        const go=button('移动到当前点中心','calibration-go',calibration);
        const fine=make('select',null,'calibration-step');for(const [v,t]of[[1/90,'1单位 ≈0.0111 mm'],[5/90,'5单位 ≈0.0556 mm'],[.1,'0.1 mm'],[1,'1 mm'],[10,'1 cm（10 mm）']]){const o=make('option',t);o.value=String(v);fine.append(o);}fine.value=String(5/90);fine.setAttribute('aria-label','中心微调步长');const fineLabel=make('label','② 微调步长（mm）');fineLabel.append(fine);primary.append(fineLabel);
        const jogGrid=make('div',null,'pcb-teach-jogs');primary.append(jogGrid);
        const jogs=[];for(const [direction,text]of[['up','上'],['left','左'],['right','右'],['down','下']]){const b=button(text,'calibration-jog-'+direction,jogGrid);jogs.push(b);b.onclick=()=>perform(async()=>{await job('/motor/jog',{probe:probe.value,direction,step_mm:Number(fine.value)});});}
        const servoRow=make('div',null,'pcb-teach-observe');servoRow.append(observe,raise);primary.append(servoRow,single,saveReason);
        const record=button('记录本点中心并前往下一点','calibration-record',calibration),cancel=button('取消五点（保留旧补偿）','calibration-cancel',calibration);
        const result=make('pre',null,'calibration-result');calibration.append(result);const save=button('保存新的XY补偿','calibration-save',calibration);
        const fmt=n=>typeof n==='number'?n.toFixed(4):'—';
        const active=()=>draft.id&&!['saved','cancelled','idle'].includes(draft.state);
        function selection(){const c=typeof padCandidates==='undefined'?{}:padCandidates;return {left:c.left||null,right:c.right||null};}
        function orientation(){return typeof boardRotation==='undefined'?0:Number(boardRotation);}
        function ready(){return Boolean(window.probeWorkbench?.online&&status?.ready&&!status.busy&&!status.stopped);}
        function publish(value){window.pcbMotorPending=value;window.dispatchEvent(new CustomEvent('pcb-motor-pending',{detail:{pending:value}}));}
        function showPreview(value){preview=value;window.pcbTargetPreview=value;window.dispatchEvent(new CustomEvent('pcb-target-preview-changed'));}
        function invalidate(){sequence++;showPreview(null);render();}
        function abandon(){teaching=null;message='';invalidate();}
        function sameTarget(t){return t&&t.probe===probe.value&&t.pad_id===selection()[t.probe]&&t.layout_id===config?.layout_id&&t.orientation===orientation()&&t.revision===config?.revision;}
        function motionBlock(){if(!config?.layout_id)return '请先导入epro2工程。';if(!probe.value||!armed)return '请在①选择左针或右针，再点击PCB焊盘。';if(dirty)return '附加补偿有未保存修改。';if(!window.probeWorkbench?.online)return '当前是离线规划。请在上方切换为实机控制，再选针、点击焊盘。';if(status?.stopped)return '停车锁定中，请先检查并解除停车。';if(status?.busy||busy)return '运动或记录正在执行，请等待；此时点击不会排队。';if(!status?.ready)return status?.initialization?.message||'电机尚未就绪，请等待坐标重建完成。';return '';}
        async function api(path,payload){const response=await fetch(path,{credentials:'same-origin',cache:'no-store',...(payload===undefined?{}:{method:'POST',headers:{'Content-Type':'application/json','X-Requested-With':'XMLHttpRequest'},body:JSON.stringify(payload)})});const value=await response.json();if(!response.ok)throw Error(value.error||'请求失败');return value;}
        async function refresh(){config=await api('/motor/pcb/config');draft=await api('/motor/pcb/calibration');if(active()){probe.value=draft.probe;selectionOnly=true;pickPolicy.value='select';}if(!dirty)for(const p of ['left','right'])for(const a of ['x','y'])if(offsets[p][a])offsets[p][a].value=String(config.offsets[p][a]);render();}
        async function perform(action){if(busy||externalPending)return;busy=true;error='';publish(true);render();try{await action();await refresh();}catch(e){error=e.message;try{await refresh();}catch(_){} }finally{busy=false;publish(false);window.motorStatus?.refresh?.();render();}}
        async function job(path,payload){const value=await api(path,payload);const deadline=Date.now()+610000;
            while(Date.now()<deadline){await new Promise(resolve=>setTimeout(resolve,180));status=await api('/motor/status');const j=status.last_job;if(j?.job_id===value.job_id&&!status.busy){if(j.state!=='completed')throw Error(j.error||'运动任务未成功完成。');return status;}}
            throw Error('等待任务结束超时，请查看电机状态。');}
        function reason(){
            const block=motionBlock();if(block)return block;
            if(selectionOnly)return '仅选点模式：点击不会运动；请使用下方靠边定位或五点按钮。';
            if(teaching?.stage==='saved')return '新XY补偿已保存。再次点击其他焊盘可验证或继续微调。';
            if(sameTarget(teaching)&&teaching.stage==='manual')return '此针没有当前工程的有效补偿，不能猜测位置。首次请用左侧点动粗调，再用这里的方向键对准中心，确认保存初值。';
            if(sameTarget(teaching)&&teaching.stage==='arrived')return '已到焊盘中心的预计XY位置。用方向键微调，观察对准中心后确认保存。';
            return '点击PCB二维或三维视图中的焊盘，将自动抬针并按当前补偿移动到中心。';
        }
        function saveBlock(){
            const block=motionBlock();if(block)return block;
            if(externalPending)return '另一个控制操作尚未结束，请等待。';
            if(active())return '五点标定进行中，请使用五点的记录按钮，或先取消本轮。';
            if(!selection()[probe.value])return '请先选择针尖实际对准的那个焊盘，才能记录补偿。';
            if(teaching?.stage==='saved'&&sameTarget(teaching))return '此点补偿已保存；只有再次明确对准才需保存。';
            if(selectionOnly||!sameTarget(teaching)||!['arrived','manual'].includes(teaching?.stage))return '尚未绑定本次中心对准。若针尖已在所选焊盘中心，点“已手动对准：使用当前位置（不移动）”，再确认保存。';
            return '';
        }
        function render(){
            const chosen=selection(),p=probe.value,valid=ready()&&!busy&&!dirty&&!externalPending,phase=active();
            if(teaching&&!sameTarget(teaching)){teaching=null;message='';}
            pickPolicy.disabled=busy||Boolean(phase);
            const point=window.probeWorkbench?.design?.pads?.[chosen[p]];
            current.textContent=point?`当前${p==='left'?'左针':'右针'}目标：${point.reference||''}.${point.pad_number||''} · ${point.net||'无网络'}\n目标为焊盘中心。`:'尚未选择目标焊盘。';
            retry.hidden=teaching?.stage!=='failed';retry.disabled=!valid||!armed||selectionOnly||Boolean(phase)||!chosen[p]||!config?.alignment?.[p];
            manualBind.disabled=!valid||!armed||!p||!chosen[p]||!point?.is_allowed||!config?.layout_id||Boolean(phase);
            previewButton.textContent='预览正常接触点';previewButton.disabled=busy||dirty||!config?.layout_id||!['left','right'].some(p=>enabled[p].checked&&chosen[p]);
            move.disabled=!valid||!preview?.can_move;
            line.textContent=error||message||reason();line.className=error?'pcb-error':'';
            summary.textContent=(config?.registration_scope==='fixed_fixture'?'固定槽口设备补偿（跨工程沿用）\n':'')+(p?[p]:['left','right']).map(p=>{const e=config?.effective_offsets?.[p];return (p==='left'?'左针':'右针')+'：'+(e?'有效补偿 X '+fmt(e.x)+' / Y '+fmt(e.y)+' mm':config?.alignment_reasons?.[p]||'未标定');}).join('\n');
            target.hidden=!preview;
            target.textContent=preview?Object.entries(preview.points||{}).map(([p,q])=>`${p==='left'?'左针':'右针'} ${q.reference||''}.${q.pad_number||''} ${q.contact_mode||'实际坐标'}\n中心 ${fmt(q.center?.x??q.x)}, ${fmt(q.center?.y??q.y)}；落点 ${fmt(q.x)}, ${fmt(q.y)} mm`).concat(preview.errors||[]).join('\n'):'尚无有效预览。';
            saveOffsets.disabled=!dirty||busy;inset.disabled=busy;probe.disabled=busy||Boolean(phase);
            single.disabled=!valid||selectionOnly||!armed||Boolean(phase)||!sameTarget(teaching)||!['arrived','manual'].includes(teaching?.stage);centrePreview.disabled=busy||dirty||!chosen[p]||!config?.layout_id||Boolean(phase);
            saveReason.textContent=single.disabled?saveBlock():'确认针尖位于上述焊盘中心后保存；保存只读取当前XY，不移动或升降。';
            observe.disabled=!valid||!p||(phase?draft.state!=='aligning':!sameTarget(teaching)||!['arrived','manual'].includes(teaching?.stage));raise.disabled=!valid||!p;restore.disabled=busy||!config?.can_restore?.[p]||Boolean(phase);reset.disabled=busy||Boolean(phase)||!config?.saved_anchors?.[p];
            add.disabled=busy||Boolean(phase)||!chosen[p]||selected.length>=5;clear.disabled=busy||Boolean(phase)||!selected.length;
            start.disabled=busy||Boolean(phase)||selected.length!==5||!config?.alignment?.[p];tol.disabled=busy||Boolean(phase);
            list.replaceChildren();const rows=phase?draft.points:selected;
            rows.forEach((row,i)=>{const item=make('li',`${row.reference||''}.${row.pad_number||''} ${row.net||''} ${row.package||'封装未标注，请核对0805'}${draft.samples?.[i]?' ✓':''}`);const b=button(phase?'重测此点':'移除',null,item);b.disabled=busy;b.onclick=()=>perform(async()=>{if(phase){draft=await api('/motor/pcb/calibration/select',{id:draft.id,index:i});}else selected.splice(i,1);});list.append(item);});
            stateLine.textContent=draft.invalid_reason||(!phase?'先选择5个不同焊盘，推荐覆盖四周及中部。':`第 ${draft.index+1}/5 点 · ${draft.state} · 初值固定，尚未覆盖正式补偿。`);
            go.disabled=!valid||!phase||draft.state!=='ready'||Boolean(draft.invalid_reason);
            record.disabled=!valid||draft.state!=='aligning'||Boolean(draft.invalid_reason);
            jogs.forEach(b=>b.disabled=!valid||!p);fine.disabled=busy;
            cancel.disabled=!phase;save.disabled=busy||draft.state!=='complete'||!draft.result?.acceptable||Boolean(draft.invalid_reason);
            const r=draft.result;result.textContent=r?`旧补偿 X ${fmt(r.old.x)} / Y ${fmt(r.old.y)}\n新补偿 X ${fmt(r.new.x)} / Y ${fmt(r.new.y)}\n最大残差 ${fmt(r.max_error_mm)} mm；RMS ${fmt(r.rms_error_mm)} mm\n`+r.residuals.map((x,i)=>`点${i+1}: ΔX ${fmt(x.dx_mm)} / ΔY ${fmt(x.dy_mm)} mm`).join('\n')+(r.acceptable?'\n可保存；建议再用独立焊盘核验。':'\n残差超限，请重测；原补偿未改变。'):'';
        }
        async function makePreview(center=false){const stamp=++sequence,raw=selection(),pads={};for(const p of ['left','right'])pads[p]=center?(p===probe.value?raw[p]:null):(enabled[p].checked?raw[p]:null);
            const value=await api('/motor/pcb/preview',{pads,layout_id:config.layout_id,orientation:orientation(),inset_mm:Number(inset.value),purpose:center?'calibration':'normal'});if(stamp===sequence)showPreview(value);}
        async function movePoint(){preview=await api('/motor/pcb/calibration/preview',{id:draft.id});showPreview(preview);render();if(!preview.can_move)throw Error(preview.errors.join('；'));await job('/motor/pcb/move',{preview_id:preview.preview_id});showPreview(null);draft=await api('/motor/pcb/calibration');}
        async function moveSelectedToCentre(t){
            const stamp=++sequence;
            const value=await api('/motor/pcb/preview',{pads:{left:t.probe==='left'?t.pad_id:null,right:t.probe==='right'?t.pad_id:null},layout_id:t.layout_id,orientation:t.orientation,purpose:'calibration'});
            if(stamp!==sequence||!sameTarget(t)||!armed||selectionOnly||!window.probeWorkbench?.online)throw Error('选点或模式已变化，本次未发送移动。请重新点击焊盘。');
            showPreview(value);render();
            if(!value.can_move)throw Error((value.errors||[]).join('；')||'目标未通过坐标与行程检查。');
            t.stage='moving';await job('/motor/pcb/move',{preview_id:value.preview_id});
            if(!sameTarget(t)||!armed||selectionOnly)throw Error('移动已结束，但选点或模式已改变，请重新选点。');
            t.stage='arrived';showPreview(null);message='';
        }
        function selectPad(id){
            if(busy||status?.busy||externalPending){error='任务执行中，未接受新选点；不会排队运动。';render();return true;}
            if(!probe.value||!armed){error='请先在右栏①选择左针或右针，再点击焊盘。';render();return true;}
            const pads=window.probeWorkbench?.design?.pads||layoutPads;
            if(!pads[id]?.is_allowed){error='请选择顶面导电焊盘。';render();return true;}
            window.probeWorkbench.assign(probe.value,id);
            lastLayout=JSON.stringify([selection(),orientation(),window.probeWorkbench?.design?.layout_id]);
            message='';error='';
            if(selectionOnly||active()){render();return true;}
            const block=motionBlock();if(block){error=block;render();return true;}
            teaching={probe:probe.value,pad_id:id,layout_id:config.layout_id,orientation:orientation(),revision:config.revision,stage:'selected'};
            const t=teaching;
            void perform(async()=>{
                await refresh();
                if(!sameTarget(t)||!armed||selectionOnly)throw Error('工程或补偿已变化，请重新点击焊盘。');
                if(!config.alignment?.[t.probe]){t.stage='manual';return;}
                try{await moveSelectedToCentre(t);}catch(e){t.stage='failed';throw e;}
            });return true;
        }
        window.pcbPadInteraction={pick:selectPad};
        retry.onclick=()=>{if(!retry.disabled)selectPad(selection()[probe.value]);};
        manualBind.onclick=()=>{
            if(manualBind.disabled)return;
            const stamp=++sequence;
            const t={probe:probe.value,pad_id:selection()[probe.value],layout_id:config.layout_id,orientation:orientation()};
            void perform(async()=>{
                await refresh();
                const pad=window.probeWorkbench?.design?.pads?.[t.pad_id]||layoutPads[t.pad_id];
                if(stamp!==sequence||!ready()||!armed||dirty||active()||!pad?.is_allowed||t.probe!==probe.value||t.pad_id!==selection()[t.probe]||t.layout_id!==config?.layout_id||t.orientation!==orientation())throw Error('针、焊盘或控制状态已变化，请重新核对当前位置后再绑定。');
                selectionOnly=false;pickPolicy.value='centre';
                teaching={...t,revision:config.revision,stage:'manual'};
                message='已绑定当前位置与所选焊盘中心，未移动或升降。确认实物对准后，点击③保存新补偿。';
                showPreview(null);
            });
        };
        previewButton.onclick=()=>perform(()=>makePreview());window.sendProbeCommand=()=>{if(!previewButton.disabled)previewButton.onclick();};
        centrePreview.onclick=()=>perform(()=>makePreview(true));
        move.onclick=()=>perform(async()=>{const id=preview.preview_id;abandon();await job('/motor/pcb/move',{preview_id:id});});
        single.onclick=()=>{if(single.disabled)return;const t={...teaching};void perform(async()=>{if(!sameTarget(t))throw Error('目标已变化，请重新选择焊盘。');await job('/motor/pcb/teach',{probe:t.probe,pad_id:t.pad_id,orientation:t.orientation,revision:t.revision,layout_id:t.layout_id});await refresh();teaching={...t,revision:config.revision,stage:'saved'};message='新XY补偿已保存，已应用于当前PCB的全部焊盘。';});};
        raise.onclick=()=>perform(()=>api('/motor/servo/up',{channel:probe.value==='left'?1:2}));
        observe.onclick=()=>perform(()=>api('/motor/servo/down',{channel:probe.value==='left'?1:2}));
        restore.onclick=()=>perform(async()=>{config=await api('/motor/pcb/restore',{probe:probe.value,revision:config.revision});invalidate();});
        reset.onclick=()=>perform(async()=>{config=await api('/motor/pcb/invalidate',{probe:probe.value,revision:config.revision});selected=[];invalidate();});
        saveOffsets.onclick=()=>perform(async()=>{const values={};for(const p of ['left','right']){values[p]={};for(const a of ['x','y'])values[p][a]=Number(offsets[p][a].value);}await api('/motor/pcb/config',{offsets:values,revision:config.revision});dirty=false;invalidate();});
        add.onclick=()=>{const id=selection()[probe.value],pads=window.probeWorkbench?.design?.pads||layoutPads;if(selected.some(p=>p.pad_id===id)){error='本轮需5个不同焊盘。';render();return;}const p=pads[id];if(p){selected.push({pad_id:id,reference:p.reference,pad_number:p.pad_number,net:p.net,package:p.package});render();}};
        clear.onclick=()=>{selected=[];render();};
        start.onclick=()=>perform(async()=>{draft=await api('/motor/pcb/calibration/start',{probe:probe.value,pad_ids:selected.map(p=>p.pad_id),orientation:orientation(),tolerance_mm:Number(tol.value)});});
        go.onclick=()=>perform(movePoint);
        record.onclick=()=>perform(async()=>{await job('/motor/pcb/calibration/record',{id:draft.id});draft=await api('/motor/pcb/calibration');if(draft.state==='ready')await movePoint();});
        cancel.onclick=async()=>{try{draft=await api('/motor/pcb/calibration/cancel',{id:draft.id});showPreview(null);error='已取消，旧补偿保留。';render();}catch(e){error=e.message;render();}};
        save.onclick=()=>perform(async()=>{await api('/motor/pcb/calibration/save',{id:draft.id});selected=[];invalidate();});
        probe.onchange=()=>{armed=Boolean(probe.value);selected=[];error='';abandon();for(const p of ['left','right'])enabled[p].checked=p===probe.value;render();};
        pickPolicy.onchange=()=>{selectionOnly=pickPolicy.value==='select';error='';abandon();};
        calibration.ontoggle=()=>{if(calibration.open){selectionOnly=true;pickPolicy.value='select';abandon();}};
        window.addEventListener('motor-ui-pending',e=>{externalPending=Boolean(e.detail?.pending);render();});
        window.motorStatus?.subscribe((value,e)=>{if(status&&value&&JSON.stringify(status.positions_mm)!==JSON.stringify(value.positions_mm)&&!busy)invalidate();const becameReady=value?.ready&&!status?.ready;status=value;if(value?.busy&&!busy&&value.last_job?.action!=='jog'){teaching=null;message='';}if(e)error=e.message;if((!value?.ready&&!value?.busy)||value?.stopped){teaching=null;message='';}render();if(becameReady&&!busy)void refresh().catch(e=>{error=e.message;render();});});
        window.addEventListener('pcb-selection-changed',()=>{abandon();});
        for(const name of ['pcb-layout-changed','execution-mode-changed'])window.addEventListener(name,()=>{armed=false;probe.value='';error='';abandon();void refresh().catch(e=>{error=e.message;render();});});
        window.setInterval(()=>{const now=JSON.stringify([selection(),orientation(),window.probeWorkbench?.design?.layout_id]);if(now!==lastLayout){lastLayout=now;invalidate();void refresh().catch(e=>{error=e.message;render();});}},500);
        void refresh().catch(e=>{error=e.message;render();});window.motorStatus?.refresh();render();
    }
    if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init,{once:true});else init();
}());
