
#!/bin/bash
benchmarks=()
for i in {1..10}; do
    benchmarks+=("benchmark$i")  
done
sub_dirs=("rtl" "tcl" "output" "reports" "constraint")

for benchmark in "${benchmarks[@]}"; 
 do
  mkdir -p "$benchmark"
  for subdirectorie in "${sub_dirs[@]}"; 
 do
   mkdir -p "$benchmark/$subdirectorie"
  done
done

