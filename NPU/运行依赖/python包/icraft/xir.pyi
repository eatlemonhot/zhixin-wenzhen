"""
icraft xir python interface
"""
from __future__ import annotations
import io
import typing
__all__ = ['ACos', 'ACosh', 'ASin', 'ASinh', 'ATan', 'ATanh', 'Abs', 'Add', 'AlignAxis', 'AlignedUnit', 'Anycards', 'AnycardsPattern', 'Argmax', 'Argmin', 'AttrPattern', 'AvgPool1d', 'AvgPool2d', 'AvgPool3d', 'Avgpool', 'AxisName', 'AxisUnit', 'BICUBIC', 'BILINEAR', 'BaseQuantizedType', 'BatchNorm1d', 'BatchNorm2d', 'BatchNorm3d', 'Batchnorm', 'Bool', 'BoolType', 'BuildTime', 'BuyiTarget', 'CAFFE', 'CIRCULAR', 'CONSTANT', 'CalibratedType', 'Cast', 'ChannelShuffle', 'ChunkMem', 'ClampScalar', 'CommitID', 'CommitSinceTag', 'CompileTarget', 'Concat', 'Conv1d', 'Conv1dTranspose', 'Conv2d', 'Conv2dTranspose', 'Conv3d', 'Conv3dTranspose', 'ConvTranspose1d', 'ConvTranspose2d', 'ConvTranspose3d', 'Copy', 'Cos', 'Cosh', 'CustomTarget', 'DARKNET', 'Data', 'DataType', 'DistrUnvalidValue', 'Div', 'DivideScalar', 'ELU', 'Einsum', 'Elu', 'Equal', 'Error', 'ExpQuantizedScale', 'ExpQuantizedScaleArray', 'Expand', 'ExternalMem', 'FLOOR', 'FPGATarget', 'FloatImm', 'FloatType', 'Framework', 'FullVersion', 'GELU', 'Gelu', 'Greater', 'GreaterEqual', 'HardOp', 'Hardshrink', 'Hardsigmoid', 'Hardswish', 'Hardtanh', 'HostMem', 'HostTarget', 'ICRAFT_REGISTER_PASS', 'INTER_LINEAR', 'INTER_NEAREST', 'Input', 'InstanceNorm1d', 'InstanceNorm2d', 'InstanceNorm3d', 'IntImm', 'IntegerType', 'InternalError', 'Interpolation', 'IsModified', 'IsOp', 'IsOptionalOp', 'LayerNorm', 'Layernorm', 'Layout', 'Less', 'LessEqual', 'Log', 'LogSigmoid', 'LogSoftmax', 'MainVersion', 'MajorVersionNum', 'Matmul', 'Max', 'MaxPool1d', 'MaxPool2d', 'MaxPool3d', 'Maximum', 'Maxpool', 'Mean', 'MemType', 'MergedAxisDistr', 'Min', 'Minimum', 'MinorVersionNum', 'Mish', 'Mode', 'Multiply', 'NEAREST', 'NONE', 'Neg', 'Network', 'NetworkBase', 'NetworkPass', 'NetworkRewriter', 'NetworkView', 'Normalize', 'NormalizedQuantizedType', 'NormalizedType', 'NormratioArray', 'NotEqual', 'ONNX', 'ObjectRef', 'OnChipMem', 'OpPattern', 'Operation', 'OptionalOpPattern', 'OrPattern', 'Output', 'PATTERN_REQUIRE', 'PReLU', 'PYTORCH', 'Pad', 'PaddingMode', 'Params', 'Pass', 'PassContext', 'PassInfo', 'PatchVersionNum', 'Pattern', 'PixelShuffle', 'Prelu', 'PruneAxis', 'QuantizedScale', 'QuantizedScaleArray', 'QuantizedType', 'REFLECT', 'REFLECTION', 'REPLICATE', 'REPLICATION', 'ReLU', 'Relu', 'Reshape', 'Resize', 'ResizeInterpolation', 'Roll', 'RoundingMode', 'SYMMETRIC', 'ScalarImm', 'ScalarType', 'Semantics', 'SequentialPass', 'SiLU', 'Sigmoid', 'Silu', 'Sin', 'Sinh', 'Slice', 'Softmax', 'Softplus', 'Softshrink', 'Softsign', 'Split', 'Sqrt', 'Squeeze', 'Stack', 'String', 'Sum', 'SwapOrder', 'TENSORFLOW', 'TRUNC', 'Tan', 'Tanh', 'Tanhshrink', 'TensorType', 'Transpose', 'Unstack', 'Upsample', 'Value', 'ValuePattern', 'ValueUsesInfo', 'WL30S', 'WL340', 'Where', 'Wildcard', 'WolongTarget', 'WolongTarget_Chips', 'ZERO', 'ZEROS', 'ZG30S', 'ZG330', 'ZG340', 'ZhugeTarget', 'ZhugeTarget_Chips']
class ACos(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ACosNode'
    @staticmethod
    def Init() -> ACos:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ACos:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class ACosh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ACoshNode'
    @staticmethod
    def Init() -> ACosh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ACosh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class ASin(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ASinNode'
    @staticmethod
    def Init() -> ASin:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ASin:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class ASinh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ASinhNode'
    @staticmethod
    def Init() -> ASinh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ASinh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class ATan(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ATanNode'
    @staticmethod
    def Init() -> ATan:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ATan:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class ATanh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ATanhNode'
    @staticmethod
    def Init() -> ATanh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ATanh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Abs(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::AbsNode'
    @staticmethod
    def Init() -> Abs:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Abs:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Add(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::AddNode'
    @staticmethod
    def Init() -> Add:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value, alpha: ScalarImm, beta: ScalarImm) -> None:
        """
        					构造函数（兼容标量输入）
        					:param	lhs:		左操作数
        					:param	rhs:		右操作数
        					:param	alpha:		左操作数的系数
        					:param	beta:		右操作数的系数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs:		左操作数
        					:param	rhs:		右操作数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value, alpha: list[ScalarImm], beta: list[ScalarImm]) -> None:
        """
        					构造函数
        					:param	lhs:		左操作数
        					:param	rhs:		右操作数
        					:param	alpha:		左操作数的系数
        					:param	beta:		右操作数的系数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Add:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def alpha(self) -> list[ScalarImm]:
        """
        左操作数的系数
        """
    @property
    def beta(self) -> list[ScalarImm]:
        """
        右操作数的系数
        """
class AlignAxis(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::AlignAxisNode'
    @staticmethod
    def Init() -> AlignAxis:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, aligned_units: list[AlignedUnit]) -> None:
        """
        					构造函数
        					:param	input:			输入
        					:param	aligned_units:	对齐的维度和单位
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AlignAxis:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def aligned_units(self) -> ...:
        """
        对齐的维度和单位
        """
    @aligned_units.setter
    def aligned_units(self, arg1: list[AlignedUnit]) -> None:
        ...
class AlignedUnit(ObjectRef):
    type_key: typing.ClassVar[str] = 'icraft::xir::AlignedUnitNode'
    @staticmethod
    def Init() -> AlignedUnit:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, index: ..., unit: ...) -> None:
        """
        					构造函数
        					:param	index:		维度索引
        					:param	unit:		对齐的单位
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AlignedUnit:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def index(self) -> ...:
        """
        维度索引
        """
    @property
    def unit(self) -> ...:
        """
        对齐的单位
        """
class AnycardsPattern(Pattern):
    """
    表示模式匹配的通配符
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::AnycardsPatternNode'
    @staticmethod
    def Init() -> AnycardsPattern:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AnycardsPattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Argmax(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ArgmaxNode'
    @staticmethod
    def Init() -> Argmax:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dim: IntImm | None = None, keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求最大值索引的维度（支持负数索引）
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Argmax:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> IntImm | None:
        """
        进行求最大值索引的维度（支持负数索引）
        """
    @dim.setter
    def dim(self, arg1: IntImm | None) -> None:
        ...
    @property
    def keepdim(self) -> bool:
        """
        是否保持维度不变
        """
    @keepdim.setter
    def keepdim(self, arg1: bool) -> None:
        ...
class Argmin(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ArgminNode'
    @staticmethod
    def Init() -> Argmin:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dim: IntImm | None = None, keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求最小值索引的维度（支持负数索引）
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Argmin:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> IntImm | None:
        """
        进行求最小值索引的维度（支持负数索引）
        """
    @dim.setter
    def dim(self, arg1: IntImm | None) -> None:
        ...
    @property
    def keepdim(self) -> bool:
        """
        是否保持维度不变
        """
    @keepdim.setter
    def keepdim(self, arg1: bool) -> None:
        ...
class AttrPattern(Pattern):
    """
    表示匹配算子属性的模式
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::AttrPatternNode'
    @staticmethod
    def Init() -> AttrPattern:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: str, arg1: ObjectRef | int | int | int | bool | float | str) -> None:
        ...
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AttrPattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def key(self) -> str:
        """
        属性的键
        """
    @property
    def value(self) -> ObjectRef | int | int | int | bool | float | str:
        """
        属性的值
        """
class AvgPool1d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::AvgPool1dNode'
    @staticmethod
    def Init() -> AvgPool1d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, pool_width: int, stride_width: int, pad_left: int, pad_right: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_width:				池化窗口宽度
        					:param	stride_width:			池化滑动宽度
        					:param	stride_height:			池化滑动高度
        					:param	pad_left:				池化左方Pad
        					:param	pad_right:				池化右方Pad
        					:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        					:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AvgPool1d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def count_include_pad(self) -> bool:
        """
        平均时是否包含pad数据，默认不包含
        """
    @count_include_pad.setter
    def count_include_pad(self, arg1: bool) -> None:
        ...
    @property
    def divisor_override(self) -> int:
        """
        覆盖池化的除数，默认为0表示不覆盖
        """
    @divisor_override.setter
    def divisor_override(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        池化左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        池化右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pool_width(self) -> int:
        """
        池化窗口宽度
        """
    @pool_width.setter
    def pool_width(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        池化滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class AvgPool2d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::AvgPool2dNode'
    @staticmethod
    def Init() -> AvgPool2d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, pool_width: int, pool_height: int, stride_width: int, stride_height: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        				构造函数
        				:param	input:					池化的输入
        				:param	pool_width:				池化窗口宽度
        				:param	pool_height:			池化窗口高度
        				:param	stride_width:			池化滑动宽度
        				:param	stride_height:			池化滑动高度
        				:param	pad_top:				池化上方Pad
        				:param	pad_bottom:				池化下方Pad
        				:param	pad_left:				池化左方Pad
        				:param	pad_right:				池化右方Pad
        				:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        				:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad_top_bottom: int, pad_left_right: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        				构造函数
        				:param	input:					池化的输入
        				:param	pool_size:				池化窗口尺寸，高度和宽度相同
        				:param	stride:					池化滑动长度，高度和宽度相同
        				:param	pad_top_bottom:			池化上下方Pad
        				:param	pad_left_right:			池化左右方Pad
        				:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        				:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        				构造函数
        				:param	input:					池化的输入
        				:param	pool_size:				池化窗口尺寸，高度和宽度相同
        				:param	stride:					池化滑动长度，高度和宽度相同
        				:param	pad:					池化上下左右方Pad
        				:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        				:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AvgPool2d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def count_include_pad(self) -> bool:
        """
        平均时是否包含pad数据，默认不包含
        """
    @count_include_pad.setter
    def count_include_pad(self, arg1: bool) -> None:
        ...
    @property
    def divisor_override(self) -> int:
        """
        覆盖池化的除数，默认为0表示不覆盖
        """
    @divisor_override.setter
    def divisor_override(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        池化下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        池化左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        池化右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        池化上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def pool_height(self) -> int:
        """
        池化窗口高度
        """
    @pool_height.setter
    def pool_height(self, arg1: int) -> None:
        ...
    @property
    def pool_width(self) -> int:
        """
        池化窗口宽度
        """
    @pool_width.setter
    def pool_width(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        池化滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        池化滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class AvgPool3d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::AvgPool3dNode'
    @staticmethod
    def Init() -> AvgPool3d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, pool_depth: int, pool_width: int, pool_height: int, stride_depth: int, stride_width: int, stride_height: int, pad_front: int, pad_back: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_depth:				池化窗口深度
        					:param	pool_width:				池化窗口宽度
        					:param	pool_height:			池化窗口高度
        					:param	stride_depth:			池化滑动深度
        					:param	stride_width:			池化滑动宽度
        					:param	stride_height:			池化滑动高度
        					:param	pad_front:				池化前方Pad
        					:param	pad_back:				池化后方Pad
        					:param	pad_top:				池化上方Pad
        					:param	pad_bottom:				池化下方Pad
        					:param	pad_left:				池化左方Pad
        					:param	pad_right:				池化右方Pad
        					:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        					:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad_front_top_bottom: int, pad_back_left_right: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_size:				池化窗口尺寸，深度、高度和宽度相同
        					:param	stride:					池化滑动长度，深度、高度和宽度相同
        					:param	pad_front_top_bottom:	池化前上下方Pad
        					:param	pad_back_left_right:	池化后左右方Pad
        					:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        					:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad: int, count_include_pad: bool = False, divisor_override: int = 0) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_size:				池化窗口尺寸，深度、高度和宽度相同
        					:param	stride:					池化滑动长度，深度、高度和宽度相同
        					:param	pad:					池化前后上下左右方Pad
        					:param	count_include_pad:		覆盖池化的除数，默认为0不覆盖
        					:param	divisor_override:		平均时是否包含pads数据，默认为false
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AvgPool3d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def count_include_pad(self) -> bool:
        """
        平均时是否包含pad数据，默认不包含
        """
    @count_include_pad.setter
    def count_include_pad(self, arg1: bool) -> None:
        ...
    @property
    def divisor_override(self) -> int:
        """
        覆盖池化的除数，默认为0表示不覆盖
        """
    @divisor_override.setter
    def divisor_override(self, arg1: int) -> None:
        ...
    @property
    def pad_back(self) -> int:
        """
        池化后方Pad，默认为0
        """
    @pad_back.setter
    def pad_back(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        池化下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_front(self) -> int:
        """
        池化前方Pad，默认为0
        """
    @pad_front.setter
    def pad_front(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        池化左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        池化右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        池化上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def pool_depth(self) -> int:
        """
        池化窗口深度
        """
    @pool_depth.setter
    def pool_depth(self, arg1: int) -> None:
        ...
    @property
    def pool_height(self) -> int:
        """
        池化窗口高度
        """
    @pool_height.setter
    def pool_height(self, arg1: int) -> None:
        ...
    @property
    def pool_width(self) -> int:
        """
        池化窗口宽度
        """
    @pool_width.setter
    def pool_width(self, arg1: int) -> None:
        ...
    @property
    def stride_depth(self) -> int:
        """
        池化滑动深度，默认为1
        """
    @stride_depth.setter
    def stride_depth(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        池化滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        池化滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class AxisName(ObjectRef):
    """
    表示Layout中的一个大写坐标轴
    """
    __hash__: typing.ClassVar[None] = None
    type_key: typing.ClassVar[str] = 'icraft::xir::AxisNameNode'
    @staticmethod
    def Init() -> AxisName:
        """
        创建一个初始化(非空)对象
        """
    def __eq__(self, arg0: AxisName) -> bool:
        """
        检查该坐标轴和另一个是否相同
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, name: str) -> None:
        """
        				构造函数
        				:param name:		坐标轴的名字
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AxisName:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def name(self) -> str:
        """
        坐标轴的名字
        """
class AxisUnit(AxisName):
    """
    表示Layout中的一个小写坐标轴
    """
    __hash__: typing.ClassVar[None] = None
    type_key: typing.ClassVar[str] = 'icraft::xir::AxisUnitNode'
    @staticmethod
    def Init() -> AxisUnit:
        """
        创建一个初始化(非空)对象
        """
    def __eq__(self, arg0: AxisUnit) -> bool:
        """
        检查该坐标轴和另一个是否相同
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, name: str, unit: int) -> None:
        """
        				构造函数
        				:param name:		坐标轴的名字
        				:param unit:		坐标轴的单位长度
        """
    @typing.overload
    def __init__(self, name: str) -> None:
        """
        				构造函数(默认单位长度为0)
        				:param name:		坐标轴的名字
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> AxisUnit:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setUnit(self, unit: int) -> AxisUnit:
        """
        				构造函数(默认单位长度为0)
        				:param unit:		单位长度
        """
    @property
    def unit(self) -> int:
        """
        坐标轴的单位长度
        """
class BaseQuantizedType(ScalarType):
    """
    表示基本的量化类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::BaseQuantizedTypeNode'
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> BaseQuantizedType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def expressed_dtype(self) -> ScalarType:
        """
        表达类型，即数据的原始类型
        """
    @property
    def storage_dtype(self) -> ScalarType:
        """
        存储类型，即量化的目标类型
        """
class BatchNorm1d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::BatchNorm1dNode'
    @staticmethod
    def Init() -> BatchNorm1d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, variance: Params, mean: Params) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	variance:	乘数因子
        					:param	mean:		加数因子
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> BatchNorm1d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def mean(self) -> Params:
        """
        Batchnorm加数因子
        """
    @mean.setter
    def mean(self, arg1: Params) -> None:
        ...
    @property
    def variance(self) -> Params:
        """
        Batchnorm的乘数因子
        """
    @variance.setter
    def variance(self, arg1: Params) -> None:
        ...
class BatchNorm2d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::BatchNorm2dNode'
    @staticmethod
    def Init() -> BatchNorm2d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, variance: Params, mean: Params) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	variance:	乘数因子
        					:param	mean:		加数因子
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> BatchNorm2d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def mean(self) -> Params:
        """
        Batchnorm加数因子
        """
    @mean.setter
    def mean(self, arg1: Params) -> None:
        ...
    @property
    def variance(self) -> Params:
        """
        Batchnorm的乘数因子
        """
    @variance.setter
    def variance(self, arg1: Params) -> None:
        ...
class BatchNorm3d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::BatchNorm3dNode'
    @staticmethod
    def Init() -> BatchNorm3d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, variance: Params, mean: Params) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	variance:	乘数因子
        					:param	mean:		加数因子
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> BatchNorm3d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def mean(self) -> Params:
        """
        BatchNorm3d加数因子
        """
    @mean.setter
    def mean(self, arg1: Params) -> None:
        ...
    @property
    def variance(self) -> Params:
        """
        BatchNorm3d的乘数因子
        """
    @variance.setter
    def variance(self, arg1: Params) -> None:
        ...
class Bool(ScalarImm):
    """
    表示布尔值立即数
    """
    __hash__: typing.ClassVar[None] = None
    type_key: typing.ClassVar[str] = 'icraft::xir::BoolNode'
    @staticmethod
    def Init() -> Bool:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __and__(self, arg0: bool) -> Bool:
        """
        重载逻辑与操作符
        """
    @typing.overload
    def __and__(self: bool, arg0: Bool) -> Bool:
        """
        重载逻辑与操作符
        """
    @typing.overload
    def __and__(self, arg0: Bool) -> Bool:
        """
        重载逻辑与操作符
        """
    def __bool__(self) -> bool:
        """
        类型转换为bool
        """
    @typing.overload
    def __eq__(self, arg0: bool) -> bool:
        """
        重载等于操作符
        """
    @typing.overload
    def __eq__(self: bool, arg0: Bool) -> bool:
        """
        重载等于操作符
        """
    @typing.overload
    def __eq__(self, arg0: Bool) -> bool:
        """
        重载等于操作符
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: bool) -> None:
        """
        构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def __not__(self) -> Bool:
        """
        重载逻辑非操作符
        """
    @typing.overload
    def __or__(self, arg0: bool) -> Bool:
        """
        重载逻辑或操作符
        """
    @typing.overload
    def __or__(self: bool, arg0: Bool) -> Bool:
        """
        重载逻辑或操作符
        """
    @typing.overload
    def __or__(self, arg0: Bool) -> Bool:
        """
        重载逻辑或操作符
        """
    def clone(self, depth: int = 1) -> Bool:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class BoolType(ScalarType):
    """
    表示布尔数据类型的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::BoolTypeNode'
    @staticmethod
    def Init() -> BoolType:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> BoolType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class BuyiTarget(CompileTarget):
    """
    表示Buyi编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::BuyiTargetNode'
    @staticmethod
    def Init() -> BuyiTarget:
        """
        创建一个初始化(非空)对象
        """
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> BuyiTarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class CalibratedType(BaseQuantizedType):
    """
    表示校准后的数据类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::CalibratedTypeNode'
    @staticmethod
    def Init() -> CalibratedType:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, min: float, max: float, sat: float, storage_dtype: ScalarType, expressed_dtype: ScalarType = ...) -> None:
        """
        				构造函数
        				:param min:					统计最小值
        				:param max:					统计最大值
        				:param sat:					统计饱和点
        				:param storage_dtype:		存储类型，即量化的目标类型
        				:param expressed_dtype:		表达类型，即数据的原始类型
        """
    @typing.overload
    def __init__(self, min: list[float], max: list[float], sat: list[float], storage_dtype: ScalarType, expressed_dtype: ScalarType = ...) -> None:
        """
        				构造函数
        				:param min:					统计最小值
        				:param max:					统计最大值
        				:param sat:					统计饱和点
        				:param storage_dtype:		存储类型，即量化的目标类型
        				:param expressed_dtype:		表达类型，即数据的原始类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> CalibratedType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def max(self) -> ...:
        """
        统计的最大值
        """
    @property
    def min(self) -> ...:
        """
        统计的最小值
        """
    @property
    def sat(self) -> ...:
        """
        统计的饱和点
        """
class Cast(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::CastNode'
    @staticmethod
    def Init() -> Cast:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, target_dtype: TensorType) -> None:
        """
        					构造函数
        					:param	input:			输入
        					:param	target_dtype:	目标数据类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Cast:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def target_dtype(self) -> TensorType:
        """
        目标数据类型
        """
    @target_dtype.setter
    def target_dtype(self, arg1: TensorType) -> None:
        ...
class ChannelShuffle(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ChannelShuffleNode'
    @staticmethod
    def Init() -> ChannelShuffle:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, groups: int) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	groups:		要把通道分成的组数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ChannelShuffle:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def groups(self) -> int:
        """
         要把通道分成的组数
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
class ChunkMem(MemType):
    type_key: typing.ClassVar[str] = 'icraft::xir::ChunkMemNode'
    @staticmethod
    def Init() -> ChunkMem:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, chunk_id: int, offset: int) -> None:
        """
        				构造函数，从地址构造
        				:param chunk_id:	Chunk ID
        				:param offset:		Chunk上的偏移
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ChunkMem:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setAddr(self, chunk_id: int, offset: int) -> ChunkMem:
        """
        				设置地址
        				:param chunk_id:	Chunk ID
        				:param offset:		Chunk上的偏移
        """
    @property
    def chunk_id(self) -> int:
        """
        Chunk ID
        """
    @property
    def offset(self) -> int:
        """
        Chunk上的偏移
        """
class ClampScalar(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ClampScalarNode'
    @staticmethod
    def Init() -> ClampScalar:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, min: float = ..., max: float = ...) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	min:		裁剪的下限，默认负无穷
        					:param	max:		裁剪的上限，默认正无穷
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ClampScalar:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def max(self) -> float:
        """
        裁剪的上限，默认正无穷
        """
    @max.setter
    def max(self, arg1: float) -> None:
        ...
    @property
    def min(self) -> float:
        """
        裁剪的下限，默认负无穷
        """
    @min.setter
    def min(self, arg1: float) -> None:
        ...
class CompileTarget(ObjectRef):
    """
    表示算子的编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::CompileTargetNode'
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> CompileTarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Concat(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ConcatNode'
    @staticmethod
    def Init() -> Concat:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, inputs: list[Value], axis: int = -1) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		拼接的维度，默认为-1，表示最后一维
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Concat:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> int:
        """
        拼接的维度，默认为-1，表示最后一维
        """
    @axis.setter
    def axis(self, arg1: int) -> None:
        ...
class Conv1d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::Conv1dNode'
    @staticmethod
    def Init() -> Conv1d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride_width: int, pad_left: int, pad_right: int, dilation_width: int, groups: int = 1, padding_mode: PaddingMode = ...) -> None:
        """
        					构造函数
        					:param	input:					输入
        					:param	weights:				卷积的权重
        					:param	bias:					卷积的偏置
        					:param	stride_width:			卷积滑动宽度
        					:param	pad_left:				卷积左方Pad
        					:param	pad_right:				卷积右方Pad
        					:param	dilation_width:			卷积膨胀宽度
        					:param	groups:					卷积分组，默认为1
        					:param	padding_mode:			卷积pad模式，默认为ZEROS
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Conv1d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def cut_scale(self) -> QuantizedScaleArray:
        """
        硬件截位时的系数
        """
    @cut_scale.setter
    def cut_scale(self, arg1: QuantizedScaleArray) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        卷积膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def groups(self) -> int:
        """
        卷积分组数量，默认为1
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        卷积左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        卷积右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def padding_mode(self) -> PaddingMode:
        """
        卷积的pad模式，默认为ZEROS
        """
    @padding_mode.setter
    def padding_mode(self, arg1: PaddingMode) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        卷积滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class Conv2d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::Conv2dNode'
    @staticmethod
    def Init() -> Conv2d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride_width: int, stride_height: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, dilation_width: int, dilation_height: int, groups: int = 1, padding_mode: PaddingMode = ...) -> None:
        """
        					构造函数
        					:param	input:					输入
        					:param	weights:				卷积的权重
        					:param	bias:					卷积的偏置
        					:param	stride_width:			卷积滑动宽度
        					:param	stride_height:			卷积滑动高度
        					:param	pad_top:				卷积上方Pad
        					:param	pad_bottom:				卷积下方Pad
        					:param	pad_left:				卷积左方Pad
        					:param	pad_right:				卷积右方Pad
        					:param	dilation_width:			卷积膨胀宽度
        					:param	dilation_height:		卷积膨胀高度
        					:param	groups:					卷积分组，默认为1
        					:param	padding_mode:			卷积pad模式，默认为ZEROS
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride: int, pad: int, dilation: int, groups: int = 1, padding_mode: PaddingMode = ...) -> None:
        """
        					构造函数
        					:param	input:					输入
        					:param	weights:				卷积的权重
        					:param	bias:					卷积的偏置
        					:param	stride:					卷积滑动步长，宽度和高度相同
        					:param	pad:					卷积的Pad，上下左右相同
        					:param	dilation:				卷积膨胀系数，宽度和高度相同
        					:param	groups:					卷积分组，默认为1
        					:param	padding_mode:			卷积pad模式，默认为ZEROS
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Conv2d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def cut_scale(self) -> QuantizedScaleArray:
        """
        硬件截位时的系数
        """
    @cut_scale.setter
    def cut_scale(self, arg1: QuantizedScaleArray) -> None:
        ...
    @property
    def dilation_height(self) -> int:
        """
        卷积膨胀高度，默认为1
        """
    @dilation_height.setter
    def dilation_height(self, arg1: int) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        卷积膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def groups(self) -> int:
        """
        卷积分组数量，默认为1
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        卷积下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        卷积左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        卷积右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        卷积上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def padding_mode(self) -> PaddingMode:
        """
        卷积的pad模式，默认为ZEROS
        """
    @padding_mode.setter
    def padding_mode(self, arg1: PaddingMode) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        卷积滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        卷积滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class Conv3d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::Conv3dNode'
    @staticmethod
    def Init() -> Conv3d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride_depth: int, stride_width: int, stride_height: int, pad_front: int, pad_back: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, dilation_depth: int, dilation_width: int, dilation_height: int, groups: int = 1, padding_mode: PaddingMode = ...) -> None:
        """
        					构造函数
        					:param	input:					输入
        					:param	weights:				卷积的权重
        					:param	bias:					卷积的偏置
        					:param	stride_depth:			卷积滑动深度
        					:param	stride_width:			卷积滑动宽度
        					:param	stride_height:			卷积滑动高度
        					:param	pad_front:				卷积前方Pad
        					:param	pad_back:				卷积后方Pad
        					:param	pad_top:				卷积上方Pad
        					:param	pad_bottom:				卷积下方Pad
        					:param	pad_left:				卷积左方Pad
        					:param	pad_right:				卷积右方Pad
        					:param	dilation_depth:			卷积膨胀深度
        					:param	dilation_width:			卷积膨胀宽度
        					:param	dilation_height:		卷积膨胀高度
        					:param	groups:					卷积分组，默认为1
        					:param	padding_mode:			卷积pad模式，默认为ZEROS
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride: int, pad: int, dilation: int, groups: int = 1, padding_mode: PaddingMode = ...) -> None:
        """
        					构造函数
        					:param	input:					输入
        					:param	weights:				卷积的权重
        					:param	bias:					卷积的偏置
        					:param	stride:					卷积滑动步长，深度、宽度和高度相同
        					:param	pad:					卷积的Pad，前后上下左右相同
        					:param	dilation:				卷积膨胀系数，深度、宽度和高度相同
        					:param	groups:					卷积分组，默认为1
        					:param	padding_mode:			卷积pad模式，默认为ZEROS
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Conv3d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def cut_scale(self) -> QuantizedScaleArray:
        """
        硬件截位时的系数
        """
    @cut_scale.setter
    def cut_scale(self, arg1: QuantizedScaleArray) -> None:
        ...
    @property
    def dilation_depth(self) -> int:
        """
        卷积膨胀深度，默认为1
        """
    @dilation_depth.setter
    def dilation_depth(self, arg1: int) -> None:
        ...
    @property
    def dilation_height(self) -> int:
        """
        卷积膨胀高度，默认为1
        """
    @dilation_height.setter
    def dilation_height(self, arg1: int) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        卷积膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def groups(self) -> int:
        """
        卷积分组数量，默认为1
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
    @property
    def pad_back(self) -> int:
        """
        卷积后方Pad，默认为0
        """
    @pad_back.setter
    def pad_back(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        卷积下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_front(self) -> int:
        """
        卷积前方Pad，默认为0
        """
    @pad_front.setter
    def pad_front(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        卷积左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        卷积右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        卷积上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def padding_mode(self) -> PaddingMode:
        """
        卷积的pad模式，默认为ZEROS
        """
    @padding_mode.setter
    def padding_mode(self, arg1: PaddingMode) -> None:
        ...
    @property
    def stride_depth(self) -> int:
        """
        卷积滑动深度，默认为1
        """
    @stride_depth.setter
    def stride_depth(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        卷积滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        卷积滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class ConvTranspose1d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ConvTranspose1dNode'
    @staticmethod
    def Init() -> ConvTranspose1d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride_width: int, pad_left: int, pad_right: int, dilation_width: int, output_pad_width: int, groups: int = 1) -> None:
        """
        				构造函数
        				:param	input:					输入
        				:param	weights:				反卷积的权重
        				:param	bias:					反卷积的偏置
        				:param	stride_width:			反卷积滑动宽度
        				:param	pad_left:				反卷积左方Pad
        				:param	pad_right:				反卷积右方Pad
        				:param	dilation_width:			反卷积膨胀宽度
        				:param	output_pad_width:		反卷积宽度上输出Pad
        				:param	groups:					反卷积分组，默认为1
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ConvTranspose1d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dilation_width(self) -> int:
        """
        反卷积膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def groups(self) -> int:
        """
        反卷积分组数量，默认为1
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
    @property
    def output_pad_width(self) -> int:
        """
        反卷积宽度上输出Pad，默认为0
        """
    @output_pad_width.setter
    def output_pad_width(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        反卷积左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        反卷积右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        反卷积滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class ConvTranspose2d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ConvTranspose2dNode'
    @staticmethod
    def Init() -> ConvTranspose2d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride_width: int, stride_height: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, dilation_width: int, dilation_height: int, output_pad_width: int, output_pad_height: int, groups: int = 1) -> None:
        """
        				构造函数
        				:param	input:					输入
        				:param	weights:				反卷积的权重
        				:param	bias:					反卷积的偏置
        				:param	stride_width:			反卷积滑动宽度
        				:param	stride_height:			反卷积滑动高度
        				:param	pad_top:				反卷积上方Pad
        				:param	pad_bottom:				反卷积下方Pad
        				:param	pad_left:				反卷积左方Pad
        				:param	pad_right:				反卷积右方Pad
        				:param	dilation_width:			反卷积膨胀宽度
        				:param	dilation_height:		反卷积膨胀高度
        				:param	output_pad_width:		反卷积宽度上输出Pad
        				:param	output_pad_height:		反卷积高度上输出Pad
        				:param	groups:					反卷积分组，默认为1
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride: int, pad: int, dilation: int, output_pad: int, groups: int = 1) -> None:
        """
        				构造函数
        				:param	input:					输入
        				:param	weights:				反卷积的权重
        				:param	bias:					反卷积的偏置
        				:param	stride:					反卷积滑动步长，宽度和高度相同
        				:param	pad:					反卷积的Pad，上下左右相同
        				:param	dilation:				反卷积膨胀系数，宽度和高度相同
        				:param	output_pad:				反卷积输出PAD，宽度和高度相同
        				:param	groups:					反卷积分组，默认为1
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ConvTranspose2d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dilation_height(self) -> int:
        """
        反卷积膨胀高度，默认为1
        """
    @dilation_height.setter
    def dilation_height(self, arg1: int) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        反卷积膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def groups(self) -> int:
        """
        反卷积分组数量，默认为1
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
    @property
    def output_pad_height(self) -> int:
        """
        反卷积高度上输出Pad，默认为0
        """
    @output_pad_height.setter
    def output_pad_height(self, arg1: int) -> None:
        ...
    @property
    def output_pad_width(self) -> int:
        """
        反卷积宽度上输出Pad，默认为0
        """
    @output_pad_width.setter
    def output_pad_width(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        反卷积下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        反卷积左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        反卷积右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        反卷积上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        反卷积滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        反卷积滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class ConvTranspose3d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ConvTranspose3dNode'
    @staticmethod
    def Init() -> ConvTranspose3d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride_depth: int, stride_width: int, stride_height: int, pad_front: int, pad_back: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, dilation_depth: int, dilation_width: int, dilation_height: int, output_pad_depth: int, output_pad_width: int, output_pad_height: int, groups: int = 1) -> None:
        """
        				构造函数
        				:param	input:					输入
        				:param	weights:				反卷积的权重
        				:param	bias:					反卷积的偏置
        				:param	stride_depth:			反卷积滑动深度
        				:param	stride_width:			反卷积滑动宽度
        				:param	stride_height:			反卷积滑动高度
        				:param	pad_front:				反卷积前方Pad
        				:param	pad_back:				反卷积后方Pad
        				:param	pad_top:				反卷积上方Pad
        				:param	pad_bottom:				反卷积下方Pad
        				:param	pad_left:				反卷积左方Pad
        				:param	pad_right:				反卷积右方Pad
        				:param	dilation_depth:			反卷积膨胀深度
        				:param	dilation_width:			反卷积膨胀宽度
        				:param	dilation_height:		反卷积膨胀高度
        				:param	output_pad_depth:		反卷积深度上输出Pad
        				:param	output_pad_width:		反卷积宽度上输出Pad
        				:param	output_pad_height:		反卷积高度上输出Pad
        				:param	groups:					反卷积分组，默认为1
        """
    @typing.overload
    def __init__(self, input: Value, weights: Value, bias: Value | None, stride: int, pad: int, dilation: int, output_pad: int, groups: int = 1) -> None:
        """
        				构造函数
        				:param	input:					输入
        				:param	weights:				反卷积的权重
        				:param	bias:					反卷积的偏置
        				:param	stride:					反卷积滑动步长，深度、宽度和高度相同
        				:param	pad:					反卷积的Pad，前后上下左右相同
        				:param	dilation:				反卷积膨胀系数，深度、宽度和高度相同
        				:param	output_pad:				反卷积输出PAD，深度、宽度和高度相同
        				:param	groups:					反卷积分组，默认为1
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ConvTranspose3d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dilation_depth(self) -> int:
        """
        反卷积膨胀深度，默认为1
        """
    @dilation_depth.setter
    def dilation_depth(self, arg1: int) -> None:
        ...
    @property
    def dilation_height(self) -> int:
        """
        反卷积膨胀高度，默认为1
        """
    @dilation_height.setter
    def dilation_height(self, arg1: int) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        反卷积膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def groups(self) -> int:
        """
        反卷积分组数量，默认为1
        """
    @groups.setter
    def groups(self, arg1: int) -> None:
        ...
    @property
    def output_pad_depth(self) -> int:
        """
        反卷积深度上输出Pad，默认为0
        """
    @output_pad_depth.setter
    def output_pad_depth(self, arg1: int) -> None:
        ...
    @property
    def output_pad_height(self) -> int:
        """
        反卷积高度上输出Pad，默认为0
        """
    @output_pad_height.setter
    def output_pad_height(self, arg1: int) -> None:
        ...
    @property
    def output_pad_width(self) -> int:
        """
        反卷积宽度上输出Pad，默认为0
        """
    @output_pad_width.setter
    def output_pad_width(self, arg1: int) -> None:
        ...
    @property
    def pad_back(self) -> int:
        """
        反卷积后方Pad，默认为0
        """
    @pad_back.setter
    def pad_back(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        反卷积下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_front(self) -> int:
        """
        反卷积前方Pad，默认为0
        """
    @pad_front.setter
    def pad_front(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        反卷积左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        反卷积右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        反卷积上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def stride_depth(self) -> int:
        """
        反卷积滑动深度，默认为1
        """
    @stride_depth.setter
    def stride_depth(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        反卷积滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        反卷积滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class Copy(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::CopyNode'
    @staticmethod
    def Init() -> Copy:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:	输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Copy:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Cos(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::CosNode'
    @staticmethod
    def Init() -> Cos:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Cos:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Cosh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::CoshNode'
    @staticmethod
    def Init() -> Cosh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Cosh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class CustomTarget(CompileTarget):
    """
    表示Custom编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::CustomTargetNode'
    @staticmethod
    def Init() -> CustomTarget:
        """
        创建一个初始化(非空)对象
        """
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> CustomTarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Data(ObjectRef):
    """
    表示数据的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::DataNode'
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Data:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setDType(self, arg0: DataType) -> Data:
        """
        设置数据类型
        """
    def setMType(self, arg0: MemType) -> Data:
        """
        设置存储类型
        """
    def storageBits(self) -> int:
        """
        获取存储位数
        """
    def storageBytes(self) -> int:
        """
        获取存储字节数
        """
    @property
    def dtype(self) -> DataType:
        """
        数据类型
        """
    @property
    def mtype(self) -> MemType:
        """
        存储类型
        """
class DataType(ObjectRef):
    """
    表示数据类型的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::DataTypeNode'
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def bits(self) -> int:
        """
        获取该数据类型所占位数.
        """
    def bytes(self) -> int:
        """
        获取该数据类型所占字节数.
        """
    def clone(self, depth: int = 1) -> DataType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def getNormratio(self) -> ... | None:
        """
        				获取(可选的)归一化系数
        				:return:  如果该DataType是 NormalizedType 或 NormalizedQuantizedType,
        						  则返回相应的归一化系数，否则返回None
        """
    def getScale(self) -> ... | None:
        """
        				获取(可选的)量化缩放因子
        				:return:  如果该DataType是 QuantizedType,
        						  则返回相应的量化缩放因子，否则返回std::nullopt
        """
    def getStorageType(self) -> ...:
        """
        				获取存储类型
        				:return:  如果该DataType是非量化类型，则返回本身；
        						  如果该DataType是量化类型，则返回相应的storage_dtype；
        						  如果该DataType是TensorType，对其element_dtype做以上处理
        """
    def getZeroPoints(self) -> list[int] | None:
        """
        				获取(可选的)量化的零点
        				:return:  如果该DataType是 QuantizedType,
        							则返回相应的量化的零点，否则返回std::nullopt
        """
    def numElements(self) -> int:
        """
        获取数据类型的元素个数.
        """
    def setNormratio(self, normratio: list[float]) -> bool:
        """
        				尝试设置归一化系数
        				:return:  如果该DataType是 NormalizedType 或 NormalizedQuantizedType,
        						  则设置相应的归一化系数并返回True，否则返回False
        """
    def setScale(self, scale: ...) -> bool:
        """
        				尝试设置量化缩放因子
        				:return:  如果该DataType是 QuantizedType,
        						  则设置相应的量化缩放因子并返回true，否则返回false
        """
    def setStorageType(self, type: ...) -> None:
        """
        				获取存储类型
        				:return:  如果该DataType是非量化类型，则设置本身；
        						  如果该DataType是量化类型，则设置相应的storage_dtype；
        						  如果该DataType是TensorType，对其element_dtype做以上处理
        """
    def setZeroPoints(self, zero_points: list[int]) -> bool:
        """
        				尝试设置量化的零点
        				:return:  如果该DataType是 QuantizedType,
        							则设置相应的量化的零点并返回true，否则返回false
        """
class DistrUnvalidValue:
    """
    分布的无效值
    
    Members:
    
      ZERO : 无效值填充0
    
      NONE : 无效值不存在
    """
    NONE: typing.ClassVar[DistrUnvalidValue]  # value = <DistrUnvalidValue.NONE: 1>
    ZERO: typing.ClassVar[DistrUnvalidValue]  # value = <DistrUnvalidValue.ZERO: 0>
    __members__: typing.ClassVar[dict[str, DistrUnvalidValue]]  # value = {'ZERO': <DistrUnvalidValue.ZERO: 0>, 'NONE': <DistrUnvalidValue.NONE: 1>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class Div(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::DivNode'
    @staticmethod
    def Init() -> Div:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value, rounding_mode: ...) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Div:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class DivideScalar(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::DivideScalarNode'
    @staticmethod
    def Init() -> DivideScalar:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, divisor: float, rounding_mode: RoundingMode = ...) -> None:
        """
        					构造函数
        					:param	input:			输入
        					:param	divisor:		除数
        					:param	rounding_mode:	取整模式
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> DivideScalar:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def divisor(self) -> float:
        """
        除数
        """
    @divisor.setter
    def divisor(self, arg1: float) -> None:
        ...
    @property
    def rounding_mode(self) -> RoundingMode:
        """
        取整模式
        """
    @rounding_mode.setter
    def rounding_mode(self, arg1: RoundingMode) -> None:
        ...
class ELU(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ELUNode'
    @staticmethod
    def Init() -> ELU:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, alpha: float = 1.0) -> None:
        """
        				构造函数
        				:param	input:			输入
        				:param	alpha:			负半轴的系数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ELU:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def alpha(self) -> float:
        """
        负半轴的系数
        """
    @alpha.setter
    def alpha(self, arg1: float) -> None:
        ...
class Einsum(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::EinsumNode'
    @staticmethod
    def Init() -> Einsum:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, inputs: list[Value], equation: str) -> None:
        """
        					构造函数
        					:param	inputs:		输入
        					:param 	equation:	求和标记
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Einsum:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def equation(self) -> str:
        """
        求和标记
        """
    @equation.setter
    def equation(self, arg1: str) -> None:
        ...
class Equal(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::EqualNode'
    @staticmethod
    def Init() -> Equal:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs :	左操作数
        					:param	rhs :	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Equal:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Error(RuntimeError):
    pass
class ExpQuantizedScale(QuantizedScale):
    type_key: typing.ClassVar[str] = 'icraft::xir::ExpQuantizedScaleNode'
    @staticmethod
    def Init() -> ExpQuantizedScale:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, m: int, exp: int, origin_scale: float) -> None:
        """
        				构造函数.
        				:param m:				m*2^(-exp)中的m
        				:param exp:				m*2^(-exp)中的exp
        				:param origin_scale:	未适配硬件的原始浮点缩放系数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ExpQuantizedScale:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def exp(self) -> int:
        """
        m*2^(-exp)中的exp
        """
    @property
    def m(self) -> int:
        """
        m*2^(-exp)中的m
        """
class ExpQuantizedScaleArray(QuantizedScaleArray):
    type_key: typing.ClassVar[str] = 'icraft::xir::ExpQuantizedScaleArrayNode'
    @staticmethod
    def Init() -> ExpQuantizedScaleArray:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, m: list[int], exp: list[int], origin_scale: list[float], axis: int = -1) -> None:
        """
        				构造函数.
        				:param m:				m*2^(-exp)中的m
        				:param exp:				m*2^(-exp)中的exp
        				:param origin_scale:	未适配硬件的原始浮点缩放系数
        				:param axis:			三种系数对应的维度，默认为-1，表示最后一维
        """
    @typing.overload
    def __init__(self, lhs: QuantizedScaleArray, rhs: QuantizedScaleArray) -> None:
        """
        				构造函数.
        				:param lhs:		待拼接输入1
        				:param rhs:		待拼接输入2
        """
    @typing.overload
    def __init__(self, n: int, val: QuantizedScale) -> None:
        """
        				构造函数，从初始值构造.
        				:param n:		元素数量
        				:param val:		初始值
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ExpQuantizedScaleArray:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setAxis(self, axis: int) -> ExpQuantizedScaleArray:
        ...
    @property
    def exp(self) -> ...:
        """
        m*2^(-exp)中的exp
        """
    @property
    def m(self) -> ...:
        """
        m*2^(-exp)中的m
        """
class Expand(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ExpandNode'
    @staticmethod
    def Init() -> Expand:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, sizes: list[int]) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dims:		期望扩充到的维度
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Expand:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def sizes(self) -> ...:
        """
        期望扩充到的维度
        """
    @sizes.setter
    def sizes(self, arg1: list[int]) -> None:
        ...
class ExternalMem(MemType):
    type_key: typing.ClassVar[str] = 'icraft::xir::ExternalMemNode'
    @staticmethod
    def Init() -> ExternalMem:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, addr: int) -> None:
        """
        				构造函数，从地址构造
        				:param addr:	ETM上的地址
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ExternalMem:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setAddr(self, addr: int) -> ExternalMem:
        """
        				设置地址
        				:param addr:	ETM上的地址
        """
    @property
    def addr(self) -> int:
        """
        ETM上的地址
        """
class FPGATarget(CompileTarget):
    """
    表示FPGA编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::FPGATargetNode'
    @staticmethod
    def Init() -> FPGATarget:
        """
        创建一个初始化(非空)对象
        """
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> FPGATarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class FloatImm(ScalarImm):
    """
    表示浮点立即数
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::FloatImmNode'
    @staticmethod
    def Init() -> FloatImm:
        """
        创建一个初始化(非空)对象
        """
    def __float__(self) -> float:
        """
        将浮点立即数转换为float
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, value: float, dtype: ScalarType, mtype: MemType = ...) -> None:
        """
        				构造函数
        				:param value:		立即数的值
        				:param dtype:		立即数的数据类型
        				:param mtype:		立即数的存储类型
        """
    @typing.overload
    def __init__(self, value: float, mtype: MemType = ...) -> None:
        """
        				构造函数
        				:param value:		立即数的值
        				:param mtype:		立即数的存储类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> FloatImm:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def value(self) -> float:
        """
        立即数的值
        """
class FloatType(ScalarType):
    """
    表示浮点数据类型的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::FloatTypeNode'
    @staticmethod
    def BF16() -> FloatType:
        """
        创建一个bf16
        """
    @staticmethod
    def FP16() -> FloatType:
        """
        创建一个fp16
        """
    @staticmethod
    def FP32() -> FloatType:
        """
        创建一个fp32
        """
    @staticmethod
    def FP64() -> FloatType:
        """
        创建一个fp64
        """
    @staticmethod
    def FPE6M9() -> FloatType:
        """
        创建一个fpe6m9
        """
    @staticmethod
    def FPE7M8() -> FloatType:
        """
        创建一个fpe7m8
        """
    @staticmethod
    def Init() -> FloatType:
        """
        创建一个初始化(非空)对象
        """
    @staticmethod
    def TF32() -> FloatType:
        """
        创建一个tf32
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, emax: int, emin: int, precision: int, bits: int) -> None:
        """
        				构造函数
        				:param emax:		指数的最大值
        				:param emin:		指数的最小值
        				:param precision:	尾数的精度(位数)
        				:param bits:		浮点数的位数
        """
    @typing.overload
    def __init__(self, sem: Semantics) -> None:
        """
        				构造函数
        				:param sem:		浮点语义
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> FloatType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def semantics(self) -> Semantics:
        """
        获取该浮点类型的浮点语义
        """
class Framework:
    """
    表示前端框架的枚举
    
    Members:
    
      PYTORCH : Pytorch框架
    
      CAFFE : Caffe框架
    
      TENSORFLOW : Tensorflow框架
    
      DARKNET : Darknet框架
    
      ONNX : ONNX框架
    """
    CAFFE: typing.ClassVar[Framework]  # value = <Framework.CAFFE: 1>
    DARKNET: typing.ClassVar[Framework]  # value = <Framework.DARKNET: 3>
    ONNX: typing.ClassVar[Framework]  # value = <Framework.ONNX: 4>
    PYTORCH: typing.ClassVar[Framework]  # value = <Framework.PYTORCH: 0>
    TENSORFLOW: typing.ClassVar[Framework]  # value = <Framework.TENSORFLOW: 2>
    __members__: typing.ClassVar[dict[str, Framework]]  # value = {'PYTORCH': <Framework.PYTORCH: 0>, 'CAFFE': <Framework.CAFFE: 1>, 'TENSORFLOW': <Framework.TENSORFLOW: 2>, 'DARKNET': <Framework.DARKNET: 3>, 'ONNX': <Framework.ONNX: 4>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class GELU(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::GELUNode'
    @staticmethod
    def Init() -> GELU:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        				构造函数
        				:param	input:			输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> GELU:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Greater(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::GreaterNode'
    @staticmethod
    def Init() -> Greater:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs :	左操作数
        					:param	rhs :	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Greater:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class GreaterEqual(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::GreaterEqualNode'
    @staticmethod
    def Init() -> GreaterEqual:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs :	左操作数
        					:param	rhs :	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> GreaterEqual:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class HardOp(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::HardOpNode'
    @staticmethod
    def Init() -> HardOp:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: list[Value], arg1: list[Params], arg2: list[Params], arg3: list[int], arg4: dict[str, int]) -> None:
        ...
    @typing.overload
    def __init__(self, arg0: list[Value], arg1: Params, arg2: Params, arg3: list[int], arg4: dict[str, int]) -> None:
        ...
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> HardOp:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def device_info(self) -> dict[str, int]:
        """
        设备信息
        """
    @device_info.setter
    def device_info(self, arg1: dict[str, int]) -> None:
        ...
    @property
    def instr(self) -> list[Params]:
        """
        指令
        """
    @property
    def origin_ops_id(self) -> ...:
        """
        原始的Op ID列表
        """
    @origin_ops_id.setter
    def origin_ops_id(self, arg1: list[int]) -> None:
        ...
    @property
    def params(self) -> list[Params]:
        """
        参数
        """
class Hardshrink(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::HardshrinkNode'
    @staticmethod
    def Init() -> Hardshrink:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, lambda: float = 0.5) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	lambda:		系数λ，默认为0.5
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Hardshrink:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def lambda(self) -> float:
        """
        系数λ，默认为0.5
        """
    @lambda.setter
    def lambda(self, arg1: float) -> None:
        ...
class Hardsigmoid(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::HardsigmoidNode'
    @staticmethod
    def Init() -> Hardsigmoid:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, alpha: float = 0.1666666716337204, beta: float = 0.5) -> None:
        """
        					构造函数
        					:param	input:	输入
        					:param	alpha:	Hardsigmoid的系数α，默认为1/6
        					:param	beta:	Hardsigmoid的系数β，默认为0.5
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Hardsigmoid:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def alpha(self) -> float:
        """
        系数α
        """
    @alpha.setter
    def alpha(self, arg1: float) -> None:
        ...
    @property
    def beta(self) -> float:
        """
        系数β
        """
    @beta.setter
    def beta(self, arg1: float) -> None:
        ...
class Hardswish(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::HardswishNode'
    @staticmethod
    def Init() -> Hardswish:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:			输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Hardswish:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Hardtanh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::HardtanhNode'
    @staticmethod
    def Init() -> Hardtanh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, min_val: float = -1.0, max_val: float = 1.0) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	min_val:	Hardtanh的最小值，默认为 -1.0
        					:param	max_val:	Hardtanh的最大值，默认为  1.0
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Hardtanh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def max_val(self) -> float:
        """
        Hardtanh的最大值，默认为  1.0
        """
    @max_val.setter
    def max_val(self, arg1: float) -> None:
        ...
    @property
    def min_val(self) -> float:
        """
        Hardtanh的最小值，默认为 -1.0
        """
    @min_val.setter
    def min_val(self, arg1: float) -> None:
        ...
class HostMem(MemType):
    """
    表示Host存储类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::HostMemNode'
    @staticmethod
    def Init() -> HostMem:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> HostMem:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class HostTarget(CompileTarget):
    """
    表示Host编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::HostTargetNode'
    @staticmethod
    def Init() -> HostTarget:
        """
        创建一个初始化(非空)对象
        """
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> HostTarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Input(Operation):
    """
    表示输入算子
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::InputNode'
    @staticmethod
    def Init() -> Input:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, *args) -> None:
        """
        				构造函数，根据数据类型列表构造Input
        				该方法会根据指定的数据类型创建Input的输出
        				:param dtypes:	数据类型列表或可变参数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Input:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class InstanceNorm1d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::InstanceNorm1dNode'
    @staticmethod
    def Init() -> InstanceNorm1d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, eps: float = 1e-05, gamma: Params | None = None, beta: Params | None = None) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		待归一化的维度
        					:param	eps:		防止除以0的小浮点数，默认为1e-5
        					:param	gamma:		输入
        					:param	beta:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> InstanceNorm1d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def beta(self) -> Params | None:
        """
        仿射计算中的bias
        """
    @beta.setter
    def beta(self, arg1: Params | None) -> None:
        ...
    @property
    def eps(self) -> float:
        """
        防止除以0的小浮点数，默认为1e-5
        """
    @eps.setter
    def eps(self, arg1: float) -> None:
        ...
    @property
    def gamma(self) -> Params | None:
        """
        仿射计算中的weight
        """
    @gamma.setter
    def gamma(self, arg1: Params | None) -> None:
        ...
class InstanceNorm2d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::InstanceNorm2dNode'
    @staticmethod
    def Init() -> InstanceNorm2d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, eps: float = 1e-05, gamma: Params | None = None, beta: Params | None = None) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		待归一化的维度
        					:param	eps:		防止除以0的小浮点数，默认为1e-5
        					:param	gamma:		输入
        					:param	beta:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> InstanceNorm2d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def beta(self) -> Params | None:
        """
        仿射计算中的bias
        """
    @beta.setter
    def beta(self, arg1: Params | None) -> None:
        ...
    @property
    def eps(self) -> float:
        """
        防止除以0的小浮点数，默认为1e-5
        """
    @eps.setter
    def eps(self, arg1: float) -> None:
        ...
    @property
    def gamma(self) -> Params | None:
        """
        仿射计算中的weight
        """
    @gamma.setter
    def gamma(self, arg1: Params | None) -> None:
        ...
class InstanceNorm3d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::InstanceNorm3dNode'
    @staticmethod
    def Init() -> InstanceNorm3d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, eps: float = 1e-05, gamma: Params | None = None, beta: Params | None = None) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		待归一化的维度
        					:param	eps:		防止除以0的小浮点数，默认为1e-5
        					:param	gamma:		输入
        					:param	beta:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> InstanceNorm3d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def beta(self) -> Params | None:
        """
        仿射计算中的bias
        """
    @beta.setter
    def beta(self, arg1: Params | None) -> None:
        ...
    @property
    def eps(self) -> float:
        """
        防止除以0的小浮点数，默认为1e-5
        """
    @eps.setter
    def eps(self, arg1: float) -> None:
        ...
    @property
    def gamma(self) -> Params | None:
        """
        仿射计算中的weight
        """
    @gamma.setter
    def gamma(self, arg1: Params | None) -> None:
        ...
class IntImm(ScalarImm):
    """
    表示整型立即数
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::IntImmNode'
    @staticmethod
    def Init() -> IntImm:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, value: int, dtype: ScalarType, mtype: MemType = ...) -> None:
        """
        				构造函数
        				:param value:		立即数的值
        				:param dtype:		立即数的数据类型
        				:param mtype:		立即数的存储类型
        """
    @typing.overload
    def __init__(self, value: int, mtype: MemType = ...) -> None:
        """
        				构造函数
        				:param value:		立即数的值
        				:param mtype:		立即数的存储类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def __int__(self) -> int:
        """
        将整型立即数转换为int64_t
        """
    def clone(self, depth: int = 1) -> IntImm:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def value(self) -> int:
        """
        立即数的值
        """
class IntegerType(ScalarType):
    """
    表示整型数据类型的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::IntegerTypeNode'
    @staticmethod
    def Init() -> IntegerType:
        """
        创建一个初始化(非空)对象
        """
    @staticmethod
    def SInt(N: int) -> IntegerType:
        """
        创建一个指定位数的sint
        """
    @staticmethod
    def SInt16() -> IntegerType:
        """
        创建一个sint16
        """
    @staticmethod
    def SInt32() -> IntegerType:
        """
        创建一个sint32
        """
    @staticmethod
    def SInt64() -> IntegerType:
        """
        创建一个sint64
        """
    @staticmethod
    def SInt8() -> IntegerType:
        """
        创建一个sint8
        """
    @staticmethod
    def UInt(N: int) -> IntegerType:
        """
        创建一个指定位数的uint
        """
    @staticmethod
    def UInt16() -> IntegerType:
        """
        创建一个uint16
        """
    @staticmethod
    def UInt32() -> IntegerType:
        """
        创建一个uint32
        """
    @staticmethod
    def UInt64() -> IntegerType:
        """
        创建一个uint64
        """
    @staticmethod
    def UInt8() -> IntegerType:
        """
        创建一个uint8
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, sign: bool, bits: int) -> None:
        """
        				构造函数
        				:param sign:	整型的符号
        				:param bits:	整型的位数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> IntegerType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class InternalError(Error):
    pass
class Interpolation:
    """
    Upsample插值方式
    
    Members:
    
      NEAREST : 最近邻插值
    
      BILINEAR : 双线性插值
    
      BICUBIC : 双三次插值
    """
    BICUBIC: typing.ClassVar[Interpolation]  # value = <Interpolation.BICUBIC: 2>
    BILINEAR: typing.ClassVar[Interpolation]  # value = <Interpolation.BILINEAR: 1>
    NEAREST: typing.ClassVar[Interpolation]  # value = <Interpolation.NEAREST: 0>
    __members__: typing.ClassVar[dict[str, Interpolation]]  # value = {'NEAREST': <Interpolation.NEAREST: 0>, 'BILINEAR': <Interpolation.BILINEAR: 1>, 'BICUBIC': <Interpolation.BICUBIC: 2>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class LayerNorm(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::LayerNormNode'
    @staticmethod
    def Init() -> LayerNorm:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, axis: list[int], eps: float = 1e-05, gamma: Params | None = None, beta: Params | None = None) -> None:
        """
        				构造函数
        				:param	input:		输入
        				:param	axis:		待归一化的维度
        				:param	eps:		防止除以0的小浮点数，默认为1e-5
        				:param	gamma:		输入
        				:param	beta:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> LayerNorm:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> ...:
        """
        待归一化的维度
        """
    @axis.setter
    def axis(self, arg1: list[int]) -> None:
        ...
    @property
    def beta(self) -> Params | None:
        """
        仿射计算中的bias
        """
    @beta.setter
    def beta(self, arg1: Params | None) -> None:
        ...
    @property
    def eps(self) -> float:
        """
        防止除以0的小浮点数，默认为1e-5
        """
    @eps.setter
    def eps(self, arg1: float) -> None:
        ...
    @property
    def gamma(self) -> Params | None:
        """
        仿射计算中的weight
        """
    @gamma.setter
    def gamma(self, arg1: Params | None) -> None:
        ...
class Layout(ObjectRef):
    """
    表示排布的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::LayoutNode'
    @staticmethod
    def CheckAxisNameUpper(c: str) -> bool:
        """
        				检查坐标轴的字符名是否是大写
        				:param c:				坐标轴的字符名
        """
    @staticmethod
    def Default(size: int = 0) -> Layout:
        """
        创建一个默认Layout
        """
    @staticmethod
    def HWIO() -> Layout:
        """
        创建一个HWIO
        """
    @staticmethod
    def Init() -> Layout:
        """
        创建一个初始化(非空)对象
        """
    @staticmethod
    def NCHW() -> Layout:
        """
        创建一个NCHW
        """
    @staticmethod
    def NHWC() -> Layout:
        """
        创建一个NHWC
        """
    @staticmethod
    def OIHW() -> Layout:
        """
        创建一个OIHW
        """
    def C(self) -> Layout:
        """
        向Layout中添加坐标轴C
        """
    def D(self) -> Layout:
        """
        向Layout中添加坐标轴D
        """
    def H(self) -> Layout:
        """
        向Layout中添加坐标轴H
        """
    def I(self) -> Layout:
        """
        向Layout中添加坐标轴I
        """
    def N(self) -> Layout:
        """
        向Layout中添加坐标轴N
        """
    def O(self) -> Layout:
        """
        向Layout中添加坐标轴O
        """
    def W(self) -> Layout:
        """
        向Layout中添加坐标轴W
        """
    def X(self, num: int = 1) -> Layout:
        """
        				向Layout中添加坐标轴*, *表示无名坐标
        				:param num:		坐标轴*的个数
        """
    def __getitem__(self, arg0: int) -> AxisName:
        """
        获取指定索引位置的坐标轴
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, axis: list[AxisName]) -> None:
        """
        				构造函数
        				:param axis:		表示坐标轴的列表
        """
    @typing.overload
    def __init__(self, layout: str) -> None:
        """
        				构造函数，从字符串构造
        				:param layout:		表示Layout的字符串
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    @typing.overload
    def c(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴c
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def c(self) -> int:
        """
        获取坐标轴c的单位长度
        """
    def clone(self, depth: int = 1) -> Layout:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @typing.overload
    def d(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴d
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def d(self) -> int:
        """
        获取坐标轴d的单位长度
        """
    def eraseAxis(self, index: int) -> Layout:
        """
        				删除坐标轴
        				:param index:			被删除的位置索引
        """
    def get(self, c: str) -> ...:
        """
        				获取Layout中的某一坐标轴
        				:param c:		字符表示的坐标轴
        				:return:		若坐标轴不存在则返回None
        """
    def getAxisCharName(self, index: int) -> str:
        """
        				获取指定索引位置的坐标轴字符名称
        				:param index:	索引位置
        """
    def getIndexOf(self, c: str) -> int:
        """
        				获取指定坐标轴在Layout中的位置索引
        				:param c:	字符表示的坐标轴
        """
    @typing.overload
    def h(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴h
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def h(self) -> int:
        """
        获取坐标轴h的单位长度
        """
    def has(self, c: str) -> bool:
        """
        				检查Layout中是否包含某一坐标轴
        				:param c:		字符表示的坐标轴
        """
    @typing.overload
    def i(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴i
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def i(self) -> int:
        """
        获取坐标轴i的单位长度
        """
    def insertAxis(self, index: int, axis_name: AxisName) -> Layout:
        """
        				插入坐标轴
        				:param index:			被插入的位置索引
        				:param axis_name:		被插入的坐标轴
        """
    def isDefault(self) -> bool:
        """
        检查该Layout是否是layout(default)
        """
    @typing.overload
    def n(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴n
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def n(self) -> int:
        """
        获取坐标轴n的单位长度
        """
    def numAxis(self) -> int:
        """
        获取Layout中的坐标轴数量
        """
    @typing.overload
    def o(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴o
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def o(self) -> int:
        """
        获取坐标轴o的单位长度
        """
    def swapAxis(self, left_index: int, right_index: int) -> Layout:
        """
        				交换两个坐标轴
        				:param left_index:		被交换的索引之一
        				:param right_index:		被交换的索引之二
        """
    def toString(self) -> str:
        """
        获取字符串形式的Layout
        """
    @typing.overload
    def w(self, unit: int) -> Layout:
        """
        				向Layout中添加坐标轴w
        				:param unit:	坐标轴的单位长度
        """
    @typing.overload
    def w(self) -> int:
        """
        获取坐标轴w的单位长度
        """
    @property
    def axis_names(self) -> list[AxisName]:
        """
        坐标轴的序列
        """
class Less(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::LessNode'
    @staticmethod
    def Init() -> Less:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs :	左操作数
        					:param	rhs :	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Less:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class LessEqual(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::LessEqualNode'
    @staticmethod
    def Init() -> LessEqual:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs :	左操作数
        					:param	rhs :	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> LessEqual:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Log(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::LogNode'
    @staticmethod
    def Init() -> Log:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Log:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class LogSigmoid(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::LogSigmoidNode'
    @staticmethod
    def Init() -> LogSigmoid:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> LogSigmoid:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class LogSoftmax(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::LogSoftmaxNode'
    @staticmethod
    def Init() -> LogSoftmax:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, axis: int = -1) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		指定LogSoftmax的维度，默认为-1，表示最后一维
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> LogSoftmax:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> int:
        """
        指定LogSoftmax的维度，默认为-1，表示最后一维
        """
    @axis.setter
    def axis(self, arg1: int) -> None:
        ...
class Matmul(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MatmulNode'
    @staticmethod
    def Init() -> Matmul:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, x: Value, k: Value, b: Value | None) -> None:
        """
        					构造函数，y = x * k + b
        					:param	x:		因数之一
        					:param	k:		因数之二
        					:param	b:		偏置，可选
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Matmul:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def cut_scale(self) -> QuantizedScaleArray:
        """
        硬件截位时的系数
        """
    @cut_scale.setter
    def cut_scale(self, arg1: QuantizedScaleArray) -> None:
        ...
class Max(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MaxNode'
    @staticmethod
    def Init() -> Max:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dim: IntImm | None = None, keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求最大值索引的维度（支持负数索引）
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Max:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> IntImm | None:
        """
        进行求最大值索引的维度（支持负数索引）
        """
    @dim.setter
    def dim(self, arg1: IntImm | None) -> None:
        ...
    @property
    def keepdim(self) -> bool:
        """
        是否保持维度不变
        """
    @keepdim.setter
    def keepdim(self, arg1: bool) -> None:
        ...
class MaxPool1d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MaxPool1dNode'
    @staticmethod
    def Init() -> MaxPool1d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, pool_width: int, stride_width: int, pad_left: int, pad_right: int, dilation_width: int) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_width:				池化窗口宽度
        					:param	stride_width:			池化滑动宽度
        					:param	pad_left:				池化左方Pad
        					:param	pad_right:				池化右方Pad
        					:param	dilation_width:			池化膨胀宽度
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> MaxPool1d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dilation_width(self) -> int:
        """
        池化膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        池化左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        池化右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pool_width(self) -> int:
        """
        池化窗口宽度
        """
    @pool_width.setter
    def pool_width(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        池化滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class MaxPool2d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MaxPool2dNode'
    @staticmethod
    def Init() -> MaxPool2d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, pool_width: int, pool_height: int, stride_width: int, stride_height: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, dilation_width: int, dilation_height: int) -> None:
        """
        				构造函数
        				:param	input:					池化的输入
        				:param	pool_width:				池化窗口宽度
        				:param	pool_height:			池化窗口高度
        				:param	stride_width:			池化滑动宽度
        				:param	stride_height:			池化滑动高度
        				:param	pad_top:				池化上方Pad
        				:param	pad_bottom:				池化下方Pad
        				:param	pad_left:				池化左方Pad
        				:param	pad_right:				池化右方Pad
        				:param	dilation_width:			池化膨胀宽度
        				:param	dilation_height:		池化膨胀高度
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad_top_bottom: int, pad_left_right: int, dilation: int) -> None:
        """
        				构造函数
        				:param	input:					池化的输入
        				:param	pool_size:				池化窗口尺寸，高度和宽度相同
        				:param	stride:					池化滑动长度，高度和宽度相同
        				:param	pad_top_bottom:			池化上下方Pad
        				:param	pad_left_right:			池化左右方Pad
        				:param	dilation:				池化膨胀系数，宽度和高度相同
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad: int, dilation: int) -> None:
        """
        				构造函数
        				:param	input:					池化的输入
        				:param	pool_size:				池化窗口尺寸，高度和宽度相同
        				:param	stride:					池化滑动长度，高度和宽度相同
        				:param	pad:					池化上下左右方Pad
        				:param	dilation:				池化膨胀系数，宽度和高度相同
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> MaxPool2d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dilation_height(self) -> int:
        """
        池化膨胀高度，默认为1
        """
    @dilation_height.setter
    def dilation_height(self, arg1: int) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        池化膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        池化下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        池化左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        池化右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        池化上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def pool_height(self) -> int:
        """
        池化窗口宽度
        """
    @pool_height.setter
    def pool_height(self, arg1: int) -> None:
        ...
    @property
    def pool_width(self) -> int:
        """
        池化窗口宽度
        """
    @pool_width.setter
    def pool_width(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        池化滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        池化滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class MaxPool3d(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MaxPool3dNode'
    @staticmethod
    def Init() -> MaxPool3d:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, pool_depth: int, pool_width: int, pool_height: int, stride_depth: int, stride_width: int, stride_height: int, pad_front: int, pad_back: int, pad_top: int, pad_bottom: int, pad_left: int, pad_right: int, dilation_depth: int, dilation_width: int, dilation_height: int) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_depth:				池化窗口深度
        					:param	pool_width:				池化窗口宽度
        					:param	pool_height:			池化窗口高度
        					:param	stride_depth:			池化滑动深度
        					:param	stride_width:			池化滑动宽度
        					:param	stride_height:			池化滑动高度
        					:param	pad_front:				池化前方Pad
        					:param	pad_back:				池化后方Pad
        					:param	pad_top:				池化上方Pad
        					:param	pad_bottom:				池化下方Pad
        					:param	pad_left:				池化左方Pad
        					:param	pad_right:				池化右方Pad
        					:param	dilation_width:			池化膨胀深度
        					:param	dilation_width:			池化膨胀宽度
        					:param	dilation_height:		池化膨胀高度
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad_front_top_bottom: int, pad_back_left_right: int, dilation: int) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_size:				池化窗口尺寸，高度和宽度相同
        					:param	stride:					池化滑动长度，高度和宽度相同
        					:param	pad_front_top_bottom:	池化前上下方Pad
        					:param	pad_back_left_right:	池化后左右方Pad
        					:param	dilation:				池化膨胀系数，宽度和高度相同
        """
    @typing.overload
    def __init__(self, input: Value, pool_size: int, stride: int, pad: int, dilation: int) -> None:
        """
        					构造函数
        					:param	input:					池化的输入
        					:param	pool_size:				池化窗口尺寸，深度、高度和宽度相同
        					:param	stride:					池化滑动长度，深度、高度和宽度相同
        					:param	pad:					池化前后上下左右方Pad
        					:param	dilation:				池化膨胀系数，深度、宽度和高度相同
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> MaxPool3d:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dilation_depth(self) -> int:
        """
        池化膨胀深度，默认为1
        """
    @dilation_depth.setter
    def dilation_depth(self, arg1: int) -> None:
        ...
    @property
    def dilation_height(self) -> int:
        """
        池化膨胀高度，默认为1
        """
    @dilation_height.setter
    def dilation_height(self, arg1: int) -> None:
        ...
    @property
    def dilation_width(self) -> int:
        """
        池化膨胀宽度，默认为1
        """
    @dilation_width.setter
    def dilation_width(self, arg1: int) -> None:
        ...
    @property
    def pad_back(self) -> int:
        """
        池化后方Pad，默认为0
        """
    @pad_back.setter
    def pad_back(self, arg1: int) -> None:
        ...
    @property
    def pad_bottom(self) -> int:
        """
        池化下方Pad，默认为0
        """
    @pad_bottom.setter
    def pad_bottom(self, arg1: int) -> None:
        ...
    @property
    def pad_front(self) -> int:
        """
        池化前方Pad，默认为0
        """
    @pad_front.setter
    def pad_front(self, arg1: int) -> None:
        ...
    @property
    def pad_left(self) -> int:
        """
        池化左方Pad，默认为0
        """
    @pad_left.setter
    def pad_left(self, arg1: int) -> None:
        ...
    @property
    def pad_right(self) -> int:
        """
        池化右方Pad，默认为0
        """
    @pad_right.setter
    def pad_right(self, arg1: int) -> None:
        ...
    @property
    def pad_top(self) -> int:
        """
        池化上方Pad，默认为0
        """
    @pad_top.setter
    def pad_top(self, arg1: int) -> None:
        ...
    @property
    def pool_depth(self) -> int:
        """
        池化窗口深度
        """
    @pool_depth.setter
    def pool_depth(self, arg1: int) -> None:
        ...
    @property
    def pool_height(self) -> int:
        """
        池化窗口宽度
        """
    @pool_height.setter
    def pool_height(self, arg1: int) -> None:
        ...
    @property
    def pool_width(self) -> int:
        """
        池化窗口宽度
        """
    @pool_width.setter
    def pool_width(self, arg1: int) -> None:
        ...
    @property
    def stride_depth(self) -> int:
        """
        池化滑动深度，默认为1
        """
    @stride_depth.setter
    def stride_depth(self, arg1: int) -> None:
        ...
    @property
    def stride_height(self) -> int:
        """
        池化滑动高度，默认为1
        """
    @stride_height.setter
    def stride_height(self, arg1: int) -> None:
        ...
    @property
    def stride_width(self) -> int:
        """
        池化滑动宽度，默认为1
        """
    @stride_width.setter
    def stride_width(self, arg1: int) -> None:
        ...
class Maximum(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MaximumNode'
    @staticmethod
    def Init() -> Maximum:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs:		左操作数
        					:param	rhs:		右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Maximum:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Mean(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MeanNode'
    @staticmethod
    def Init() -> Mean:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, input: Value, dim: int, keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求和的维度
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, inputs: Value, dim: list[int], keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求和的维度
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Mean:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> ...:
        """
        进行求和的维度（支持负数索引）
        """
    @dim.setter
    def dim(self, arg1: ...) -> None:
        ...
    @property
    def keepdim(self) -> bool:
        """
        是否保持维度不变
        """
    @keepdim.setter
    def keepdim(self, arg1: bool) -> None:
        ...
class MemType(ObjectRef):
    """
    表示存储类型的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::MemTypeNode'
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> MemType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class MergedAxisDistr(ObjectRef):
    """
    
    				表示通道分布的类.
    				MergedAxisDistr使用掩码来表示多个维度融合后元素是否有效，掩码的数量和融合后元素数相同。
    				当掩码为1时表示该通道有效，为0表示无效。
    			
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::MergedAxisDistrNode'
    @staticmethod
    def Init() -> MergedAxisDistr:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, merged_axis: list[int], element_num: int = 0, init: bool = True) -> None:
        """
        				构造函数.
        				:param merged_axis:		坐标轴索引
        				:param element_num:		元素的数量
        				:param init:			valid_mask的初始值，默认为true
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def allSections(self) -> list[tuple[int, int, bool]]:
        """
        				获取所有的片段.
        				:return: 表示片段的list，其中每个元素为一个tuple.
        						 tuple的三个元素分别表示该片段的[开始, 结束)以及是否有效.
        """
    @typing.overload
    def append(self, element_num: int, valid: bool) -> MergedAxisDistr:
        """
        				设置融合坐标.
        				:param chann_num:	通道数量
        				:param valid:		添加的通道是否有效
        """
    @typing.overload
    def append(self, other_valid_mask: list[bool]) -> MergedAxisDistr:
        """
        				合并另一个valid_mask.
        				:param other_valid_mask:	数组表示的有效掩码
        """
    def clone(self, depth: int = 1) -> MergedAxisDistr:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def isValid(self, index: int) -> bool:
        """
        				检查指定的元素是否有效.
        				:param index:	通道索引
        				:return: 如果有效则返回true
        """
    def setMergedAxis(self, merged_axis: list[int]) -> MergedAxisDistr:
        """
        				设置融合坐标.
        				:param merged_axis:		坐标轴索引
        """
    def setUValue(self, uvalue: DistrUnvalidValue) -> MergedAxisDistr:
        """
        设置无效元素的值
        """
    def setUnvalid(self, start: int, end: int) -> MergedAxisDistr:
        """
        标记[start, end)范围无效.
        """
    def setValid(self, start: int, end: int) -> MergedAxisDistr:
        """
        标记[start, end)范围有效.
        """
    def totalNum(self) -> int:
        """
        获取总的元素数.
        """
    def totalUnvalidNum(self) -> int:
        """
        获取总的无效元素数.
        """
    def totalValidNum(self) -> int:
        """
        获取总的有效元素数.
        """
    def unvalidSections(self) -> list[tuple[int, int]]:
        """
        				获取所有的无效片段.
        				:return: 表示片段的list，其中每个元素为一个tuple.
        						 tuple的三个元素分别表示该片段的[开始, 结束)以及是否有效.
        """
    def validSections(self) -> list[tuple[int, int]]:
        """
        				获取所有的有效片段.
        				:return: 表示片段的list，其中每个元素为一个tuple.
        						 tuple的三个元素分别表示该片段的[开始, 结束)以及是否有效.
        """
    @property
    def merged_axis(self) -> ...:
        """
        融合的维度索引列表
        """
    @property
    def uvalue(self) -> DistrUnvalidValue:
        """
        无效元素的值
        """
    @property
    def valid_mask(self) -> ...:
        """
        元素掩码列表
        """
class Min(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MinNode'
    @staticmethod
    def Init() -> Min:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dim: IntImm | None = None, keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求最大值索引的维度（支持负数索引）
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Min:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> IntImm | None:
        """
        进行求最大值索引的维度（支持负数索引）
        """
    @dim.setter
    def dim(self, arg1: IntImm | None) -> None:
        ...
    @property
    def keepdim(self) -> bool:
        """
        是否保持维度不变
        """
    @keepdim.setter
    def keepdim(self, arg1: bool) -> None:
        ...
class Minimum(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MinimumNode'
    @staticmethod
    def Init() -> Minimum:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs:		左操作数
        					:param	rhs:		右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Minimum:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Mish(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MishNode'
    @staticmethod
    def Init() -> Mish:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:			输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Mish:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Mode:
    """
    填充模式
    
    Members:
    
      CONSTANT : 常量
    
      REFLECTION : 反射
    
      REPLICATION : 复制
    
      SYMMETRIC : 对称
    """
    CONSTANT: typing.ClassVar[Mode]  # value = <Mode.CONSTANT: 0>
    REFLECTION: typing.ClassVar[Mode]  # value = <Mode.REFLECTION: 1>
    REPLICATION: typing.ClassVar[Mode]  # value = <Mode.REPLICATION: 2>
    SYMMETRIC: typing.ClassVar[Mode]  # value = <Mode.SYMMETRIC: 3>
    __members__: typing.ClassVar[dict[str, Mode]]  # value = {'CONSTANT': <Mode.CONSTANT: 0>, 'REFLECTION': <Mode.REFLECTION: 1>, 'REPLICATION': <Mode.REPLICATION: 2>, 'SYMMETRIC': <Mode.SYMMETRIC: 3>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class Multiply(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::MultiplyNode'
    @staticmethod
    def Init() -> Multiply:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs:			左操作数
        					:param	rhs:			右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Multiply:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def cut_scale(self) -> QuantizedScaleArray:
        """
        硬件截位时的系数
        """
    @cut_scale.setter
    def cut_scale(self, arg1: QuantizedScaleArray) -> None:
        ...
class Neg(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::NegNode'
    @staticmethod
    def Init() -> Neg:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Neg:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Network(NetworkBase):
    """
    表示网络的类
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::NetworkNode'
    @staticmethod
    def CreateFromFlatFile(file_path: str) -> Network:
        """
        从Flat文件创建一个网络
        """
    @staticmethod
    def CreateFromJsonFile(file_path: str) -> Network:
        """
        从Json文件创建一个网络
        """
    @staticmethod
    def Init() -> Network:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, name: str, framework_kind: Framework, framework_version: str, swap_mode: bool, llm_mode: bool, ai_target: CompileTarget = ...) -> None:
        """
        				构造函数
        				:param name:				网络名称
        				:param framework_kind:		前端框架
        				:param framework_version:	前端框架
        				:param swap_mode:			内存交换模式
        				:param llm_mode:			大模型标记
        				:param ai_target:			准备部署到的ICore后端
        """
    @typing.overload
    def __init__(self, name: str, framework_kind: Framework, framework_version: str, swap_mode: bool, ai_target: CompileTarget = ...) -> None:
        """
        				构造函数(默认为小模型）
        				:param name:				网络名称
        				:param framework_kind:		前端框架
        				:param framework_version:	前端框架
        				:param swap_mode:			内存交换模式
        				:param ai_target:			准备部署到的ICore后端
        """
    @typing.overload
    def __init__(self, name: str, framework_kind: Framework, framework_version: str, ai_target: CompileTarget = ...) -> None:
        """
        				构造函数(默认为小模型，且不开启内存交换模式）
        				:param name:				网络名称
        				:param framework_kind:		前端框架
        				:param framework_version:	前端框架
        				:param ai_target:			准备部署到的ICore后端
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def addOp(self, op: Operation) -> Network:
        """
        				向网络中添加算子
        				:param op:			被添加的算子
        				:raise: 如果遇到以下情况，则抛出异常:
        					*	将Input插入非空网络
        					*	在空网络中插入非Input算子
        					*	Op为空
        					*	Op已经加入过别的网络
        					*	Op在该网络中已经存在
        					*	Op指定的op_id在网络中已被分配
        					*	Op不是Input算子，但是却没有输入
        					*   Op的输出指定的v_id在网络中已被分配
        """
    def autoLoadParams(self, path: str, calc_md5: bool = True) -> None:
        """
        				加载网络的参数（自动选择加载方式）
        				:param	path:		指定的路径
        				:param	calc_md5:	反序列化时是否计算参数的MD5
        				:raise:				如果参数的MD5和网络不匹配的抛出异常
        """
    def clone(self, depth: int = 1) -> Network:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @typing.overload
    def connect(self, from: Value, to: Operation, index: int) -> Network:
        """
        				将(算子输出)Value连接到算子to的第index个输入
        				:param	from:		源Value
        				:param	to:			目标算子
        				:param	index:		算子的第index个输入
        """
    @typing.overload
    def connect(self, from: Value, to: Operation) -> Network:
        """
        				将(算子输出)Value连接到算子to最后一个输入
        				:param	from:		源Value
        				:param	to:			目标算子
        """
    @typing.overload
    def connect(self, from: Value, to: list[tuple[Operation, set[int]]]) -> Network:
        """
        				将(算子输出)Value连接到ValueUsesInfo表示的目标
        				:param	from:		源Value
        				:param	to:			目标
        """
    def dumpFlatToFile(self, file_path: str, calc_md5: bool = True, validate: bool = True) -> None:
        """
        				将网络序列化为FlatBuffers，并输出到指定的文件
        				:param	file_path:		指定的文件路径
        				:param	calc_md5:		序列化时是否计算参数的MD5
        				:param	validate:		序列化时是否检查网络必须符合规范
        """
    def dumpJson(self, stream: io.BytesIO, calc_md5: bool = True) -> None:
        """
        				将网络序列化为Json，并输出到指定的流
        				:param	stream:		指定的输出流
        				:param	calc_md5:	序列化时是否计算参数的MD5
        """
    def dumpJsonAndParams(self, json_path: str, raw_path: str, move: bool = False, calc_md5: bool = True, validate: bool = True) -> None:
        """
        				将网络序列化为Json，并输出网络参数到指定的路径
        				:param  json_path: 		指定的Json文件路径
        				:param	raw_path:		指定的参数文件或目录路径
        				:param	move:			swap_mode下是否移动参数缓存文件（移动会导致网络不可访问）
        				:param	calc_md5:		序列化时是否计算参数的MD5
        				:param	validate:		序列化时是否检查网络必须符合规范
        """
    def dumpJsonToFile(self, file_path: str, calc_md5: bool = True, validate: bool = True) -> None:
        """
        				将网络序列化为Json，并输出到指定的文件
        				:param	file_path:		指定的文件路径
        				:param	calc_md5:		序列化时是否计算参数的MD5
        				:param	validate:		序列化时是否检查网络必须符合规范
        """
    def dumpParams(self, stream: io.BytesIO) -> None:
        """
        				输出网络参数到指定的流
        				:param	stream:		指定的输出流
        """
    def dumpParamsToFile(self, file_path: str) -> None:
        """
        				输出网络参数到指定的文件
        				:param	file_path:		指定的文件路径
        """
    def dumpSwapParamsToDir(self, dest_path: str, move: bool = False) -> None:
        """
        				输出内存交换的网络参数到指定的目录
        				:param	dest_path:		指定的目录路径
        				:param	move:			是否移动参数缓存文件（移动会导致网络不可访问）
        """
    def getTag(self, key: str) -> ObjectRef | None:
        """
        				获取网络的标签
        				:param key:			标签的键
        				:return: 标签的值（可选项）
        """
    def getUsesInfo(self, v: Value) -> list[tuple[Operation, set[int]]]:
        """
        				获取某个Value的使用信息
        				:param	v:		目标Value
        """
    def getUsesInfoExceptMatch(self, v: Value, match: dict[OpPattern, Operation]) -> list[tuple[Operation, set[int]]]:
        """
        				获取某个Value的使用信息，排除匹配结果中的算子
        				:param	v:		目标Value
        """
    def insertOp(self, op_index: int, op: Operation) -> Network:
        """
        				向网络中插入算子
        				:param op_index:	插入位置
        				:param op:			被插入Op
        				:raise: 如果遇到以下情况，则抛出异常:
        					*	将Input插入非空网络
        					*	在空网络中插入非Input算子
        					*	Op为空
        					*	Op已经加入过别的网络
        					*	Op在该网络中已经存在
        					*	Op指定的op_id在网络中已被分配
        					*	Op不是Input算子，但是却没有输入
        					*   Op的输出指定的v_id在网络中已被分配
        """
    def insertOpById(self, op_id: int, op: Operation) -> Network:
        """
        				向网络中插入算子
        				:param op_id:		插入位置的Op ID
        				:param op:			被插入Op
        				:raise: 如果遇到以下情况，则抛出异常:
        					*	将Input插入非空网络
        					*	在空网络中插入非Input算子
        					*	Op为空
        					*	Op已经加入过别的网络
        					*	Op在该网络中已经存在
        					*	Op指定的op_id在网络中已被分配
        					*	Op不是Input算子，但是却没有输入
        					*   Op的输出指定的v_id在网络中已被分配
        """
    def lazyLoadParamsFromDir(self, dir_path: str) -> None:
        """
        				从目录中惰性加载网络的参数
        				:param	dir_path:		指定的目录路径
        """
    def lazyLoadParamsFromFile(self, file_path: str, calc_md5: bool = True) -> None:
        """
        				从文件中惰性加载网络的参数
        				:param	file_path:		指定的文件路径
        				:param	calc_md5:		反序列化时是否计算参数的MD5
        				:raise:					如果参数的MD5和网络不匹配的抛出异常
        """
    def loadParams(self, stream: io.BytesIO, calc_md5: bool = True) -> None:
        """
        				从输入流中加载网络的参数
        				:param	stream:		指定的输入流
        				:param	calc_md5:	反序列化时是否计算参数的MD5
        				:raise:				如果参数的MD5和网络不匹配则抛出异常
        """
    def loadParamsFromFile(self, file_path: str, calc_md5: bool = True) -> None:
        """
        				从文件中加载网络的参数
        				:param	file_path:		指定的文件路径
        				:param	calc_md5:		反序列化时是否计算参数的MD5
        				:raise:					如果参数的MD5和网络不匹配则抛出异常
        """
    def removeOp(self, f: typing.Callable[[Operation], bool]) -> Network:
        """
        				移除网络中的算子
        				:param	f:		移除算子的条件函数，所有f返回true的算子都会被移除
        """
    def removeOpById(self, op_id: int) -> Network:
        """
        				移除网络中的算子
        				:param op_id:		被移除算子的ID
        				:raise: 如果指定的Op在网络中不存在则抛出异常
        """
    def removeTag(self, key: str) -> bool:
        """
        				删除算子的标签
        				:param key:			标签的键
        				:return: 如果标签存在则返回true，否则返回false
        """
    def replaceGroup(self, src: dict[OpPattern, Operation], dest: Operation) -> Network:
        """
        				将MatchGroup表达的子图替换为某个算子
        				:param	src:		MatchGroup表达的子图
        				:param	dest:		替换后的算子
        """
    def replaceOp(self, src: Operation, dest: Operation) -> Network:
        """
        				替换网络中的算子
        				:param	src:		被替换的算子
        				:param	dest:		替换后的算子
        """
    def replaceOpById(self, op_id: int, op: Operation) -> Network:
        """
        				替换网络中的算子
        				:param	op_id:		被替换的算子ID
        				:param	op:			替换后的算子
        """
    def replaceOpByIdKeepUses(self, op_id: int, op: Operation) -> Network:
        """
        				替换网络中的算子，保持原来的连接关系
        				:param	op_id:		被替换的算子ID
        				:param	op:			替换后的算子
        				:raise: 如果指定的Op在网络中不存在则抛出异常
        """
    def replaceOpKeepUses(self, src: Operation, dest: Operation) -> Network:
        """
        				替换网络中的算子，保持原来的连接关系
        				:param	src:		被替换的算子
        				:param	dest:		替换后的算子
        				:raise: 如果指定的Op在网络中不存在则抛出异常
        """
    def rewrite(self, pattern: Pattern, callback: typing.Callable[[Network, dict[OpPattern, Operation]], None], times: int = 10000) -> None:
        """
        				根据指定的模式和回调重写网络
        				:param	pattern:	指定的模式
        				:param	callback:	回调函数，实现了改变网络的逻辑
        				:param	times:		搜索的最大次数
        """
    def rewriter(self) -> ...:
        """
        获取网络的NetworkRewriter
        """
    def search(self, pattern: Pattern) -> list[dict[OpPattern, Operation]]:
        """
        				搜索网络中符合模式的结构
        				:param	pattern:	指定的模式
        				:return:			list[dict[OpPattern, Operation]]表示的搜索结果
        									其中每个dict[OpPattern, Operation]表示一组匹配结果, 即MatchGroup
        """
    def searchOnce(self, pattern: Pattern) -> dict[OpPattern, Operation]:
        """
        				搜索网络中符合模式的结构一次
        				:param	pattern:	指定的模式
        				:return:			dict[OpPattern, Operation]表示的一组搜索结果
        """
    def setLLMMode(self, llm_mode: bool) -> Network:
        """
        				设置网络的大模型标记
        				:param llm_mode:	大模型标记
        				:return: 自身
        """
    def setName(self, name: str) -> Network:
        """
        				设置网络的名称
        				:param name:		网络的名称
        """
    def setTag(self, key: str, value: ObjectRef) -> Network:
        """
        				设置网络的标签
        				:param key:			标签的键
        				:param value:		标签的值
        """
    @property
    def framework_kind(self) -> Framework:
        """
        前端框架
        """
    @property
    def framework_version(self) -> str:
        """
        框架版本
        """
    @property
    def icraft_version(self) -> str:
        """
        Icraft版本
        """
    @property
    def icraft_xir_version(self) -> str:
        """
        XIR版本
        """
    @property
    def llm_mode(self) -> bool:
        """
        大模型标记
        """
    @property
    def name(self) -> str:
        """
        网络名称
        """
    @property
    def params_bytes(self) -> int:
        """
        参数大小
        """
    @property
    def params_md5(self) -> str:
        """
        参数的MD5
        """
    @property
    def swap_mode(self) -> bool:
        """
        内存交换模式
        """
    @property
    def tags(self) -> dict[String, ObjectRef]:
        """
        其它标记
        """
class NetworkBase(ObjectRef):
    """
    表示网络的基类.
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::NetworkBaseNode'
    @staticmethod
    def Init() -> NetworkBase:
        """
        创建一个初始化(非空)对象
        """
    def __getitem__(self, arg0: int) -> Operation:
        """
        获取网络的第index个算子.
        """
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NetworkBase:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def containsValueById(self, v_id: int) -> bool:
        """
        				检查网络中是否存在指定ID的Value
        				:param	v_id:		指定的ID
        				:return:			如果存在则返回true，否则返回false
        """
    def getConsumersByOpId(self: ..., op_id: int, sorted: bool) -> list[Operation]:
        """
        获取网络中指定Op的消费者(消费者的输入是该Op的输出)
        """
    def getNextOpById(self, op_id: int) -> Operation:
        """
        获取网络Op列表中(即执行序)某个Op的后一个Op
        """
    def getOpById(self, op_id: int) -> Operation:
        """
        				根据指定ID获取网络中的Op
        				:param	op_id:		指定的ID
        				:raise:				如果op_id指定的Op不存在则抛出异常
        """
    def getOpIndexById(self, op_id: int) -> int:
        """
        				获取指定Op在网络中的index
        				:param	op_id:		指定Op的ID
        """
    def getOpsById(self: ..., op_ids: list[int]) -> list[Operation]:
        """
        				根据指定ID列表获取网络中的Op列表
        				:param	op_ids:		指定的ID列表
        				:raise:				如果op_id指定的Op不存在则抛出异常
        """
    def getPreOpById(self, op_id: int) -> Operation:
        """
        获取网络Op列表中(即执行序)某个Op的前一个Op
        """
    def getProducersByOpId(self: ..., op_id: int, sorted: bool) -> list[Operation]:
        """
        获取网络中指定Op的生产者(生产者的输出是该Op的输入)
        """
    def getUsesNumByValueId(self, v_id: int) -> int:
        """
        				获取网络中使用某Value(即以该Value做输入)的Op数量
        				:param	v_id:		指定的ID
        """
    def getUsesOpByValueId(self, v_id: int) -> ...:
        """
        				获取网络中使用某Value(即以该Value做输入)的Op列表
        				:param	v_id:		指定的ID
        """
    def getValueById(self, v_id: int) -> Value:
        """
        				根据指定ID获取网络中的Value
        				:param	v_id:		指定的ID
        				:raise:				如果v_id指定的Value不存在则抛出异常
        """
    def getValuesById(self: ..., value_ids: list[int]) -> list[Value]:
        """
        				根据指定ID列表获取网络中的Value列表
        				:param	value_ids:		指定的ID列表
        				:raise:					如果v_id指定的Value不存在则抛出异常
        """
    def inputs(self) -> list[Value]:
        """
        				获取网络中的输入
        				:return: 网络中输入算子的输出Value列表，即网络的输入
        """
    def outputs(self) -> list[Value]:
        """
        				获取网络中的输出
        				:return: 网络中输出算子的输入Value列表，即网络的输出
        """
    def setAITarget(self, ai_target: CompileTarget) -> NetworkBase:
        """
        				设置网络准备部署到的ICore后端
        				:param	ai_target:			准备部署到的ICore后端
        """
    @typing.overload
    def view(self, ops: ...) -> ...:
        """
        				从该网络创建一个NetworkView
        				:param	ops:		NetworkView包含的算子
        """
    @typing.overload
    def view(self, op_ids: list[int]) -> ...:
        """
        				从该网络创建一个NetworkView
        				:param	op_ids:		NetworkView包含的算子的ID列表
        """
    @typing.overload
    def view(self, start_index: int, end_index: int) -> ...:
        """
        				从该网络创建一个NetworkView
        				:param	start_index:	NetworkView包含的算子在原网络中的开始索引(包含)，支持负数索引
        				:param	end_index:		NetworkView包含的算子在原网络中的结束索引(不包含)
        """
    @typing.overload
    def view(self, start_index: int) -> ...:
        """
        				从该网络创建一个NetworkView
        				:param	start_index:	NetworkView包含的算子在原网络中的开始索引(包含)
        """
    @typing.overload
    def view(self, judge: typing.Callable[[Operation], bool]) -> ...:
        """
        				从该网络创建一个NetworkView
        				:param	judge:			判断算子是否放入NetworkView的函数
        """
    def viewByOpId(self, start_op_id: int, end_op_id: int) -> ...:
        """
        				从该网络视图创建一个NetworkView
        				:param	start_op_id:	NetworkView包含的开始算子ID(包含)
        				:param	end_op_id:		NetworkView包含的结束算子ID(包含)
        """
    def viewExcept(self, op_ids: list[int]) -> ...:
        """
        				从该网络视图创建一个NetworkView
        				:param	op_ids:		NetworkView不包含的算子的ID列表
        """
    @property
    def ai_target(self) -> CompileTarget:
        """
        准备部署到的ICore后端
        """
    @property
    def ops(self) -> list[Operation]:
        """
        Op列表
        """
class NetworkPass(Pass):
    """
    
    			表示网络Pass的类型
    			NetworkPass会对输入的Network调用执行函数进行处理，然后返回处理后的Network
    		
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::NetworkPassNode'
    @staticmethod
    def Init() -> NetworkPass:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, pass_func: typing.Callable[[..., PassContext], ...], name: String, opt_level: int = 0, required_passes: list[String] = []) -> None:
        """
        				构造函数
        				:param	pass_func:			Pass的执行函数
        				:param	name:				Pass的名称
        				:param	opt_level:			Pass的优化等级，默认为0
        				:param	required_passes:	Pass的前置Pass，默认为空
        """
    @typing.overload
    def __init__(self, pass_func: typing.Callable[[..., PassContext], ...], pass_info: PassInfo) -> None:
        """
        				构造函数
        				:param	pass_func:			Pass的执行函数
        				:param	pass_info:			Pass的信息
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NetworkPass:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def pass_func(self) -> typing.Callable[[..., PassContext], ...]:
        """
        Pass的执行函数
        """
class NetworkRewriter:
    """
    
    				网络的重写器，提供continue和break方法控制重写过程
    				默认的重写过程会重复从头匹配网络，而continue可以使其从上一个匹配位置继续，break会直接中断重写过程
    			
    """
    def Break(self) -> None:
        """
        中断重写过程
        """
    def Continue(self) -> None:
        """
        从上次匹配的位置继续匹配和重写
        """
class NetworkView(NetworkBase):
    type_key: typing.ClassVar[str] = 'icraft::xir::NetworkViewNode'
    @staticmethod
    def Init() -> NetworkView:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NetworkView:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def network(self) -> Network:
        """
        获取该网络视图对应的Network.
        """
    def setOutputsOrderByValueIds(self, arg0: list[int]) -> NetworkView:
        """
        修改NetworkView的输出Value的顺序.
        """
    def toNetwork(self) -> Network:
        """
        将当前网络视图转为一个独立的网络，如果缺失输入输出会自动补全.
        """
class Normalize(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::NormalizeNode'
    @staticmethod
    def Init() -> Normalize:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, axis: list[int], p: float = 2, eps: float = 1e-12) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		待归一化的维度（支持负数索引）
        					:param	p:			范数公式中的指数值，默认为2
        					:param	eps:		防止除以0的小浮点数，默认为1e-12
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Normalize:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> ...:
        """
        待归一化的维度（支持负数索引）
        """
    @axis.setter
    def axis(self, arg1: list[int]) -> None:
        ...
    @property
    def eps(self) -> float:
        """
        防止除以0的小浮点数，默认为1e-12
        """
    @eps.setter
    def eps(self, arg1: float) -> None:
        ...
    @property
    def p(self) -> float:
        """
        范数公式中的指数值，默认为2
        """
    @p.setter
    def p(self, arg1: float) -> None:
        ...
class NormalizedQuantizedType(QuantizedType):
    """
    表示采用归一化的量化类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::NormalizedQuantizedTypeNode'
    @staticmethod
    def Init() -> NormalizedQuantizedType:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, normratio: list[float], scale: ..., storage_dtype: ScalarType, expressed_dtype: ScalarType = ...) -> None:
        """
        				构造函数
        				:param normratio:			归一化系数
        				:param scale:				量化的缩放因子
        				:param storage_dtype:		存储类型，即量化的目标类型
        				:param expressed_dtype:		表达类型，即数据的原始类型
        """
    @typing.overload
    def __init__(self, nomalized: NormalizedType, scale: ...) -> None:
        """
        				构造函数
        				:param nomalized:			归一化类型的对象
        				:param scale:				量化的缩放因子
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NormalizedQuantizedType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class NormalizedType(BaseQuantizedType):
    """
    表示归一化后的数据类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::NormalizedTypeNode'
    @staticmethod
    def Init() -> NormalizedType:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, normratio: list[float], storage_dtype: ScalarType, expressed_dtype: ScalarType = ...) -> None:
        """
        				构造函数
        				:param normratio:			归一化系数
        				:param storage_dtype:		存储类型，即量化的目标类型
        				:param expressed_dtype:		表达类型，即数据的原始类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NormalizedType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def normratio(self) -> ...:
        """
        归一化系数
        """
class NormratioArray(ObjectRef):
    """
    表示归一化系数列表.
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::NormratioArrayNode'
    @staticmethod
    def Init() -> NormratioArray:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, data: list[float], axis: int = -1) -> None:
        ...
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NormratioArray:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setAxis(self, axis: int) -> NormratioArray:
        ...
    @property
    def axis(self) -> int:
        """
        系数对应的维度
        """
    @property
    def data(self) -> list[float]:
        """
        归一化系数
        """
class NotEqual(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::NotEqualNode'
    @staticmethod
    def Init() -> NotEqual:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value) -> None:
        """
        					构造函数
        					:param	lhs :	左操作数
        					:param	rhs :	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> NotEqual:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class ObjectRef:
    """
    表示XIR中的对象引用，可以认为是一个侵入式地智能指针，XIR中的所有类型都派生自此类
    """
    __hash__: typing.ClassVar[None] = None
    type_key: typing.ClassVar[str] = 'Object'
    def __eq__(self, arg0: ObjectRef) -> bool:
        """
        重载等于运算符
        """
    def __init__(self) -> None:
        """
        默认构造函数
        """
    def __ne__(self, arg0: ObjectRef) -> bool:
        """
        重载不等于运算符
        """
    def __str__(self) -> str:
        """
        获取对象的字符串表示
        """
    def clone(self, depth: int = 1) -> ObjectRef:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def defined(self) -> bool:
        """
        检查引用的实例是否存在，如果对象引用了空指针则返回false
        """
    def same_as(self, arg0: ObjectRef) -> bool:
        """
        比较引用的实例是否相同，即对象的指针是否相同
        """
    def typeKey(self) -> str:
        """
        获取所引用对象的type_key字符串，该字符串表示引用对象的类型
        """
    def type_is(self, arg0: type) -> bool:
        """
        检查类型是否是字符串指定的类型
        """
    def unique(self) -> bool:
        """
        判断引用是否唯一，即引用计数为1则返回true
        """
    def use_count(self) -> int:
        """
        获取引用计数
        """
class OnChipMem(MemType):
    """
    表示OCM存储类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::OnChipMemNode'
    @staticmethod
    def Init() -> OnChipMem:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, addr: int) -> None:
        """
        				构造函数，从地址构造
        				:param addr:	OCM上的地址
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> OnChipMem:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setAddr(self, addr: int) -> OnChipMem:
        """
        				设置地址
        				:param addr:	OCM上的地址
        """
    @property
    def addr(self) -> int:
        """
        OCM上的地址
        """
class OpPattern(Pattern):
    """
    表示匹配算子的模式
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::OpPatternNode'
    @staticmethod
    def Init() -> OpPattern:
        """
        创建一个初始化(非空)对象
        """
    def __call__(self, inputs: list[...]) -> OpPattern:
        """
        				设置算子的输入模式
        				:param inputs:		输入模式列表
        """
    def __getitem__(self, arg0: int) -> ...:
        """
        获取算子的输出模式
        """
    def __hash__(self) -> int:
        """
        哈希方法
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, op_type: list[str]) -> None:
        """
        				构造函数
        				:param op_type:		算子的类型字符串
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    @typing.overload
    def __or__(self, arg0: OpPattern) -> ...:
        """
        或逻辑的操作符重载
        """
    @typing.overload
    def __or__(self, arg0: ...) -> ...:
        """
        或逻辑的操作符重载
        """
    def clone(self, depth: int = 1) -> OpPattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @typing.overload
    def hasAttr(self, key: str) -> OpPattern:
        """
        				为算子添加属性模式，匹配键
        				:param key:		属性的键
        """
    @typing.overload
    def hasAttr(self, key: str, value: ObjectRef | int | int | int | bool | float | str) -> OpPattern:
        """
        				为算子添加属性模式，匹配键和值
        				:param key:		属性的键
        				:param value:	属性的值
        """
    def onTarget(self, arg0: type) -> OpPattern:
        """
        描述算子的编译目标
        """
    def setConstraint(self, cfunc: typing.Callable[[Operation], bool]) -> OpPattern:
        """
        				描述算子的约束函数
        				:param cfunc:	算子的约束函数，该函数返回True表示符合约束
        """
    @property
    def attrs(self) -> list[AttrPattern]:
        """
        算子的属性
        """
    @property
    def cfunc(self) -> typing.Callable[[Operation], bool]:
        """
        算子的约束函数
        """
    @property
    def inputs(self) -> list[...]:
        """
        算子的输入
        """
    @property
    def op_type(self) -> ...:
        """
        算子的类型
        """
    @property
    def target_type(self) -> str:
        """
        算子的编译目标类型
        """
class Operation(ObjectRef):
    """
    表示算子的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::OperationNode'
    @staticmethod
    def Create(arg0: str, arg1: str) -> Operation:
        """
        				根据名字创建算子
        				:param name:			算子的名字
        				:param dll_file:		算子所在DLL路径(可选)
        """
    def __getitem__(self, arg0: int) -> Value:
        """
        获取算子索引指定的输出
        """
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def addInput(self, v: Value) -> Operation:
        """
        				获取算子的标签
        				:param v:		被添加的输入
        """
    def attrs(self) -> dict[str, ObjectRef | int | int | int | bool | float | str]:
        """
        				获取算子中所有属性的字典
        """
    def checkBound(self) -> None:
        """
        检查算子的属性是否都满足边界条件. 不满足则抛出异常
        """
    def checkNull(self) -> None:
        """
        检查算子的属性是否都不为空. 为空则抛出异常
        """
    def clearInputs(self) -> Operation:
        """
        清除算子所有的输入
        """
    def clone(self, depth: int = 1) -> Operation:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def connectInput(self, index: int, v: Value) -> None:
        """
        				连接输入, 将v作为Op的第index个输入
        				:param index:		输入的索引
        				:param v:			被连接的输入Value
        """
    def consumers(self) -> list[Operation]:
        """
        获取算子的消费者算子列表
        """
    def getAttr(self, arg0: str) -> ObjectRef | int | int | int | bool | float | str:
        """
        				获取算子中的某个属性
        				:param key:		属性的字符串名称
        """
    @typing.overload
    def getInputIndex(self, v: Value) -> set[int]:
        """
        				获取输入的索引，即是算子的第几个输入
        				:param	v		指定的输入Value
        				:raise:			如果v不是Op的任何输入则抛出异常
        """
    @typing.overload
    def getInputIndex(self, v_id: int) -> set[int]:
        """
        				获取输入的索引，即是算子的第几个输入
        				:param	v_id	指定的输入Value的ID
        				:raise:			如果v不是Op的任何输入则抛出异常
        """
    def getTag(self, key: str) -> ObjectRef | None:
        """
        				获取算子的标签
        				:param key:			标签的键
        				:return: 标签的值（可选项）
        """
    @typing.overload
    def hasAttr(self, arg0: str) -> bool:
        """
        				检查算子中某个属性是否存在
        				:param key:		属性的字符串名称
        """
    @typing.overload
    def hasAttr(self, arg0: str, arg1: ObjectRef | int | int | int | bool | float | str) -> None:
        """
        				检查算子中某个属性是否存在并等于指定的值
        				:param key:		属性的字符串名称
        				:param value:	属性的值
        """
    @typing.overload
    def inferResults(self, override: bool = False) -> list[Value]:
        """
        				推断算子的输出类型，并获取输出
        				该方法调用算子注册的TypeInfer函数来推断输出的类型
        				:param:		override	是否覆盖已有输出，默认为否，如果已有输出则不再推断
        				:raise:					如果没有注册TypeInfer函数，则抛出异常
        """
    @typing.overload
    def inferResults(self, dtypes: list[TensorType], override: bool = False) -> list[Value]:
        """
        				根据指定的输出类型列表，获取算子的输出
        				该方法调用算子注册的TypeInfer函数来推断输出的类型
        				:param dtypes:			输出的数据类型列表
        				:param override:		是否覆盖已有输出，默认为否，如果已有输出则不再推断
        """
    def insertInput(self, index: int, v: Value) -> Operation:
        """
        				插入输入
        				index表示插入后的索引，比如输入为空时应指定index为0
        				:param index:	插入输入后的索引
        				:param v:		指定的输入值
        """
    def isActivate(self) -> bool:
        """
        检查该算子是否是激活算子
        """
    def isBoundToNetwork(self) -> bool:
        """
        检查算子是否绑定到了网络
        """
    def network(self) -> ...:
        """
        获取算子绑定的网络
        """
    def nextOp(self) -> Operation:
        """
        获取算子执行序的下一个算子
        """
    def nonParamsInputs(self) -> list[Value]:
        """
        获取算子非Params的输入列表
        """
    def paramsAttrs(self, is_defined: bool = False) -> list[Params]:
        """
        				获取算子中所有Params属性的列表
        """
    def paramsInputs(self) -> list[Value]:
        """
        获取算子Params的输入列表
        """
    def preOp(self) -> Operation:
        """
        获取算子执行序的上一个算子
        """
    def producers(self) -> list[Operation]:
        """
        获取算子的生产者算子列表
        """
    def removeInputById(self, v_id: int) -> Operation:
        """
        				移除算子指定ID的输入
        				:param v_id:	输入的ID
        """
    def removeTag(self, key: str) -> bool:
        """
        				删除算子的标签
        				:param key:			标签的键
        				:return: 如果标签存在则返回true，否则返回false
        """
    def replaceInput(self, old_input: Value, new_input: Value) -> Operation:
        """
        				替换输入
        				:param old_input:	老的输入
        				:param new_input:	新的输入
        """
    def setAttr(self, key: str, value: ObjectRef | int | int | int | bool | float | str) -> None:
        """
        				设置算子中某个属性的值
        				:param key:		属性的字符串名称
        				:param value:	属性值
        """
    def setAttrs(self, attrs: dict[str, ObjectRef | int | int | int | bool | float | str]) -> None:
        """
        				根据属性的字典设置属性值
        				:param attrs:	属性字典
        """
    def setCompileTarget(self, target: CompileTarget) -> Operation:
        """
        设置算子的编译目标
        """
    def setId(self, op_id: int) -> Operation:
        """
        设置算子的ID
        """
    def setInput(self, index: int, v: Value) -> Operation:
        """
        				设置算子索引指定位置的值
        				:param index:	索引
        				:param v:		指定的输入值
        """
    def setInputs(self, inputs: list[Value]) -> Operation:
        """
        				设置算子的输入序列
        				:param inputs:		指定的输入序列
        """
    def setName(self, name: str) -> Operation:
        """
        设置算子的名字
        """
    def setOutput(self, index: int, v: Value) -> Operation:
        """
        				设置算子索引指定位置输出的值
        				:param index:	索引
        				:param v:		指定的输入值
        """
    def setOutputs(self, outputs: list[Value]) -> Operation:
        """
        				设置算子的输出序列
        				:param outputs:		指定的输出序列
        """
    def setTag(self, key: str, value: ObjectRef) -> Operation:
        """
        				设置算子的标签
        				:param key:			标签的键
        				:param value:		标签的值
        """
    @property
    def compile_target(self) -> CompileTarget:
        """
        算子的编译目标
        """
    @property
    def inputs(self) -> list[Value]:
        """
        算子的输入列表
        """
    @property
    def name(self) -> str:
        """
        算子的名字
        """
    @property
    def op_id(self) -> int:
        """
        算子的ID
        """
    @property
    def outputs(self) -> list[Value]:
        """
        算子的输出列表
        """
    @property
    def tags(self) -> dict[String, ObjectRef]:
        """
        一些标记
        """
class OptionalOpPattern(OpPattern):
    """
    表示匹配可选算子的模式
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::OptionalOpPatternNode'
    @staticmethod
    def Init() -> OptionalOpPattern:
        """
        创建一个初始化(非空)对象
        """
    def __call__(self, inputs: list[...]) -> OptionalOpPattern:
        """
        				设置算子的输入模式
        				:param inputs:		输入模式列表
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, op_type: list[str]) -> None:
        """
        				构造函数
        				:param op_type:		算子的类型字符串
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> OptionalOpPattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class OrPattern(Pattern):
    """
    表示模式匹配中的或逻辑
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::OrPatternNode'
    @staticmethod
    def Init() -> OrPattern:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, letf: Pattern, right: Pattern) -> None:
        """
        				构造函数
        				:param left:	左操作数
        				:param right:	右操作数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    @typing.overload
    def __or__(self, arg0: OpPattern) -> OrPattern:
        """
        或逻辑的操作符重载
        """
    @typing.overload
    def __or__(self, arg0: OrPattern) -> OrPattern:
        """
        或逻辑的操作符重载
        """
    def clone(self, depth: int = 1) -> OrPattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def left(self) -> Pattern:
        """
        左操作数
        """
    @property
    def right(self) -> Pattern:
        """
        右操作数
        """
class Output(Operation):
    """
    表示输出算子
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::OutputNode'
    @staticmethod
    def Init() -> Output:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, *args) -> None:
        """
        				构造函数，根据Value列表构造Output
        				该方法会将指定的Value列表作为Output的输入
        				:param values:	Value列表或可变参数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Output:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class PReLU(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::PReLUNode'
    @staticmethod
    def Init() -> PReLU:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, alpha: Params) -> None:
        """
        				构造函数
        				:param	input:		输入
        				:param	alpha:		系数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> PReLU:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def alpha(self) -> Params:
        """
        系数
        """
    @alpha.setter
    def alpha(self, arg1: Params) -> None:
        ...
class Pad(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::PadNode'
    @staticmethod
    def Init() -> Pad:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, padding: list[int], mode: Mode = ..., value: ScalarImm = ...) -> None:
        """
        					构造函数
        					:param	input:			输入
        					:param	padding:		Pad的数量，维度 = 输入维度*2，每个输入维度对应前后两个padding
        					:param	mode:			Pad的模式，默认为CONSTANT
        					:param	value:			Pad为CONSTANT模式时的值，默认为0
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Pad:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class PaddingMode:
    """
    填充模式
    
    Members:
    
      ZEROS : 填充0
    
      REFLECT : 反射
    
      REPLICATE : 重复
    
      CIRCULAR : 环形
    """
    CIRCULAR: typing.ClassVar[PaddingMode]  # value = <PaddingMode.CIRCULAR: 3>
    REFLECT: typing.ClassVar[PaddingMode]  # value = <PaddingMode.REFLECT: 1>
    REPLICATE: typing.ClassVar[PaddingMode]  # value = <PaddingMode.REPLICATE: 2>
    ZEROS: typing.ClassVar[PaddingMode]  # value = <PaddingMode.ZEROS: 0>
    __members__: typing.ClassVar[dict[str, PaddingMode]]  # value = {'ZEROS': <PaddingMode.ZEROS: 0>, 'REFLECT': <PaddingMode.REFLECT: 1>, 'REPLICATE': <PaddingMode.REPLICATE: 2>, 'CIRCULAR': <PaddingMode.CIRCULAR: 3>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class Params(Value):
    """
    表示参数的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::ParamsNode'
    @staticmethod
    def Init() -> Params:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, b: typing_extensions.Buffer, name: str = '', layout: Layout = ..., mtype: MemType = ..., swap: bool = False) -> None:
        """
        				构造函数, 从buffer构造
        				:param b:			python buffer
        				:param name:		数据名字
        				:param layout:		数据排布
        				:param mtype:		存储类型
        				:param swap:		是否开启惰性加载
        """
    @typing.overload
    def __init__(self, name: str, dtype: TensorType, mtype: MemType = ..., swap: bool = False) -> None:
        """
        				构造函数
        				:param name:		数据名字
        				:param dtype:		数据类型
        				:param mtype:		存储类型
        				:param swap:		是否开启惰性加载
        """
    @typing.overload
    def __init__(self, dtype: TensorType, swap: bool = False) -> None:
        """
        				构造函数(默认数据和名字为空)
        				:param dtype:		数据类型
        				:param swap:		是否开启惰性加载
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Params:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def copyData(self, b: typing_extensions.Buffer) -> int:
        """
        复制别的数据作为参数数据
        """
    @typing.overload
    def fill(self, arg0: typing.Callable[[int], float]) -> Params:
        """
        填充数据
        """
    @typing.overload
    def fill(self, arg0: typing.Callable[[int], int]) -> Params:
        """
        填充数据
        """
    def hasData(self) -> bool:
        """
        检查参数是否包含数据
        """
    def isAllowNoData(self) -> bool:
        """
        检查该参数是否允许没有数据
        """
    def isLazyLoaded(self) -> bool:
        """
        检查该参数是否是从文件惰性加载的
        """
    def isSwap(self) -> bool:
        """
        检查该参数是否开启惰性加载
        """
    def setAllowNoData(self, allow_no_data: bool) -> Params:
        """
        设置标记该参数是允许没有数据的
        """
    def setData(self, b: typing_extensions.Buffer) -> None:
        """
        设置参数数据
        """
    def setLazy(self, lazy: bool) -> Params:
        """
        设置标记该参数是从文件惰性加载的
        """
class Pass(ObjectRef):
    """
    Pass抽象了对网络的增删查改等访问.
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::PassNode'
    @staticmethod
    @typing.overload
    def Create(name: str) -> Pass:
        """
        				根据名字创建一个Pass
        				:param	name:				Pass的名称
        """
    @staticmethod
    @typing.overload
    def Create(name: str, dll_path: str) -> Pass:
        """
        				根据名字创建一个Pass
        				:param	name:				Pass的名称
        				:param	dll_path:			Pass所在的DLL路径
        """
    def __call__(self, network: ..., pass_ctx: PassContext = ...) -> ...:
        """
        执行Pass
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Pass:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def setName(self, name: String) -> Pass:
        """
        				设置Pass的名字
        				:param name:	Pass的名字
        """
    def setOptLevel(self, opt_level: int) -> Pass:
        """
        				设置Pass的优化等级
        				:param opt_level:	Pass的优化等级
        """
    def setPassInfo(self, pass_info: PassInfo) -> Pass:
        """
        				设置Pass的信息.
        				:param pass_info:	Pass的信息
        """
    def setRequiredPasses(self, required_passes: list[String]) -> Pass:
        """
        				设置Pass的前置Pass.
        				:param required_passes:	Pass需要的前置Pass
        """
    @property
    def pass_info(self) -> PassInfo:
        """
        Pass的信息
        """
class PassContext(ObjectRef):
    """
    表示Pass上下文的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::PassContextNode'
    @staticmethod
    def Current() -> PassContext:
        """
        获取当前作用域下的上下文
        """
    @staticmethod
    def Init() -> PassContext:
        """
        创建一个初始化(非空)对象
        """
    def __enter__(self) -> None:
        """
        实现python with上下文管理器的enter方法
        """
    def __exit__(self, arg0: typing.Any, arg1: typing.Any, arg2: typing.Any) -> None:
        """
        实现python with上下文管理器的exit方法
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, top_level: int, required_passes: list[String] = [], disabled_passes: list[String] = [], config: dict[String, ObjectRef] = {}) -> None:
        """
        				构造函数
        				:param top_level:			上下文支持Pass的最高等级
        				:param required_passes:		上下文需要的前置Pass, 默认为空
        				:param disabled_passes:		上下文禁用的Pass, 默认为空
        				:param config:				上下文的配置, 默认为空
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> PassContext:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def disablePass(self, pass_name: str) -> PassContext:
        """
        				为上下文添加禁用Pass
        				:param pass_name:			被禁用Pass的名字
        """
    def getConfig(self, key: str, default_value: ObjectRef | None) -> ObjectRef | None:
        """
        				获取上下文的配置
        				:param key:				配置的键
        				:param default_value:	如果配置不存在则使用的默认值
        """
    def isPassEnabled(self, info: ...) -> bool:
        """
        				检查指定的PassInfo表示的Pass是否可以在该上下文中执行
        				可以执行的条件如下：
        
        				*	1. 该Pass没有被禁用
        				*	2. 该Pass优化等级小于等于上下文允许的最大等级
        
        				:param info:	指定的PassInfo
        """
    def removeDisabledPass(self, pass_name: str) -> PassContext:
        """
        				为上下文移除禁用Pass
        				:param pass_name:			被移除Pass的名字
        """
    def removeRequiredPass(self, pass_name: str) -> PassContext:
        """
        				为上下文移除前置Pass
        				:param pass_name:			被移除Pass的名字
        """
    def requirePass(self, pass_name: str) -> PassContext:
        """
        				为上下文添加前置Pass
        				:param pass_name:			被添加Pass的名字
        """
    def setConfig(self, key: str, value: ObjectRef) -> PassContext:
        """
        				为上下文添加配置
        				:param key:			配置的键
        				:param value:		配置的值
        """
    @property
    def config(self) -> dict[String, ObjectRef]:
        """
        该上下文的配置
        """
    @property
    def disabled_passes(self) -> list[str]:
        """
        该上下文禁用的Pass
        """
    @property
    def required_passes(self) -> list[str]:
        """
        该上下文需要的前置Pass
        """
    @property
    def top_level(self) -> int:
        """
        该上下文支持Pass的最高等级
        """
class PassInfo(ObjectRef):
    """
    表示Pass信息的类
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::PassInfoNode'
    @staticmethod
    def Init() -> PassInfo:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, name: str, opt_level: int = 0, required_passes: list[str] = []) -> None:
        """
        				构造函数
        				:param	name:				Pass的名称
        				:param	opt_level:			Pass的优化等级, 默认为0
        				:param	required_passes:	Pass需要的前置Pass, 默认为空
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> PassInfo:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def name(self) -> String:
        """
        Pass的名称
        """
    @property
    def opt_level(self) -> int:
        """
        Pass的优化等级
        """
    @property
    def required_passes(self) -> list[str]:
        """
        Pass需要的前置Pass
        """
class Pattern(ObjectRef):
    """
    表示模式匹配的基类
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::PatternNode'
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Pattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class PixelShuffle(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::PixelShuffleNode'
    @staticmethod
    def Init() -> PixelShuffle:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, upscale_factor: int) -> None:
        """
        					构造函数
        					:param	input:				输入
        					:param	upscale_factor:		扩充因子
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> PixelShuffle:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def upscale_factor(self) -> int:
        """
        扩充因子
        """
    @upscale_factor.setter
    def upscale_factor(self, arg1: int) -> None:
        ...
class PruneAxis(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::PruneAxisNode'
    @staticmethod
    def Init() -> PruneAxis:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, arg0: Value, arg1: list[int]) -> None:
        """
        					构造函数.
        					:param	input:		输入
        					:param	input:		要执行去无效数据的merged_distr的下标们
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> PruneAxis:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class QuantizedScale(ObjectRef):
    """
    表示量化缩放系数.
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::QuantizedScaleNode'
    @staticmethod
    def Init() -> QuantizedScale:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, origin_scale: float) -> None:
        """
        				构造函数.
        				:param origin_scale:		未适配硬件的原始浮点缩放系数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> QuantizedScale:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def origin_scale(self) -> float:
        """
        未适配硬件的原始浮点缩放系数
        """
class QuantizedScaleArray(ObjectRef):
    """
    表示量化缩放系数列表.
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::QuantizedScaleArrayNode'
    @staticmethod
    def Init() -> QuantizedScaleArray:
        """
        创建一个初始化(非空)对象
        """
    def __getitem__(self, arg0: int) -> QuantizedScale:
        """
        通过索引访问元素.
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, origin_scale: list[float], axis: int = -1) -> None:
        """
        				构造函数.
        				:param origin_scale:		未适配硬件的原始浮点缩放系数列表
        				:param axis:				origin_scale系数对应的维度，默认为-1，表示最后一维
        """
    @typing.overload
    def __init__(self, lhs: QuantizedScaleArray, rhs: QuantizedScaleArray) -> None:
        """
        				构造函数.
        				:param lhs:		待拼接输入1
        				:param rhs:		待拼接输入2
        """
    @typing.overload
    def __init__(self, n: int, val: QuantizedScale) -> None:
        """
        				构造函数，从初始值构造.
        				:param n:		元素数量
        				:param val:		初始值
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def back(self) -> QuantizedScale:
        """
        获取存储的最后一个元素.
        """
    def clone(self, depth: int = 1) -> QuantizedScaleArray:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def empty(self) -> bool:
        """
        检查Array是否为空.
        """
    def front(self) -> QuantizedScale:
        """
        获取存储的第一个元素.
        """
    def setAxis(self, axis: int) -> QuantizedScaleArray:
        ...
    def size(self) -> int:
        """
        获取Array的大小.
        """
    def split(self, begin: int, end: int, stride: int = 1) -> QuantizedScaleArray:
        """
        通过索引访问子列表.
        """
    @property
    def origin_scale(self) -> ...:
        """
        未适配硬件的原始浮点缩放系数列表
        """
class QuantizedType(BaseQuantizedType):
    """
    表示量化后的数据类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::QuantizedTypeNode'
    @staticmethod
    def Init() -> QuantizedType:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, scale: ..., storage_dtype: ScalarType, expressed_dtype: ScalarType = ...) -> None:
        """
        				构造函数
        				:param scale:				量化的缩放因子
        				:param storage_dtype:		存储类型，即量化的目标类型
        				:param expressed_dtype:		表达类型，即数据的原始类型
        """
    @typing.overload
    def __init__(self, scale: ..., zero_points: list[int], storage_dtype: ScalarType, expressed_dtype: ScalarType = ...) -> None:
        """
        				构造函数
        				:param scale:				量化的缩放因子
        				:param zero_points:			量化的零点
        				:param storage_dtype:		存储类型，即量化的目标类型
        				:param expressed_dtype:		表达类型，即数据的原始类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> QuantizedType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def scale(self) -> ...:
        """
        量化的缩放因子
        """
    @property
    def zero_points(self) -> list[int]:
        """
        量化的零点
        """
class ReLU(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ReLUNode'
    @staticmethod
    def Init() -> ReLU:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        				构造函数
        				:param	input:			输入
        """
    @typing.overload
    def __init__(self, input: Value, alpha: float, max_value: float = ..., threshold: float = 0) -> None:
        """
        				构造函数
        				:param	input:			输入
        				:param	alpha:			系数
        				:param	max_value:		最大值
        				:param	threshold:		转折点
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ReLU:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def alpha(self) -> float:
        """
        系数
        """
    @alpha.setter
    def alpha(self, arg1: float) -> None:
        ...
    @property
    def max_value(self) -> float:
        """
        最大值
        """
    @max_value.setter
    def max_value(self, arg1: float) -> None:
        ...
    @property
    def threshold(self) -> float:
        """
        转折点
        """
    @threshold.setter
    def threshold(self, arg1: float) -> None:
        ...
class Reshape(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ReshapeNode'
    @staticmethod
    def Init() -> Reshape:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, shape: list[int], layout: Layout) -> None:
        """
        					构造函数
        					:param	input:			输入
        					:param	shape:			目标形状
        					:param	layout:			目标排布
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Reshape:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def layout(self) -> Layout:
        """
        目标排布
        """
    @layout.setter
    def layout(self, arg1: Layout) -> None:
        ...
    @property
    def shape(self) -> ...:
        """
        目标形状
        """
    @shape.setter
    def shape(self, arg1: list[int]) -> None:
        ...
class Resize(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::ResizeNode'
    @staticmethod
    def Init() -> Resize:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dsize: list[int], interpolation: ResizeInterpolation = ...) -> None:
        """
        					构造函数
        					:param	input:			输入
        					:param	dsize:			目标大小
        					:param	interpolation:	插值方式
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Resize:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dsize(self) -> ...:
        """
        目标大小
        """
    @dsize.setter
    def dsize(self, arg1: list[int]) -> None:
        ...
    @property
    def interpolation(self) -> ResizeInterpolation:
        """
        插值方式
        """
    @interpolation.setter
    def interpolation(self, arg1: ResizeInterpolation) -> None:
        ...
class ResizeInterpolation:
    """
    Resize的插值方式
    
    Members:
    
      INTER_NEAREST : 最近邻插值
    
      INTER_LINEAR : 双线性插值
    """
    INTER_LINEAR: typing.ClassVar[ResizeInterpolation]  # value = <ResizeInterpolation.INTER_LINEAR: 1>
    INTER_NEAREST: typing.ClassVar[ResizeInterpolation]  # value = <ResizeInterpolation.INTER_NEAREST: 0>
    __members__: typing.ClassVar[dict[str, ResizeInterpolation]]  # value = {'INTER_NEAREST': <ResizeInterpolation.INTER_NEAREST: 0>, 'INTER_LINEAR': <ResizeInterpolation.INTER_LINEAR: 1>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class Roll(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::RollNode'
    @staticmethod
    def Init() -> Roll:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, shift: int, dim: int | None) -> None:
        """
        				构造函数
        				:param	input:			输入
        				:param	shift:			滚动位移
        				:param	dim:			滚动轴
        """
    @typing.overload
    def __init__(self, input: Value, dsize: list[int], interpolation: list[int] | None) -> None:
        """
        				构造函数
        				:param	input:			输入
        				:param	shifts:			滚动位移
        				:param	dims:			滚动轴
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Roll:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dims(self) -> ...:
        """
        滚动轴
        """
    @dims.setter
    def dims(self, arg1: ... | None) -> None:
        ...
    @property
    def shifts(self) -> ...:
        """
        滚动位移
        """
    @shifts.setter
    def shifts(self, arg1: list[int]) -> None:
        ...
class RoundingMode:
    """
    取整模式
    
    Members:
    
      NONE : 对应true divide
    
      TRUNC : 对应c语言风格的整除
    
      FLOOR : 对应python风格"//"符号，或floor divide
    """
    FLOOR: typing.ClassVar[RoundingMode]  # value = <RoundingMode.FLOOR: 2>
    NONE: typing.ClassVar[RoundingMode]  # value = <RoundingMode.NONE: 0>
    TRUNC: typing.ClassVar[RoundingMode]  # value = <RoundingMode.TRUNC: 1>
    __members__: typing.ClassVar[dict[str, RoundingMode]]  # value = {'NONE': <RoundingMode.NONE: 0>, 'TRUNC': <RoundingMode.TRUNC: 1>, 'FLOOR': <RoundingMode.FLOOR: 2>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class ScalarImm(Data):
    """
    表示标量立即数
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::ScalarImmNode'
    @typing.overload
    def __init__(self) -> None:
        """
        表示标量立即数
        """
    @typing.overload
    def __init__(self, arg0: int) -> None:
        """
        构造函数，从int构造
        """
    @typing.overload
    def __init__(self, arg0: float) -> None:
        """
        构造函数，从float构造
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ScalarImm:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def scalarType(self) -> ScalarType:
        """
        获取ScalarType类型的数据类型
        """
class ScalarType(DataType):
    """
    表示标量数据类型的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::ScalarTypeNode'
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ScalarType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def isBF16(self) -> bool:
        """
        检查该浮点类型是否是bf16
        """
    def isBool(self) -> bool:
        """
        检查是否是bool
        """
    def isFP16(self) -> bool:
        """
        检查该浮点类型是否是fp16
        """
    def isFP32(self) -> bool:
        """
        检查该浮点类型是否是fp32
        """
    def isFP64(self) -> bool:
        """
        检查该浮点类型是否是fp64
        """
    def isFPE6M9(self) -> bool:
        """
        检查该浮点类型是否是fpe6m9
        """
    def isFPE7M8(self) -> bool:
        """
        检查该浮点类型是否是fpe7m8
        """
    def isSInt(self, N: int) -> bool:
        """
        检查是否是N位的sint
        """
    def isSInt16(self) -> bool:
        """
        检查是否是sint16
        """
    def isSInt32(self) -> bool:
        """
        检查是否是sint32
        """
    def isSInt64(self) -> bool:
        """
        检查是否是sint64
        """
    def isSInt8(self) -> bool:
        """
        检查是否是sint8
        """
    def isSigned(self) -> bool:
        """
        检查是否是有符号的整数
        """
    def isTF32(self) -> bool:
        """
        检查该浮点类型是否是tf32
        """
    def isUInt(self, N: int) -> bool:
        """
        检查是否是N位的uint
        """
    def isUInt16(self) -> bool:
        """
        检查是否是uint16
        """
    def isUInt32(self) -> bool:
        """
        检查是否是uint32
        """
    def isUInt64(self) -> bool:
        """
        检查是否是uint64
        """
    def isUInt8(self) -> bool:
        """
        检查是否是uint8
        """
class Semantics:
    """
    表示浮点语义的结构体
    """
    __hash__: typing.ClassVar[None] = None
    def __eq__(self, arg0: Semantics) -> bool:
        """
        重载等于运算符
        """
    def __init__(self, emax: int, emin: int, precision: int, bits: int) -> None:
        """
        				构造函数
        				:param emax:		指数的最大值
        				:param emin:		指数的最小值
        				:param precision:	尾数的精度(位数)
        				:param bits:		浮点数的位数
        """
    @property
    def bits(self) -> int:
        """
        浮点数的位数
        """
    @property
    def emax(self) -> int:
        """
        指数的最大值
        """
    @property
    def emin(self) -> int:
        """
        指数的最小值
        """
    @property
    def precision(self) -> int:
        """
        尾数的精度(位数)
        """
class SequentialPass(Pass):
    """
    
    			表示Pass序列的类型
    			Pass序列即一系列Pass组成的一个Pass, 该Pass执行时会依次执行每一个Pass
    		
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::SequentialPassNode'
    @staticmethod
    def Init() -> SequentialPass:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, passes: list[Pass], name: String, opt_level: int = 0, required_passes: list[String] = []) -> None:
        """
        				构造函数.
        
        				:param	passes:				Pass列表
        				:param	name:				Pass的名称
        				:param	opt_level:			Pass的优化等级，默认为0
        				:param	required_passes:	Pass的前置Pass，默认为空
        """
    @typing.overload
    def __init__(self, passes: list[Pass], pass_info: PassInfo) -> None:
        """
        				构造函数
        				:param	passes:			Pass列表
        				:param	pass_info:		Pass信息, 默认为Pass名为sequential
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> SequentialPass:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def passes(self) -> list[Pass]:
        """
        Pass列表
        """
class SiLU(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SiLUNode'
    @staticmethod
    def Init() -> SiLU:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        				构造函数
        				:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> SiLU:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Sigmoid(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SigmoidNode'
    @staticmethod
    def Init() -> Sigmoid:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Sigmoid:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Sin(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SinNode'
    @staticmethod
    def Init() -> Sin:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Sin:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Sinh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SinhNode'
    @staticmethod
    def Init() -> Sinh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Sinh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Slice(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SliceNode'
    @staticmethod
    def Init() -> Slice:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, arg0: Value, arg1: list[int], arg2: list[int], arg3: list[int]) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	begin:		切片的起始点，对应每个维度，从0开始
        					:param	end:		切片的结束点，对应每个维度，开空间
        					:param	stride:		切片的滑动步长，对应每个维度
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Slice:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def begin(self) -> ...:
        """
        切片的起始点，对应每个维度，从0开始
        """
    @begin.setter
    def begin(self, arg1: list[int]) -> None:
        ...
    @property
    def end(self) -> ...:
        """
        切片的结束点，对应每个维度，开空间
        """
    @end.setter
    def end(self, arg1: list[int]) -> None:
        ...
    @property
    def stride(self) -> ...:
        """
        切片的滑动步长，对应每个维度
        """
    @stride.setter
    def stride(self, arg1: list[int]) -> None:
        ...
class Softmax(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SoftmaxNode'
    @staticmethod
    def Init() -> Softmax:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, input: Value, axis: int) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		指定Softmax的维度，默认为-1，表示最后一维
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Softmax:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> int:
        """
        Softmax的维度，默认为-1，表示最后一维
        """
    @axis.setter
    def axis(self, arg1: int) -> None:
        ...
class Softplus(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SoftplusNode'
    @staticmethod
    def Init() -> Softplus:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数.
        """
    @typing.overload
    def __init__(self, input: Value, beta: float = 1.0, threshold: float = 20.0) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	beta:		系数β，默认为1.0
        					:param	threshold:	阈值，默认为20.0
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Softplus:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def beta(self) -> float:
        """
        系数β，默认为1.0
        """
    @beta.setter
    def beta(self, arg1: float) -> None:
        ...
    @property
    def threshold(self) -> float:
        """
        阈值，默认为20.0
        """
    @threshold.setter
    def threshold(self, arg1: float) -> None:
        ...
class Softshrink(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SoftshrinkNode'
    @staticmethod
    def Init() -> Softshrink:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, lambda: float = 0.5) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	lambda:		系数λ，默认为0.5
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Softshrink:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def lambda(self) -> float:
        """
        系数λ，默认为0.5
        """
    @lambda.setter
    def lambda(self, arg1: float) -> None:
        ...
class Softsign(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SoftsignNode'
    @staticmethod
    def Init() -> Softsign:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Softsign:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Split(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SplitNode'
    @staticmethod
    def Init() -> Split:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, sections: list[int], axis: int = -1) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	sections:	分割块
        					:param	axis:		分割的维度
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Split:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> int:
        """
        分割的维度，默认为-1，表示最后一维
        """
    @axis.setter
    def axis(self, arg1: int) -> None:
        ...
    @property
    def sections(self) -> ...:
        """
        分割块
        """
    @sections.setter
    def sections(self, arg1: list[int]) -> None:
        ...
class Sqrt(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SqrtNode'
    @staticmethod
    def Init() -> Sqrt:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Sqrt:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Squeeze(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SqueezeNode'
    @staticmethod
    def Init() -> Squeeze:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, axis: list[int]) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	axis:		压缩的维度
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Squeeze:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> ...:
        """
        压缩的维度
        """
    @axis.setter
    def axis(self, arg1: list[int]) -> None:
        ...
class Stack(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::StackNode'
    @staticmethod
    def Init() -> Stack:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, inputs: list[Value], dim: int = 0) -> None:
        """
        					构造函数
        					:param	input:	输入
        					:param	dim:	进行堆叠运算的维度（支持负数索引），默认为0
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Stack:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> int:
        """
        进行堆叠运算的维度（支持负数索引），默认为0
        """
    @dim.setter
    def dim(self, arg1: int) -> None:
        ...
class String(ObjectRef):
    type_key: typing.ClassVar[str] = 'Object'
    @typing.overload
    def __init__(self) -> None:
        ...
    @typing.overload
    def __init__(self, arg0: str) -> None:
        ...
    def empty(self) -> bool:
        """
        检查字符串是否为空
        """
class Sum(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SumNode'
    @staticmethod
    def Init() -> Sum:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, input: Value, dim: int, keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求和的维度
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, inputs: Value, dim: list[int], keepdim: bool = False) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dim:		进行求和的维度
        					:param	keepdim:	是否保持维度不变
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Sum:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> ...:
        """
        进行求和的维度（支持负数索引）
        """
    @dim.setter
    def dim(self, arg1: ...) -> None:
        ...
    @property
    def keepdim(self) -> bool:
        """
        是否保持维度不变
        """
    @keepdim.setter
    def keepdim(self, arg1: bool) -> None:
        ...
class SwapOrder(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::SwapOrderNode'
    @staticmethod
    def Init() -> SwapOrder:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, order: list[int], axis: int = -1) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	order:		期望的排布顺序
        					:param	axis:		期望交换顺序的维度
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> SwapOrder:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def axis(self) -> int:
        """
        期望交换顺序的维度
        """
    @axis.setter
    def axis(self, arg1: int) -> None:
        ...
    @property
    def order(self) -> ...:
        """
        期望的排布顺序
        """
    @order.setter
    def order(self, arg1: list[int]) -> None:
        ...
class Tan(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::TanNode'
    @staticmethod
    def Init() -> Tan:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Tan:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Tanh(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::TanhNode'
    @staticmethod
    def Init() -> Tanh:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        				构造函数
        				:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Tanh:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class Tanhshrink(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::TanhshrinkNode'
    @staticmethod
    def Init() -> Tanhshrink:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value) -> None:
        """
        					构造函数
        					:param	input:		输入
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Tanhshrink:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class TensorType(DataType):
    """
    表示张量数据类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::TensorTypeNode'
    @staticmethod
    def Init() -> TensorType:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, element_type: ScalarType, shape: list[int], layout: ..., merged_distrs: list[...]) -> None:
        """
        				构造函数
        				:param element_type:	元素类型
        				:param shape:			张量的形状
        				:param layout:			张量的排布
        				:param merged_distrs:	维度的分布
        """
    @typing.overload
    def __init__(self, element_type: ScalarType, shape: list[int], layout: ...) -> None:
        """
        				构造函数
        				:param element_type:	元素类型
        				:param shape:			张量的形状
        				:param layout:			张量的排布
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> TensorType:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def createAddMergedDistr(self, arg0: list[int]) -> ...:
        """
        				创建并添加维度分布, 默认融合分布所有元素全有效
        				:param merged_axis:		维度索引列表
        				:return:				创建的维度分布
        				:raise:					如果相应维度的分布已经存在则抛出异常
        """
    def dimSize(self, combine: bool = False) -> int:
        """
        获取维度大小.
        """
    def getChannel(self) -> int:
        """
        获取通道数
        """
    def getDim(self, index: int, combine: bool = False) -> int:
        """
        				获取张量索引指定的维度
        				:param index:	索引，为负数时表示从后往前
        				:param combine: 组合，大小写字母合并后的完整维度
        				:return:		索引对应的维度
        				:raise:			索引要小于张量的形状大小，否则抛出异常
        """
    def getDimByAxis(self, c: str, combine: bool = False) -> int:
        """
        				获取张量排布中的指定轴的维度
        				:param c:	字符表示的张量排布中的坐标轴
        				:param combine: 组合，大小写字母合并后的完整维度
        				:return:	该坐标轴上的维度
        				:raise:		坐标轴不能为'*'以及张量的形状大小和排布大小要相等，否则抛出异常
        """
    def getMergedDistr(self, arg0: list[int]) -> ... | None:
        """
        				获取融合维度的分布
        				:param merged_axis:		维度索引列表
        				:return:				指定融合维度的分布，如果不存在则返回None
        """
    def hasNegativeDim(self) -> bool:
        """
        检查是否有维度的尺寸是负的
        """
    def isLayouted(self) -> bool:
        """
        判断是否是Layout后的张量数据类型
        """
    def mutateMergedDistr(self, arg0: list[int], arg1: int, arg2: int, arg3: bool) -> TensorType:
        """
        				调节指定分布
        				:param merged_axis:		维度索引列表
        				:param start:			范围开始(包含)
        				:param end:				范围结束(不包含)
        """
    def setDimByAxis(self, c: str, dim: int) -> TensorType:
        """
        				设置张量排布中的指定轴的维度
        				:param c:	字符表示的张量排布中的坐标轴
        				:param dim:	被设置的维度
        				:raise:		坐标轴不能为'*'以及张量的形状大小和排布大小要相等，否则抛出异常
        """
    def setElementDtype(self, dtype: ScalarType) -> TensorType:
        """
        设置元素数据类型
        """
    def setLayout(self, layout: ...) -> TensorType:
        """
        设置layout
        """
    def setMergedDistrs(self, arg0: list[...]) -> TensorType:
        """
        设置维度分布
        """
    def setShape(self, arg0: list[int]) -> TensorType:
        """
        设置形状
        """
    @property
    def element_dtype(self) -> ScalarType:
        """
        张量元素的数据类型
        """
    @property
    def layout(self) -> ...:
        """
        张量的排布
        """
    @property
    def merged_distrs(self) -> list[...]:
        """
        维度的分布
        """
    @property
    def shape(self) -> list[int]:
        """
        张量的形状
        """
class Transpose(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::TransposeNode'
    @staticmethod
    def Init() -> Transpose:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dims: list[int], layout: Layout) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dims:		期望的排布维度索引
        					:param	layout:		期望的排布
        """
    @typing.overload
    def __init__(self, input: Value, dims: list[int]) -> None:
        """
        					构造函数
        					:param	input:		输入
        					:param	dims:		期望的排布维度索引
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Transpose:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dims(self) -> ...:
        """
        期望的排布维度索引
        """
    @dims.setter
    def dims(self, arg1: list[int]) -> None:
        ...
    @property
    def layout(self) -> Layout:
        """
        期望的排布
        """
    @layout.setter
    def layout(self, arg1: Layout) -> None:
        ...
class Unstack(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::UnstackNode'
    @staticmethod
    def Init() -> Unstack:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, dim: int = 0) -> None:
        """
        					构造函数
        					:param	input:	输入
        					:param	dim:	进行分隔运算的维度（支持负数索引），默认为0
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Unstack:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def dim(self) -> int:
        """
        进行分隔运算的维度（支持负数索引），默认为0
        """
    @dim.setter
    def dim(self, arg1: int) -> None:
        ...
class Upsample(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::UpsampleNode'
    @staticmethod
    def Init() -> Upsample:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, input: Value, height: int, width: int, interpolation: Interpolation = ..., align_corners: bool = False) -> None:
        """
        					构造函数
        					:param	input:				输入
        					:param	height:				上采样高度
        					:param	width:				上采样宽度
        					:param	interpolation:		插值方式
        					:param	align_corners:		是否对齐四角
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Upsample:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def align_corners(self) -> bool:
        """
        是否对齐四角
        """
    @align_corners.setter
    def align_corners(self, arg1: bool) -> None:
        ...
    @property
    def height(self) -> int:
        """
        上采样高度
        """
    @height.setter
    def height(self, arg1: int) -> None:
        ...
    @property
    def interpolation(self) -> Interpolation:
        """
        插值方式
        """
    @interpolation.setter
    def interpolation(self, arg1: Interpolation) -> None:
        ...
    @property
    def width(self) -> int:
        """
        上采样宽度
        """
    @width.setter
    def width(self, arg1: int) -> None:
        ...
class Value(Data):
    """
    表示算子输入输出的数据
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::ValueNode'
    @staticmethod
    def Init() -> Value:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, name: str, dtype: TensorType, mtype: MemType = ...) -> None:
        """
        				构造函数
        				:param name:		数据名字
        				:param dtype:		数据类型
        				:param mtype:		存储类型
        """
    @typing.overload
    def __init__(self, dtype: TensorType) -> None:
        """
        				构造函数
        				:param dtype:		数据类型
        """
    @typing.overload
    def __init__(self, dtype: TensorType, mtype: MemType) -> None:
        """
        				构造函数
        				:param dtype:		数据类型
        				:param mtype:		存储类型
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Value:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def getUsesNum(self) -> int:
        """
        获取该数据被使用的次数
        """
    def getUsesOp(self) -> ...:
        """
        获取使用该数据作为输入的Op列表
        """
    def index(self) -> int:
        """
        获取该数据在Op中的index
        """
    def isBoundToNetwork(self) -> bool:
        """
        检查数据是否被绑定到了网络
        """
    def isBoundToOp(self) -> bool:
        """
        检查数据是否被绑定到了Op
        """
    def isParams(self) -> bool:
        """
        检查该数据是否是Params
        """
    def network(self) -> ...:
        """
        获取该数据绑定的网络
        """
    def op(self) -> ...:
        """
        获取产生该数据的Op
        """
    def setId(self, v_id: int) -> Value:
        """
        设置数据的ID
        """
    def setName(self, name: str) -> Value:
        """
        设置数据的名字
        """
    def tensorType(self) -> TensorType:
        """
        获取TensorType类型的数据类型
        """
    @property
    def name(self) -> str:
        """
        数据的名字
        """
    @property
    def v_id(self) -> int:
        """
        数据的ID
        """
class ValuePattern(Pattern):
    """
    表示匹配算子输入的模式
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::ValuePatternNode'
    @staticmethod
    def Init() -> ValuePattern:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, op_pattern: OpPattern, index: int, uses: int = -1, dtype: TensorType = ...) -> None:
        """
        				构造函数
        				:param op_pattern:	产生该Value的算子
        				:param index:		该Value在算子输出中的索引位置
        				:param uses:		使用该Value的Op数量，默认为-1，表示任意数量
        				:param dtype:		该Value的数据类型
        """
    @typing.overload
    def __init__(self, arg0: AnycardsPattern) -> None:
        """
        构造函数，从通配符构造
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ValuePattern:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    def hasDtype(self, dtype: TensorType) -> ValuePattern:
        """
        				描述Value的数据类型
        				:param dtype:	该Value的数据类型
        				:return:		返回一个新的模式
        """
    def hasUses(self, uses: int) -> ValuePattern:
        """
        				描述Value的使用次数
        				:param uses:	使用次数
        				:return:		返回一个新的模式
        """
    def isAnycards(self) -> bool:
        """
        检查该模式是否是Anycards
        """
    def isWildcard(self) -> bool:
        """
        检查该模式是否是Wildcard
        """
    @property
    def dtype(self) -> TensorType:
        """
        该Value的数据类型
        """
    @property
    def index(self) -> int:
        """
        该Value在算子输出中的索引位置
        """
    @property
    def op_pattern(self) -> OpPattern:
        """
        产生Value的算子
        """
    @property
    def uses(self) -> int:
        """
        使用该Value的Op数量，默认为-1，表示任意数量
        """
class ValueUsesInfo:
    """
    
    			list[tuple(Operation, uint64_t)]表示的使用信息,
    			每个tuple(Operation, uint64_t)表示使用的Op, 以及在该Op输入中的index
    		
    """
class Where(Operation):
    type_key: typing.ClassVar[str] = 'icraft::xir::WhereNode'
    @staticmethod
    def Init() -> Where:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, lhs: Value, rhs: Value, condition: Value) -> None:
        """
        					构造函数
        					:param	lhs:		左操作数
        					:param	rhs:		右操作数
        					:param	condition:	判断条件
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> Where:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
class WolongTarget(CompileTarget):
    """
    表示Wolong编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::WolongTargetNode'
    @staticmethod
    def Init() -> WolongTarget:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, core: WolongTarget_Chips) -> None:
        """
        构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> WolongTarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def Core(self) -> WolongTarget_Chips:
        """
        表示细分的的Wolong后端芯片
        """
class WolongTarget_Chips:
    """
    表示细分的的Wolong后端芯片
    
    Members:
    
      WL340 : WL340
    
      WL30S : WL30S
    """
    WL30S: typing.ClassVar[WolongTarget_Chips]  # value = <WolongTarget_Chips.WL30S: 1>
    WL340: typing.ClassVar[WolongTarget_Chips]  # value = <WolongTarget_Chips.WL340: 0>
    __members__: typing.ClassVar[dict[str, WolongTarget_Chips]]  # value = {'WL340': <WolongTarget_Chips.WL340: 0>, 'WL30S': <WolongTarget_Chips.WL30S: 1>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
class ZhugeTarget(CompileTarget):
    """
    表示Zhuge编译目标的类型
    """
    type_key: typing.ClassVar[str] = 'icraft::xir::ZhugeTargetNode'
    @staticmethod
    def Init() -> ZhugeTarget:
        """
        创建一个初始化(非空)对象
        """
    @typing.overload
    def __init__(self) -> None:
        """
        默认构造函数
        """
    @typing.overload
    def __init__(self, core: ZhugeTarget_Chips) -> None:
        """
        构造函数
        """
    @typing.overload
    def __init__(self, arg0: ObjectRef) -> None:
        """
        将父类强制转换为子类（该类型）
        """
    def clone(self, depth: int = 1) -> ZhugeTarget:
        """
        				克隆一份该对象
        				:param depth:	克隆的深度，默认为1，即浅克隆
        				:return:		克隆得到的新对象
        """
    @property
    def Core(self) -> ZhugeTarget_Chips:
        """
        表示细分的的Zhuge后端芯片
        """
class ZhugeTarget_Chips:
    """
    表示细分的的Zhuge后端芯片
    
    Members:
    
      ZG330 : ZG330
    
      ZG340 : ZG340
    
      ZG30S : ZG30S
    """
    ZG30S: typing.ClassVar[ZhugeTarget_Chips]  # value = <ZhugeTarget_Chips.ZG30S: 2>
    ZG330: typing.ClassVar[ZhugeTarget_Chips]  # value = <ZhugeTarget_Chips.ZG330: 0>
    ZG340: typing.ClassVar[ZhugeTarget_Chips]  # value = <ZhugeTarget_Chips.ZG340: 1>
    __members__: typing.ClassVar[dict[str, ZhugeTarget_Chips]]  # value = {'ZG330': <ZhugeTarget_Chips.ZG330: 0>, 'ZG340': <ZhugeTarget_Chips.ZG340: 1>, 'ZG30S': <ZhugeTarget_Chips.ZG30S: 2>}
    def __eq__(self, other: typing.Any) -> bool:
        ...
    def __getstate__(self) -> int:
        ...
    def __hash__(self) -> int:
        ...
    def __index__(self) -> int:
        ...
    def __init__(self, value: int) -> None:
        ...
    def __int__(self) -> int:
        ...
    def __ne__(self, other: typing.Any) -> bool:
        ...
    def __repr__(self) -> str:
        ...
    def __setstate__(self, state: int) -> None:
        ...
    def __str__(self) -> str:
        ...
    @property
    def name(self) -> str:
        ...
    @property
    def value(self) -> int:
        ...
def Anycards() -> AnycardsPattern:
    """
    构造一个通配符模式，匹配任意数量输入
    """
def BuildTime() -> str:
    """
    获取编译时间
    """
def CommitID() -> str:
    """
    获取CommitID
    """
def CommitSinceTag() -> int:
    """
    获取自上个Tag提交了所少次
    """
def FullVersion() -> str:
    """
    获取全版本号
    """
def ICRAFT_REGISTER_PASS(arg0: typing.Callable) -> None:
    """
    Pass注册辅助函数.
    """
def IsModified() -> bool:
    """
    检查是否有修改
    """
@typing.overload
def IsOp(type_key: str, *args) -> OpPattern:
    """
    			构造一个匹配算子的模式, 匹配指定的算子类型
    			:param type_key:	算子类型字符串
    			:param args:		算子输入列表或可变参数
    """
@typing.overload
def IsOp(type: type, *args) -> OpPattern:
    """
    			构造一个匹配算子的模式, 匹配指定的算子类型
    			:param type:	算子类型
    			:param args:	算子输入列表或可变参数
    """
@typing.overload
def IsOp(type: list[type], *args) -> OpPattern:
    """
    			构造一个匹配算子的模式, 匹配指定的算子类型
    			:param type:	算子类型
    			:param args:	算子输入列表或可变参数
    """
@typing.overload
def IsOp(*args) -> OpPattern:
    """
    			构造一个匹配算子的模式, 匹配指定的算子类型
    			:param args:	算子输入列表或可变参数
    """
@typing.overload
def IsOptionalOp(type_key: str, *args) -> OptionalOpPattern:
    """
    			构造一个匹配可选算子的模式, 匹配指定的算子类型
    			:param type_key:	算子类型字符串
    			:param args:		算子输入列表或可变参数
    """
@typing.overload
def IsOptionalOp(type: type, *args) -> OptionalOpPattern:
    """
    			构造一个匹配可选算子的模式, 匹配指定的算子类型
    			:param type:	算子类型
    			:param args:	算子输入列表或可变参数
    """
@typing.overload
def IsOptionalOp(*args) -> OptionalOpPattern:
    """
    			构造一个匹配可选算子的模式, 匹配指定的算子类型
    			:param args:	算子输入列表或可变参数
    """
def MainVersion() -> str:
    """
    获取版本号
    """
def MajorVersionNum() -> int:
    """
    获取主版本号
    """
def MinorVersionNum() -> int:
    """
    获取次版本号
    """
def PATTERN_REQUIRE(expr: bool) -> bool:
    """
    算子约束辅助函数
    """
def PatchVersionNum() -> int:
    """
    获取补丁版本号
    """
def Wildcard() -> ValuePattern:
    """
    构造一个通配符模式，匹配任意一个输入
    """
BICUBIC: Interpolation  # value = <Interpolation.BICUBIC: 2>
BILINEAR: Interpolation  # value = <Interpolation.BILINEAR: 1>
CAFFE: Framework  # value = <Framework.CAFFE: 1>
CIRCULAR: PaddingMode  # value = <PaddingMode.CIRCULAR: 3>
CONSTANT: Mode  # value = <Mode.CONSTANT: 0>
DARKNET: Framework  # value = <Framework.DARKNET: 3>
FLOOR: RoundingMode  # value = <RoundingMode.FLOOR: 2>
INTER_LINEAR: ResizeInterpolation  # value = <ResizeInterpolation.INTER_LINEAR: 1>
INTER_NEAREST: ResizeInterpolation  # value = <ResizeInterpolation.INTER_NEAREST: 0>
NEAREST: Interpolation  # value = <Interpolation.NEAREST: 0>
NONE: RoundingMode  # value = <RoundingMode.NONE: 0>
ONNX: Framework  # value = <Framework.ONNX: 4>
PYTORCH: Framework  # value = <Framework.PYTORCH: 0>
REFLECT: PaddingMode  # value = <PaddingMode.REFLECT: 1>
REFLECTION: Mode  # value = <Mode.REFLECTION: 1>
REPLICATE: PaddingMode  # value = <PaddingMode.REPLICATE: 2>
REPLICATION: Mode  # value = <Mode.REPLICATION: 2>
SYMMETRIC: Mode  # value = <Mode.SYMMETRIC: 3>
TENSORFLOW: Framework  # value = <Framework.TENSORFLOW: 2>
TRUNC: RoundingMode  # value = <RoundingMode.TRUNC: 1>
WL30S: WolongTarget_Chips  # value = <WolongTarget_Chips.WL30S: 1>
WL340: WolongTarget_Chips  # value = <WolongTarget_Chips.WL340: 0>
ZERO: DistrUnvalidValue  # value = <DistrUnvalidValue.ZERO: 0>
ZEROS: PaddingMode  # value = <PaddingMode.ZEROS: 0>
ZG30S: ZhugeTarget_Chips  # value = <ZhugeTarget_Chips.ZG30S: 2>
ZG330: ZhugeTarget_Chips  # value = <ZhugeTarget_Chips.ZG330: 0>
ZG340: ZhugeTarget_Chips  # value = <ZhugeTarget_Chips.ZG340: 1>
Avgpool = AvgPool2d
Batchnorm = BatchNorm2d
Conv1dTranspose = ConvTranspose1d
Conv2dTranspose = ConvTranspose2d
Conv3dTranspose = ConvTranspose3d
Elu = ELU
Gelu = GELU
Layernorm = LayerNorm
Maxpool = MaxPool2d
Prelu = PReLU
Relu = ReLU
Silu = SiLU
