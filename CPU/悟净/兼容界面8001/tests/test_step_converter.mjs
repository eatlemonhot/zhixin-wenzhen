import assert from 'node:assert/strict';
import {test} from 'node:test';
import {createRequire} from 'node:module';
import {stepArrays} from '../interface/static/js/step-model-geometry.js';
const {convertStepMesh}=createRequire(import.meta.url)('../interface/static/js/step-converter.js');
function fixture(){
    const positions=[[0,-.127,0,10,-.127,1.6,0,-20.127,1.6],[1,-3.127,1.6,2,-3.127,1.6,1,-4.127,2]];
    const meshes=positions.map(array=>({attributes:{position:{array},normal:{array:[0,0,1,0,0,1,0,0,1]}},index:{array:[0,1,2]},brep_faces:[{first:0,last:0,color:null}]}));
    return {success:true,meshes,root:{name:'',meshes:[],children:[{name:'Board~PCB',meshes:[0],children:[]},{name:'R1~package',meshes:[],children:[{name:'Vendor body',meshes:[1],children:[]}]},{name:'TopCopper~PCB',meshes:[0],children:[]}]}};
}
const design={dimensions:{layout_id:'a'.repeat(64),width:10,height:20,orientation:0,origin:[0,.127]},components:[{reference:'R1'}]};
test('browser converter handles nested component bodies and ignores duplicate copper exports',()=>{
    const converted=convertStepMesh(fixture(),design,'board.step'),parts=stepArrays(converted.binary,converted.manifest);
    assert.deepEqual(parts.map(p=>p.reference),['Board','R1']);assert.equal(converted.manifest.component_count,1);assert.deepEqual(converted.manifest.missing_references,[]);
    assert.deepEqual([...parts[1].index],[0,2,1]);assert.equal(parts[1].position[0],1);assert.equal(parts[1].position[1],3);
});
test('wrong substrate dimensions cannot be silently scaled to fit',()=>{
    assert.throws(()=>convertStepMesh(fixture(),{...design,dimensions:{...design.dimensions,width:11}},'other.step'));
});
test('missing substrate and duplicate references are rejected',()=>{
    const a=fixture();a.root.children.shift();assert.throws(()=>convertStepMesh(a,design,'x.step'));
    const b=fixture();b.root.children.push(b.root.children[1]);assert.throws(()=>convertStepMesh(b,design,'x.step'));
});
test('unidentified solids cannot be assigned to a guessed component',()=>{
    const r=fixture();r.root.children[1].name='Unknown';assert.throws(()=>convertStepMesh(r,design,'x.step'));
});
test('missing component geometry is reported explicitly and original inputs are not rewritten',()=>{
    const r=fixture(),d={...design,components:[...design.components,{reference:'R2'}]},before=JSON.stringify(r);
    const {manifest}=convertStepMesh(r,d,'x.step');assert.deepEqual(manifest.missing_references,['R2']);assert.equal(JSON.stringify(r),before);
});
