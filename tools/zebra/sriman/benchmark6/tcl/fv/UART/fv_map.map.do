
//input ports
add mapped point RST RST -type PI PI
add mapped point TX_CLK TX_CLK -type PI PI
add mapped point RX_CLK RX_CLK -type PI PI
add mapped point RX_IN_S RX_IN_S -type PI PI
add mapped point TX_IN_P[7] TX_IN_P[7] -type PI PI
add mapped point TX_IN_P[6] TX_IN_P[6] -type PI PI
add mapped point TX_IN_P[5] TX_IN_P[5] -type PI PI
add mapped point TX_IN_P[4] TX_IN_P[4] -type PI PI
add mapped point TX_IN_P[3] TX_IN_P[3] -type PI PI
add mapped point TX_IN_P[2] TX_IN_P[2] -type PI PI
add mapped point TX_IN_P[1] TX_IN_P[1] -type PI PI
add mapped point TX_IN_P[0] TX_IN_P[0] -type PI PI
add mapped point TX_IN_V TX_IN_V -type PI PI
add mapped point Prescale[5] Prescale[5] -type PI PI
add mapped point Prescale[4] Prescale[4] -type PI PI
add mapped point Prescale[3] Prescale[3] -type PI PI
add mapped point Prescale[2] Prescale[2] -type PI PI
add mapped point Prescale[1] Prescale[1] -type PI PI
add mapped point Prescale[0] Prescale[0] -type PI PI
add mapped point parity_enable parity_enable -type PI PI
add mapped point parity_type parity_type -type PI PI

//output ports
add mapped point RX_OUT_P[7] RX_OUT_P[7] -type PO PO
add mapped point RX_OUT_P[6] RX_OUT_P[6] -type PO PO
add mapped point RX_OUT_P[5] RX_OUT_P[5] -type PO PO
add mapped point RX_OUT_P[4] RX_OUT_P[4] -type PO PO
add mapped point RX_OUT_P[3] RX_OUT_P[3] -type PO PO
add mapped point RX_OUT_P[2] RX_OUT_P[2] -type PO PO
add mapped point RX_OUT_P[1] RX_OUT_P[1] -type PO PO
add mapped point RX_OUT_P[0] RX_OUT_P[0] -type PO PO
add mapped point RX_OUT_V RX_OUT_V -type PO PO
add mapped point TX_OUT_S TX_OUT_S -type PO PO
add mapped point TX_OUT_V TX_OUT_V -type PO PO
add mapped point parity_error parity_error -type PO PO
add mapped point framing_error framing_error -type PO PO

//inout ports




//Sequential Pins
add mapped point U0_UART_RX/U0_data_sampling/sampled_bit/q U0_UART_RX/U0_data_sampling/sampled_bit_reg/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_data_sampling/Samples[0]/q U0_UART_RX/U0_data_sampling/Samples_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_data_sampling/Samples[1]/q U0_UART_RX/U0_data_sampling/Samples_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_data_sampling/Samples[2]/q U0_UART_RX/U0_data_sampling/Samples_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[0]/q U0_UART_RX/U0_deserializer/P_DATA_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[1]/q U0_UART_RX/U0_deserializer/P_DATA_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[2]/q U0_UART_RX/U0_deserializer/P_DATA_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[3]/q U0_UART_RX/U0_deserializer/P_DATA_reg[3]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[6]/q U0_UART_RX/U0_deserializer/P_DATA_reg[6]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[5]/q U0_UART_RX/U0_deserializer/P_DATA_reg[5]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[4]/q U0_UART_RX/U0_deserializer/P_DATA_reg[4]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_deserializer/P_DATA[7]/q U0_UART_RX/U0_deserializer/P_DATA_reg[7]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/bit_count[3]/q U0_UART_RX/U0_edge_bit_counter/bit_count_reg[3]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/bit_count[2]/q U0_UART_RX/U0_edge_bit_counter/bit_count_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[5]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[5]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[5]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[5]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/bit_count[1]/q U0_UART_RX/U0_edge_bit_counter/bit_count_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/bit_count[0]/q U0_UART_RX/U0_edge_bit_counter/bit_count_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/bit_count[0]/q U0_UART_RX/U0_edge_bit_counter/bit_count_reg[0]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[4]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[4]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[4]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[4]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[2]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[2]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[2]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[3]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[3]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[3]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[3]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[1]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[1]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[1]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[0]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_edge_bit_counter/edge_count[0]/q U0_UART_RX/U0_edge_bit_counter/edge_count_reg[0]/QN  -type DFF DFF
add mapped point U0_UART_RX/U0_par_chk/par_err/q U0_UART_RX/U0_par_chk/par_err_reg/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_stp_chk/stp_err/q U0_UART_RX/U0_stp_chk/stp_err_reg/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_strt_chk/strt_glitch/q U0_UART_RX/U0_strt_chk/strt_glitch_reg/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_uart_fsm/current_state[0]/q U0_UART_RX/U0_uart_fsm/current_state_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_uart_fsm/current_state[1]/q U0_UART_RX/U0_uart_fsm/current_state_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_RX/U0_uart_fsm/current_state[2]/q U0_UART_RX/U0_uart_fsm/current_state_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/ser_count[2]/q U0_UART_TX/U0_Serializer/ser_count_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[1]/q U0_UART_TX/U0_Serializer/DATA_V_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[6]/q U0_UART_TX/U0_Serializer/DATA_V_reg[6]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[0]/q U0_UART_TX/U0_Serializer/DATA_V_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[2]/q U0_UART_TX/U0_Serializer/DATA_V_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[4]/q U0_UART_TX/U0_Serializer/DATA_V_reg[4]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[3]/q U0_UART_TX/U0_Serializer/DATA_V_reg[3]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[5]/q U0_UART_TX/U0_Serializer/DATA_V_reg[5]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/DATA_V[7]/q U0_UART_TX/U0_Serializer/DATA_V_reg[7]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/ser_count[1]/q U0_UART_TX/U0_Serializer/ser_count_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_Serializer/ser_count[0]/q U0_UART_TX/U0_Serializer/ser_count_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_fsm/busy/q U0_UART_TX/U0_fsm/busy_reg/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_fsm/current_state[2]/q U0_UART_TX/U0_fsm/current_state_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_fsm/current_state[0]/q U0_UART_TX/U0_fsm/current_state_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_fsm/current_state[1]/q U0_UART_TX/U0_fsm/current_state_reg[1]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_mux/OUT/q U0_UART_TX/U0_mux/OUT_reg/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/parity/q U0_UART_TX/U0_parity_calc/parity_reg/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[5]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[5]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[3]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[3]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[2]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[2]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[6]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[6]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[4]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[4]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[7]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[7]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[0]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[0]/Q  -type DFF DFF
add mapped point U0_UART_TX/U0_parity_calc/DATA_V[1]/q U0_UART_TX/U0_parity_calc/DATA_V_reg[1]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
