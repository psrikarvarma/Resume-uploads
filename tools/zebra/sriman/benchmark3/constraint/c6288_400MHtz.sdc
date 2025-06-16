# Clock constraints
create_clock -name clk -period 2.5 -waveform {0 1.25} [get_ports "clk"]
set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_uncertainty 0.01 [get_clocks "clk"]
set_input_delay -max 1.0 [get_ports "rst"] -clock [get_clocks "clk"]
# Set input delay for reset signal
set_input_delay -max 1.0 [get_ports "rst"]

# Set input delay for multiple signals
set_input_delay -max 1.0 [get_ports {N1 N18 N35 N52 N69 N86 N103 N120 N137 N154 N171 N188 N205 N222 N239 N256 N273 N290 N307 N324 N341 N358 N375 N392 N409 N426 N443 N460 N477 N494 N511 N528}]

# Set output delay for specified signals
set_output_delay -max 1.0 [get_ports {N545 N1581 N1901 N2223 N2548 N2877 N3211 N3552 N3895 N4241 N4591 N4946 N5308 N5672 N5971 N6123 N6150 N6160 N6170 N6180 N6190 N6200 N6210 N6220 N6230 N6240 N6250 N6260 N6270 N6280 N6287 N6288}]

