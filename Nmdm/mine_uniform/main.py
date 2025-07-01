import numpy as np
import matplotlib.pyplot as plt

# Load data from text files
n_values = np.loadtxt('n.txt')
p_values = np.loadtxt('p.txt')
v_values = np.loadtxt('v.txt')

# Calculate start and end indices for 1/5 to 4/5 range
def get_subset_indices(data):
    total_len = len(data)
    start_idx = int(total_len*0)
    end_idx = int(total_len)
    return start_idx, end_idx

# Select subset of values
n_start, n_end = get_subset_indices(n_values)
p_start, p_end = get_subset_indices(p_values)
v_start, v_end = get_subset_indices(v_values)

n_subset = n_values[n_start:n_end]
p_subset = p_values[p_start:p_end]
v_subset = v_values[v_start:v_end]

# Generate x values for the subset
common_x = np.linspace(0, len(n_subset)-1, len(n_subset))

# Plot n vs x
plt.figure(figsize=(10, 6))
plt.plot(common_x, n_subset, label='n values', color='blue')
plt.xlabel('x')
plt.ylabel('n(x)')
plt.title('n profile')
plt.legend()
plt.grid(True)
plt.savefig('nplot.png')
plt.show()

# Plot p vs x
plt.figure(figsize=(10, 6))
plt.plot(common_x, p_subset, label='p values', color='red')
plt.xlabel('x')
plt.ylabel('p(x)')
plt.title('p profile')
plt.legend()
plt.grid(True)
plt.savefig('pplot.png')
plt.show()

# Plot v vs x
plt.figure(figsize=(10, 6))
plt.plot(common_x, v_subset, label='v values', color='violet')
plt.xlabel('x')
plt.ylabel('v(x)')
plt.title('v profile')
plt.legend()
plt.grid(True)
plt.savefig('vplot.png')
plt.show()

# Plot n and p vs common x
plt.figure(figsize=(10, 6))
plt.plot(common_x, n_subset, label='n values', color='blue')
plt.plot(common_x, p_subset, label='p values', color='red')
plt.xlabel('x')
plt.ylabel('n(x) and p(x)')
plt.title('n and p profiles')
plt.legend()
plt.grid(True)
plt.savefig('npplot.png')
plt.show()
