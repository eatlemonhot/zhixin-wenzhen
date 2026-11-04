(function () {
    'use strict';
    const byId=id=>document.getElementById(id),drop=byId('design-dropzone');
    if(!drop)return;
    const picker=byId('design-multiple-files'),message=byId('upload-status');
    const ids=['layout-file','step-file'];
    const roles={epro2:'layout-file',step:'step-file',stp:'step-file'};
    const labels={'layout-file':'选择嘉立创工程 (.epro2)','step-file':'选择整板STEP（可选）'};
    const jobFields=['job-ground','job-power','job-excitation','job-rails','job-peak','job-reference-label','job-analysis-mode','job-calibration','job-normal-reference','job-dut-id'].filter(id=>byId(id));
    let locked=false,importState=null,refreshSequence=0;
    let activePlan=null,plannedPayload=null,exportRecord=null,timer=null;
    let requestEpoch=0,requestController=null,submitting=false,running=false,runningJob=null,pollGeneration=0,runningKind=null;
    let preparing=false,preparation=null,clearanceToken=null;
    function saveSettings(){
        if(!importState?.loaded)return;
        try{sessionStorage.setItem('unpowered-form',JSON.stringify({layout:importState.layout_id,fields:Object.fromEntries(jobFields.map(id=>[id,byId(id).value]))}));}catch(error){                      }
    }
    function assign(id,file){const transfer=new DataTransfer();if(file)transfer.items.add(file);byId(id).files=transfer.files;}
    function renderFiles(){
        const list=byId('design-file-list');list.replaceChildren();
        for(const id of ids){const file=byId(id).files[0],label=byId(id+'-button');
            if(label)label.textContent=file?file.name:labels[id];
            if(file){const li=document.createElement('li');li.textContent=file.name+' · '+(file.size/1024).toFixed(1)+' KiB';list.append(li);}
        }
    }
    function select(files){
        if(locked)return;
        try{
            const chosen={};
            for(const file of files){const ext=file.name.split('.').pop().toLowerCase(),id=roles[ext];
                if(file.name.startsWith('~$'))continue;
                if(!id)throw Error('请选择一个嘉立创V3 epro2工程，可附同版STEP；无需网表或BOM。');
                if(chosen[id])throw Error('同一类型请只选一份文件：'+file.name);chosen[id]=file;
            }
            if(chosen['layout-file']&&!chosen['step-file'])assign('step-file',null);
            for(const [id,file] of Object.entries(chosen))assign(id,file);
            message.textContent='已选择文件，点击“导入工程”开始解析。';renderFiles();
        }catch(error){message.textContent=error.message;}
        picker.value='';
    }
    drop.onclick=()=>{if(!locked)picker.click();};
    drop.onkeydown=event=>{if(event.key==='Enter'||event.key===' '){event.preventDefault();if(!locked)picker.click();}};
    drop.ondragover=event=>{event.preventDefault();if(!locked)drop.classList.add('dragover');};
    drop.ondragleave=()=>drop.classList.remove('dragover');
    drop.ondrop=event=>{event.preventDefault();drop.classList.remove('dragover');select(event.dataTransfer.files);};
    picker.onchange=()=>select(picker.files);
    for(const id of ids)byId(id).addEventListener('change',()=>{if(id==='layout-file')assign('step-file',null);renderFiles();});
    byId('design-clear-files').onclick=()=>{if(!locked){ids.forEach(id=>assign(id,null));renderFiles();message.textContent='已清空待导入文件，已导入的工程仍保留。';}};
    function upload(){
        const layout=byId('layout-file').files[0];
        if(!layout)throw Error('请先选择一个嘉立创V3 epro2工程。');
        if(!/\.epro2$/i.test(layout.name))throw Error('请选择嘉立创V3 .epro2工程。');
        const body=new FormData();body.append('layout_file',layout);body.append('import_mode','native');
        return {layout,body,maxSize:16*1024*1024};
    }
    function setLocked(value){locked=value;[...ids,'design-multiple-files','design-clear-files'].forEach(id=>byId(id).disabled=value);drop.setAttribute('aria-disabled',String(value));updateButtons();}
    function fillSelect(id,nets,old){const select=byId(id);select.replaceChildren(new Option('请选择网络',''));nets.forEach(net=>select.add(new Option(net,net)));if(nets.includes(old))select.value=old;}
    function planReady(){return Boolean(importState?.loaded&&importState?.complete&&importState?.data?.report.diagnostic_ready!==false&&!importState?.data?.report.missing_nominal_values.length);}
    function updateButtons(){
        const mode=byId('job-power').value,busy=locked||submitting||preparing;
        byId('download-diagnostic-job').disabled=busy||!planReady();
        byId('diagnostic-unpowered-cancel').disabled=!running||runningKind!=='unpowered';
        byId('diagnostic-unpowered-start').disabled=busy||running||mode!=='unpowered'||!activePlan;
        byId('diagnostic-online').disabled=busy||running||preparation?.motion_enabled===true;
        byId('diagnostic-check').disabled=busy||running;
        byId('diagnostic-clear-stop').disabled=busy||running||!preparation?.motor?.stopped||!byId('diagnostic-clear-confirm').checked;
        byId('diagnostic-export').disabled=submitting||!exportRecord;
    }
    function invalidatePlan(note){
        requestEpoch++;requestController?.abort();requestController=null;
        clearTimeout(timer);timer=null;submitting=false;pollGeneration++;
        activePlan=null;plannedPayload=null;exportRecord=null;
        sessionStorage.removeItem('unpowered-saved-plan');
        byId('diagnostic-job-json').textContent='';byId('diagnostic-result').textContent='';
        byId('diagnostic-result-summary').textContent='';byId('diagnostic-events').textContent='';
        byId('diagnostic-unpowered-readiness').textContent='';
        byId('diagnostic-unpowered-files').replaceChildren();
        byId('diagnostic-plan-summary').textContent='';
        if(note){byId('diagnostic-job-status').textContent=note;byId('diagnostic-job-status').dataset.state='';}
        window.diagnosisDashboard?.hide();updateButtons();
        if(runningJob){const key=runningJob,serial=pollGeneration;timer=setTimeout(()=>pollUnpowered(key,serial),700);}
    }
    function refreshExcitation(){
        const old=byId('job-excitation').value,ground=byId('job-ground').value;
        fillSelect('job-excitation',(importState?.data?.nets||[]).filter(net=>net!==ground),old);
    }
    function railSuggestions(){
        return (importState?.data?.nets||[]).flatMap(net=>{const match=/^([+-]?\d+(?:\.\d+)?)V$/i.exec(net);return match&&Number(match[1])!==0?[net+'='+Number(match[1])]:[];});
    }
    function updatePowerGuide(){
        const mode=byId('job-power').value,rails=byId('job-rails'),suggestions=railSuggestions();rails.required=mode==='powered';
        byId('job-power-help').textContent=mode==='powered'?'必填：每行填写“电源网络=电压”，例如 +5V=5 和 -5V=-5；GND不用填写。':mode==='unpowered'?'断电测试：电源网络/电压栏应留空。先生成断电方案，再检查并启动实测；不支持的器件或链路会显示具体原因。':'请确认待测板采用带电还是断电测试。';
        byId('job-use-rail-suggestions').hidden=mode!=='powered'||!suggestions.length;
        byId('measurement-capability').textContent=mode==='unpowered'?'系统按方案选择注入网络、测点、频率与Rs，执行采集并生成测量报告。':mode==='powered'?'请选择断电测量模式。':'导入工程后选择带电或断电模式。';
        byId('job-excitation-label').hidden=mode!=='unpowered';
        byId('job-reference-label-wrap').hidden=mode!=='unpowered';
        byId('job-excitation').required=mode==='unpowered';
        byId('diagnostic-unpowered-controls').hidden=mode!=='unpowered';
        byId('download-diagnostic-job').textContent=mode==='unpowered'?'2. 生成断电测量方案':'2. 生成测量方案';
        byId('diagnostic-unpowered-start').textContent='3. 开始自动测量';
        updateButtons();
    }
    async function refreshPublishedReport(state){                     }
    function render(state){
        const savedPlan=sessionStorage.getItem('unpowered-saved-plan');
        const previous=importState;importState=state;const data=state.data,ready=state.loaded&&state.complete;
        byId('design-readiness').textContent=ready?(data.source_mode==='native_epro2'?'工程网络与器件参数已提取':'连接校验通过 · 可生成测量方案'):state.loaded?'工程已导入，正在读取器件参数':'尚未导入epro2工程';
        byId('design-readiness').className=ready?'design-ready':'design-pending';
        const statistics=byId('design-statistics'),issues=byId('design-issues'),tbody=byId('design-bom-table').querySelector('tbody');
        statistics.replaceChildren();issues.replaceChildren();tbody.replaceChildren();
        const same=previous?.layout_id===state.layout_id;
        fillSelect('job-ground',data?.nets||[],same?byId('job-ground').value:'');
        if(!same){invalidatePlan();byId('job-power').value='';byId('job-rails').value='';byId('job-excitation').value='';}
        if(ready){
            const report=data.report;
            for(const [count,label] of [[report.component_count,'个元件'],[report.net_count,'个网络'],[report.checked_pins,'个引脚已核对']]){const span=document.createElement('span');span.textContent=count+' '+label;statistics.append(span);}
            for(const warning of report.warnings){const li=document.createElement('li');li.textContent=warning;issues.append(li);}
            const grounds=data.nets.filter(net=>/^(GND|0|AGND|DGND)$/i.test(net));if(!byId('job-ground').value&&grounds.length===1)byId('job-ground').value=grounds[0];
            for(const part of data.bom){const row=document.createElement('tr');for(const value of [part.reference,part.value||part.part_number||'未提供',part.tolerance_relative===null?'未给出':(part.tolerance_relative*100)+'%']){const cell=document.createElement('td');cell.textContent=value;row.append(cell);}tbody.append(row);}
            if(report.diagnostic_ready===false||report.missing_nominal_values.length){byId('design-readiness').textContent='工程可查看和定位；诊断前请修正元件参数或连接提示';}
        }
        refreshExcitation();
        if(ready&&!same){
            let saved=null;try{saved=JSON.parse(sessionStorage.getItem('unpowered-form'));}catch(error){                  }
            if(saved?.layout===state.layout_id){
                for(const id of jobFields)if(Object.hasOwn(saved.fields||{},id))byId(id).value=saved.fields[id];
                refreshExcitation();
            }
            if(byId('job-power').value==='powered'&&!byId('job-rails').value)byId('job-rails').value=railSuggestions().join('\n');
            if(new URLSearchParams(location.search).get('workflow')==='unpowered'){byId('job-power').value='unpowered';byId('job-rails').value='';}
            saveSettings();
            if(savedPlan&&!running)restorePlan(savedPlan,state);
        }
        const pdfLink=byId('design-pdf-link');pdfLink.hidden=!state.pdf_url;if(state.pdf_url)pdfLink.href=state.pdf_url;else pdfLink.removeAttribute('href');
        updatePowerGuide();refreshPublishedReport(state);
        if(ready&&byId('job-power').value==='unpowered'&&!same)refreshPreparation();
    }
    async function refresh(){const sequence=++refreshSequence;try{const response=await fetch('/design-package/status',{credentials:'same-origin'});if(!response.ok)throw Error('无法读取导入状态');const state=await response.json();if(sequence===refreshSequence)render(state);}catch(error){byId('design-readiness').textContent=error.message;}}
    for(const id of jobFields){const field=byId(id);for(const name of ['input','change'])field.addEventListener(name,()=>{
        field.removeAttribute('aria-invalid');invalidatePlan('测试设置已变化，请重新生成方案。');
        if(id==='job-ground')refreshExcitation();
        if(id==='job-power'){
            byId('job-fixed-ground').checked=false;
            if(field.value==='powered'&&!byId('job-rails').value)byId('job-rails').value=railSuggestions().join('\n');
            if(field.value==='unpowered')byId('job-rails').value='';
        }
        updatePowerGuide();saveSettings();
        if(id==='job-power'&&field.value==='unpowered')refreshPreparation();
    });}
    byId('job-use-rail-suggestions').onclick=()=>{invalidatePlan();byId('job-rails').value=railSuggestions().join('\n');byId('job-rails').removeAttribute('aria-invalid');byId('diagnostic-job-status').textContent='已根据网络名称填入电源建议，请核对实际供电电压后再生成任务。';};
    function invalid(id,message){byId('measurement-advanced').open=true;const error=Error(message);error.field=byId(id);throw error;}
    function makePayload(){
        jobFields.forEach(id=>byId(id).removeAttribute('aria-invalid'));
        if(!byId('job-ground').value)invalid('job-ground','请选择参考地网络。');
        const mode=byId('job-power').value,railsText=byId('job-rails').value.trim();
        if(mode!=='unpowered')invalid('job-power','请选择断电测试。');
        if(mode==='powered'&&!railsText)invalid('job-rails','带电测试还缺电源设置：请每行填写“网络=电压”，或点击“填入电源建议”。');
        if(mode==='unpowered'&&railsText)invalid('job-rails','断电测试请清空电源网络/电压。');
        const rails={};for(const line of railsText.split(/\r?\n/)){
            if(!line.trim())continue;
            const index=line.lastIndexOf('=');
            if(index<=0||!line.slice(index+1).trim())invalid('job-rails','电源格式应为“网络=电压”，每行一项，例如 +5V=5。');
            const net=line.slice(0,index).trim(),value=Number(line.slice(index+1).trim());
            if(!Number.isFinite(value)||Object.hasOwn(rails,net))invalid('job-rails','电源电压应填写数值，且每个电源网络只填一次。');
            if(!importState.data.nets.includes(net)||net===byId('job-ground').value)invalid('job-rails','电源网络必须来自当前网表，且不能是参考地。');
            rails[net]=value;
        }
        if(!byId('job-peak').value||!byId('job-peak').checkValidity())invalid('job-peak','请输入有效的正激励峰值上限（不超过10V）。');
        const body={layout_id:importState.layout_id,ground_net:byId('job-ground').value,power_mode:mode,rails,max_input_peak_V:Number(byId('job-peak').value)};
        if(mode==='unpowered'){
            const drive=byId('job-excitation').value;
            if(!drive||drive===body.ground_net||!importState.data.nets.includes(drive))invalid('job-excitation','请选择与参考地不同的断电激励网络。');
            body.excitation_net=drive;
            body.reference_label=byId('job-reference-label').value;
            const analysis=byId('job-analysis-mode')?.value||'measurement';
            if(analysis!=='measurement'){
                body.analysis_mode=analysis;
                body.calibration_id=byId('job-calibration').value;
                body.dut_id=byId('job-dut-id').value.trim();
                if(!body.calibration_id)invalid('job-calibration','请选择校准配置。');
                if(!body.dut_id)invalid('job-dut-id','请输入待测板编号。');
                if(analysis==='reference')body.reference_label='user_declared_normal';
                else{
                    body.reference_id=byId('job-normal-reference').value;
                    if(!body.reference_id)invalid('job-normal-reference','请选择正常参考。');
                }
            }
        }
        return body;
    }
    function showError(error,prefix){
        const status=byId('diagnostic-job-status');status.textContent=prefix+error.message;status.dataset.state='error';
        if(error.field){error.field.setAttribute('aria-invalid','true');error.field.focus();error.field.scrollIntoView({block:'center',behavior:'smooth'});}
    }
    function showReadiness(value){
        const reasons=(value?.blockers||[]).map(item=>typeof item==='string'?item:item.message||item.code);
        const warnings=(value?.warnings||[]).map(item=>typeof item==='string'?item:item.message);
        const text=reasons.length?'实测准备检查：\n'+reasons.map((item,index)=>(index+1)+'. '+item).join('\n'):value?.hardware_execution_available?'真实测量准备检查通过：'+value.total_conditions+'条件，每通路'+value.frames_per_path+'帧。将移动、落针、采集并生成报告。':'尚无可用的实测准备检查结果。';
        byId('diagnostic-unpowered-readiness').textContent=text+(warnings.length?'\n报告范围：\n'+warnings.join('\n'):'');
    }
    async function post(path,body,signal){
        const response=await fetch(path,{method:'POST',credentials:'same-origin',headers:{'Content-Type':'application/json','X-Requested-With':'XMLHttpRequest'},body:JSON.stringify(body),signal});
        const data=await response.json();return {ok:response.ok,status:response.status,data};
    }
    async function refreshPreparation(){
        try{
            const response=await fetch('/diagnosis/unpowered/readiness?analysis_mode='+encodeURIComponent(byId('job-analysis-mode')?.value||'measurement'),{credentials:'same-origin',cache:'no-store'}),data=await response.json();
            if(!response.ok)throw Error(data.error||'准备检查失败');preparation=data;
            byId('diagnostic-unpowered-readiness').textContent=data.checks.map(c=>(c.ok?'✓ ':'待处理：')+c.message).join('\n');
        }catch(error){preparation=null;byId('diagnostic-unpowered-readiness').textContent=error.message;}
        updateButtons();
    }
    function planSummary(job){
        byId('diagnostic-plan-summary').textContent='方案来源：板端CPU按工程连接和固定扫频规则生成。注入 '+job.scope.excitation_net+'；测点 '+job.scope.measurement_nets.join('、')+'；'+job.scope.frequencies_hz.length+'个频率 × '+job.scope.rs_nominal_ohm.length+'档Rs，共 '+job.actions.length+'条件。每条件4通路各'+job.frames_per_path+'帧。每次XY移位前须目视确认双针离板。';
    }
    async function restorePlan(raw,state){
        const epoch=requestEpoch;
        try{
            const saved=JSON.parse(raw);if(saved.layout!==state.layout_id||!/^um_[a-f0-9]{32}$/.test(saved.key))return;
            const response=await fetch('/diagnosis/unpowered/'+saved.key+'/plan',{credentials:'same-origin',cache:'no-store'}),job=await response.json();
            if(!response.ok||epoch!==requestEpoch||running||job.import_provenance.layout_id!==importState.layout_id)return;
            const body=makePayload();if(JSON.stringify(body)!==JSON.stringify(saved.payload))return;
            activePlan=job;plannedPayload=body;exportRecord=job;byId('diagnostic-job-json').textContent=JSON.stringify(job,null,2);planSummary(job);
            window.diagnosisDashboard?.planned(job);sessionStorage.setItem('unpowered-saved-plan',raw);byId('diagnostic-job-status').textContent='已恢复本会话尚未执行的断电方案，请检查设备后开始。';updateButtons();
        }catch(error){                    }
    }
    async function waitDeviceCheck(key){
        const deadline=Date.now()+45000;
        while(Date.now()<deadline){
            const response=await fetch('/motor/status',{credentials:'same-origin',cache:'no-store'}),state=await response.json();
            if(!response.ok)throw Error(state.error||'无法读取设备检查');
            if(state.last_job?.job_id===key&&!state.busy){if(state.last_job.state!=='completed')throw Error(state.last_job.error||state.message);return;}
            await new Promise(resolve=>setTimeout(resolve,500));
        }
        throw Error('设备检查尚未结束，请稍后重新查看状态。');
    }
    async function prepareAction(action){
        if(preparing||running)return;preparing=true;updateButtons();
        try{
            if(action==='online'){await call('/motor/mode',{enabled:true});window.motorStatus?.refresh();}
            else{
                if(action==='check')await call('/motor/servo/read',{});
                const data=await call('/diagnosis/unpowered/'+(action==='clear'?'clear-stop':'check-devices'),action==='clear'?{confirm_probes_raised:byId('diagnostic-clear-confirm').checked}:{});
                byId('diagnostic-unpowered-readiness').textContent='正在只读核验四轴停稳与现有机械参考，不自动回零…';await waitDeviceCheck(data.job_id);
            }
        }catch(error){showError(error,'设备准备未完成：');}
        finally{await refreshPreparation();preparing=false;updateButtons();}
    }
    async function ensureAutomaticReady(){
        preparing=true;updateButtons();
        try{
            await refreshPreparation();
            if(!preparation)throw Error('无法读取设备状态。');
            const acquisition=preparation.checks.find(c=>c.id==='acquisition'),idle=preparation.checks.find(c=>c.id==='idle');
            if(acquisition?.ok!==true||idle?.ok!==true)throw Error(acquisition?.ok!==true?acquisition?.message||'采集板未就绪。':idle?.message||'采集板未空闲。');
            if(!preparation.motion_enabled){await call('/motor/mode',{enabled:true});window.motorStatus?.refresh();}
            if(!preparation.servo?.checked||!preparation.servo?.available)await call('/motor/servo/read',{});
            if(!preparation.motor?.ready||preparation.motor?.stopped){
                const result=await call('/diagnosis/unpowered/check-devices',{});await waitDeviceCheck(result.job_id);
            }
            await refreshPreparation();
            if(preparation?.ready!==true)throw Error((preparation?.checks||[]).filter(c=>!c.ok).map(c=>c.message).join('；')||'设备检查尚未通过。');
        }catch(error){byId('diagnostic-setup-tools').open=true;throw error;}
        finally{preparing=false;updateButtons();}
    }
    byId('diagnostic-online').onclick=()=>prepareAction('online');
    byId('diagnostic-check').onclick=()=>prepareAction('check');
    byId('diagnostic-clear-stop').onclick=()=>prepareAction('clear');
    byId('diagnostic-clear-confirm').onchange=updateButtons;
    byId('diagnostic-refresh-readiness').onclick=refreshPreparation;
    byId('diagnostic-clearance').onclick=async()=>{
        if(!runningJob||!clearanceToken)return;const button=byId('diagnostic-clearance');button.disabled=true;
        try{await call('/diagnosis/unpowered/'+runningJob+'/confirm-clearance',{token:clearanceToken,confirmed:true});}
        catch(error){showError(error,'离板确认未接受：');button.disabled=false;}
    };
    byId('diagnostic-job-form').onsubmit=async event=>{
        event.preventDefault();if(locked||submitting||!planReady())return;
        invalidatePlan();const epoch=requestEpoch,status=byId('diagnostic-job-status');
        try{
            const body=makePayload();
            requestController=new AbortController();submitting=true;updateButtons();
            status.textContent='正在从工程网络与焊盘生成六频双档方案…';status.dataset.state='working';
            const response=await post('/diagnosis/unpowered/plan',body,requestController.signal);
            if(epoch!==requestEpoch)return;
            if(!response.ok)throw Error(response.data.error||'生成失败');
            const job=response.data;activePlan=job;plannedPayload=body;exportRecord=job;
            byId('diagnostic-job-json').textContent=JSON.stringify(job,null,2);
            window.diagnosisDashboard?.planned(job);
            showReadiness(job.unpowered_readiness);
            planSummary(job);saveSettings();
            sessionStorage.setItem('unpowered-saved-plan',JSON.stringify({layout:importState.layout_id,key:job.job_id,payload:body}));
            refreshPreparation();
            byId('diagnostic-result-summary').textContent='断电方案已生成，尚未采集或诊断；开始实测时会重新检查条件。';
            status.textContent='断电方案已生成：'+job.actions.length+'个真实测量条件。可查看方案，然后点击“开始断电实测并生成报告”。';
            status.dataset.state='success';
        }catch(error){if(epoch===requestEpoch&&error.name!=='AbortError')showError(error,'未生成任务：');}
        finally{if(epoch===requestEpoch){submitting=false;requestController=null;updateButtons();}}
    };
    byId('diagnostic-unpowered-start').onclick=async()=>{
        if(locked||submitting||!activePlan||byId('job-power').value!=='unpowered')return;
        const epoch=requestEpoch,status=byId('diagnostic-job-status');
        try{
            if(!byId('job-fixed-ground').checked)throw Error('整板节点扫频需要DUT GND接公共地，请接好后勾选接线确认；单元件两端测法使用另一配方。');
            status.textContent='正在自动检查设备与现有参考，尚未开始运动…';
            await ensureAutomaticReady();
            if(epoch!==requestEpoch||!activePlan)return;
            const body=makePayload();
            if(JSON.stringify(body)!==JSON.stringify(plannedPayload)){invalidatePlan('设置已变化，请重新生成断电方案。');return;}
            requestController=new AbortController();submitting=true;updateButtons();
            runningKind='unpowered';runningJob=activePlan.job_id;runLock(true);
            status.textContent='正在启动真实移动、落针和逐条件采集…';status.dataset.state='working';
            const response=await post('/diagnosis/unpowered/start',{...body,job_id:runningJob,fixed_ground_connected:true},requestController.signal);
            if(epoch!==requestEpoch)return;
            const data=response.data,readiness=data.readiness||data.unpowered_readiness||data.job?.unpowered_readiness;
            if(data.job){activePlan=data.job;byId('diagnostic-job-json').textContent=JSON.stringify(data.job,null,2);}
            exportRecord={schema:'unpowered-test-attempt/1.0',http_status:response.status,job:activePlan,response:data};
            byId('diagnostic-result').textContent=JSON.stringify(exportRecord,null,2);if(readiness)showReadiness(readiness);
            if(!response.ok){
                runningJob=null;runningKind=null;runLock(false);
                const reason=data.error||'当前实测条件不满足。';status.textContent='断电实测未启动：'+reason;status.dataset.state='error';
                byId('diagnostic-result-summary').textContent='本次未完成实物测量，不能判定正常或故障；原因见实测准备检查和完整记录。';
            }else{
                sessionStorage.setItem('unpowered-active-job',runningJob);
                byId('diagnostic-result-summary').textContent='真实测量已启动，正在按方案采集；完成后提供测量报告和全部原码。';
                const serial=++pollGeneration;pollUnpowered(runningJob,serial);
            }
        }catch(error){if(epoch===requestEpoch&&error.name!=='AbortError'){
            showError(error,runningJob?'启动响应中断，正在核对后台任务：':'自动测量未启动：');
            if(runningJob){sessionStorage.setItem('unpowered-active-job',runningJob);pollUnpowered(runningJob,++pollGeneration);}
        }}
        finally{if(epoch===requestEpoch){submitting=false;requestController=null;updateButtons();}}
    };
    byId('diagnostic-export').onclick=()=>{
        if(!exportRecord)return;
        const blob=new Blob([JSON.stringify(exportRecord,null,2)+'\n'],{type:'application/json'}),url=URL.createObjectURL(blob),link=document.createElement('a');
        link.href=url;link.download=byId('job-power').value==='unpowered'?'unpowered-test-record.json':'diagnostic-job.json';link.click();setTimeout(()=>URL.revokeObjectURL(url),0);
    };
    async function call(path,body){const response=await post(path,body);if(!response.ok)throw Error(response.data.error||'请求失败');return response.data;}
    function runLock(busy){running=busy;setLocked(busy);jobFields.forEach(id=>byId(id).disabled=busy);byId('job-fixed-ground').disabled=busy;updateButtons();}
    async function pollUnpowered(key,serial){
        try{
            const response=await fetch('/diagnosis/unpowered/'+key,{credentials:'same-origin'}),data=await response.json();
            if(serial!==pollGeneration||key!==runningJob)return;
            if(!response.ok)throw Error(data.error||'读取测量任务失败');
            window.diagnosisDashboard?.updateUnpowered({...data,job:activePlan||data.job,job_id:key});
            byId('diagnostic-job-status').dataset.state='';
            byId('diagnostic-job-status').textContent=data.message+' · '+data.frames_captured+'帧 · '+Number(data.elapsed_seconds||0).toFixed(1)+'秒';
            byId('diagnostic-events').textContent='状态：'+data.state+'\n阶段：'+(data.phase||'准备')+'\n测量条件：'+data.completed_conditions+'/'+data.total_conditions;
            const clearance=byId('diagnostic-clearance');
            clearance.hidden=data.state!=='running'||data.phase!=='waiting_clearance';
            const notice=byId('diagnostic-clearance-notice');if(notice){notice.hidden=clearance.hidden;notice.style.display=clearance.hidden?'none':'flex';}
            if(!clearance.hidden){
                if(clearanceToken!==data.clearance_token){clearanceToken=data.clearance_token;clearance.disabled=false;}
                if(data.contact_position)clearance.textContent='确认通道'+data.contact_channels+(data.contact_position==='up'?'已抬起':'已接触')+'，继续';
                clearance.textContent='双针已离板，继续测量';const hint=byId('diagnostic-clearance-note');if(hint)hint.textContent='双针离板后，继续移动到 '+data.clearance_target+'。';
            }
            if(data.state==='running'){timer=setTimeout(()=>pollUnpowered(key,serial),700);return;}
            runningJob=null;runningKind=null;sessionStorage.removeItem('unpowered-active-job');runLock(false);
            sessionStorage.removeItem('unpowered-saved-plan');
            exportRecord={job:activePlan,result:data};activePlan=null;plannedPayload=null;updateButtons();
            byId('diagnostic-result').textContent=JSON.stringify(data.result||data,null,2);
            const result=data.result;
            byId('diagnostic-result-summary').textContent=result?
                result.diagnosis?'诊断结果：'+(result.diagnosis.candidate_names||[]).join('、')+'；'+result.completed_conditions+'条件，'+result.frames_captured+'帧。':result.reference_id?'正常参考：'+result.reference_id:result.completed_conditions+'条件，'+result.frames_captured+'帧。':data.message;
            window.dispatchEvent(new Event('closedloop-assets-changed'));
            const files=byId('diagnostic-unpowered-files');files.replaceChildren();
            window.diagnosisDashboard?.show();
            if(result)for(const [name,label] of [['report.json','下载结果数据'],['measurements.csv','下载测量表格'],['measurement_bundle.zip','下载完整记录']]){
                const link=document.createElement('a');link.href='/diagnosis/unpowered/'+key+'/files/'+name;link.textContent=label;link.download=name;files.append(link,document.createElement('br'));
            }
        }catch(error){if(serial===pollGeneration&&key===runningJob){
            byId('diagnostic-job-status').dataset.state='error';byId('diagnostic-job-status').textContent='连接中断，后台任务状态尚待确认：'+error.message;timer=setTimeout(()=>pollUnpowered(key,serial),1800);
        }}
    }
    byId('diagnostic-unpowered-cancel').onclick=async()=>{if(!runningJob||runningKind!=='unpowered')return;try{await call('/diagnosis/unpowered/'+runningJob+'/cancel',{});}catch(error){showError(error,'取消失败：');}};

    window.designPackage={upload,setLocked,refresh};
    window.addEventListener('workbench-design-changed',()=>{invalidatePlan('工程或方向已变化，请重新生成方案。');refresh();});refresh();
    const resume=sessionStorage.getItem('unpowered-active-job');
    if(resume&&/^um_[a-f0-9]{32}$/.test(resume)){runningJob=resume;runningKind='unpowered';runLock(true);pollUnpowered(resume,++pollGeneration);}
}());

