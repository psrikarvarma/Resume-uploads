# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.10-p001_1 on Thu Nov 28 11:09:33 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design c6288

set_clock_gating_check -setup 0.0 
set_input_delay -add_delay -max 1.0 [get_ports N1]
set_input_delay -add_delay -max 1.0 [get_ports N18]
set_input_delay -add_delay -max 1.0 [get_ports N35]
set_input_delay -add_delay -max 1.0 [get_ports N52]
set_input_delay -add_delay -max 1.0 [get_ports N69]
set_input_delay -add_delay -max 1.0 [get_ports N86]
set_input_delay -add_delay -max 1.0 [get_ports N103]
set_input_delay -add_delay -max 1.0 [get_ports N120]
set_input_delay -add_delay -max 1.0 [get_ports N137]
set_input_delay -add_delay -max 1.0 [get_ports N154]
set_input_delay -add_delay -max 1.0 [get_ports N171]
set_input_delay -add_delay -max 1.0 [get_ports N188]
set_input_delay -add_delay -max 1.0 [get_ports N205]
set_input_delay -add_delay -max 1.0 [get_ports N222]
set_input_delay -add_delay -max 1.0 [get_ports N239]
set_input_delay -add_delay -max 1.0 [get_ports N256]
set_input_delay -add_delay -max 1.0 [get_ports N273]
set_input_delay -add_delay -max 1.0 [get_ports N290]
set_input_delay -add_delay -max 1.0 [get_ports N307]
set_input_delay -add_delay -max 1.0 [get_ports N324]
set_input_delay -add_delay -max 1.0 [get_ports N341]
set_input_delay -add_delay -max 1.0 [get_ports N358]
set_input_delay -add_delay -max 1.0 [get_ports N375]
set_input_delay -add_delay -max 1.0 [get_ports N392]
set_input_delay -add_delay -max 1.0 [get_ports N409]
set_input_delay -add_delay -max 1.0 [get_ports N426]
set_input_delay -add_delay -max 1.0 [get_ports N443]
set_input_delay -add_delay -max 1.0 [get_ports N460]
set_input_delay -add_delay -max 1.0 [get_ports N477]
set_input_delay -add_delay -max 1.0 [get_ports N494]
set_input_delay -add_delay -max 1.0 [get_ports N511]
set_input_delay -add_delay -max 1.0 [get_ports N528]
set_output_delay -add_delay -max 1.0 [get_ports N545]
set_output_delay -add_delay -max 1.0 [get_ports N1581]
set_output_delay -add_delay -max 1.0 [get_ports N1901]
set_output_delay -add_delay -max 1.0 [get_ports N2223]
set_output_delay -add_delay -max 1.0 [get_ports N2548]
set_output_delay -add_delay -max 1.0 [get_ports N2877]
set_output_delay -add_delay -max 1.0 [get_ports N3211]
set_output_delay -add_delay -max 1.0 [get_ports N3552]
set_output_delay -add_delay -max 1.0 [get_ports N3895]
set_output_delay -add_delay -max 1.0 [get_ports N4241]
set_output_delay -add_delay -max 1.0 [get_ports N4591]
set_output_delay -add_delay -max 1.0 [get_ports N4946]
set_output_delay -add_delay -max 1.0 [get_ports N5308]
set_output_delay -add_delay -max 1.0 [get_ports N5672]
set_output_delay -add_delay -max 1.0 [get_ports N5971]
set_output_delay -add_delay -max 1.0 [get_ports N6123]
set_output_delay -add_delay -max 1.0 [get_ports N6150]
set_output_delay -add_delay -max 1.0 [get_ports N6160]
set_output_delay -add_delay -max 1.0 [get_ports N6170]
set_output_delay -add_delay -max 1.0 [get_ports N6180]
set_output_delay -add_delay -max 1.0 [get_ports N6190]
set_output_delay -add_delay -max 1.0 [get_ports N6200]
set_output_delay -add_delay -max 1.0 [get_ports N6210]
set_output_delay -add_delay -max 1.0 [get_ports N6220]
set_output_delay -add_delay -max 1.0 [get_ports N6230]
set_output_delay -add_delay -max 1.0 [get_ports N6240]
set_output_delay -add_delay -max 1.0 [get_ports N6250]
set_output_delay -add_delay -max 1.0 [get_ports N6260]
set_output_delay -add_delay -max 1.0 [get_ports N6270]
set_output_delay -add_delay -max 1.0 [get_ports N6280]
set_output_delay -add_delay -max 1.0 [get_ports N6287]
set_output_delay -add_delay -max 1.0 [get_ports N6288]
set_wire_load_mode "enclosed"
