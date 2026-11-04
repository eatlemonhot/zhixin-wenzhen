import {rotateBoardPoint,fixturePoint} from './fixture-geometry.js?v=corner-20261025';
export function selectStepModel(catalog,design){
    const entry=design.step_model||catalog.models?.[design.layout_id];if(!entry)return null;
    if(entry.layout_id!==design.layout_id||entry.units!=='mm'||
        Math.abs(entry.width_mm-design.dimensions.width)>.001||Math.abs(entry.height_mm-design.dimensions.height)>.001)throw Error('STEP与当前PCB工程或尺寸不匹配。');
    return entry;
}
export function stepPose(dimensions,placement){
    const corner=fixturePoint(...rotateBoardPoint(0,0,dimensions),placement);
    return {x:corner[0],y:corner[1],z:placement.z,angle:-dimensions.orientation*Math.PI/180,scaleY:-1};
}
export function stepArrays(buffer,manifest){
    if(manifest.schema!=='circuitscout.step-mesh/v1'||manifest.units!=='mm'||buffer.byteLength!==manifest.binary_bytes)throw Error('STEP展示数据格式或长度不正确。');
    function read(spec,type){
        if(spec.type!==type||!Number.isInteger(spec.offset)||!Number.isInteger(spec.count)||spec.offset<0||spec.count<=0||spec.offset%4||spec.offset+spec.count*4>buffer.byteLength)throw Error('STEP网格索引范围不正确。');
        return new (type==='f32'?Float32Array:Uint32Array)(buffer,spec.offset,spec.count);
    }
    return manifest.parts.map(p=>{
        const position=read(p.position,'f32'),normal=read(p.normal,'f32'),index=read(p.index,'u32');
        if(position.length%3||position.length!==normal.length||index.length%3)throw Error('STEP网格维度不正确。');
        for(const value of position)if(!Number.isFinite(value))throw Error('STEP包含无效坐标。');
        for(const value of normal)if(!Number.isFinite(value))throw Error('STEP包含无效法线。');
        for(const value of index)if(value>=position.length/3)throw Error('STEP顶点索引越界。');
        let covered=0;
        for(const g of p.groups){if(g.start!==covered||!Number.isInteger(g.count)||g.count<=0||g.count%3||!p.colors[g.material])throw Error('STEP颜色分组不正确。');covered+=g.count;}
        if(covered!==index.length)throw Error('STEP颜色分组不完整。');
        return {...p,position,normal,index};
    });
}
