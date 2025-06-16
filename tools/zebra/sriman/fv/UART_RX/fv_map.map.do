
//input ports
add mapped point CLK CLK -type PI PI
add mapped point RST RST -type PI PI
add mapped point RX_IN RX_IN -type PI PI
add mapped point parity_enable parity_enable -type PI PI
add mapped point parity_type parity_type -type PI PI
add mapped point Prescale[5] Prescale[5] -type PI PI
add mapped point Prescale[4] Prescale[4] -type PI PI
add mapped point Prescale[3] Prescale[3] -type PI PI
add mapped point Prescale[2] Prescale[2] -type PI PI
add mapped point Prescale[1] Prescale[1] -type PI PI
add mapped point Prescale[0] Prescale[0] -type PI PI

//output ports
add mapped point P_DATA[7] P_DATA[7] -type PO PO
add mapped point P_DATA[6] P_DATA[6] -type PO PO
add mapped point P_DATA[5] P_DATA[5] -type PO PO
add mapped point P_DATA[4] P_DATA[4] -type PO PO
add mapped point P_DATA[3] P_DATA[3] -type PO PO
add mapped point P_DATA[2] P_DATA[2] -type PO PO
add mapped point P_DATA[1] P_DATA[1] -type PO PO
add mapped point P_DATA[0] P_DATA[0] -type PO PO
add mapped point data_valid data_valid -type PO PO
add mapped point parity_error parity_error -type PO PO
add mapped point framing_error framing_error -type PO PO

//inout ports




//Sequential Pins
add mapped point U0_data_sampling/sampled_bit/q U0_data_sampling/sampled_bit_reg/Q  -type DFF DFF
add mapped point U0_data_sampling/Samples[0]/q U0_data_sampling/Samples_reg[0]/Q  -type DFF DFF
add mapped point U0_data_sampling/Samples[1]/q U0_data_sampling/Samples_reg[1]/Q  -type DFF DFF
add mapped point U0_data_sampling/Samples[2]/q U0_data_sampling/Samples_reg[2]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[0]/q U0_deserializer/P_DATA_reg[0]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[1]/q U0_deserializer/P_DATA_reg[1]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[2]/q U0_deserializer/P_DATA_reg[2]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[3]/q U0_deserializer/P_DATA_reg[3]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[6]/q U0_deserializer/P_DATA_reg[6]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[5]/q U0_deserializer/P_DATA_reg[5]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[4]/q U0_deserializer/P_DATA_reg[4]/Q  -type DFF DFF
add mapped point U0_deserializer/P_DATA[7]/q U0_deserializer/P_DATA_reg[7]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/bit_count[3]/q U0_edge_bit_counter/bit_count_reg[3]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/bit_count[2]/q U0_edge_bit_counter/bit_count_reg[2]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/edge_count[5]/q U0_edge_bit_counter/edge_count_reg[5]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/bit_count[1]/q U0_edge_bit_counter/bit_count_reg[1]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/bit_count[0]/q U0_edge_bit_counter/bit_count_reg[0]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/edge_count[4]/q U0_edge_bit_counter/edge_count_reg[4]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/edge_count[2]/q U0_edge_bit_counter/edge_count_reg[2]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/edge_count[3]/q U0_edge_bit_counter/edge_count_reg[3]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/edge_count[1]/q U0_edge_bit_counter/edge_count_reg[1]/Q  -type DFF DFF
add mapped point U0_edge_bit_counter/edge_count[0]/q U0_edge_bit_counter/edge_count_reg[0]/Q  -type DFF DFF
add mapped point U0_par_chk/par_err/q U0_par_chk/par_err_reg/Q  -type DFF DFF
add mapped point U0_stp_chk/stp_err/q U0_stp_chk/stp_err_reg/Q  -type DFF DFF
add mapped point U0_strt_chk/strt_glitch/q U0_strt_chk/strt_glitch_reg/Q  -type DFF DFF
add mapped point U0_uart_fsm/current_state[0]/q U0_uart_fsm/current_state_reg[0]/Q  -type DFF DFF
add mapped point U0_uart_fsm/current_state[1]/q U0_uart_fsm/current_state_reg[1]/Q  -type DFF DFF
add mapped point U0_uart_fsm/current_state[2]/q U0_uart_fsm/current_state_reg[2]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
