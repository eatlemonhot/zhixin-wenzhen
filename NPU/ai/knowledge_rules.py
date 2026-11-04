import numpy as np

def apply(label,pred,rules):
    out=np.array(pred,copy=True)
    if label in rules:
        # C1-open disconnects the only signal path into AMP1. R5-open
        # disconnects AMP1 from AMP2. The simulated 1G leakage path is
        # bounded by <1e-5 transfer; keep remaining port responses intact.
        indices=[i for i in range(36) if label!=7 or i%18>=6]
        out[...,indices,0:2]=0.
    return out

class KnowledgeBank:
    def __init__(self,base,rules):self.base=base;self.rules=tuple(rules)
    def predict(self,label,ref,factor):return apply(label,self.base.predict(label,ref,factor),self.rules)
    def curves(self,ref):return [(grid,apply(i,pred,self.rules)) for i,(grid,pred) in enumerate(self.base.curves(ref))]
