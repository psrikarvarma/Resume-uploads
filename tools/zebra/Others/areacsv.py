import pandas as pd
import re

# Path to the input file
file_path = 'areanew.txt' # Replace with your file path

# Initialize lists to hold the extracted data
benchmark_names = []
frequencies = []
speed_types = []
areas = []

# Process the file line by line
with open(file_path, 'r') as file:
    for line in file:
        # Extract the benchmark name
        match_benchmark = re.search(r'(\w+)', line)
        benchmark = match_benchmark.group(1) if match_benchmark else None

        # Extract the frequency (100, 400, 500, etc.)
        match_frequency = re.search(r'(\d+MHtz)', line)
        frequency = match_frequency.group(1).replace("MHtz", "") if match_frequency else None

        # Extract the speed type (_slow_, _slow_lvt_, _slow_hvt_, _fast_, _fast_lvt_, _fast_hvt_)
        match_speed = re.search(r'(_slow_|_slow_lvt_|_slow_hvt_|_fast_|_fast_lvt_|_fast_hvt_)', line)
        speed = match_speed.group(1) if match_speed else None

        # Extract the area (content before "<none> (D)")
        match_area = re.search(r'(\d+\.\d+)\s+<none>', line)
        area = match_area.group(1) if match_area else None

        # Append extracted data to respective lists if all elements are found
        if benchmark and frequency and speed and area:
            benchmark_names.append(benchmark)
            frequencies.append(frequency)
            speed_types.append(speed)
            areas.append(area)

# Create a DataFrame from the extracted data
data = {
    'Benchmark': benchmark_names,
    'Frequency': frequencies,
    'Speed_Type': speed_types,
    'Area': areas
}
df = pd.DataFrame(data)

# Save the DataFrame to a CSV file
output_csv_path = 'extracted_data.csv' # Replace with your desired output path
df.to_csv(output_csv_path, index=False)

print(f"Data has been extracted and saved to {output_csv_path}")
