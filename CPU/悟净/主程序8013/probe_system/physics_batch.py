import math
import numpy as np


class PreparedBatch:
    def __init__(self, actions):
        self.actions = actions
        self.compatible = all(p.unknown == actions[0].unknown for p in actions)
        if not self.compatible:
            return
        self.matrix = np.stack([p.matrix for p in actions])
        self.rhs = np.stack([p.rhs for p in actions])
        self.voltage = np.stack([p.voltage for p in actions])
        self.inverse = np.stack([p.inverse for p in actions])
        self.frequency = np.array([p.frequency for p in actions])
        self.branch_cache = {}
        self.ports = [actions[0].index['$H'+key] for key in ('A','B','C')]

    def _features(self, voltage):
        a,b,c = (voltage[:,i] for i in self.ports)
        if np.any(abs(a) < 1e-15):
            raise self.actions[0].solver.NetworkError('参考相量过小，不能计算比值')
        result = np.column_stack(((c/a).real,(c/a).imag,np.zeros(len(a)),np.zeros(len(a)),(b/a).real,(b/a).imag))
        if not np.isfinite(result).all():
            raise self.actions[0].solver.NetworkError('特征包含非有限值')
        return result

    def evaluate(self, event=None, factor=1.):
        if not self.compatible:
            return np.array([p.evaluate(event,factor) for p in self.actions])
        if not event or event['mode'] == 'normal':
            return self._features(self.voltage)
        ref,mode = event['ref'],event['mode']
        if ref not in self.branch_cache:
            if len(self.branch_cache)>=4:self.branch_cache.clear()
            rows = [p.branches[ref] for p in self.actions]
            vectors = np.stack([row[2] for row in rows])
            response = np.einsum('aij,aj->ai',self.inverse,vectors)
            right = np.einsum('ai,aij->aj',vectors,self.inverse)
            self.branch_cache[ref] = (rows[0][0],np.array([row[1] for row in rows]),
                vectors,np.array([row[3] for row in rows]),response,right,
                np.einsum('ai,aj->aij',vectors,vectors),np.einsum('ai,aj->aij',response,right))
        part,old_y,vector,boundary,response,right,stamp,inverse_stamp = self.branch_cache[ref]
        if mode in ('low','high'):
            if type(factor) not in (int,float) or not math.isfinite(factor) or factor <= 0:
                raise self.actions[0].solver.NetworkError('参数比例必须为有限正数')
            value = part['value']*factor
            new_y = 1./value if part['kind']=='R' else 2j*np.pi*self.frequency*value
        elif mode == 'open':
            new_y = 0j
        elif mode == 'short':
            new_y = 10.
        else:
            raise self.actions[0].solver.NetworkError('不支持该故障模式')
        delta = new_y-old_y
        denominator = 1.+delta*np.sum(vector*response,axis=1)
        if np.any(abs(denominator)<1e-10):
            return np.array([p.evaluate(event,factor) for p in self.actions])
        coefficient = delta/denominator
        voltage = self.voltage-(coefficient*(np.sum(vector*self.voltage,axis=1)+boundary))[:,None]*response
        inverse = self.inverse-coefficient[:,None,None]*inverse_stamp
        matrix = self.matrix+delta[:,None,None]*stamp
        rhs = self.rhs-(delta*boundary)[:,None]*vector
        absolute = abs(matrix)
        scales = np.max(absolute,axis=2)
        if np.any(scales==0) or not all(np.isfinite(array).all() for array in (matrix,rhs,voltage,inverse)):
            return np.array([p.evaluate(event,factor) for p in self.actions])
        norm = np.max(np.sum(absolute,axis=2),axis=1)
        condition = np.max(np.sum(absolute/scales[:,:,None],axis=2),axis=1)*np.max(np.sum(abs(inverse)*scales[:,None,:],axis=2),axis=1)
        residual = np.max(abs(np.einsum('aij,aj->ai',matrix,voltage)-rhs),axis=1)
        divisor = norm*np.max(abs(voltage),axis=1)+np.max(abs(rhs),axis=1)
        error = np.divide(residual,divisor,out=np.zeros_like(residual),where=divisor!=0)
        bad = (condition>1e10)|(~np.isfinite(condition))|(error>1e-10)|(~np.isfinite(error))
        result = self._features(voltage)
        for index in np.flatnonzero(bad):
            result[index] = self.actions[index].evaluate(event,factor)
        return result
