set_property PACKAGE_PIN Y12 [get_ports servo_pwm_j17_3]
set_property IOSTANDARD LVCMOS33 [get_ports servo_pwm_j17_3]
set_property DRIVE 4 [get_ports servo_pwm_j17_3]
set_property SLEW SLOW [get_ports servo_pwm_j17_3]
# 约束末级寄存器到排针的内部延迟预算。
set_max_delay 10.000 -to [get_ports servo_pwm_j17_3]
set_min_delay 0.000 -to [get_ports servo_pwm_j17_3]
