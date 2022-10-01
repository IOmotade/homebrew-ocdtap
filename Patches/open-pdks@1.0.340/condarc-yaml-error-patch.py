import sys

buildpath = sys.argv[1]
filepath = f"{buildpath}/sources/skywater-pdk/third_party/make-env/conda.mk"

with open(filepath, 'r') as file:
  contents = file.readlines()
  
contents[120] = "$(CONDA_SETUP_PATCH): $(RM) $(CONDA_DIR)/.condarc"
contents[144] = "$(CONDA_ENV_PYTHON): $(ENVIRONMENT_FILE) $(REQUIREMENTS_FILE) | $(CONDA_PYTHON) $(CONDA_SETUP_PATCH) $(CONDA_PKGS_DEP) $(CONDA_ENVS_DIR) $(CONDA_PYVENV)"

with open(filepath, 'w') as file:
  file.write("".join(contents))
