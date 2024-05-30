#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ovmf_config.sh>
# * Description       : <Setup OVMF and disable secure boot>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Inspired by amd>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Install OVMF on Proxmox host
#          Modify the VM config to disable secure boot
#          Restart the VM to apply the new config

# Prerequisites:
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ovmf_config.sh

# chmod +x ovmf_config.sh

# ##################################################### #
# The Script

# Define variables
# Prompt the user for the VMID
read -p "Please enter the VMID: " VMID

# Define the destination directory for OVMF.fd
DEST_DIR="/usr/share/ovmf"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Find the 101-ovmf.fd file and move it to the permanent directory
EFI_CODE=$(find / -name "101-ovmf.fd" 2>/dev/null | head -n 1)
if [ -z "$EFI_CODE" ]; then
    echo "101-ovmf.fd file not found. Ensure OVMF is installed correctly."
    exit 1
fi

# Move the 101-ovmf.fd file to the permanent directory
mv "$EFI_CODE" "$DEST_DIR"

# Set the EFI_DIR variable
EFI_DIR="$DEST_DIR"
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
while ! apt-get update && apt-get install -y ovmf; do
    check_success || continue
done

# Verify the OVMF file exists
if [ ! -f "$EFI_CODE" ]; then
    echo "101-ovmf.fd file not found. Ensure OVMF is installed correctly."
    exit 1
fi

# Backup the existing VM configuration file
echo "Backing up the existing VM configuration..."
while ! cp "$VM_CONF" "$VM_CONF.bak"; do
    check_success || continue
done

# Update the VM configuration file
echo "Updating VM configuration..."
bash -c "cat > $VM_CONF" <<EOF
args: -drive if=pflash,format=raw,readonly=on,file=$EFI_CODE
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

