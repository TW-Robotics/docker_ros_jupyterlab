This repository contains the code for the FHTW ROS 2 JupyterLab Docker image. It is based on the container image also present on desktop PCs in class.

[Docker](https://www.docker.com/) is a software that allows deployment and development of software in so-called containers. Containers are similar inconcept to a virtual machine, however, they are much more performant due to containers running inside the host OS kernel. Docker containers on Linux are straigt-forward, since you can just install Docker directly. On Windows, you will need to install Windows Subsystem for Linux (WSL) first, since Docker actually runs within that instead of natively in Windows.

---
## Getting Started Linux

### Docker Installation
1. Follow the [Docker Installation for Linux](https://docs.docker.com/engine/install/ubuntu/) guide to install Docker. **Important: Make sure to just install Docker Engine and not the Docker Desktop application (only applies to Linux). We will need some features that are paid in the Docker Desktop application.**
2. Add user to docker group: `sudo groupadd docker` and `sudo usermod -aG docker $USER`. After a reboot, you should be able to run the Docker hello world example by typing `docker run hello-world` in a terminal.

3. Optional: Nvidia Container Toolkit for GPU acceleration on Nvidia Graphics Cards: See [Nvidia Container Toolkit Installation](install_documentation/nvidia_container_toolkit.md)

### Running the Docker Container
4. Clone this repository: `git clone https://github.com/fhtw-robotics/ros2_jupyterlab_docker.git`. The `src` folder in this repository serves as the workspace and holds ROS 2 packages and jupyter notebooks.
5. Run the Docker container: `bash run_local.sh`
6. Open the JupyterLab interface in your browser by clicking on the link in the terminal starting with `http://localhost:8888/lab?token=...`

---
## Getting Started Windows

### Docker Installation
1. Follow the [Docker Installation for Windows](https://docs.docker.com/desktop/install/windows-install/) guide to install Docker. **Important: Make sure to follow the **WSL 2 Backend** portion of the tutorial.**

### Running the Docker Container

2. Clone this repository: `git clone https://github.com/fhtw-robotics/ros2_jupyterlab_docker.git` or download the repository as a zip file (green button on the upper right corner of the repository page) and extract it. The `src` folder in this repository serves as the workspace and holds ROS 2 packages and jupyter notebooks.
3. Double click on `run_local.bat` to run the Docker container.
4. Open the JupyterLab interface in your browser by clicking on the link in the terminal starting with `http://localhost:8888/lab?token=...`
