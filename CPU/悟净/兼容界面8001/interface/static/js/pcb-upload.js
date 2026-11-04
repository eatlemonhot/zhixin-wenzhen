(function () {
    'use strict';
    const button=document.getElementById('upload-button'),status=document.getElementById('upload-status');
    if(!button||!status)return;
    const form=button.closest('form'),layoutInput=document.getElementById('layout-file'),stepInput=document.getElementById('step-file'),cancel=document.getElementById('upload-cancel');
    const headers={'X-Requested-With':'XMLHttpRequest'};
    let uploading=false,motorBusy=false,controller=null,worker=null,lastInfo=null,phase='',started=0;
    status.style.whiteSpace='pre-line';
    function updateButton(){button.disabled=uploading||motorBusy;}
    window.motorStatus.subscribe(data=>{motorBusy=Boolean(data&&data.busy);updateButton();});
    function showInfo(info){
        lastInfo=info;if(uploading)return;
        const lines=['已导入：'+info.format+'，'+info.pads+'个焊盘/孔，'+info.nets+'个网络。'];
        if(Number.isFinite(info.width_mm)&&Number.isFinite(info.height_mm))lines.push('板尺寸：'+info.width_mm.toFixed(3)+' × '+info.height_mm.toFixed(3)+' mm。');
        if(info.step_model)lines.push('STEP已保存并匹配：'+info.step_model.component_count+'个元件。');
        if(info.warnings?.length)lines.push(...info.warnings);
        lines.push('请核对板尺寸和方向，记录左右探针对准后再移动。');status.textContent=lines.join('\n');
    }
    socket.on('pcb_import_info',showInfo);socket.on('dimensions',d=>{if(d.import_info)showInfo(d.import_info);});
    function progress(text){phase=text;status.textContent=text+' 已用时'+Math.floor((performance.now()-started)/1000)+'秒。';}
    async function inspect(file,signal){
        const data=new FormData();data.append('layout_file',file);
        const response=await fetch('/kicad/inspect_project',{method:'POST',body:data,headers,credentials:'same-origin',signal});
        const result=await response.json();if(!response.ok)throw Error(result.error||'工程检查失败。');return result;
    }
    async function convert(file,design,signal){
        const buffer=await file.arrayBuffer();if(signal.aborted)throw new DOMException('cancelled','AbortError');
        return new Promise((resolve,reject)=>{
            worker=new Worker('/static/js/step-upload-worker.js?v=joint-20261025-1');
            const abort=()=>{worker?.terminate();worker=null;reject(new DOMException('cancelled','AbortError'));};
            signal.addEventListener('abort',abort,{once:true});
            worker.onmessage=event=>{const data=event.data;if(data.phase){progress(data.phase);return;}
                signal.removeEventListener('abort',abort);worker.terminate();worker=null;
                if(data.error)reject(Error(data.error));else resolve(data);
            };
            worker.onerror=()=>{signal.removeEventListener('abort',abort);worker?.terminate();worker=null;reject(Error('STEP解析器运行失败，请刷新网页或简化模型后重试。'));};
            worker.postMessage({buffer,design,name:file.name},[buffer]);
        });
    }
    cancel.onclick=()=>{if(!cancel.hidden&&!cancel.disabled)controller?.abort();};
    form.addEventListener('submit',async event=>{
        event.preventDefault();if(uploading||motorBusy)return;
        const layout=layoutInput.files[0],step=stepInput.files[0];if(!layout)return;
        uploading=true;updateButton();layoutInput.disabled=stepInput.disabled=true;started=performance.now();controller=new AbortController();
        let timedOut=false,success=false,timer=null;const clock=setInterval(()=>progress(phase),1000);
        try{
            if(layout.size>16*1024*1024)throw Error('工程文件超过16MB。');
            if(step&&step.size>32*1024*1024)throw Error('STEP超过32MB，请简化模型后导出。');
            const body=new FormData();body.append('layout_file',layout);
            if(step){
                cancel.hidden=false;cancel.disabled=false;progress('正在检查工程…');
                timer=setTimeout(()=>{timedOut=true;controller.abort();},150000);
                const design=await inspect(layout,controller.signal);
                const converted=await convert(step,design,controller.signal);
                clearTimeout(timer);cancel.disabled=true;
                body.append('step_file',step);body.append('step_manifest',new Blob([JSON.stringify(converted.manifest)],{type:'application/json'}),'model.json');
                body.append('step_mesh',new Blob([converted.binary],{type:'application/octet-stream'}),'meshes.bin');
                progress('正在上传模型、核对装配位置并保存…');
            }else progress('正在导入工程并查找已保存的STEP…');
            cancel.hidden=true;
            timer=setTimeout(()=>{timedOut=true;controller.abort();},600000);
            const response=await fetch(form.action,{method:'POST',body,headers,credentials:'same-origin',signal:controller.signal});
            const text=await response.text();if(!response.ok)throw Error(text);
            success=true;await window.probeWorkbench?.refresh();
            socket.emit('list_nets');socket.emit('list_edges');socket.emit('list_pads');socket.emit('list_dimensions');
        }catch(error){
            status.textContent=error.name==='AbortError'?(timedOut?'导入超时，请检查连接或简化STEP后重试。':'已取消转换，当前工程未更换。'):'导入失败：'+error.message;
            if(timedOut)window.probeWorkbench?.refresh();
        }finally{
            clearInterval(clock);clearTimeout(timer);worker?.terminate();worker=null;controller=null;
            uploading=false;layoutInput.disabled=stepInput.disabled=false;cancel.hidden=true;updateButton();
            if(success){const info=window.probeWorkbench?.design?.dimensions?.import_info||lastInfo;if(info)showInfo(info);else status.textContent='文件已导入，正在更新工程视图。';}
        }
    });
}());
