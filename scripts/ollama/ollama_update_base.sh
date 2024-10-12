#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ollama_update_base.sh>
# * Description       : <Setup base vm for production>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by automation>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Bring the fresh clone up to proper config standards

# Prerequisites:
# * Download the update script to the proxmox host
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ollama_update_base.sh

# * Make the script executable
# chmod +x ollama_update_base.sh

# * Run the script
# bash ollama_update_base.sh

# Variables
VMID=101
NEW_NAME="ollama"
NEW_CPU="host"
NEW_CORES=4
NEW_MEMORY=16384
NEW_DISK_SIZE=84172M
NEW_IP="192.168.1.101/24"
NEW_GW="192.168.1.1"
HOSTPCI="0000:03:00.0"
# EFIDISK_SIZE="4M"
# EFIDISK_TYPE="4m"
# BIOS_TYPE="ovmf"
MACHINE_TYPE="q35, viommu=intel"
UUID="747716ca-8b7c-40bb-a815-d26eea1df803"
NET0_MAC="BC:24:11:63:24:12"
STORAGE="local-lvm"
EFIDISK="local-lvm:vm-$VMID-disk-1"
BALLOON=2048

# Create the vm via clone 
qm clone 5000 $VMID --full --name $NEW_NAME --storage $STORAGE

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
qm set $VMID --name $NEW_NAME
qm set $VMID --cpu $NEW_CPU
qm set $VMID --cores $NEW_CORES
qm set $VMID --memory $NEW_MEMORY
qm set $VMID --balloon $BALLOON
qm resize $VMID scsi0 $NEW_DISK_SIZE
qm set $VMID --hostpci0 $HOSTPCI
qm set $VMID --ipconfig0 ip=$NEW_IP,gw=$NEW_GW
qm set $VMID --net0 virtio=$NET0_MAC,bridge=vmbr0
qm set $VMID --smbios1 uuid=$UUID
# qm set $VMID --bios $BIOS_TYPE
qm set $VMID --machine $MACHINE_TYPE
qm set $VMID --numa 0
qm set $VMID --scsihw virtio-scsi-pci
qm set $VMID --serial0 socket

# Ensure boot settings are correct
qm set $VMID --boot order=scsi0
qm set $VMID --boot c --bootdisk scsi0

# Stop the VM after config
qm stop $VMID

# Restart the VM to apply changes
# qm start $VMID

echo "VM $VMID has been updated and restarted with the new configuration."
