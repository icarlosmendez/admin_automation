#!/bin/bash

set -e

# Configuration Variables
VMID=${VMID:-101}  # Default to VM ID 101 if not set
GPU_PCI_ID="0000:03:00.0"  # Replace with your GPU's PCI ID
REQUIRED_PACKAGES=("linux-firmware" "rocm-dkms" "dkms" "git")

# Function to check and install missing packages
install_packages() {
    echo "Checking for required packages..."
    for package in "${REQUIRED_PACKAGES[@]}"; do
        if ! dpkg -l | grep -q "^ii.*$package"; then
            echo "Installing $package..."
            sudo apt-get install -y "$package"
        else
            echo "$package is already installed."
        fi
    done
}

# Ensure the firmware is updated
install_firmware() {
    echo "Ensuring latest firmware is installed..."
    sudo apt-get update
    sudo apt-get install -y linux-firmware
    sudo update-initramfs -u
    echo "Firmware updated."
}

# Check and load amdgpu kernel module
setup_kernel_module() {
    echo "Checking for amdgpu kernel module..."
    if ! lsmod | grep -q amdgpu; then
        echo "Loading amdgpu module..."
        sudo modprobe amdgpu
    else
        echo "amdgpu module is already loaded."
    fi

    echo "Reconfiguring amdgpu-dkms if necessary..."
    sudo dpkg-reconfigure amdgpu-dkms || true
}

# Verify GPU device nodes
verify_device_nodes() {
    echo "Verifying /dev/kfd and /dev/dri..."
    if [[ -e /dev/kfd && -d /dev/dri ]]; then
        echo "GPU device nodes are present."
    else
        echo "GPU device nodes are missing. Ensure amdgpu is loaded and firmware is correct."
        exit 1
    fi
}

# Optional: Install vendor-reset for GPUs with reset issues
install_vendor_reset() {
    echo "Installing vendor-reset module to handle GPU resets..."
    if [[ ! -d /usr/src/vendor-reset-* ]]; then
        sudo apt-get install -y dkms
        git clone https://github.com/gnif/vendor-reset.git /tmp/vendor-reset
        cd /tmp/vendor-reset
        sudo make dkms-install
        cd -
        rm -rf /tmp/vendor-reset
        echo "vendor-reset installed successfully."
    else
        echo "vendor-reset is already installed."
    fi
}

# Create a hook script for cleanup on VM shutdown
setup_hook_script() {
    VM_HOOK_SCRIPT="/etc/pve/qemu-server/hooks/${VMID}.hook"

    echo "Setting up GPU cleanup hook script at $VM_HOOK_SCRIPT..."
    sudo tee "$VM_HOOK_SCRIPT" > /dev/null <<EOF
#!/bin/bash
case "\$1" in
    pre-start)
        echo "Unbinding GPU from amdgpu and binding to vfio-pci..."
        echo "$GPU_PCI_ID" > /sys/bus/pci/devices/$GPU_PCI_ID/driver/unbind
        echo "vfio-pci" > /sys/bus/pci/devices/$GPU_PCI_ID/driver_override
        modprobe vfio-pci
        ;;
    post-stop)
        echo "Unbinding GPU from vfio-pci and rebinding to amdgpu..."
        echo "$GPU_PCI_ID" > /sys/bus/pci/devices/$GPU_PCI_ID/driver/unbind
        echo "amdgpu" > /sys/bus/pci/devices/$GPU_PCI_ID/driver_override
        modprobe amdgpu
        ;;
    *)
        echo "Unknown hook phase: \$1"
        ;;
esac
EOF
    sudo chmod +x "$VM_HOOK_SCRIPT"
    echo "Hook script created."
}

# Main script execution
main() {
    echo "Starting VM GPU setup script for VMID=$VMID..."
    install_packages
    install_firmware
    setup_kernel_module
    verify_device_nodes
    install_vendor_reset
    setup_hook_script
    echo "VM GPU setup complete. Please restart your VM for changes to take effect."
}

main "$@"
