#!/bin/zsh

# Enable conda activation in this script only
eval "$(conda shell.zsh hook)"
conda activate ros_env

# Replace this script process with JupyterLab
exec jupyter-lab \
  --ServerApp.terminado_settings="{\"shell_command\":[\"/usr/bin/env\",\"CONDA_AUTO_ACTIVATE_BASE=false\",\"${CONDA_EXE}\",\"run\",\"--no-capture-output\",\"-n\",\"ros_env\",\"--\",\"/bin/zsh\",\"-l\"]}"