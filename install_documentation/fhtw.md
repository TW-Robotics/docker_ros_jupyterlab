## How to run the Docker container on the FHTW internal PCs

1. Log into Win11 using your FHTW/CIS credentials

2. Open PowerShell and run the following command to set the Execution Policy:
    ```powershell
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass; & "C:\Users\Public\Desktop\ROS\WSL_init.ps1"
    ```

3. Open WSL from the Start Menu. You should be in a Linux terminal inside WSL now.

4. Change to root user in Linux using the following command. Please consult the lecturer regarding the correct password.
    ```bash
    sudo -i
    ```

5. Clone this repository (if not already present) using the following command:
    ```bash
    git clone https://github.com/TW-Robotics/docker_ros_jupyterlab.git
    ```
    It may make sense to just store the whole repository on a USB drive and copy it between WSL in file explorere and an external USB drive.

6. Run `bash fhtw.sh` in this repository to start the Docker container. Similarly to the local setup, only the `src` folder is mounted. Therefore, you will need to manually save your work in either a git repository or on a USB drive.

    **Important: When you reboot the internal PCs, they will be wiped. Therefore, you may loose all of your work. Make sure to save your work to an external drive or a git repository.**