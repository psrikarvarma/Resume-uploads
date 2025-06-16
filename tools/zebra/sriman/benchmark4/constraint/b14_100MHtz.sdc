# Clock constraints
create_clock -name clk -period 10 -waveform {0 5} [get_ports "clock"]
set_clock_transition -rise 0.1 [get_clocks "clock"]
set_clock_transition -fall 0.1 [get_clocks "clock"]
set_clock_uncertainty 0.01 [get_clocks "clock"]

# Input delay constraints
set_input_delay -max 1.0 [get_ports "reset"] -clock [get_clocks "clock"]

# Output delay constraints (if required)
set_output_delay -max 1.0 [get_ports "addr"] -clock [get_clocks "clock"]
set_output_delay -max 1.0 [get_ports "datao"] -clock [get_clocks "clock"]
