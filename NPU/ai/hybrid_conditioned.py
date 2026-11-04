from pathlib import Path
import json
from conditioned_bank import ConditionedBank
class HybridConditionedBank:
    def __init__(self,path,family,reference_phases=None,reference_amplitudes=None):
        assert family=='B';self.family=family;self.version=0;self.waves={'hybrid':True}
        self.selection=json.loads((Path(path)/'hybrid_selection.json').read_text())['labels']
        self.children={name:ConditionedBank(Path(path)/'components'/name,family,reference_phases,reference_amplitudes) for name in set(self.selection.values())}
    def set_phase(self,index,phases,frames=None):
        for child in self.children.values():child.set_phase(index,phases,frames)
        self.version+=1
    def predict(self,board,label,ref,factor):return self.children[self.selection[str(label)]].predict(board,label,ref,factor)
    def curves(self,board,ref):
        result={}
        for name,child in self.children.items():
            labels=[i for i in range(26) if self.selection[str(i)]==name]
            result.update(zip(labels,child.curves(board,ref,labels=labels)))
        return [result[i] for i in range(26)]
