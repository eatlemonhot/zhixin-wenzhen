/* Optional offline importer. The webpage uses the same converter in a Worker. */
const fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
const {convertStepMesh}=require('../interface/static/js/step-converter.js');
function arg(name){const i=process.argv.indexOf('--'+name);if(i<0||!process.argv[i+1])throw Error('Missing --'+name);return path.resolve(process.argv[i+1]);}
const digest=b=>crypto.createHash('sha256').update(b).digest('hex');
async function main(){
 const step=arg('step'),design=JSON.parse(fs.readFileSync(arg('design'),'utf8')),output=arg('output');
 const raw=fs.readFileSync(step),occt=await require(arg('occt-module'))();
 const result=occt.ReadStepFile(raw,{linearUnit:'millimeter',linearDeflectionType:'absolute_value',linearDeflection:.035,angularDeflection:.3});
 const {manifest,binary}=convertStepMesh(result,design,path.basename(step)),bytes=Buffer.from(binary);
 manifest.source_sha256=digest(raw);manifest.binary_sha256=digest(bytes);
 fs.mkdirSync(output,{recursive:true});fs.writeFileSync(path.join(output,'meshes.bin'),bytes);fs.writeFileSync(path.join(output,'model.json'),JSON.stringify(manifest,null,2)+'\n');
 console.log(JSON.stringify({output,components:manifest.component_count,missing:manifest.missing_references,bytes:bytes.length}));
}
main().catch(e=>{console.error(e.message);process.exitCode=1;});
