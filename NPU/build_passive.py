import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

import numpy as np


def export(folder):
    import onnx
    from onnx import helper, numpy_helper, TensorProto
    weights = dict(np.load(folder / 'cpu_weights.npz'))
    nodes, tensors = [], []
    previous = 'Z'
    for index in range(3):
        w, b = 'W' + str(index), 'b' + str(index)
        tensors.extend([numpy_helper.from_array(weights[w].astype(np.float32), w), numpy_helper.from_array(weights[b].astype(np.float32), b)])
        output = 'fault_logits' if index == 2 else 'linear_' + str(index)
        nodes.append(helper.make_node('Gemm', [previous, w, b], [output], transB=1))
        if index < 2:
            previous = 'relu_' + str(index)
            nodes.append(helper.make_node('Relu', [output], [previous]))
    graph = helper.make_graph(nodes, 'passive_ranker', [helper.make_tensor_value_info('Z', TensorProto.FLOAT, [1, 470])],
                              [helper.make_tensor_value_info('fault_logits', TensorProto.FLOAT, [1, len(weights['b2'])])], tensors)
    model = helper.make_model(graph, opset_imports=[helper.make_opsetid('', 11)], producer_name='probe')
    model.ir_version = 7
    onnx.checker.check_model(model)
    onnx.save(model, str(folder / 'ranker_npu.onnx'))


def compile_model(folder, executable):
    with tempfile.TemporaryDirectory(prefix='probe_npu_') as directory:
        work = Path(directory)
        shutil.copy2(folder / 'ranker_npu.onnx', work / 'ranker.onnx')
        stages = [('parse', 'parsed'), ('optimize', 'optimized'), ('quantize', 'quantized'), ('adapt', 'adapted'), ('generate', 'generated')]
        previous = None
        for stage, output in stages:
            target = work / output
            values = dict(jr_path=target.as_posix(), log_path=(work / ('tmp_' + stage)).as_posix())
            if stage == 'parse':
                values.update(net_name='ranker', framework='onnx', network=(work / 'ranker.onnx').as_posix(), target='zhuge',
                              inputs='1,470', inputs_layout='FD', inputs_dtype='fp32', pre_method='nop', pre_scale='nop', pre_mean='nop', channel_swap='nop')
            else:
                values.update(json=str(previous.with_suffix('.json')).replace('\\', '/'), raw=str(previous.with_suffix('.raw')).replace('\\', '/'))
                if stage in ('optimize', 'quantize', 'adapt'):
                    values['target'] = 'zhuge'
                if stage == 'quantize':
                    values['qdtype'] = 'fp16'
            config = work / (stage + '.toml')
            config.write_text('[' + stage + ']\n' + '\n'.join(key + ' = ' + json.dumps(value) for key, value in values.items()) + '\n', encoding='utf-8')
            subprocess.run([str(executable), stage, str(config)], cwd=work, check=True)
            if stage != 'generate':
                previous = target / ('ranker_' + output)
        candidates = list((work / 'generated').glob('*ZG*.json'))
        if len(candidates) != 1:
            raise ValueError('NPU生成结果错误')
        graph = json.loads(candidates[0].read_text(encoding='utf-8'))
        ops = [op for op in graph['ops'] if op['_type_key'] not in ('icraft::xir::Input', 'icraft::xir::Output')]
        if not ops or any(op['_type_key'] != 'icraft::xir::HardOp' or op.get('compile_target') != '@zhuget(330)' for op in ops):
            raise ValueError('NPU算子部署错误')
        out = folder / 'compiled'
        out.mkdir(exist_ok=True)
        for suffix in ('.json', '.raw'):
            shutil.copy2(candidates[0].with_suffix(suffix), out / ('ranker_ZG' + suffix))
        binding = dict(weights_sha256=hashlib.sha256((folder / 'cpu_weights.npz').read_bytes()).hexdigest(),
                       sha256={p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in (out / 'ranker_ZG.json', out / 'ranker_ZG.raw')})
        (out / 'binding.json').write_text(json.dumps(binding, indent=2), encoding='utf-8')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', type=Path, default=Path(__file__).resolve().parents[1] / 'CPU/悟净/主程序8013/probe_system/unpowered_ai/model')
    parser.add_argument('--compile', action='store_true')
    parser.add_argument('--icraft', default=shutil.which('icraft') or 'icraft')
    args = parser.parse_args()
    export(args.model)
    if args.compile:
        compile_model(args.model, args.icraft)


if __name__ == '__main__':
    main()
