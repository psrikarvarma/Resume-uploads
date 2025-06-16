# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.10-p001_1 on Thu Nov 28 08:23:37 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design FADD

set_max_delay 8 -from [list \
  [get_ports {i_A[63]}]  \
  [get_ports {i_A[62]}]  \
  [get_ports {i_A[61]}]  \
  [get_ports {i_A[60]}]  \
  [get_ports {i_A[59]}]  \
  [get_ports {i_A[58]}]  \
  [get_ports {i_A[57]}]  \
  [get_ports {i_A[56]}]  \
  [get_ports {i_A[55]}]  \
  [get_ports {i_A[54]}]  \
  [get_ports {i_A[53]}]  \
  [get_ports {i_A[52]}]  \
  [get_ports {i_A[51]}]  \
  [get_ports {i_A[50]}]  \
  [get_ports {i_A[49]}]  \
  [get_ports {i_A[48]}]  \
  [get_ports {i_A[47]}]  \
  [get_ports {i_A[46]}]  \
  [get_ports {i_A[45]}]  \
  [get_ports {i_A[44]}]  \
  [get_ports {i_A[43]}]  \
  [get_ports {i_A[42]}]  \
  [get_ports {i_A[41]}]  \
  [get_ports {i_A[40]}]  \
  [get_ports {i_A[39]}]  \
  [get_ports {i_A[38]}]  \
  [get_ports {i_A[37]}]  \
  [get_ports {i_A[36]}]  \
  [get_ports {i_A[35]}]  \
  [get_ports {i_A[34]}]  \
  [get_ports {i_A[33]}]  \
  [get_ports {i_A[32]}]  \
  [get_ports {i_A[31]}]  \
  [get_ports {i_A[30]}]  \
  [get_ports {i_A[29]}]  \
  [get_ports {i_A[28]}]  \
  [get_ports {i_A[27]}]  \
  [get_ports {i_A[26]}]  \
  [get_ports {i_A[25]}]  \
  [get_ports {i_A[24]}]  \
  [get_ports {i_A[23]}]  \
  [get_ports {i_A[22]}]  \
  [get_ports {i_A[21]}]  \
  [get_ports {i_A[20]}]  \
  [get_ports {i_A[19]}]  \
  [get_ports {i_A[18]}]  \
  [get_ports {i_A[17]}]  \
  [get_ports {i_A[16]}]  \
  [get_ports {i_A[15]}]  \
  [get_ports {i_A[14]}]  \
  [get_ports {i_A[13]}]  \
  [get_ports {i_A[12]}]  \
  [get_ports {i_A[11]}]  \
  [get_ports {i_A[10]}]  \
  [get_ports {i_A[9]}]  \
  [get_ports {i_A[8]}]  \
  [get_ports {i_A[7]}]  \
  [get_ports {i_A[6]}]  \
  [get_ports {i_A[5]}]  \
  [get_ports {i_A[4]}]  \
  [get_ports {i_A[3]}]  \
  [get_ports {i_A[2]}]  \
  [get_ports {i_A[1]}]  \
  [get_ports {i_A[0]}] ] -to [list \
  [get_ports {o_res[63]}]  \
  [get_ports {o_res[62]}]  \
  [get_ports {o_res[61]}]  \
  [get_ports {o_res[60]}]  \
  [get_ports {o_res[59]}]  \
  [get_ports {o_res[58]}]  \
  [get_ports {o_res[57]}]  \
  [get_ports {o_res[56]}]  \
  [get_ports {o_res[55]}]  \
  [get_ports {o_res[54]}]  \
  [get_ports {o_res[53]}]  \
  [get_ports {o_res[52]}]  \
  [get_ports {o_res[51]}]  \
  [get_ports {o_res[50]}]  \
  [get_ports {o_res[49]}]  \
  [get_ports {o_res[48]}]  \
  [get_ports {o_res[47]}]  \
  [get_ports {o_res[46]}]  \
  [get_ports {o_res[45]}]  \
  [get_ports {o_res[44]}]  \
  [get_ports {o_res[43]}]  \
  [get_ports {o_res[42]}]  \
  [get_ports {o_res[41]}]  \
  [get_ports {o_res[40]}]  \
  [get_ports {o_res[39]}]  \
  [get_ports {o_res[38]}]  \
  [get_ports {o_res[37]}]  \
  [get_ports {o_res[36]}]  \
  [get_ports {o_res[35]}]  \
  [get_ports {o_res[34]}]  \
  [get_ports {o_res[33]}]  \
  [get_ports {o_res[32]}]  \
  [get_ports {o_res[31]}]  \
  [get_ports {o_res[30]}]  \
  [get_ports {o_res[29]}]  \
  [get_ports {o_res[28]}]  \
  [get_ports {o_res[27]}]  \
  [get_ports {o_res[26]}]  \
  [get_ports {o_res[25]}]  \
  [get_ports {o_res[24]}]  \
  [get_ports {o_res[23]}]  \
  [get_ports {o_res[22]}]  \
  [get_ports {o_res[21]}]  \
  [get_ports {o_res[20]}]  \
  [get_ports {o_res[19]}]  \
  [get_ports {o_res[18]}]  \
  [get_ports {o_res[17]}]  \
  [get_ports {o_res[16]}]  \
  [get_ports {o_res[15]}]  \
  [get_ports {o_res[14]}]  \
  [get_ports {o_res[13]}]  \
  [get_ports {o_res[12]}]  \
  [get_ports {o_res[11]}]  \
  [get_ports {o_res[10]}]  \
  [get_ports {o_res[9]}]  \
  [get_ports {o_res[8]}]  \
  [get_ports {o_res[7]}]  \
  [get_ports {o_res[6]}]  \
  [get_ports {o_res[5]}]  \
  [get_ports {o_res[4]}]  \
  [get_ports {o_res[3]}]  \
  [get_ports {o_res[2]}]  \
  [get_ports {o_res[1]}]  \
  [get_ports {o_res[0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -add_delay -max 1.0 [get_ports i_mode]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[63]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[62]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[61]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[60]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[59]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[58]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[57]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[56]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[55]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[54]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[53]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[52]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[51]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[50]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[49]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[48]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[47]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[46]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[45]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[44]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[43]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[42]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[41]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[40]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[39]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[38]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[37]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[36]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[35]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[34]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[33]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[32]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[31]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[30]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[29]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[28]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[27]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[26]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[25]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[24]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[23]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[22]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[21]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[20]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[19]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[18]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[17]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[16]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[15]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[14]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[13]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[12]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[11]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[10]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[9]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[8]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[7]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[6]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[5]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[4]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[3]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[2]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[1]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_A[0]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[63]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[62]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[61]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[60]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[59]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[58]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[57]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[56]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[55]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[54]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[53]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[52]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[51]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[50]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[49]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[48]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[47]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[46]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[45]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[44]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[43]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[42]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[41]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[40]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[39]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[38]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[37]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[36]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[35]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[34]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[33]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[32]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[31]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[30]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[29]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[28]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[27]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[26]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[25]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[24]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[23]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[22]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[21]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[20]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[19]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[18]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[17]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[16]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[15]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[14]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[13]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[12]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[11]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[10]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[9]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[8]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[7]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[6]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[5]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[4]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[3]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[2]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[1]}]
set_input_delay -add_delay -max 1.0 [get_ports {i_B[0]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[63]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[62]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[61]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[60]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[59]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[58]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[57]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[56]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[55]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[54]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[53]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[52]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[51]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[50]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[49]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[48]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[47]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[46]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[45]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[44]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[43]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[42]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[41]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[40]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[39]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[38]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[37]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[36]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[35]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[34]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[33]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[32]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[31]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[30]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[29]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[28]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[27]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[26]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[25]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[24]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[23]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[22]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[21]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[20]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[19]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[18]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[17]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[16]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[15]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[14]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[13]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[12]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[11]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[10]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[9]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[8]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[7]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[6]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[5]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[4]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[3]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[2]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[1]}]
set_output_delay -add_delay -max 1.0 [get_ports {o_res[0]}]
set_wire_load_mode "enclosed"
