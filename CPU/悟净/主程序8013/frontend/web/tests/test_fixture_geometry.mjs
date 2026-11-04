import assert from 'node:assert/strict';
import {test} from 'node:test';
import fs from 'node:fs';
import {fixtureDatum,boardPlacement,fixturePoint,clampPlacement,rotateBoardPoint} from '../interface/static/js/fixture-geometry.js';
const config=JSON.parse(fs.readFileSync(new URL('../interface/static/models/fixture.json',import.meta.url)));
const datum=fixtureDatum(config),d={width:100,height:100,orientation:0};
const close=(a,b)=>assert.ok(Math.abs(a-b)<1e-8,`${a} != ${b}`);

test('fixed corner agrees with the marked STEP pocket, independent of the clamp',()=>{
    const p=boardPlacement(d,datum);
    close(p.x,-55.4981931843075);close(p.y,63.39819318430794);close(p.z,-2);
    assert.notEqual(p.y,datum.clampInnerY);
});
test('upper-left anchor stays fixed for different board widths and heights',()=>{
    const a=boardPlacement(d,datum);
    for(const [width,height] of [[80,50],[50,110],[120,30]]){
        const b=boardPlacement({...d,width,height},datum);
        assert.deepEqual([b.x,b.y],[a.x,a.y]);
    }
});
test('board extends right/down from the fixed corner into the base opening',()=>{
    const p=boardPlacement(d,datum);
    assert.deepEqual(fixturePoint(0,0,p),[p.x,p.y]);
    assert.deepEqual(fixturePoint(100,100,p),[p.x+100,p.y-100]);
    assert.ok(p.y-100>datum.railMinY);
});
test('rigid clamp inner edge follows the bottom of each board',()=>{
    for(const height of [30,50,100,120]){
        const p=boardPlacement({...d,height},datum),s=clampPlacement(p,datum);
        close(datum.clampInnerY+s.y,p.y-height);
        close((datum.clampInnerY+s.y)-(datum.clampOuterY+s.y),35);
        assert.deepEqual([s.x,s.z],[0,0]);
    }
});
test('width alone never shifts the fixed corner or clamp',()=>{
    const a=boardPlacement(d,datum),b=boardPlacement({...d,width:60},datum);
    assert.deepEqual(clampPlacement(a,datum),clampPlacement(b,datum));
    close(fixturePoint(60,0,b)[0],a.x+60);
});
test('90/270 degrees exchange dimensions and reposition the clamp, keeping the corner',()=>{
    const r={width:80,height:50,orientation:0},a=boardPlacement(r,datum);
    for(const orientation of [90,270]){
        const b=boardPlacement({...r,orientation},datum);
        assert.deepEqual([b.width,b.height],[50,80]);
        assert.deepEqual([b.x,b.y],[a.x,a.y]);
        close(clampPlacement(b,datum).y-clampPlacement(a,datum).y,-30);
    }
});
test('selection and pre-rotated plan use the same display transform at all orientations',()=>{
    const expected={0:[10,20],90:[30,10],180:[70,30],270:[20,70]};
    for(const orientation of [0,90,180,270]){
        const dims={width:80,height:50,orientation},p=boardPlacement(dims,datum);
        const pad=rotateBoardPoint(10,20,dims),plan=expected[orientation];
        assert.deepEqual(pad,plan);
        assert.deepEqual(fixturePoint(...pad,p),fixturePoint(...plan,p));
    }
});
test('positive manual offsets move right/down, and clamp follows the new lower edge',()=>{
    const a=boardPlacement(d,datum),b=boardPlacement(d,datum,{x:2,y:3});
    close(b.x,a.x+2);close(b.y,a.y-3);
    close(clampPlacement(b,datum).y-clampPlacement(a,datum).y,-3);
});
test('display assembly leaves source dimensions and STEP metadata untouched',()=>{
    const before=JSON.stringify({d,config});
    const p=boardPlacement(d,datum);fixturePoint(20,30,p);clampPlacement(p,datum);
    assert.equal(JSON.stringify({d,config}),before);
});
test('rejects invalid sizes and offsets',()=>{
    for(const width of [NaN,Infinity,0,-1])assert.throws(()=>boardPlacement({...d,width},datum));
    assert.throws(()=>boardPlacement(d,datum,{x:Infinity,y:0}));
});
