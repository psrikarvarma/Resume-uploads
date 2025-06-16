####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /home/psrikarvarma/personal/tools/sriman/benchmark4/rtl
set_attribute library slow_vdd1v0_basicCells_lvt.lib

read_hdl -vhdl /home/psrikarvarma/personal/tools/sriman/benchmark4/rtl/b14.vhd 

elaborate

read_sdc /home/psrikarvarma/personal/tools/sriman/benchmark4/constraint/b14_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /home/psrikarvarma/personal/tools/sriman/benchmark4/output/b14_400MHtz_slow_lvt.v
write_sdc > /home/psrikarvarma/personal/tools/sriman/benchmark4/output/b14_400MHtz_slow_lvt.sdc

# Write results in Report folder
report_timing > /home/psrikarvarma/personal/tools/sriman/benchmark4/reports/b14_400MHtz_slow_lvt_timing.rpt
report_power  > /home/psrikarvarma/personal/tools/sriman/benchmark4/reports/b14_400MHtz_slow_lvt_power.rpt
report_area   > /home/psrikarvarma/personal/tools/sriman/benchmark4/reports/b14_400MHtz_slow_lvt_area.rpt

quit
