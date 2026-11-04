# 实现阶段增加保持优化余量；时序报告采用原始约束。
# 不修改 ADC、DAC、网口的外部输入输出时序预算。
set_clock_uncertainty -hold 0.225 [all_clocks]
