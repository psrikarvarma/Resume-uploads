#!/bin/bash
benchmarks=("benchmark1" "benchmark2" "benchmark3" "benchmark4"  "benchmark5" 
"benchmark6" "benchmark7" "benchmark8" "benchmark9" "benchmark10")
homedirectory="/DIG_DESIGN/INTERNS/dic_lab_02/sriman"
for benchmark in "${benchmarks[@]}"; do
    tcl_dir="$homedirectory/$benchmark/tcl"  
        tcl_files=$(find "$tcl_dir" -type f -name "*.tcl")
     for tcl_file in $tcl_files; do
         echo "Running TCL script: $tcl_file"
         genus -legacy_ui -f "$tcl_file"
     done
done
