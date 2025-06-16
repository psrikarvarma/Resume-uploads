# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.10-p001_1 on Tue Nov 26 05:47:38 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design UART_RX

create_clock -name "CLK" -period 2.5 -waveform {0.0 1.25} [get_ports CLK]
set_clock_transition 0.1 [get_clocks CLK]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks CLK] -add_delay -max 1.0 [get_ports RST]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_clocks CLK]
set_clock_uncertainty -hold 0.01 [get_clocks CLK]
