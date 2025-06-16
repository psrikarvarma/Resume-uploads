####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /home/psrikarvarma/personal/tools/sriman/benchmark5/rtl
set_attribute library fast_vdd1v0_basicCells.lib

read_hdl -vhdl /home/psrikarvarma/personal/tools/sriman/benchmark5/rtl/b15.vhd 

elaborate

read_sdc /home/psrikarvarma/personal/tools/sriman/benchmark5/constraint/b15_100MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /home/psrikarvarma/personal/tools/sriman/benchmark5/output/b15_100MHtz_fast.v
write_sdc > /home/psrikarvarma/personal/tools/sriman/benchmark5/output/b15_100MHtz_fast.sdc

# Write results in Report folder
report_timing > /home/psrikarvarma/personal/tools/sriman/benchmark5/reports/b15_100MHtz_fast_timing.rpt
report_power  > /home/psrikarvarma/personal/tools/sriman/benchmark5/reports/b15_100MHtz_fast_power.rpt
report_area   > /home/psrikarvarma/personal/tools/sriman/benchmark5/reports/b15_100MHtz_fast_area.rpt

quit
