####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl
set_attribute library slow_vdd1v0_basicCells_hvt.lib

read_hdl /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl/align_mantisa.v /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl/Extract.v /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl/FADD.v /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl/Normalization.v /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl/Operation.v /home/psrikarvarma/personal/tools/sriman/benchmark7/rtl/Result_and_exception.v 

elaborate

read_sdc /home/psrikarvarma/personal/tools/sriman/benchmark7/constraint/FADD_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /home/psrikarvarma/personal/tools/sriman/benchmark7/output/FADD_400MHtz_slow_hvt.v
write_sdc > /home/psrikarvarma/personal/tools/sriman/benchmark7/output/FADD_400MHtz_slow_hvt.sdc

# Write results in Report folder
report_timing > /home/psrikarvarma/personal/tools/sriman/benchmark7/reports/FADD_400MHtz_slow_hvt_timing.rpt
report_power  > /home/psrikarvarma/personal/tools/sriman/benchmark7/reports/FADD_400MHtz_slow_hvt_power.rpt
report_area   > /home/psrikarvarma/personal/tools/sriman/benchmark7/reports/FADD_400MHtz_slow_hvt_area.rpt

quit
