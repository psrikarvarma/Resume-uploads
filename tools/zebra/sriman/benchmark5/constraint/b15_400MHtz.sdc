# Clock constraints
create_clock -name CLOCK -period 2.5 -waveform {0 1.25} [get_ports "CLOCK"]
set_clock_transition -rise 0.1 [get_clocks "CLOCK"]
set_clock_transition -fall 0.1 [get_clocks "CLOCK"]
set_clock_uncertainty 0.01 [get_clocks "CLOCK"]

# Input delay constraints
set_input_delay -max 1.0 [get_ports "Datai"] -clock [get_clocks "CLOCK"]
set_input_delay -max 1.0 [get_ports "NA_n"] -clock [get_clocks "CLOCK"]
set_input_delay -max 1.0 [get_ports "BS16_n"] -clock [get_clocks "CLOCK"]
set_input_delay -max 1.0 [get_ports "READY_n"] -clock [get_clocks "CLOCK"]
set_input_delay -max 1.0 [get_ports "HOLD"] -clock [get_clocks "CLOCK"]
set_input_delay -max 1.0 [get_ports "RESET"] -clock [get_clocks "CLOCK"]

# Output delay constraints
set_output_delay -max 1.0 [get_ports "BE_n"] -clock [get_clocks "CLOCK"]
set_output_delay -max 1.0 [get_ports "Address"] -clock [get_clocks "CLOCK"]
set_output_delay -max 1.0 [get_ports "W_R_n"] -clock [get_clocks "CLOCK"]
set_output_delay -max 1.0 [get_ports "D_C_n"] -clock [get_clocks "CLOCK"]
set_output_delay -max 1.0 [get_ports "M_IO_n"] -clock [get_clocks "CLOCK"]
set_output_delay -max 1.0 [get_ports "ADS_n"] -clock [get_clocks "CLOCK"]
set_output_delay -max 1.0 [get_ports "Datao"] -clock [get_clocks "CLOCK"]
