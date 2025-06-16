#!/bin/bash

# Define benchmarks
benchmarks=("benchmark3" "benchmark6" "benchmark9" "benchmark10")
# "benchmark5" "benchmark6" "benchmark7" "benchmark8" "benchmark9" "benchmark10")

# Define root directory
root_dir="/DIG_DESIGN/INTERNS/dic_lab_02/sriman"  # Change to /home/psrikarvarma/personal/tools/sriman if needed

# Iterate over each benchmark
for benchmark in "${benchmarks[@]}"; do
    # Define the directory containing TCL files for the current benchmark
    tcl_dir="$root_dir/$benchmark/tcl"
        
        # Find all .tcl files in the directory
        tcl_files=$(find "$tcl_dir" -type f -name "*.tcl")
        
        # Execute each TCL file
        for tcl_file in $tcl_files; do
            echo "Running TCL script: $tcl_file"
            genus -legacy_ui -f "$tcl_file"
        done
done

echo "Script execution completed!"

