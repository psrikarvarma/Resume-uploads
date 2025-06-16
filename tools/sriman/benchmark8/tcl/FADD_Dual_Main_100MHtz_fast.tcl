####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl
set_attribute library fast_vdd1v0_basicCells.lib

read_hdl /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/Alignment.v /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/Extraction.v /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/FADD_Dual_Main.v /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/Normalization.v /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/Operation.v /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/Pipeline_Reg.v /home/psrikarvarma/personal/tools/sriman/benchmark8/rtl/Result.v 

elaborate

read_sdc /home/psrikarvarma/personal/tools/sriman/benchmark8/constraint/FADD_Dual_Main_100MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /home/psrikarvarma/personal/tools/sriman/benchmark8/output/FADD_Dual_Main_100MHtz_fast.v
write_sdc > /home/psrikarvarma/personal/tools/sriman/benchmark8/output/FADD_Dual_Main_100MHtz_fast.sdc

# Write results in Report folder
report_timing > /home/psrikarvarma/personal/tools/sriman/benchmark8/reports/FADD_Dual_Main_100MHtz_fast_timing.rpt
report_power  > /home/psrikarvarma/personal/tools/sriman/benchmark8/reports/FADD_Dual_Main_100MHtz_fast_power.rpt
report_area   > /home/psrikarvarma/personal/tools/sriman/benchmark8/reports/FADD_Dual_Main_100MHtz_fast_area.rpt

quit
