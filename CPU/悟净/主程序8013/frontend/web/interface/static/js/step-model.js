import * as T from './vendor/three.module.js';
import {stepArrays} from './step-model-geometry.js?v=joint-20261025-1';
export function disposeStep(model){
    model?.root.traverse(o=>{o.geometry?.dispose();if(Array.isArray(o.material))o.material.forEach(m=>m.dispose());});
}
export async function loadStep(entry){
    const prefix=entry.manifest_url||'/static/models/'+entry.manifest;
    if(!/^\/(static\/models\/boards\/[^?#]+|kicad\/step_model\/design_[a-f0-9]{32}\/model\.json)$/.test(prefix))throw Error('STEP模型地址无效。');
    const response=await fetch(prefix);if(!response.ok)throw Error('STEP元件清单加载失败。');
    const meta=await response.json();
    if(meta.layout_id!==entry.layout_id||meta.source_sha256!==entry.source_sha256||meta.binary!=='meshes.bin')throw Error('STEP元件清单与工程不匹配。');
    const binary=await fetch(prefix.slice(0,prefix.lastIndexOf('/')+1)+meta.binary);if(!binary.ok)throw Error('STEP元件网格加载失败。');
    const parts=stepArrays(await binary.arrayBuffer(),meta),root=new T.Group(),board=new T.Group(),components=new T.Group();root.add(board,components);
    try{for(const part of parts){
        const geometry=new T.BufferGeometry();geometry.setAttribute('position',new T.BufferAttribute(part.position,3));geometry.setAttribute('normal',new T.BufferAttribute(part.normal,3));geometry.setIndex(new T.BufferAttribute(part.index,1));
        for(const g of part.groups)geometry.addGroup(g.start,g.count,g.material);
        const materials=part.colors.map(c=>new T.MeshStandardMaterial({color:new T.Color().setRGB(...c,T.SRGBColorSpace),roughness:.55,metalness:.12,side:T.DoubleSide}));
        const mesh=new T.Mesh(geometry,materials);mesh.name=part.reference;mesh.userData.reference=part.reference;(part.kind==='board'?board:components).add(mesh);
    }}catch(e){disposeStep({root});throw e;}
    return {root,board,components,meta};
}
