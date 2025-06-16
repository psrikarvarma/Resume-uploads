#!/bin/bash

# Array of benchmark names
benchmarks=()
for i in {1..10}; do
    benchmarks+=("benchmark$i")
done

# Array of subdirectories
sub_dirs=("rtl" "tcl" "output" "reports" "constraint")

# Create directories
for benchmark in "${benchmarks[@]}"; do
    mkdir -p "$benchmark" # Create the benchmark directory

    # Create subdirectories inside the benchmark directory
    for sub_dir in "${sub_dirs[@]}"; do
        mkdir -p "$benchmark/$sub_dir"
    done
done

