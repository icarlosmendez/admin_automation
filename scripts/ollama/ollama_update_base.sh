#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ollama_update_base.sh>
# * Description       : <Setup base vm for production>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 11/09/2024	<iCarlosMendez>	<Insprired by automation>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Bring the fresh clone up to proper config standards

# Prerequisites:
# * Download the update script to the proxmox host (That's this script!)
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ollama_update_base.sh

# * Make the script executable (Yes, you need to be able to run this script!)
# chmod +x ollama_update_base.sh

# * Run the script (This Script!)
# bash ollama_update_base.sh

# ##################################################### #
# Logging setup
LOG_FILE="/var/log/ollama_vm_build.log"
exec > >(tee -a $LOG_FILE) 2>&1

# ##################################################### #
# Variables
VMID=101
NEW_NAME="ollama"
NEW_CPU="host"
NEW_CORES=4
NEW_MEMORY=16384
NEW_DISK_SIZE=81920M
NEW_IP="10.10.10.21/24"
NEW_GW="10.10.10.10"
HOSTPCI="0000:03:00.0"
EFIDISK_SIZE="4M"
EFIDISK_TYPE="4m"
BIOS_TYPE="ovmf"
MACHINE_TYPE="pc,viommu=virtio"
UUID="747716ca-8b7c-40bb-a815-d26eea1df803"
NET0_MAC="BC:24:11:63:24:12"
STORAGE="local-lvm"
EFIDISK="local-lvm:vm-$VMID-disk-1"
BALLOON=2048
OSTYPE="l26"  # Linux 6.x - 2.6 Kernel

# Create the vm via clone 
qm clone 5000 $VMID --full --name $NEW_NAME --storage $STORAGE || {
  echo "Failed to clone the template VM" | tee -a $LOG_FILE; exit 1;
}

# Create EFI disk if missing
if ! lvdisplay pve/vm-${VMID}-disk-1 > /dev/null 2>&1; then
  echo "Creating EFI disk..."
  lvcreate -L $EFIDISK_SIZE -n vm-$VMID-disk-1 pve || {
    echo "Failed to create EFI disk" | tee -a $LOG_FILE; exit 1;
  }
  qm set $VMID --efidisk0 $EFIDISK,efitype=$EFIDISK_TYPE,size=$EFIDISK_SIZE,pre-enrolled-keys=0 || {
    echo "Failed to assign EFI disk with Secure Boot disabled" | tee -a $LOG_FILE; exit 1;
  }
else
  echo "EFI disk already exists."
fi

# # Function to create the Logical Volume (LV) for the EFI disk
# create_efi_disk() {
#   echo "Creating EFI disk logical volume..."
#   lvcreate -L $EFIDISK_SIZE -n vm-$VMID-disk-1 pve 2>&1 | tee -a /var/log/efi_disk_creation.log
#   if [ $? -eq 0 ]; then
#     echo "EFI disk logical volume created successfully."
#   else
#     echo "Failed to create EFI disk logical volume. Check /var/log/efi_disk_creation.log for details."
#     exit 1
#   fi
# }

# # Check if EFI disk exists on the LV, create if it doesn't
# if ! lvdisplay pve/vm-${VMID}-disk-1 > /dev/null 2>&1; then
#   create_efi_disk
#   echo "Assigning EFI disk to VM..."
#   qm set $VMID --efidisk0 $EFIDISK,efitype=$EFIDISK_TYPE,size=$EFIDISK_SIZE 2>&1 | tee -a /var/log/efi_disk_assignment.log
#   if [ $? -eq 0 ]; then
#     echo "EFI disk assigned successfully."
#   else
#     echo "Failed to assign EFI disk. Check /var/log/efi_disk_assignment.log for details."
#     exit 1
#   fi
# else
#   echo "EFI disk already exists."
# fi

# Update VM configuration
qm set $VMID --name $NEW_NAME --cpu $NEW_CPU --cores $NEW_CORES --memory $NEW_MEMORY \
             --balloon $BALLOON --hostpci0 $HOSTPCI --ipconfig0 ip=$NEW_IP,gw=$NEW_GW \
             --net0 virtio=$NET0_MAC,bridge=vmbr0 --smbios1 uuid=$UUID --bios $BIOS_TYPE \
             --machine $MACHINE_TYPE --numa 0 --scsihw virtio-scsi-pci --serial0 socket || {
    echo "Failed to configure VM settings" | tee -a $LOG_FILE; exit 1;
}

# Resize primary disk
qm resize $VMID scsi0 $NEW_DISK_SIZE

# Set boot options
qm set $VMID --boot order=scsi0 || { echo "Failed to set boot order" | tee -a $LOG_FILE; exit 1; }
qm set $VMID --boot c --bootdisk scsi0 || { echo "Failed to set bootdisk" | tee -a $LOG_FILE; exit 1; }

# Set OS Type
qm set $VMID --ostype $OSTYPE || { echo "Failed to set OS type" | tee -a $LOG_FILE; exit 1; }

# Stop and Start the VM
qm stop $VMID || { echo "Failed to stop VM" | tee -a $LOG_FILE; exit 1; }
qm start $VMID || { echo "Failed to start VM" | tee -a $LOG_FILE; exit 1; }

# Wait for VM to boot (optional but super cool!)
# Wait for VM to respond to ping
echo "Waiting for VM to become reachable..."
MAX_RETRIES=30
RETRY_DELAY=2
for i in $(seq 1 $MAX_RETRIES); do
    if ping -c 1 -W 1 ${NEW_IP%%/*} > /dev/null 2>&1; then
        echo "VM is reachable!"
        break
    fi
    echo "Ping attempt $i/$MAX_RETRIES failed. Retrying in $RETRY_DELAY seconds..."
    sleep $RETRY_DELAY
done

if ! ping -c 1 -W 1 ${NEW_IP%%/*} > /dev/null 2>&1; then
    echo "VM did not become reachable within the expected time. Exiting." | tee -a $LOG_FILE
    exit 1
fi

# Run apt update/upgrade inside the VM
echo "Running apt update and upgrade inside the VM..."
# ssh -o StrictHostKeyChecking=no -i /path/to/ssh-key ubuntu@${NEW_IP%%/*} \
    # "sudo apt update && sudo apt upgrade -y" || {
ssh ubuntu@${NEW_IP%%/*} "sudo apt update && sudo apt upgrade -y" || {
    echo "Failed to update/upgrade the VM OS" | tee -a $LOG_FILE; exit 1;
}

echo "VM $VMID has been updated and restarted with the new configuration."