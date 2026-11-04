from pathlib import Path
import json,hashlib
import numpy as np
from model_spec import CONTRACT,RS,VARIANTS,encode,ROOT,PREPROCESSING
from network_runtime import Model
from controller import diagnose

class Expert:
    def __init__(self,family,model_path,bank_path,compiled=None,backend='cpu'):
        self.family=family;self.model_path=Path(model_path);self.bank_path=Path(bank_path)
        self.interface=json.loads((self.model_path/'interface.json').read_text())
        if self.interface['feature_contract']!=CONTRACT or self.interface['Rs_ohm']!=list(RS) or self.interface['variant']!=VARIANTS[family]:
            raise ValueError('模型合同、Rs或器件版本不匹配')
        if self.interface.get('preprocessing_id','raw-delta-reference-v1')!=PREPROCESSING[family]:raise ValueError('CPU预处理与权重版本不匹配')
        self.model=Model(self.model_path,backend,compiled)
        self.calibration=json.loads((self.bank_path/'calibration.json').read_text())
        if self.calibration['feature_contract']!=CONTRACT or self.calibration['Rs_ohm']!=list(RS):raise ValueError('物理库合同不匹配')
        if family=='B':
            from action_policy import policy
            binding=json.loads((self.bank_path/'DEVICE_BUNDLE.json').read_text())
            sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
            if binding['variant']!=VARIANTS[family] or binding['action_policy']!=policy(family) or binding['neural_source_sha256']!=sha(self.model_path/'ranker_npu.onnx'):
                raise ValueError('B器件模型、CPU响应库或测量域不配套')
            for name,digest in binding['bank_files'].items():
                if sha(self.bank_path/name)!=digest:raise ValueError('CPU响应库文件已改变：'+name)

    def run(self,reference,reference_phases,reader,origin='simulation',emit=None,reference_amplitudes=None):
        if origin not in ('simulation','synthetic_test_vector'):
            raise ValueError('输入来源须为simulation或synthetic_test_vector。')
        start=len(self.model.calls)
        import native_ps
        native_start=native_ps.statistics()
        from controller_preserved import diagnose as preserved_diagnose
        def report(kind,**data):
            if kind=='analysis' and self.model.calls:
                call=self.model.calls[-1];data.update(neural_backend=call['backend'],NPU_executed=call['NPU_executed'],CPU_scores_used=call['CPU_scores_used'])
            if emit:emit(kind,**data)
        result=preserved_diagnose(self.family,reference,reference_phases,reader,self.model.probabilities,self.bank_path,self.calibration,emit=report if emit else None)
        calls=self.model.calls[start:]
        result.update(ps_compute=native_ps.evidence(native_start),variant=VARIANTS[self.family],origin=origin,NPU_executed=any(c['NPU_executed'] for c in calls),
                      neural_execution=dict(backend=self.model.backend,calls=calls,raw_NPU_precision_accepted=False),
                      source_format='Version-matched PL LSQ F6; no CPU redefinition of residual.',hardware_qualified=False)
        return result
