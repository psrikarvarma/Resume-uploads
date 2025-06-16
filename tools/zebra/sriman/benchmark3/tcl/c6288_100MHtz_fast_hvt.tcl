####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/rtl
set_attribute library fast_vdd1v0_basicCells_hvt.lib

read_hdl /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/rtl/c6288.v 

elaborate

read_sdc /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/constraint/c6288_100MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/output/c6288_100MHtz_fast_hvt.v
write_sdc > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/output/c6288_100MHtz_fast_hvt.sdc

# Write results in Report folder
report_timing > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/reports/c6288_100MHtz_fast_hvt_timing.rpt
report_power  > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/reports/c6288_100MHtz_fast_hvt_power.rpt
report_area   > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark3/reports/c6288_100MHtz_fast_hvt_area.rpt

quit
