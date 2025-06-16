
//input ports
add mapped point CLK CLK -type PI PI
add mapped point RST RST -type PI PI
add mapped point P_DATA[7] P_DATA[7] -type PI PI
add mapped point P_DATA[6] P_DATA[6] -type PI PI
add mapped point P_DATA[5] P_DATA[5] -type PI PI
add mapped point P_DATA[4] P_DATA[4] -type PI PI
add mapped point P_DATA[3] P_DATA[3] -type PI PI
add mapped point P_DATA[2] P_DATA[2] -type PI PI
add mapped point P_DATA[1] P_DATA[1] -type PI PI
add mapped point P_DATA[0] P_DATA[0] -type PI PI
add mapped point Data_Valid Data_Valid -type PI PI
add mapped point parity_enable parity_enable -type PI PI
add mapped point parity_type parity_type -type PI PI

//output ports
add mapped point TX_OUT TX_OUT -type PO PO
add mapped point busy busy -type PO PO

//inout ports




//Sequential Pins
add mapped point U0_Serializer/ser_count[2]/q U0_Serializer/ser_count_reg[2]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[1]/q U0_Serializer/DATA_V_reg[1]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[6]/q U0_Serializer/DATA_V_reg[6]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[0]/q U0_Serializer/DATA_V_reg[0]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[2]/q U0_Serializer/DATA_V_reg[2]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[4]/q U0_Serializer/DATA_V_reg[4]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[3]/q U0_Serializer/DATA_V_reg[3]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[5]/q U0_Serializer/DATA_V_reg[5]/Q  -type DFF DFF
add mapped point U0_Serializer/DATA_V[7]/q U0_Serializer/DATA_V_reg[7]/Q  -type DFF DFF
add mapped point U0_Serializer/ser_count[1]/q U0_Serializer/ser_count_reg[1]/Q  -type DFF DFF
add mapped point U0_Serializer/ser_count[0]/q U0_Serializer/ser_count_reg[0]/Q  -type DFF DFF
add mapped point U0_fsm/busy/q U0_fsm/busy_reg/Q  -type DFF DFF
add mapped point U0_fsm/current_state[2]/q U0_fsm/current_state_reg[2]/Q  -type DFF DFF
add mapped point U0_fsm/current_state[0]/q U0_fsm/current_state_reg[0]/Q  -type DFF DFF
add mapped point U0_fsm/current_state[1]/q U0_fsm/current_state_reg[1]/Q  -type DFF DFF
add mapped point U0_mux/OUT/q U0_mux/OUT_reg/Q  -type DFF DFF
add mapped point U0_parity_calc/parity/q U0_parity_calc/parity_reg/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[5]/q U0_parity_calc/DATA_V_reg[5]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[3]/q U0_parity_calc/DATA_V_reg[3]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[2]/q U0_parity_calc/DATA_V_reg[2]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[6]/q U0_parity_calc/DATA_V_reg[6]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[4]/q U0_parity_calc/DATA_V_reg[4]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[7]/q U0_parity_calc/DATA_V_reg[7]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[0]/q U0_parity_calc/DATA_V_reg[0]/Q  -type DFF DFF
add mapped point U0_parity_calc/DATA_V[1]/q U0_parity_calc/DATA_V_reg[1]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
