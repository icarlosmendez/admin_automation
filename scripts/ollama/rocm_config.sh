# !bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ROCm_config.sh>
# * Description       : <Setup ROCm for Local LLMs/AI>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by amd>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Install AMD ROCm Software Stack to allow Machine Learning
#          and AI workloads to be run on the GPU.

# Prerequisites:
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/rocm_config.sh

# chmod +x rocm_config.sh

# sudo touch /var/log/rocm_install_checkpoint
# sudo chown $USER:$USER /var/log/rocm_install_checkpoint

# Log Files: 
# In the event that there are issues with the execution,
# check the following log file for clues.
# /var/lib/dkms/amdgpu/[version]/build/make.log

# Define a checkpoint file
CHECKPOINT_FILE="/var/log/rocm_install_checkpoint"

# Check if a checkpoint exists
if [ -f $CHECKPOINT_FILE ]; then
    source $CHECKPOINT_FILE
else
    PHASE=1
fi

# Function to save the checkpoint
save_checkpoint() {
    echo "PHASE=$PHASE" > $CHECKPOINT_FILE
}

# Ensure PHASE is an integer
if [ -n "$PHASE" ]; then
    PHASE=$(($PHASE + 0))
else
    PHASE=1
fi

# Phase 1: Initial Setup and Key Download
if [ "$PHASE" -eq 1 ]; then
    echo "Phase 1: Initial Setup and Key Download"
    # Registering repositories
    # Download and convert the package signing key.

    # Make the directory if it doesn't exist yet.
    # This location is recommended by the distribution maintainers.
    sudo mkdir --parents --mode=0755 /etc/apt/keyrings

    # Download the key, convert the signing-key to a full
    # keyring required by apt and store in the keyring directory
    wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | \
        gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null

    /*
    The GPG key may change; ensure it is updated when installing a new release. 

    If the key signature verification fails while updating, re-add the key from the ROCm to the apt repository as mentioned above. 

    The current rocm.gpg.key is not available in a standard key ring distribution but has the following SHA1 sum hash: 73f5d8100de6048aa38a8b84cd9a87f05177d208 rocm.gpg.key
    */

    # Register kernel-mode driver
    # Add the AMDGPU repository for the driver.
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/amdgpu/6.1.1/ubuntu jammy main" \
        | sudo tee /etc/apt/sources.list.d/amdgpu.list
    sudo apt update

    # Register ROCm packages
    # Add the ROCm repository.
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/6.1.1 jammy main" \
        | sudo tee --append /etc/apt/sources.list.d/rocm.list

    echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' \
        | sudo tee /etc/apt/preferences.d/rocm-pin-600
    sudo apt update

    PHASE=2
    save_checkpoint
fi

# Phase 2: Install Kernel Headers and AMD GPU Drivers
if [ "$PHASE" -eq 2 ]; then
    echo "Phase 2: Install Kernel Headers and AMD GPU Drivers"

    # Install AMD ROCm for linux (Ubuntu 22.04)
    sudo apt install -y "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
    sudo usermod -a -G render,video $LOGNAME # Adding current user to Video, Render groups. See prerequisites.
    wget https://repo.radeon.com/amdgpu-install/6.1.1/ubuntu/jammy/amdgpu-install_6.1.60101-1_all.deb
    sudo apt install -y ./amdgpu-install_6.1.60101-1_all.deb
    sudo apt update

    PHASE=3
    save_checkpoint
fi

# Phase 3: Install AMD GPU DKMS and Reboot
if [ "$PHASE" -eq 3 ]; then
    echo "Phase 3: Install AMD GPU DKMS and Reboot"

    # Install kernel driver
    sudo apt install -y amdgpu-dkms
    PHASE=4
    save_checkpoint

    echo "Please reboot the system to apply the changes."
    read -p "Press any key to reboot..." -n 1 -r
    sudo reboot

    exit 0
fi

# Phase 4: Install ROCm Packages and Reboot
if [ "$PHASE" -eq 4 ]; then
    echo "Phase 4: Install ROCm Packages and Reboot"

    # Install ROCm packages
    sudo apt install -y rocm
    PHASE=5
    save_checkpoint
    
    echo "Please reboot system for all settings to take effect."
    read -p "Press any key to reboot..." -n 1 -r
    sudo reboot

    exit 0
fi

# Phase 5: Post-Installation Configuration
if [ "$PHASE" -eq 5 ]; then
    echo "Phase 5: Post-Installation Configuration"

    # Post-installation instructions
    # Applies to Linux
    # 2024-03-25
    # https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/native-install/post-install.html

    # Configure the system linker.

    # Instruct the system linker where to find shared objects (.so files) for ROCm applications.
    sudo tee --append /etc/ld.so.conf.d/rocm.conf <<EOF
/opt/rocm/lib
/opt/rocm/lib64
EOF

    sudo ldconfig

    # Configure PATH.
    # Add binary paths to the PATH environment variable.
    export PATH=$PATH:/opt/rocm-6.1.1/bin

    # Verify kernel-mode driver installation.
    dkms status

    # Verify ROCm installation.
    # Not sure if the intention is to cat or ls these to ensure they exist?
    /opt/rocm-6.1.1/bin/rocminfo
    /opt/rocm-6.1.1/bin/clinfo

    /opt/rocm/bin/rocminfo
    /opt/rocm/opencl/bin/clinfo

    # Ensure that the necessary kernel drivers are loaded
    if ! lsmod | grep -q amdgpu; then
        sudo modprobe amdgpu
    fi

    # Confirm that your GPU is properly seated in the PCIe slot and is recognized by the system
    lspci | grep VGA

    # Making sure that the appropriate drivers and ROCm components are loaded within the VM.
    # kfd = Kernel Fusion Driver
    dmesg | grep kfd 
    lsmod | grep amdgpu

    echo "ROCm installation and configuration complete."
fi