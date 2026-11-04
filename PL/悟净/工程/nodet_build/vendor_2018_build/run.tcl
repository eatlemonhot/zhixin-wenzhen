set actual [version -short]
puts "FDW_ACTUAL_TOOL_VERSION $actual"
if {$actual ne "2018.3"} {error "本厂家整板入口只接受2018.3，未加载JFM，未修改安装库"}
open_project {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_board_project/FDW_WUJING_SERVO_PAIR124.xpr}
foreach name {fdw_iq_lsq_axis.v fdw_fft8192_hann.v fdw_iq_fft_core.v fdw_ddr_frame_reader.v fdw_wujing_dsp_top.v iq_sin_q16.mem fft_hann_q17.mem fft_twiddle_q18.mem fdw_dsp_cdc.xdc} {
    set count 0
    foreach object [get_files -all] {if {[file tail [get_property NAME $object]] eq $name} {incr count}}
    if {$count == 0} {
        if {[string match *.xdc $name]} {set source_path [file join [get_property DIRECTORY [current_project]] constrs_1 $name]; set target_set constrs_1} else {set source_path [file join [get_property DIRECTORY [current_project]] rtl fdw_dsp $name]; set target_set sources_1}
        if {![file exists $source_path]} {error "新核源文件缺失：$source_path"}
        add_files -norecurse -fileset $target_set $source_path
        set count 0
        foreach object [get_files -all] {if {[file tail [get_property NAME $object]] eq $name} {incr count}}
    }
    if {$count != 1} {error "新核文件实际登记数量不正确：$name"}
}
update_compile_order -fileset sources_1
puts "FDW_SOURCE_FILES_VERIFIED 9"
config_ip_cache -disable_cache
report_ip_status -file matched_ip_status.rpt
set locked [get_ips -filter {IS_LOCKED == 1}]
if {[llength $locked] != 0} {error "匹配版本中仍有锁定IP，须先核查来源，不能继续"}
set chosen_edif [get_files -all {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_inputs/AI_Mate.edif}]
if {[llength $chosen_edif] != 1} {error "厂家网表登记不唯一"}
if {![get_property IS_ENABLED $chosen_edif] || ![get_property USED_IN_IMPLEMENTATION $chosen_edif]} {error "厂家网表被禁用或未用于实现"}
puts "FDW_VENDOR_EDIF_ENABLED [get_property NAME $chosen_edif]"
set ::env(JFM_PATH) {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/JFM_Kits}
source {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/JFM_Kits/ip_patch/run.tcl}
foreach name {add_hook_tcl_to_prj replace_7z030ai_file} {if {[llength [info commands $name]] != 1} {error "厂家工具包命令缺失：$name"}}
add_hook_tcl_to_prj
replace_7z030ai_file
puts "FDW_VENDOR_SETUP_COMPLETE"
add_files -norecurse -fileset utils_1 {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/post_route_physopt_checked.tcl}
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.TCL.POST {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/post_route_physopt_checked.tcl} [get_runs impl_1]
add_files -norecurse -fileset utils_1 {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/implementation_opt_post_checked.tcl C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/implementation_route_post_checked.tcl C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/write_bitstream_pre_checked.tcl C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/write_bitstream_post_checked.tcl}
set_property STEPS.OPT_DESIGN.TCL.POST {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/implementation_opt_post_checked.tcl} [get_runs impl_1]
set_property STEPS.ROUTE_DESIGN.TCL.POST {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/implementation_route_post_checked.tcl} [get_runs impl_1]
set_property STEPS.WRITE_BITSTREAM.TCL.PRE {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/write_bitstream_pre_checked.tcl} [get_runs impl_1]
set_property STEPS.WRITE_BITSTREAM.TCL.POST {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_build/vendor_2018_build/write_bitstream_post_checked.tcl} [get_runs impl_1]
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
set state [get_property STATUS [get_runs impl_1]]
puts "FDW_BOARD_BUILD_STATE $state"
if {![string match "*Complete*" $state]} {error "整板构建没有完成：$state"}
open_run impl_1
set unresolved [get_cells -hier -filter {IS_BLACKBOX == 1}]
if {[llength $unresolved] != 0} {error "最终实现仍存在未定义黑盒"}
puts "FDW_FINAL_BLACKBOX_COUNT 0"
report_timing_summary -report_unconstrained -file full_board_timing.rpt
report_utilization -file full_board_utilization.rpt
report_drc -file full_board_drc.rpt
puts "FDW_VENDOR_BUILD_CANDIDATE_COMPLETE"
# 候选位流还须审查整板时序、厂家转换结果及引脚；此脚本没有烧录命令。
puts "FDW_VENDOR_STAGE_COMPLETE"
close_project
exit
