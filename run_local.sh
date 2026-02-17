#docker pull ghcr.io/tw-robotics/internal_ros_images:ros2_jazzy_opensource

xhost +local:docker

DOCKER_ARGS=()
DOCKER_ARGS+=("-e DISPLAY=$DISPLAY")
DOCKER_ARGS+=("-v /tmp/.X11-unix:/tmp/.X11-unix")
DOCKER_ARGS+=("--device=/dev/dri:/dev/dri")
DOCKER_ARGS+=("-v $PWD/src:/opt/ros2_ws/src")
DOCKER_ARGS+=("--net host -v /dev:/dev --ipc=host -v /dev/shm:/dev/shm")

docker run -it --rm --name fhtw_ros ${DOCKER_ARGS[@]} \
    ghcr.io/tw-robotics/internal_ros_images:ros2_jazzy_opensource \
    /bin/bash -c "source ~/myenv/bin/activate && cd /opt/ros2_ws/ && jupyter-lab --ip 0.0.0.0 --no-browser --allow-root"
