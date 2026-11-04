'use strict';
const assert=require('node:assert/strict'),vm=require('node:vm'),fs=require('node:fs'),path=require('node:path');
const source=fs.readFileSync(path.join(__dirname,'../interface/static/js/main.js'),'utf8');
function harness(){
 const parent={offsetWidth:230,offsetHeight:230,hidden:false},picked=[];let p;
 const context=vm.createContext({window:{__probeWaveformLoading:true,pcbPadInteraction:{pick:id=>picked.push(id)}},document:{getElementById:()=>parent},setTimeout(){},p5:function(setup){p={width:230,height:230,PI:Math.PI,LEFT:'left',mouseButton:'left',resizeCanvas(){}};setup(p);return p;}});
 vm.runInContext(source,context);
 vm.runInContext(`layoutDimensions={width:100,height:100};layoutPads={pad:{id:'pad',shape:'rect',size_x:5,size_y:5,footprint_x:50,footprint_y:50,footprint_angle:0,pad_x:0,pad_y:0,is_allowed:true,net:'GND'}};Context2D.fitBoard();`,context);
 const move=(x,y)=>{p.mouseX=x;p.mouseY=y;};
 return {p,picked,parent,context,move};
}
let count=0;
function check(name,action){action();count++;console.log('ok',name);}
check('only a completed left click on a pad delegates once',()=>{const h=harness();h.move(115,115);h.p.mousePressed();assert.equal(h.picked.length,0);h.p.mouseReleased();assert.deepEqual(h.picked,['pad']);});
check('drag away and back over the same pad does not select',()=>{const h=harness();h.move(115,115);h.p.mousePressed();h.move(140,130);h.p.mouseDragged();h.move(115,115);h.p.mouseDragged();h.p.mouseReleased();assert.equal(h.picked.length,0);});
check('drag out of the canvas and back is also ignored',()=>{const h=harness();h.move(115,115);h.p.mousePressed();h.move(500,500);h.p.mouseDragged();h.move(115,115);h.p.mouseReleased();assert.equal(h.picked.length,0);});
check('right click, release-only, empty space and hidden views never select',()=>{for(const mode of ['right','release','empty','hidden']){const h=harness();h.move(mode==='empty'?20:115,mode==='empty'?20:115);if(mode==='right')h.p.mouseButton='right';if(mode==='hidden')h.parent.hidden=true;if(mode!=='release')h.p.mousePressed();h.p.mouseReleased();assert.equal(h.picked.length,0,mode);}});
check('release outside the canvas does not act on the initial pad',()=>{const h=harness();h.move(115,115);h.p.mousePressed();h.move(500,500);h.p.mouseReleased();assert.equal(h.picked.length,0);});
console.log(count+' actual pad gesture checks passed (no browser or hardware).');
