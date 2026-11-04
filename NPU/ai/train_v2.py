import os
for _key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[_key]='1'
from pathlib import Path
import argparse,copy,time
import numpy as np
import torch
from torch import nn
from model_spec import *

class Net(nn.Module):
    def __init__(self):
        super().__init__();self.layers=nn.Sequential(nn.Linear(FEATURES,512),nn.ReLU(),nn.Linear(512,256),nn.ReLU(),nn.Linear(256,26))
    def forward(self,x):return self.layers(x)

def histories(path,family,repeats,rng):
    data=dict(np.load(path));rows=[];labels=[];groups=[];counts=[]
    ids=np.flatnonzero(data['family']==family)
    for index in ids:
        ref_index=int(data['reference_index'][index]);raw=data['statistics'][index];normal=data['statistics'][ref_index]
        for repeat in range(repeats):
            obs,_=sampled(raw,rng,16,linear=family!='B');ref,_=sampled(normal,rng,256,linear=family!='B');mask=np.zeros(N,bool)
            from action_policy import policy
            ap=policy(family);eligible=[i for i in ap["allowed"] if i not in ap["reserve"]];maximum=len(eligible)
            count=maximum if repeat%3==0 else min(maximum,int(rng.choice([6,10,14,18,22,30])))
            initial=[2,8,14,20,26,32];rest=[i for i in eligible if i not in initial]
            order=np.r_[initial,rng.permutation(rest)] if repeat%2 else rng.permutation(eligible)
            mask[order[:count]]=True
            rows.append(encode(family,obs,ref,mask));labels.append(int(data['label'][index]));groups.append(int(data['group'][index]));counts.append(count)
        if (len(labels)//repeats)%26==0:print('AUGMENTED',family,'states',len(labels)//repeats,'histories',len(labels),flush=True)
    return np.array(rows,np.float32),np.array(labels,np.int64),np.array(groups),np.array(counts)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--family',choices=FAMILIES,required=True);parser.add_argument('--epochs',type=int,default=240);parser.add_argument('--out',type=Path,required=True)
    parser.add_argument('--train',type=Path,default=ROOT/'train_physics_01/physics.npz');parser.add_argument('--validation',type=Path,default=ROOT/'validation_physics_01/physics.npz')
    args=parser.parse_args();args.out.mkdir(parents=True,exist_ok=False)
    torch.set_num_threads(4);torch.manual_seed(2026102607);torch.backends.cuda.matmul.allow_tf32=False;torch.backends.cudnn.allow_tf32=False
    rng=np.random.default_rng(2026102607);start=time.perf_counter()
    x,y,groups,counts=histories(args.train,args.family,192,rng)
    v,t,vg,vc=histories(args.validation,args.family,32,rng)
    assert not set(groups)&set(vg)
    np.savez_compressed(args.out/'validation_histories.npz',F=v,label=t,group=vg,count=vc)
    mean=x.mean(0);inv=1/np.maximum(x.std(0),.003);x=(x-mean)*inv;v=(v-mean)*inv
    device='cuda' if torch.cuda.is_available() else 'cpu';print('HISTORIES',args.family,len(x),len(v),'DEVICE',device,flush=True)
    tx=torch.from_numpy(x).to(device);ty=torch.from_numpy(y).to(device);vx=torch.from_numpy(v).to(device);vt=torch.from_numpy(t).to(device)
    net=Net().to(device);optimizer=torch.optim.AdamW(net.parameters(),lr=.001,weight_decay=.0003)
    scheduler=torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer,patience=8,factor=.5,min_lr=1e-5)
    best=None;best_loss=float('inf');stale=0;history=[]
    for epoch in range(1,args.epochs+1):
        net.train()
        for ids in torch.randperm(len(tx),device=device).split(1024):
            logits=net(tx[ids]);loss=nn.functional.cross_entropy(logits,ty[ids]);optimizer.zero_grad(set_to_none=True);loss.backward();optimizer.step()
        net.eval()
        with torch.no_grad():vl=float(nn.functional.cross_entropy(net(vx),vt))
        scheduler.step(vl);history.append(dict(epoch=epoch,validation_loss=vl))
        if vl<best_loss-1e-5:best_loss=vl;best=copy.deepcopy(net.state_dict());best_epoch=epoch;stale=0
        else:stale+=1
        if epoch==1 or epoch%20==0:print('EPOCH',args.family,epoch,'VAL',round(vl,5),'SECONDS',round(time.perf_counter()-start,1),flush=True)
        if epoch>=100 and stale>=40:break
    net.load_state_dict(best);net.cpu().eval()
    with torch.no_grad():logits=net(torch.from_numpy(v)).numpy()
    order=np.argsort(-logits,axis=1);metrics={}
    for count in sorted(set(vc.tolist())):
        mask=vc==count;metrics[str(count)]=dict(rows=int(mask.sum()),top1=float(np.mean(order[mask,0]==t[mask])),top3=float(np.mean(np.any(order[mask,:3]==t[mask,None],axis=1))))
    weights={}
    for j,index in enumerate((0,2,4)):
        weights['W'+str(j)]=net.layers[index].weight.detach().numpy();weights['b'+str(j)]=net.layers[index].bias.detach().numpy()
    np.savez_compressed(args.out/'cpu_weights.npz',**weights);np.savez_compressed(args.out/'normalization.npz',mean=mean,inv_std=inv)
    torch.save(net.state_dict(),args.out/'weights.pt')
    torch.onnx.export(net,torch.zeros(1,FEATURES),str(args.out/'ranker_npu.onnx'),input_names=['Z'],output_names=['fault_logits'],opset_version=11,dynamo=False)
    import onnx;onnx.checker.check_model(onnx.load(str(args.out/'ranker_npu.onnx')))
    dump(args.out/'history.json',history);dump(args.out/'interface.json',metadata(args.family))
    report=dict(completed=True,family=args.family,architecture=[470,512,256,26],parameters=sum(p.numel() for p in net.parameters()),
                train_histories=len(y),validation_histories=len(t),train_groups=sorted(set(map(int,groups))),validation_groups=sorted(set(map(int,vg))),
                best_epoch=best_epoch,validation_loss=best_loss,metrics=metrics,device=device,seconds=time.perf_counter()-start,
                test_data_read=False,calibration_data_read=False,NPU_executed=False,real_hardware=False,metadata=metadata(args.family))
    dump(args.out/'report.json',report);print('COMPLETE',args.family,metrics[str(max(metrics,key=int))],flush=True)
if __name__=='__main__':main()
