#!/bin/zsh

# Always run relative to this script / repository
cd "${0:A:h}"

# Enable Conda in this script and activate RoboStack
eval "$(conda shell.zsh hook)"
conda activate ros_env

# Absolute path to the local ROS 2 workspace setup
##Note (Simon): This conditionally sources the local ROS 2 workspace in addition to the global env on starting new JupyterLab terminals whenever available. This assumes that students created the colcon_ws as outlined in ./installation_documentation/mac.md
WS_SETUP="${PWD}/colcon_ws/install/setup.zsh"

# Start JupyterLab
exec jupyter-lab \
  --ServerApp.terminado_settings="{\"shell_command\":[\"/usr/bin/env\",\"CONDA_AUTO_ACTIVATE_BASE=false\",\"${CONDA_EXE}\",\"run\",\"--no-capture-output\",\"-n\",\"ros_env\",\"--\",\"/bin/zsh\",\"-c\",\"if [[ -f \\\"${WS_SETUP}\\\" ]]; then source \\\"${WS_SETUP}\\\"; fi; exec /bin/zsh -il\"]}"