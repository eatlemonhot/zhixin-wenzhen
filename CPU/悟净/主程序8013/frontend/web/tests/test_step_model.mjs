import assert from 'node:assert/strict';
import {test} from 'node:test';
import fs from 'node:fs';
import crypto from 'node:crypto';
import * as T from '../interface/static/js/vendor/three.module.js';
import {selectStepModel,stepPose,stepArrays} from '../interface/static/js/step-model-geometry.js';
import {fixtureDatum,boardPlacement,rotateBoardPoint,fixturePoint} from '../interface/static/js/fixture-geometry.js';
const dir=new URL('../interface/static/models/boards/',import.meta.url),catalog=JSON.parse(fs.readFileSync(new URL('catalog.json',dir))),entry=Object.values(catalog.models)[0];
const meta=JSON.parse(fs.readFileSync(new URL(entry.manifest.replace('boards/',''),dir))),raw=fs.readFileSync(new URL(entry.manifest.replace('boards/','').replace('model.json','meshes.bin'),dir));
const buffer=raw.buffer.slice(raw.byteOffset,raw.byteOffset+raw.byteLength),d={layout_id:entry.layout_id,dimensions:{width:entry.width_mm,height:entry.height_mm,orientation:0}};
const datum=fixtureDatum(JSON.parse(fs.readFileSync(new URL('../interface/static/models/fixture.json',import.meta.url))));
const close=(a,b)=>assert.ok(Math.abs(a-b)<1e-7,`${a} != ${b}`);
test('model binds to exact project fingerprint; equal size alone never matches',()=>{
    assert.equal(selectStepModel(catalog,d),entry);
    assert.equal(selectStepModel(catalog,{...d,layout_id:'a'.repeat(64)}),null);
    assert.throws(()=>selectStepModel(catalog,{...d,dimensions:{...d.dimensions,width:50}}));
});
test('all 72 exported references are unique, with one board and no omitted references',()=>{
    const refs=meta.parts.filter(p=>p.kind==='component').map(p=>p.reference);
    assert.equal(refs.length,72);assert.equal(new Set(refs).size,72);assert.equal(meta.parts.filter(p=>p.kind==='board').length,1);assert.deepEqual(meta.missing_references,[]);
    for(const ref of ['R1','LED2','U3','DC1','SW1','C20'])assert.ok(refs.includes(ref));
});
test('binary checksum, bounds and vertex/index/material coverage are intact',()=>{
    assert.equal(crypto.createHash('sha256').update(raw).digest('hex'),meta.binary_sha256);
    const parts=stepArrays(buffer,meta);assert.equal(parts.length,73);
    assert.equal(parts.reduce((sum,p)=>sum+p.index.length/3,0),319922);
    for(const p of parts){for(let i=0;i<p.position.length;i++)assert.ok(p.position[i]>=p.bounds.min[i%3]-.00002&&p.position[i]<=p.bounds.max[i%3]+.00002);}
});
test('STEP affine pose agrees with PCB pad/path coordinates at every board direction and offset',()=>{
    for(const orientation of [0,90,180,270]){
        const dims={...d.dimensions,orientation},placement=boardPlacement(dims,datum,{x:2,y:3}),pose=stepPose(dims,placement),group=new T.Group();
        group.position.set(pose.x,pose.y,pose.z);group.rotation.z=pose.angle;group.scale.set(1,pose.scaleY,1);group.updateMatrixWorld(true);
        for(const [x,y,z] of [[0,0,0],[64.143636,7.62,1.6],[12,80,14.2],[100,100,-2]]){
            const actual=new T.Vector3(x,y,z).applyMatrix4(group.matrixWorld),expected=fixturePoint(...rotateBoardPoint(x,y,dims),placement);
            close(actual.x,expected[0]);close(actual.y,expected[1]);close(actual.z,placement.z+z);
        }
    }
});
test('substrate retains its CAD edge inset and original thickness; body heights are never scaled',()=>{
    const board=meta.parts.find(p=>p.kind==='board');close(board.bounds.min[0],.01270002540005);close(board.bounds.min[1],.012700279401);
    close(meta.board_thickness_mm,1.600050800102);
    const pose=stepPose(d.dimensions,boardPlacement(d.dimensions,datum));assert.equal(pose.scaleY,-1);
});
test('truncated buffers, invalid offsets and bad triangle indices are rejected',()=>{
    assert.throws(()=>stepArrays(buffer.slice(0,-4),meta));
    const invalid=structuredClone(meta);invalid.parts[0].position.offset=1;assert.throws(()=>stepArrays(buffer,invalid));
    const broken=buffer.slice(0),index=meta.parts[0].index;new Uint32Array(broken,index.offset,index.count)[0]=0xffffffff;
    assert.throws(()=>stepArrays(broken,meta));
});
