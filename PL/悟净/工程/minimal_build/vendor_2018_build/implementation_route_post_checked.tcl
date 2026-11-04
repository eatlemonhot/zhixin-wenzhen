source -encoding utf-8 {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_board_project/ip_patch/process_control/implementation_route_post.tcl}
source -encoding utf-8 {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_board_project/constrs_1/fdw_dsp_cdc_check.tcl}
source -encoding utf-8 {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_board_project/constrs_1/fdw_ai_clock_500_check.tcl}
report_timing_summary -report_unconstrained -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_timing.rpt}
report_cdc -details -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_cdc.rpt}
report_clock_interaction -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_clock_interaction.rpt}
check_timing -verbose -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_check_timing.rpt}
report_drc -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_drc.rpt}
report_bus_skew -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_bus_skew.rpt}
report_pulse_width -file {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/minimal_build/vendor_2018_build/full_board_pulse_width.rpt}
