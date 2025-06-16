####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/rtl
set_attribute library slow_vdd1v0_basicCells_lvt.lib

read_hdl -vhdl /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/rtl/b15.vhd 

elaborate

read_sdc /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/constraint/b15_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/output/b15_400MHtz_slow_lvt.v
write_sdc > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/output/b15_400MHtz_slow_lvt.sdc

# Write results in Report folder
report_timing > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/reports/b15_400MHtz_slow_lvt_timing.rpt
report_power  > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/reports/b15_400MHtz_slow_lvt_power.rpt
report_area   > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark5/reports/b15_400MHtz_slow_lvt_area.rpt

quit
