# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.10-p001_1 on Tue Nov 26 09:37:22 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design b14

create_clock -name "clk" -period 2.5 -waveform {0.0 1.25} [get_ports clock]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
