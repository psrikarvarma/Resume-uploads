####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl
set_attribute library slow_vdd1v0_basicCells_hvt.lib

read_hdl /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/Alignment.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/Extraction.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/FADD_Dual_Main.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/Normalization.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/Operation.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/Pipeline_Reg.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/rtl/Result.v 

elaborate

read_sdc /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/constraint/FADD_Dual_Main_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/output/FADD_Dual_Main_400MHtz_slow_hvt.v
write_sdc > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/output/FADD_Dual_Main_400MHtz_slow_hvt.sdc

# Write results in Report folder
report_timing > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/reports/FADD_Dual_Main_400MHtz_slow_hvt_timing.rpt
report_power  > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/reports/FADD_Dual_Main_400MHtz_slow_hvt_power.rpt
report_area   > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark8/reports/FADD_Dual_Main_400MHtz_slow_hvt_area.rpt

quit
