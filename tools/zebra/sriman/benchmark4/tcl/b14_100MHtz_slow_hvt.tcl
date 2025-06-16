####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/rtl
set_attribute library slow_vdd1v0_basicCells_hvt.lib

read_hdl -vhdl /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/rtl/b14.vhd 

elaborate

read_sdc /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/constraint/b14_100MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/output/b14_100MHtz_slow_hvt.v
write_sdc > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/output/b14_100MHtz_slow_hvt.sdc

# Write results in Report folder
report_timing > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/reports/b14_100MHtz_slow_hvt_timing.rpt
report_power  > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/reports/b14_100MHtz_slow_hvt_power.rpt
report_area   > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark4/reports/b14_100MHtz_slow_hvt_area.rpt

quit
