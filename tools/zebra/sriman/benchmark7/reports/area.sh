#!/bin/bash

# Output file
output_file="./extracted_lines.txt"

# Clear the output file if it exists
> "$output_file"

# Loop through all files matching the pattern *area.rpt in the current directory
for file in *area.rpt; do
    if [ -f "$file" ]; then  # Ensure it's a file
        # Extract line 13 and append it to the output file
        echo " $file : $(sed -n '13p' "$file")" >> "$output_file$1"
    fi
done

echo "Extracted line 13 from all *area.rpt files in the current directory and saved to $output_file"
