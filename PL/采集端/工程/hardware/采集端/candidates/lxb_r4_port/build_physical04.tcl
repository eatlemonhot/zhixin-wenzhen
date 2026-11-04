close_design
open_checkpoint {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/7020/工程/outputs/lxb110_a2/p/LXB_R4.runs/impl_rxc01/system_wrapper_opt.dcp}
set audit_out {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/7020/工程/outputs/checkpoint_110_hellofpga_migration_audit/implementation_04}
if {[file exists $audit_out]} {error "本次物理实现目录已存在，禁止覆盖。"}
file mkdir $audit_out
reset_timing
read_xdc {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/7020/工程/outputs/checkpoint_110_hellofpga_migration_audit/implementation_03/original_timing.xdc}
write_xdc -type timing [file join $audit_out original_timing.xdc]
set_clock_uncertainty -hold 0.225 -from [get_clocks] -to [get_clocks]
place_design
route_design -no_psir -timing_summary
source {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/7020/工程/hardware/7020/candidates/lxb_r4_port/audit_routed.tcl}
