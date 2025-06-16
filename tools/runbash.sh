#!/bin/bash

# Define benchmarks
benchmarks=("benchmark1" "benchmark2" "benchmark3" "benchmark4" "benchmark5" "benchmark6" "benchmark7" "benchmark8" "benchmark9" "benchmark10")

# Define top modules corresponding to benchmarks
top_modules=("IIR_filter.v" "FIR_filter.v" "c6288.v" "b14.vhd" "b15.vhd" "UART.v" "FADD.v" "FADD_Dual_Main.v" "UART_RX.v" "UART_TX.v")

# Define root directory
root_dir="/home/psrikarvarma/personal/tools/sriman" # /DIG_DESIGN/INTERNS/dic_lab_02/sriman

# Define frequency and mode arrays
freqs=("100MHtz" "400MHtz")

modes=("slow" "fast" "fast_hvt" "slow_hvt" "fast_lvt" "slow_lvt")

for i in "${!benchmarks[@]}"; do
    benchmark="${benchmarks[i]}"
    top_module="${top_modules[i]}"
    
    rtl_dir="$root_dir/$benchmark/rtl"
    tcl_dir="$root_dir/$benchmark/tcl"
    constraint_dir="$root_dir/$benchmark/constraint"
    
	# Extract the top module name without extension
	if [[ "$top_module" == *.v ]]; then
	    top_module_name=$(basename "$top_module" .v)
	elif [[ "$top_module" == *.vhd ]]; then
	    top_module_name=$(basename "$top_module" .vhd)
	fi

    # Check if RTL directory exists
    if [[ -d "$rtl_dir" ]]; then
        # Find the top module file
        if [[ -f "$rtl_dir/$top_module" ]]; then
            top_file="$rtl_dir/$top_module"
        else
            echo "Top module $top_module not found in $rtl_dir"
            continue
        fi
        
        # Iterate through frequencies
        for freq in "${freqs[@]}"; do
            # Set clock period and waveform based on frequency
            case $freq in
                "100MHtz")
                    clk_period="10"
                    clk_waveform="{0 5}"
                    ;;
                "400MHtz")
                    clk_period="2.5"
                    clk_waveform="{0 1.25}"
                    ;;
            esac
            
            # Create constraint file
            sdc_file="$constraint_dir/${top_module_name}_${freq}.sdc"
            # mkdir -p "$constraint_dir"
            echo "Generating SDC file: $sdc_file"
            {
		echo "# Clock constraints"
		
		# Find clock input variables dynamically (handles multiple clocks)
		clk_variables=$(grep -iP "input\s+(\w+\s+)?\S*(clk|clock)\S*" "$top_file" | sed 's/;//' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(clk|clock)")
		# For VHDL files, capture the "in" ports (case-insensitive)
		if [[ "$top_file" == *.vhd ]]; then
		    clk_variables=$(grep -iP "port\s*\(.*\s*in\s+.*(clk|clock)\S*.*\)" "$top_file" | sed 's/port\s*//g' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(clk|clock)")
		fi

		# If no clock variables are found, fallback to "clk"
		if [[ -z "$clk_variables" ]]; then
		    clk_variables="clk"
		fi

		# Process each clock variable
		for clk_variable in $clk_variables; do
		    echo "create_clock -name $clk_variable -period $clk_period -waveform $clk_waveform [get_ports \"$clk_variable\"]"
		    echo "set_clock_transition -rise 0.1 [get_clocks \"$clk_variable\"]"
		    echo "set_clock_transition -fall 0.1 [get_clocks \"$clk_variable\"]"
		    echo "set_clock_uncertainty 0.01 [get_clocks \"$clk_variable\"]"
		done

		# Handle reset variables dynamically (handles multiple resets)
		reset_variables=$(grep -iP "input\s+(\w+\s+)?\S*(rst|reset)\S*" "$top_file" | sed 's/;//' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(rst|reset)")
		# For VHDL files, capture the "in" ports for reset signals
		if [[ "$top_file" == *.vhd ]]; then
		    reset_variables=$(grep -iP "port\s*\(.*\s*in\s+.*(rst|reset)\S*.*\)" "$top_file" | sed 's/port\s*//g' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(rst|reset)")
		fi

		# If no reset variables are found, fallback to "reset"
		if [[ -z "$reset_variables" ]]; then
		    reset_variables="rst"
		fi

		# Process each reset variable
		for reset_variable in $reset_variables; do
		    echo "set_input_delay -max 1.0 [get_ports \"$reset_variable\"] -clock [get_clocks \"$clk_variable\"]"
		done

		# Handle input ports, especially multi-bit signals (like [63:0])
		grep -E "input\s+[^;]+;" "$top_file" | sed -E 's/input\s+|\s*;//g' | tr -s ',' '\n' | while read -r input_port; do
		    # Check if it's a multi-bit signal (e.g., [63:0] or similar)
		    if [[ "$input_port" =~ \[.*\] ]]; then
			# Process the whole array (e.g., i_A[63:0]) in one line
			echo "set_input_delay -max 1.0 [get_ports \"$input_port\"] -clock [get_clocks \"$clk_variable\"]"
		    else
			# For single-bit signals, just set delay for the port
			echo "set_input_delay -max 1.0 [get_ports \"$input_port\"] -clock [get_clocks \"$clk_variable\"]"
		    fi
		done

		# Handle output ports similarly, with delays for multi-bit signals
		grep -E "output\s+[^;]+;" "$top_file" | sed -E 's/output\s+|\s*;//g' | tr -s ',' '\n' | while read -r output_port; do
		    # Check if it's a multi-bit signal (e.g., [63:0] or similar)
		    if [[ "$output_port" =~ \[.*\] ]]; then
			# Process the whole array (e.g., o_res[63:0]) in one line
			echo "set_output_delay -max 1.0 [get_ports \"$output_port\"] -clock [get_clocks \"$clk_variable\"]"
		    else
			# For single-bit signals, just set delay for the port
			echo "set_output_delay -max 1.0 [get_ports \"$output_port\"] -clock [get_clocks \"$clk_variable\"]"
		    fi
		done
	}	> "$sdc_file"

            # Generate TCL scripts
            for mode in "${modes[@]}"; do
                case $mode in
                    *"_lvt")
                        lib_name="${mode%%_*}_vdd1v0_basicCells_lvt.lib"
                        ;;
                    *"_hvt")
                        lib_name="${mode%%_*}_vdd1v0_basicCells_hvt.lib"
                        ;;
                    *)
                        lib_name="${mode}_vdd1v0_basicCells.lib"
                        ;;
                esac
                
                tcl_path="$tcl_dir"
                # mkdir -p "$tcl_path"
                tcl_file="$tcl_path/${top_module_name}_${freq}_${mode}.tcl"
                
                echo "Generating TCL script: $tcl_file"
                
		# Gather .v files or .vhd files depending on the top module
		if [[ "$top_file" == *.v ]]; then
		    hdl_files=$(ls "$rtl_dir"/*.v 2>/dev/null | tr '\n' ' ') # List all .v files in rtl_dir
		    read_hdl_cmd="read_hdl $hdl_files"
		elif [[ "$top_file" == *.vhd ]]; then
		    hdl_files=$(ls "$rtl_dir"/*.vhd 2>/dev/null | tr '\n' ' ') # List all .vhd files in rtl_dir
		    read_hdl_cmd="read_hdl -vhdl $hdl_files"
		fi
		
                cat <<EOT > "$tcl_file"
####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path $rtl_dir
set_attribute library $lib_name

$read_hdl_cmd

elaborate

read_sdc $sdc_file

set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

syn_generic
syn_map
syn_opt

######### output
write_hdl -mapped > $root_dir/$benchmark/output/${top_module_name}_${freq}_${mode}.v
write_sdc > $root_dir/$benchmark/output/${top_module_name}_${freq}_${mode}.sdc

# Write results in Report folder
report_timing > $root_dir/$benchmark/reports/${top_module_name}_${freq}_${mode}_timing.rpt
report_power  > $root_dir/$benchmark/reports/${top_module_name}_${freq}_${mode}_power.rpt
report_area   > $root_dir/$benchmark/reports/${top_module_name}_${freq}_${mode}_area.rpt

quit
EOT
                # Run the generated TCL script (optional)
                # genus -legacy_ui -f "$tcl_file"
                echo "Generated TCL script for $benchmark, freq=$freq, mode=$mode"
            done
        done
    else
        echo "RTL directory not found for benchmark: $benchmark"
    fi
done

echo "Script execution completed!"
