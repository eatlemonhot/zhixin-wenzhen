import copy
import math
import numpy as np


class PreparedAction:

    def __init__(self, model, frequency, source_peak, solver):
        self.model = copy.deepcopy(model)
        self.frequency = frequency
        self.source_peak = source_peak
        self.solver = solver
        self.known = solver.validate_model(model)
        self.unknown = [node for node in model['nodes'] if node not in self.known]
        self.index = {node: i for i, node in enumerate(self.unknown)}
        size = len(self.unknown)
        self.matrix = np.zeros((size, size), dtype=np.complex128)
        self.rhs = np.zeros(size, dtype=np.complex128)
        self.branches = {}
        self.fallbacks = 0
        for part in model['elements']:
            y = self.admittance(part['kind'], part['value'])
            vector = np.zeros(size, dtype=np.complex128)
            boundary = 0j
            for node, sign in ((part['a'], 1), (part['b'], -1)):
                if node in self.index:
                    vector[self.index[node]] += sign
                else:
                    boundary += sign * self.known[node]
            self.matrix += y * np.outer(vector, vector)
            self.rhs -= y * vector * boundary
            self.branches[part['id']] = (part, y, vector, boundary)
        scales = np.max(abs(self.matrix), axis=1)
        if np.any(scales == 0):
            raise solver.NetworkError('节点方程有零行')
        balanced = self.matrix / scales[:, None]
        try:
            # 行均衡，联立求出电压与逆作用，后续不重复逐列Python回代。
            result = np.linalg.solve(balanced, np.column_stack((self.rhs / scales, np.eye(size))))
        except np.linalg.LinAlgError as exc:
            raise solver.NetworkError('节点方程奇异') from exc
        self.voltage = result[:, 0]
        self.inverse = result[:, 1:] / scales[None, :]
        self._quality(self.matrix, self.rhs, self.voltage, self.inverse)

    def admittance(self, kind, value):
        return 1. / value if kind == 'R' else 2j * math.pi * self.frequency * value

    def _quality(self, matrix, rhs, voltage, inverse):
        if not all(np.isfinite(array).all() for array in (matrix, rhs, voltage, inverse)):
            raise self.solver.NetworkError('方程出现非有限值')
        scales = np.max(abs(matrix), axis=1)
        if np.any(scales == 0):
            raise self.solver.NetworkError('节点方程有零行')
        condition = float(np.linalg.norm(matrix / scales[:, None], np.inf) *
                          np.linalg.norm(inverse * scales[None, :], np.inf))
        denominator = np.linalg.norm(matrix, np.inf) * np.max(abs(voltage)) + np.max(abs(rhs))
        error = float(np.max(abs(matrix @ voltage - rhs)) / denominator) if denominator else 0.
        if not math.isfinite(condition) or condition > 1e10 or not math.isfinite(error) or error > 1e-10:
            raise self.solver.NetworkError('节点方程条件数或后向误差超过门限')

    def _features(self, voltage):
        values = dict(self.known)
        values.update(zip(self.unknown, voltage))
        a, b, c = [values['$H' + key] * self.source_peak for key in ('A', 'B', 'C')]
        if abs(a) < 1e-15:
            raise self.solver.NetworkError('参考相量过小，不能计算比值')
        result = np.array([(c / a).real, (c / a).imag, 0., 0., (b / a).real, (b / a).imag])
        if not np.isfinite(result).all():
            raise self.solver.NetworkError('特征包含非有限值')
        return result

    def evaluate(self, event=None, factor=1.):
        if not event or event['mode'] == 'normal':
            return self._features(self.voltage)
        part, old_y, vector, boundary = self.branches[event['ref']]
        mode = event['mode']
        if mode in ('low', 'high'):
            if type(factor) not in (int, float) or not math.isfinite(factor) or factor <= 0:
                raise self.solver.NetworkError('参数比例必须为有限正数')
            new_kind, new_value = part['kind'], part['value'] * factor
            new_y = self.admittance(new_kind, new_value)
        elif mode == 'open':
            new_y = 0j
        elif mode == 'short':
            new_kind, new_value, new_y = 'R', .1, 10.
        else:
            raise self.solver.NetworkError('不支持该故障模式')
        delta = new_y - old_y
        matrix = self.matrix + delta * np.outer(vector, vector)
        rhs = self.rhs - delta * vector * boundary
        try:
            response = self.inverse @ vector
            denominator = 1. + delta * (vector @ response)
            if abs(denominator) < 1e-10:
                raise self.solver.NetworkError('秩一更新接近奇异')
            coefficient = delta / denominator
            voltage = self.voltage - coefficient * response * (vector @ self.voltage + boundary)
            inverse = self.inverse - coefficient * np.outer(response, vector @ self.inverse)
            self._quality(matrix, rhs, voltage, inverse)
            return self._features(voltage)
        except self.solver.NetworkError:
            self.fallbacks += 1
            changed = copy.deepcopy(self.model)
            changed['elements'] = [p for p in changed['elements'] if not (mode == 'open' and p['id'] == part['id'])]
            if mode != 'open':
                next(p for p in changed['elements'] if p['id'] == part['id']).update(kind=new_kind, value=new_value)
            result = self.solver.solve_frequency(changed, self.frequency)
            return self._features(np.array([complex(*result['transfer_real_imag'][node]) for node in self.unknown]))
