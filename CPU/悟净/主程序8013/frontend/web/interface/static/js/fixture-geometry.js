/* 用于装夹预览的显示坐标，与PCB及电机坐标分开管理。 */
export function fixtureDatum(config) {
    const base=config.meshes[1].bounds,clip=config.meshes[0].bounds;
    const origin=base.min.map((v,i)=>i===2?base.max[2]:(v+base.max[i])/2);
    const slot=config.pcb_mount.opening_bounds_cad_mm;
    return {origin,slotMinX:slot.min[0]-origin[0],slotMaxX:slot.max[0]-origin[0],
        slotTopY:slot.max[1]-origin[1],planeZ:slot.max[2]-origin[2],
        clampInnerY:clip.max[1]-origin[1],clampOuterY:clip.min[1]-origin[1],
        railMinY:base.min[1]-origin[1],railMaxY:base.max[1]-origin[1]};
}
export function boardPlacement(dimensions,datum,offset={x:0,y:0}) {
    const turned=dimensions.orientation===90||dimensions.orientation===270;
    const width=turned?dimensions.height:dimensions.width;
    const height=turned?dimensions.width:dimensions.height;
    if(![width,height,offset.x,offset.y].every(Number.isFinite)||width<=0||height<=0)throw Error('三维装夹尺寸或偏移无效。');
    // PCB coordinates run right/down. The STEP view runs right/up. Keep the
    // installed board's upper-left corner at the fixed slot corner for all sizes.
    return {x:datum.slotMinX+offset.x,y:datum.slotTopY-offset.y,z:datum.planeZ,width,height};
}
export function fixturePoint(x,y,placement) {
    return [placement.x+x,placement.y-y];
}
export function clampPlacement(placement,datum) {
    return {x:0,y:placement.y-placement.height-datum.clampInnerY,z:0};
}
export function rotateBoardPoint(x,y,d) {
    switch(d.orientation){case 90:return[d.height-y,x];case 180:return[d.width-x,d.height-y];case 270:return[y,d.width-x];default:return[x,y];}
}
