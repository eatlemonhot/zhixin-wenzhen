(function(){
 'use strict';
 function mount(){
  const get=id=>document.getElementById(id),panel=get('diagnosis-dashboard');if(!panel||panel.dataset.consoleMounted)return;panel.dataset.consoleMounted='1';
  const body=panel.querySelector('.dd-body'),card=get('dd-records');if(!body||!card)return;
  if(get('diagnostic-job-status'))(get('dd-alerts')||card).append(get('diagnostic-job-status'));
  if(get('diagnostic-setup-tools'))(get('dd-tools')||card).append(get('diagnostic-setup-tools'));
  for(const id of ['diagnostic-unpowered-files','diagnostic-export'])if(get(id))card.append(get(id));
  for(const id of ['diagnostic-plan-summary','diagnostic-events','diagnostic-result-summary'])if(get(id)){get(id).hidden=true;card.append(get(id));}
  for(const id of ['diagnostic-job-json','diagnostic-result'])if(get(id)){const details=get(id).closest('details');if(details){details.hidden=true;card.append(details);}}
  const clearance=get('diagnostic-clearance');if(clearance){
   const notice=document.createElement('div');notice.id='diagnostic-clearance-notice';notice.className='dd-clearance';notice.hidden=true;notice.style.display='none';
   const hint=document.createElement('span');hint.id='diagnostic-clearance-note';hint.textContent='请目视确认双针已离开板面，再继续测量。';
   clearance.style.whiteSpace='normal';notice.append(hint,clearance);panel.insertBefore(notice,body);
  }
  if(get('diagnostic-unpowered-cancel'))get('diagnostic-unpowered-cancel').hidden=true;
  get('diagnostic-published-report')?.remove();
  const controls=get('diagnostic-unpowered-controls');if(controls)for(const paragraph of controls.querySelectorAll(':scope>p'))paragraph.hidden=true;
 }
 window.DiagnosisConsoleLayout={mount};
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',mount,{once:true});else mount();
}());
