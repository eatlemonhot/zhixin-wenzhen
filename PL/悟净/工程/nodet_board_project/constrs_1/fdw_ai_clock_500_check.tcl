# 检查PLL参数及派生时钟配置。
set pll [get_cells -hier -filter {NAME == U0_ps_ai_peripheral/ZGolo/u_AI_Mate_top/clkrst_wrapper_u0/AI_CORE_CLK/inst/plle2_adv_inst}]
if {[llength $pll] != 1 || [get_property CLKOUT0_DIVIDE $pll] != 2} {error "AI实际PLL不是二分频"}
set output [get_pins -of_objects $pll -filter {REF_PIN_NAME == CLKOUT0}]
set clocks [get_clocks -of_objects $output]
if {[llength $output] != 1 || [llength $clocks] != 1} {error "AI输出时钟对象异常"}
if {abs([get_property PERIOD $clocks]-2.0) > 0.001} {error "AI实际输出未形成2ns周期"}
puts "FDW_AI_REAL_CLOCK_VERIFIED [get_property NAME $clocks] [get_property PERIOD $clocks] [get_property CLKOUT0_DIVIDE $pll]"
