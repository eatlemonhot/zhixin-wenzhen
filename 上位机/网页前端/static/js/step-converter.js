(function(root){
    'use strict';
    const auxiliary=new Set(['TopCopper','BottomCopper','TopSilkscreen','BottomSilkscreen','TopFpcStiffener','BottomFpcStiffener']);
    function convertStepMesh(result,design,source){
        const d=design.dimensions,id=d.layout_id;
        if(!result.success||!Array.isArray(result.meshes))throw Error('STEP解析失败，请重新导出文件。');
        if(!/^[a-f0-9]{64}$/.test(id)||d.orientation!==0||!d.origin?.every(Number.isFinite))throw Error('需要未旋转的嘉立创PCB工程。');
        if(result.meshes.reduce((n,m)=>n+m.attributes.position.array.length*8+m.index.array.length*4,0)>64*1024*1024)throw Error('STEP展示网格超过64MB，请简化模型后再导出。');
        const components=new Map(design.components.map(c=>[c.reference,c])),owners=new Map(),parts=[],chunks=[];let offset=0;
        function collect(node,owner=null){
            const ref=node.name.split('~')[0];
            if(auxiliary.has(ref))return;
            if(ref==='Board'||components.has(ref)){
                if(owners.has(ref))throw Error('STEP位号重复：'+ref);
                owner={reference:ref,kind:ref==='Board'?'board':'component',name:node.name,meshes:[]};owners.set(ref,owner);
            }
            if(node.meshes.length){if(!owner)throw Error('STEP没有可识别的PCB/元件位号，请导出整板装配。');owner.meshes.push(...node.meshes);}
            for(const child of node.children)collect(child,owner);
        }
        collect(result.root);
        function array(values,type){const a=type==='f32'?Float32Array.from(values):Uint32Array.from(values),bytes=new Uint8Array(a.buffer),spec={offset,count:a.length,type};chunks.push(bytes);offset+=bytes.length;return spec;}
        for(const owner of owners.values()){
            if(!owner.meshes.length)continue;
            const positions=[],normals=[],colors=[],byColor=new Map(),box={min:[Infinity,Infinity,Infinity],max:[-Infinity,-Infinity,-Infinity]};
            function colorIndex(c){const color=c||[.6,.6,.6],key=color.map(x=>x.toFixed(6)).join(',');if(!byColor.has(key)){byColor.set(key,{color,index:colors.length,indices:[]});colors.push(color);}return byColor.get(key);}
            for(const meshIndex of owner.meshes){
                const m=result.meshes[meshIndex],p=m.attributes.position.array,n=m.attributes.normal?.array,indices=m.index.array,base=positions.length/3;
                if(!n||n.length!==p.length)throw Error('STEP缺少表面法线。');
                for(let i=0;i<p.length;i+=3){
                    const q=[p[i]-d.origin[0],-p[i+1]-d.origin[1],p[i+2]];
                    if(!q.every(Number.isFinite))throw Error('STEP顶点无效。');
                    positions.push(...q);normals.push(n[i],-n[i+1],n[i+2]);
                    for(let k=0;k<3;k++){box.min[k]=Math.min(box.min[k],q[k]);box.max[k]=Math.max(box.max[k],q[k]);}
                }
                let next=0;
                for(const f of m.brep_faces){
                    if(f.first!==next)throw Error('STEP表面索引不连续。');next=f.last+1;
                    const target=colorIndex(f.color||m.color).indices;
                    for(let i=f.first*3;i<(f.last+1)*3;i+=3)target.push(indices[i]+base,indices[i+2]+base,indices[i+1]+base);
                }
                if(next*3!==indices.length)throw Error('STEP表面不完整。');
            }
            const indices=[],groups=[];
            for(const c of byColor.values()){groups.push({start:indices.length,count:c.indices.length,material:c.index});for(const i of c.indices)indices.push(i);}
            parts.push({reference:owner.reference,kind:owner.kind,name:owner.name,bounds:box,colors,groups,position:array(positions,'f32'),normal:array(normals,'f32'),index:array(indices,'u32'),triangles:indices.length/3});
        }
        const board=parts.find(p=>p.kind==='board');if(!board)throw Error('STEP缺少PCB基板，请勾选导出PCB。');
        if(parts.filter(p=>p.kind==='component').length===0)throw Error('STEP没有元件实体，请勾选导出元件模型。');
        if(parts.length>2001||offset>64*1024*1024)throw Error('STEP零件或展示网格超过上限。');
        const width=board.bounds.max[0]-board.bounds.min[0],height=board.bounds.max[1]-board.bounds.min[1];
        if(Math.abs(width-d.width)>.05||Math.abs(height-d.height)>.05||Math.abs(board.bounds.min[2])>.001)throw Error('STEP基板尺寸或坐标与当前工程不同，请使用同一版文件。');
        const binary=new Uint8Array(offset);let at=0;for(const chunk of chunks){binary.set(chunk,at);at+=chunk.length;}
        const present=new Set(parts.map(p=>p.reference));
        const manifest={schema:'circuitscout.step-mesh/v1',layout_id:id,source,units:'mm',coordinate_frame:'unrotated_pcb_mm_z_from_board_bottom',width_mm:d.width,height_mm:d.height,source_origin_mm:d.origin,
            board_thickness_mm:board.bounds.max[2]-board.bounds.min[2],component_count:parts.length-1,missing_references:[...components.keys()].filter(ref=>!present.has(ref)),
            conversion:{library:'occt-import-js',version:'0.0.23',linearUnit:'millimeter',linearDeflectionType:'absolute_value',linearDeflection:.035,angularDeflection:.3},binary:'meshes.bin',binary_bytes:binary.length,parts};
        return {manifest,binary:binary.buffer};
    }
    if(typeof module==='object'&&module.exports)module.exports={convertStepMesh};else root.StepConverter={convertStepMesh};
})(typeof self!=='undefined'?self:globalThis);
