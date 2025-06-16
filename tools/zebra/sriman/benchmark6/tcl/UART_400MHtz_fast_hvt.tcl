####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl
set_attribute library fast_vdd1v0_basicCells_hvt.lib

read_hdl /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/data_sampling.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/deserializer.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/edge_bit_counter.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/mux.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/par_chk.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/parity_calc.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/Serializer.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/stp_chk.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/strt_chk.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/uart_rx_fsm.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/UART_RX.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/uart_tx_fsm.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/UART_TX.v /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/rtl/UART.v 

elaborate

read_sdc /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/constraint/UART_400MHtz.sdc

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/output/UART_400MHtz_fast_hvt.v
write_sdc > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/output/UART_400MHtz_fast_hvt.sdc

# Write results in Report folder
report_timing > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/reports/UART_400MHtz_fast_hvt_timing.rpt
report_power  > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/reports/UART_400MHtz_fast_hvt_power.rpt
report_area   > /DIG_DESIGN/INTERNS/dic_lab_02/sriman/benchmark6/reports/UART_400MHtz_fast_hvt_area.rpt

quit
