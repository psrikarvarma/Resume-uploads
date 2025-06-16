import re
from collections import defaultdict

def count_cell_types_in_file(file_path):
    cell_counts = defaultdict(int)
    current_module = None
    
    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            
            module_match = re.match(r'^\s*module\s+(\w+)\s*', line)
            if module_match:
                current_module = module_match.group(1)
                continue
            
            if re.match(r'^\s*endmodule', line):
                current_module = None
                continue
            
            if current_module:
                cell_match = re.match(r"^\s*(\w+)\s+\\?[\w\[\]\d]+(?:\([\w\d,\s]+\))?\s*\(", line)
                if cell_match:
                    cell_type = cell_match.group(1)
                    cell_counts[cell_type] += 1
    
    return cell_counts

file_path = "zebra/sriman/benchmark10/output/UART_TX_100MHtz_fast.v"

total_cells = 0
for cell_type, count in sorted(count_cell_types_in_file(file_path).items()):
    print(f"  {cell_type},{count}")
    total_cells += count

