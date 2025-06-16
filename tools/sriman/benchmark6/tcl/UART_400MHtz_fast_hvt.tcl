####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl
set_attribute library fast_vdd1v0_basicCells_hvt.lib

read_hdl /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/data_sampling.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/deserializer.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/edge_bit_counter.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/mux.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/par_chk.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/parity_calc.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/Serializer.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/stp_chk.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/strt_chk.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/uart_rx_fsm.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/UART_RX.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/uart_tx_fsm.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/UART_TX.v /home/psrikarvarma/personal/tools/sriman/benchmark6/rtl/UART.v 

elaborate

read_sdc /home/psrikarvarma/personal/tools/sriman/benchmark6/constraint/UART_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /home/psrikarvarma/personal/tools/sriman/benchmark6/output/UART_400MHtz_fast_hvt.v
write_sdc > /home/psrikarvarma/personal/tools/sriman/benchmark6/output/UART_400MHtz_fast_hvt.sdc

# Write results in Report folder
report_timing > /home/psrikarvarma/personal/tools/sriman/benchmark6/reports/UART_400MHtz_fast_hvt_timing.rpt
report_power  > /home/psrikarvarma/personal/tools/sriman/benchmark6/reports/UART_400MHtz_fast_hvt_power.rpt
report_area   > /home/psrikarvarma/personal/tools/sriman/benchmark6/reports/UART_400MHtz_fast_hvt_area.rpt

quit
