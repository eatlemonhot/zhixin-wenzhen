# 将AI的实际PLL输出除数从1改为2，VCO和GP/HP时钟保持原配置。
set pll [get_cells -hier -filter {NAME == U0_ps_ai_peripheral/ZGolo/u_AI_Mate_top/clkrst_wrapper_u0/AI_CORE_CLK/inst/plle2_adv_inst}]
if {[llength $pll] != 1} {error "AI实际PLL对象不唯一"}
if {[get_property REF_NAME $pll] ne "PLLE2_ADV"} {error "AI PLL类型不符合预期"}
set old_divider [get_property CLKOUT0_DIVIDE $pll]
if {$old_divider != 1 && $old_divider != 2} {error "AI原PLL分频值不符合预期"}
set_property CLKOUT0_DIVIDE 2 $pll
update_timing
source -encoding utf-8 {C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/nodet_board_project/constrs_1/fdw_ai_clock_500_check.tcl}
puts "FDW_AI_REAL_PLL_DIVIDER_CHANGED $old_divider 2"
