importScripts('/static/js/vendor/occt/occt-import-js.js','/static/js/step-converter.js?v=joint-20261025-1');
self.onmessage=async function(event){
    try{
        self.postMessage({phase:'正在加载STEP解析器…'});
        const occt=await occtimportjs({locateFile:file=>'/static/js/vendor/occt/'+file});
        self.postMessage({phase:'正在解析STEP模型，较大的文件可能需要几十秒…'});
        const result=occt.ReadStepFile(new Uint8Array(event.data.buffer),{linearUnit:'millimeter',linearDeflectionType:'absolute_value',linearDeflection:.035,angularDeflection:.3});
        self.postMessage({phase:'正在整理元件模型并核对板尺寸…'});
        const converted=self.StepConverter.convertStepMesh(result,event.data.design,event.data.name);
        self.postMessage({manifest:converted.manifest,binary:converted.binary},[converted.binary]);
    }catch(error){self.postMessage({error:error.message||'STEP解析失败。'});}
};
