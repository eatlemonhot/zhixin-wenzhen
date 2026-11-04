# 已核对：J17-21/W13和J17-23/AE13为Bank12的3.3V GPIO。
set_property PACKAGE_PIN W13 [get_ports {servo_pwm_j17[0]}]
set_property PACKAGE_PIN AE13 [get_ports {servo_pwm_j17[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {servo_pwm_j17[*]}]
set_property DRIVE 4 [get_ports {servo_pwm_j17[*]}]
set_property SLEW SLOW [get_ports {servo_pwm_j17[*]}]
set_property BITSTREAM.CONFIG.USR_ACCESS 01240023 [current_design]
