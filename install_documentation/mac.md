# Installing and Running ROS 2 on Mac OS

Due to inconsistent GUI handling of Linux containers on recent Mac OS versions, we recommend not using Docker on Mac OS.

**Docker Desktop for Mac will not be able to run the ROS 2 GUI applications required for this course. It will not work, no matter what is tweaked or what any LLM says.**

Instead, we recommend to install ROS 2, JupyterLab, and other Python dependencies using [Miniconda](https://docs.anaconda.com/miniconda/install/) directly on your Mac. ROS 2 can then be installed in a virtual environment using the [RoboStack distribution of ROS](https://robostack.github.io/index.html).

### Installation

1. Follow the official Mac OS [installation guide of Miniconda (Link)](https://www.anaconda.com/docs/getting-started/miniconda/install/mac-cli-install).

2. Run the following commands in a terminal to setup a Miniconda environment for ROS 2, and install the required Python packages.

```bash
## RoboStack docs: https://robostack.github.io/conda.html (we use conda instead of the default pixi)
# Create an environment and install ros-desktop
conda create -n ros_env -c conda-forge -c robostack-jazzy ros-jazzy-desktop
# Activate the environment
conda activate ros_env
# Add the roboStack channel to the environment
conda config --env --add channels robostack-jazzy

## Install compiled packages on conda-forge
conda install -c conda-forge \
  scipy scikit-learn matplotlib jupyterlab \
  pillow tqdm ros-dev-tools
```

### Running JupyterLab

3. Clone this repository: `git clone https://github.com/TW-Robotics/docker_ros_jupyterlab` or download the repository as a zip file (green button on the upper right corner of the repository page) and extract it. This folder will serve as the development folder for the rest of the semester. It will contain the workspace, ROS 2 development files, and jupyter notebooks.

4. Open a new terminal and navigate into the downloaded folder. Activate the conda environment and the jupyterlab interface using the convenience script: `zsh run_mac.sh`. The jupyterlab interface should open up automatically.

### Creating the ROS 2 Workspace Folder Structure

5. Since we can't use the prebuilt Docker image on Mac, Mac users need to manually create their ROS 2 workspace folders.
Start by running JupyterLab as outlined in the previous section.

```bash
## Run within the downloaded workspace folder
zsh run_mac.sh
```

6. Then open a new terminal *within JupyterLab* by clicking on the "+"-icon on the upper right of your open tabs. Within that terminal, run the following commands to setup a local ROS 2 workspace.

```bash
# Run within the downloaded repository folder
rm src/.keep
rmdir src
mkdir -p colcon_ws/src

cd colcon_ws
colcon build --symlink-install
cd ..
```

**Due to the different workspace setup on Mac, your source folder will be at `docker_ros_jupyterlab/colcon_ws/src` instead of at `docker_ros_jupyterlab/src` like for Linux and Windows users. So put all your ROS 2 packages in there.**