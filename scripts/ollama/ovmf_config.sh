#!/bin/bash


# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ovmf_config.sh>
# * Description       : <Setup OVMF and disable secure boot>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by amd>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Install OVMF on Proxmox host
#          Modify the vm conf to disable secure boot
#          Restart the vm to apply the new config

# Prerequisites:
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ovmf_config.sh

# chmod +x ovmf_config.sh

# ##################################################### #
# The Script

# Define variables
VMID=101
EFI_DIR="/usr/share/ovmf"
EFI_CODE="$EFI_DIR/OVMF.fd"
EFI_VARS="$EFI_DIR/OVMF_VARS.fd"
VM_CONF="/etc/pve/qemu-server/$VMID.conf"

# Function to check if a command was successful
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error occurred in the previous command."
        echo "Please check the error message above and address the issue."
        echo "Press any key to retry, or Ctrl+C to exit."
        read -n 1
        return 1
    fi
    return 0
}

# Ensure the OVMF package is installed
echo "Installing OVMF package..."
while ! sudo apt-get update && sudo apt-get install -y ovmf; do
    check_success || continue
done

# Verify the OVMF files exist
if [ ! -f "$EFI_CODE" ]; then
    echo "OVMF.fd file not found. Ensure OVMF is installed correctly."
    exit 1
fi

# Create a copy of OVMF.fd for variables if it does not exist
if [ ! -f "$EFI_VARS" ]; then
    echo "Creating OVMF_VARS.fd..."
    while ! sudo cp "$EFI_CODE" "$EFI_VARS"; do
        check_success || continue
    done
fi

# Backup the existing VM configuration file
echo "Backing up the existing VM configuration..."
while ! sudo cp "$VM_CONF" "$VM_CONF.bak"; do
    check_success || continue
done

# Update the VM configuration file
echo "Updating VM configuration..."
sudo bash -c "cat > $VM_CONF" <<EOF
args: -drive if=pflash,format=raw,readonly=on,file=$EFI_CODE -drive if=pflash,format=raw,file=$EFI_VARS
EOF
check_success

# Restart the VM
echo "Restarting VM $VMID..."
while ! qm start $VMID; do
    check_success || continue
done

echo "VM $VMID has been successfully configured and restarted."
echo "You can now proceed with the ROCm installation."

# Verify Secure Boot status (run this command inside the VM)
echo "Please verify Secure Boot status inside the VM with the following command:"
echo "mokutil --sb-state"