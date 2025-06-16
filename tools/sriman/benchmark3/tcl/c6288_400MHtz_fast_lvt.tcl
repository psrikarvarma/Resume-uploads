####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /home/psrikarvarma/personal/tools/sriman/benchmark3/rtl
set_attribute library fast_vdd1v0_basicCells_lvt.lib

read_hdl /home/psrikarvarma/personal/tools/sriman/benchmark3/rtl/c6288.v 

elaborate

read_sdc /home/psrikarvarma/personal/tools/sriman/benchmark3/constraint/c6288_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /home/psrikarvarma/personal/tools/sriman/benchmark3/output/c6288_400MHtz_fast_lvt.v
write_sdc > /home/psrikarvarma/personal/tools/sriman/benchmark3/output/c6288_400MHtz_fast_lvt.sdc

# Write results in Report folder
report_timing > /home/psrikarvarma/personal/tools/sriman/benchmark3/reports/c6288_400MHtz_fast_lvt_timing.rpt
report_power  > /home/psrikarvarma/personal/tools/sriman/benchmark3/reports/c6288_400MHtz_fast_lvt_power.rpt
report_area   > /home/psrikarvarma/personal/tools/sriman/benchmark3/reports/c6288_400MHtz_fast_lvt_area.rpt

quit
