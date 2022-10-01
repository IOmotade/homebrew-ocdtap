import sys

# Get file's absolute path
buildpath = sys.argv[1]
filepath = f"{buildpath}/sources/skywater-pdk/third_party/make-env/conda.mk"

# Read file
with open(filepath, 'r') as file:
  contents = file.readlines()
  
# Edit contents
lineIdx = 145-1
contents[lineIdx] = f"\t$(RM) $(CONDA_DIR)/.condarc\n{contents[lineIdx]}"

# Write file
with open(filepath, 'w') as file:
  file.write("".join(contents))
