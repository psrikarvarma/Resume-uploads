#!/bin/bash

benchmarks=("benchmark7" "benchmark8" "benchmark3" "benchmark4" "benchmark5"
 "benchmark6" "benchmark1" "benchmark2" "benchmark9" "benchmark10")
top_modules=("FADD.v" "FADD_Dual_Main.v" "IIR_filter.v" "FIR_filter.v" "c6288.v" 
	"b14.vhd" "b15.vhd" "UART.v" "FADD.v" "FADD_Dual_Main.v" "UART_RX.v" "UART_TX.v")

hometoaddr="/DIG_DESIGN/INTERNS/dic_lab_02/sriman"
freqs=("100MHtz" "400MHtz")
modes=("slow" "fast" "fast_hvt" "slow_hvt" "fast_lvt" "slow_lvt")

for i in "${!benchmarks[@]}"; 
do 
    rtlpath="$hometoaddr/$benchmark/rtl"
    tclpath="$hometoaddr/$benchmark/tcl"
    benchmark="${benchmarks[i]}"
    top_module="${top_modules[i]}"
    constraintpath="$hometoaddr/$benchmark/constraint"

	if [[ "$top_module" == *.v ]];
	 then
	    top_module_name=$(basename "$top_module" .v)
	elif [[ "$top_module" == *.vhd ]]; 
		then
	    top_module_name=$(basename "$top_module" .vhd)
	fi
 for freq in "${freqs[@]}"; 
 do
     if [[ $freq == "100MHtz" ]];
      then
        clk_period="10"
        clk_waveform="{0 5}"
      fi
       if [[ $freq == "400MHtz" ]];
        then
        clk_period="2.5"
        clk_waveform="{0 1.25}"
       fi
         done



# Create constraint file
   sdc_file="$constraintpath/${top_module_name}_${freq}.sdc"
            {
		echo "# Clock constraints"
clk_variables=$(grep -iP "input\s+(\w+\s+)?\S*(clk|clock)\S*" "$top_file" | sed 's/;//' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(clk|clock)")
		if [[ "$top_file" == *.vhd ]]; 
		then
	clk_variables=$(grep -iP "port\s*\(.*\s*in\s+.*(clk|clock)\S*.*\)" "$top_file" | sed 's/port\s*//g' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(clk|clock)")
		fi

		if [[ -z "$clk_variables" ]]; then
		    clk_variables="clk"
		fi
		for clk_variable in $clk_variables;
		 do
		    echo "create_clock -name $clk_variable -period $clk_period -waveform $clk_waveform [get_ports \"$clk_variable\"]"
		    echo "set_clock_transition -rise 0.1 [get_clocks \"$clk_variable\"]"
		    echo "set_clock_transition -fall 0.1 [get_clocks \"$clk_variable\"]"
		    echo "set_clock_uncertainty 0.01 [get_clocks \"$clk_variable\"]"
		done

		reset_variables=$(grep -iP "input\s+(\w+\s+)?\S*(rst|reset)\S*" "$top_file" | sed 's/;//' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(rst|reset)")

		if [[ "$top_file" == *.vhd ]]; 
		then
		    reset_variables=$(grep -iP "port\s*\(.*\s*in\s+.*(rst|reset)\S*.*\)" "$top_file" | sed 's/port\s*//g' | tr -s ',' '\n' | tr -s '[:space:]' '\n' | grep -iP "(rst|reset)")
		fi

		if [[ -z "$reset_variables" ]];
		 then
		    reset_variables="rst"
		fi
		for reset_variable in $reset_variables; do
		    echo "set_input_delay -max 1.0 [get_ports \"$reset_variable\"] -clock [get_clocks \"$clk_variable\"]"
		done

		grep -E "input\s+[^;]+;" "$top_file" | sed -E 's/input\s+|\s*;//g' | tr -s ',' '\n' | while read -r input_port; do
		    if [[ "$input_port" =~ \[.*\] ]]; then
			echo "set_input_delay -max 1.0 [get_ports \"$input_port\"] -clock [get_clocks \"$clk_variable\"]"
		    else
			echo "set_input_delay -max 1.0 [get_ports \"$input_port\"] -clock [get_clocks \"$clk_variable\"]"
		    fi
		done

		grep -E "output\s+[^;]+;" "$top_file" | sed -E 's/output\s+|\s*;//g' | tr -s ',' '\n' | while read -r output_port; do
		    if [[ "$output_port" =~ \[.*\] ]]; then
			echo "set_output_delay -max 1.0 [get_ports \"$output_port\"] -clock [get_clocks \"$clk_variable\"]"
		    else
			echo "set_output_delay -max 1.0 [get_ports \"$output_port\"] -clock [get_clocks \"$clk_variable\"]"
		    fi
		done
	}	> "$sdc_file"

#TCL
for mode in "${modes[@]}"; do
    if [[ $mode == *"_lvt" ]]; then
        lib_name="${mode%%_*}_vdd1v0_basicCells_lvt.lib"
    elif [[ $mode == *"_hvt" ]]; then
        lib_name="${mode%%_*}_vdd1v0_basicCells_hvt.lib"
    else
        lib_name="${mode}_vdd1v0_basicCells.lib"
    fi
done

   tcl_path="$tclpath"
   tcl_file="$tcl_path/${top_module_name}_${freq}_${mode}.tcl"
		if [[ "$top_file" == *.v ]]; 
		then
		    hdl_files=$(ls "$rtlpath"/*.v 2>/dev/null | tr '\n' ' ')
		    read_hdl_cmd="read_hdl $hdl_files"
		elif [[ "$top_file" == *.vhd ]];
		 then
		    hdl_files=$(ls "$rtlpath"/*.vhd 2>/dev/null | tr '\n' ' ')
		    read_hdl_cmd="read_hdl -vhdl $hdl_files"
		fi
		
                cat <<EOT > "$tcl_file"
####################technology file setup

set_attribute init_lib_search_path /DIG_DESIGN/INTERNS/PDK_DIC
set_attribute init_hdl_search_path $rtlpath
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
write_hdl -mapped > $hometoaddr/$benchmark/output/${top_module_name}_${freq}_${mode}.v
write_sdc > $hometoaddr/$benchmark/output/${top_module_name}_${freq}_${mode}.sdc

# Write results in Report folder
report_timing > $hometoaddr/$benchmark/reports/${top_module_name}_${freq}_${mode}_timing.rpt
report_power  > $hometoaddr/$benchmark/reports/${top_module_name}_${freq}_${mode}_power.rpt
report_area   > $hometoaddr/$benchmark/reports/${top_module_name}_${freq}_${mode}_area.rpt

quit
EOT
                echo "Generated TCL script for $benchmark, freq=$freq, mode=$mode"
            done
        done
    else
 echo "RTL directory not found for running benchmark: $benchmark"
    fi
done
