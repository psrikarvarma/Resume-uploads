#!/bin/bash

output_file="combined_output.txt"

> "$output_file"

for file in $(find . -type f -name 'extracted_lines.txt[0-9]*')
do
    cat "$file" >> "$output_file"
done

mv "$output_file" ./combined_output.txt

echo "Files combined successfully into combined_output.txt"
	

