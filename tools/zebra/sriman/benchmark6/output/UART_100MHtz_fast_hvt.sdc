# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.10-p001_1 on Tue Nov 26 05:04:01 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design UART

create_clock -name "TX_CLK" -period 10.0 -waveform {0.0 5.0} [get_ports TX_CLK]
set_clock_transition 0.1 [get_clocks TX_CLK]
create_clock -name "RX_CLK" -period 10.0 -waveform {0.0 5.0} [get_ports RX_CLK]
set_clock_transition 0.1 [get_clocks RX_CLK]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks RX_CLK] -add_delay -max 1.0 [get_ports RST]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.01 [get_clocks TX_CLK]
set_clock_uncertainty -setup 0.01 [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.01 [get_clocks RX_CLK]
