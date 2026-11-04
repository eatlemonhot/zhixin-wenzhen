# 精简系统保留原复位、LED和200MHz系统时钟引脚。
set_property PACKAGE_PIN F8 [get_ports sys_rst]
set_property IOSTANDARD LVCMOS15 [get_ports sys_rst]

#LED1, BANK13
set_property IOSTANDARD LVCMOS15 [get_ports {led[0]}]
set_property PACKAGE_PIN J1 [get_ports {led[0]}]
#LED2, BANK13
set_property IOSTANDARD LVCMOS15 [get_ports {led[1]}]
set_property PACKAGE_PIN M6 [get_ports {led[1]}]

create_clock -period 5.000 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN C8 [get_ports sys_clk_p]
set_property PACKAGE_PIN C7 [get_ports sys_clk_n]

