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
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ollama_update_base.sh

# chmod +x ollama_update_base.sh

# Variables
VMID=101
NEW_NAME="ollama"
NEW_CORES=4
NEW_MEMORY=16384
NEW_DISK_SIZE=84172M
NEW_IP="192.168.1.101/24"
NEW_GW="192.168.1.1"
HOSTPCI="0000:03:00.0"
EFIDISK_SIZE="4M"
EFIDISK_TYPE="4m"
BIOS_TYPE="ovmf"
MACHINE_TYPE="q35"
UUID="747716ca-8b7c-40bb-a815-d26eea1df803"
NET0_MAC="BC:24:11:63:24:12"
EFIDISK="local-lvm:vm-$VMID-disk-1"

# Check if EFI disk exists, create if it doesn't
if ! lvdisplay pve/vm-${VMID}-disk-1 > /dev/null 2>&1; then
  echo "EFI disk does not exist, creating..."
  qm set $VMID --efidisk0 $EFIDISK,efitype=$EFIDISK_TYPE,size=$EFIDISK_SIZE
else
  echo "EFI disk already exists."
fi

# Update VM configuration
qm set $VMID --name $NEW_NAME
qm set $VMID --cores $NEW_CORES
qm set $VMID --memory $NEW_MEMORY
qm resize $VMID scsi0 $NEW_DISK_SIZE
qm set $VMID --hostpci0 $HOSTPCI
qm set $VMID --ipconfig0 ip=$NEW_IP,gw=$NEW_GW
qm set $VMID --net0 virtio=$NET0_MAC,bridge=vmbr0
qm set $VMID --smbios1 uuid=$UUID
qm set $VMID --bios $BIOS_TYPE
qm set $VMID --machine $MACHINE_TYPE

# Restart the VM to apply changes
qm stop $VMID
qm start $VMID

echo "VM $VMID has been updated and restarted with the new configuration."
