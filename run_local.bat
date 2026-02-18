@echo off
setlocal EnableDelayedExpansion
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + ROS 2 JupyterLab - Docker (run_local.bat)                            +
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + Display: Using WSLg (built-in on Windows 11 / W10 19044+ with WSL2). +
echo +          No xLaunch/VcXsrv needed. Run "wsl --update" if GUI fails.  +
echo + Legacy:  Set USE_XLAUNCH=1 to use external X server (e.g. xLaunch).  +
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

set SRC_PATH=%CD%\src
echo + Path to workspace src: %SRC_PATH%
echo + JupyterLab will be available at http://localhost:8888

REM --- Display setup: WSLg (default) vs xLaunch (legacy) ---
if "%USE_XLAUNCH%"=="1" goto display_xlaunch

REM WSLg (default)
echo + Using WSLg (built-in X server). DISPLAY=:0
set "DISPLAY_ARGS=-e DISPLAY=:0"
set "MOUNT_X11=-v /run/desktop/mnt/host/wslg/.X11-unix:/tmp/.X11-unix"
goto display_done

:display_xlaunch
echo + Using legacy X server (xLaunch). DISPLAY from this machine's IP.
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
set "DISPLAY=!NetworkIP!:0.0"
echo + DISPLAY=!DISPLAY!
set "DISPLAY_ARGS=-e DISPLAY=!DISPLAY!"
set "MOUNT_X11="

:display_done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM Optional: pull latest image (uncomment to use)
REM docker pull ghcr.io/tw-robotics/internal_ros_images:ros2_jazzy_opensource

docker run -it --rm --name fhtw_ros ^
    %DISPLAY_ARGS% %MOUNT_X11% ^
    -v "%SRC_PATH%":/opt/ros2_ws/src ^
    -p 8888:8888 ^
    ghcr.io/tw-robotics/internal_ros_images:ros2_jazzy_opensource ^
    /bin/bash -c "source ~/myenv/bin/activate && cd /opt/ros2_ws/ && jupyter-lab --ip 0.0.0.0 --no-browser --allow-root"

cmd /k
