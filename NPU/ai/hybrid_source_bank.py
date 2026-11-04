import json
from pathlib import Path
from source_bank import Bank as Source
from physical_bank import Bank as Legacy

class Bank(Source):
    def predict(self,b,label,ref,factor):
        return super().predict(b,label,ref,factor) if label in self.use_new else self.legacy.predict(b,label,ref,factor)
    def curves(self,b,ref):
        import numpy as np
        from physical_bank import factor_bounds
        from model_spec import AB
        old=self.legacy.curves(b,ref)
        for label in self.use_new:
            lo,hi=factor_bounds(AB.CATALOGS[b][label]);grid=np.linspace(lo,hi,49) if lo!=hi else np.array([1.])
            old[label]=(grid,np.array([self.predict(b,label,ref,float(f)) for f in grid]))
        return old
    @classmethod
    def load(cls,path):
        path=Path(path);o=Source.load(path);o.__class__=cls;o.legacy=Legacy.load(path.parent/'legacy_physical_bank.npz')
        o.use_new=set(json.loads((path.parent/'source_amplitude_context.json').read_text())['use_new_labels']);return o
