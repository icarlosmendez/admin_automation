#!/bin/bash

# Download the script to your Proxmox host
wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/refs/heads/master/scripts/proxmox/vm_build.sh

# Logging setup
LOG_FILE="/var/log/ollama_vm_build.log"
exec > >(tee -a $LOG_FILE) 2>&1

# ##################################################### #
# Variables
VM_ID="101"
VM_NAME="ollama"
VM_RAM="16384"
VM_CORES="4"
VM_DISK_SIZE="80G"
HOSTPCI="0000:03:00.0"
EFI_DISK_SIZE="4M"
BIOS_TYPE="ovmf"
MACHINE_TYPE="pc,viommu=virtio"
OSTYPE="l26"
SSH_KEY_PATH="/root/.ssh/id_rsa.pub"
USER="ubuntu"
PASSWORD="ubuntu"
DIST_URL="https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
DIST_NAME=$(basename $DIST_URL)
STORAGE="local-lvm"
NET_MAC="BC:24:11:63:24:12"

# ##################################################### #
# Functions
check_and_download_image() {
    if [ ! -f "/var/lib/vz/template/iso/$DIST_NAME" ]; then
        echo "Downloading OS image..."
        curl -o "/var/lib/vz/template/iso/$DIST_NAME" $DIST_URL
    else
        echo "OS image already exists."
    fi
}

# ##################################################### #
# The Script
clear
echo "Starting VM creation process..."

# Download OS image if necessary
check_and_download_image

# Create the VM
qm create $VM_ID --memory $VM_RAM --cores $VM_CORES --name $VM_NAME --net0 virtio=$NET_MAC,bridge=vmbr0 || {
    echo "Failed to create VM" | tee -a $LOG_FILE; exit 1;
}

# Import and attach the disk image
qm importdisk $VM_ID "/var/lib/vz/template/iso/$DIST_NAME" $STORAGE || {
    echo "Failed to import OS disk" | tee -a $LOG_FILE; exit 1;
}
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:vm-$VM_ID-disk-0 || {
    echo "Failed to attach OS disk" | tee -a $LOG_FILE; exit 1;
}

# Create and attach EFI disk
lvcreate -L $EFI_DISK_SIZE -n vm-$VM_ID-disk-1 pve || {
    echo "Failed to create EFI disk" | tee -a $LOG_FILE; exit 1;
}
qm set $VM_ID --efidisk0 $STORAGE:vm-$VM_ID-disk-1,efitype=4m,size=$EFI_DISK_SIZE || {
    echo "Failed to attach EFI disk" | tee -a $LOG_FILE; exit 1;
}

# Configure VM settings
qm set $VM_ID --bios $BIOS_TYPE --machine $MACHINE_TYPE --cpu host --ostype $OSTYPE || {
    echo "Failed to set VM type and BIOS" | tee -a $LOG_FILE; exit 1;
}
qm set $VM_ID --vga virtio || { 
    echo "Failed to set VGA display adapter" | tee -a $LOG_FILE; exit 1; 
}
qm set $VM_ID --ipconfig0 ip=dhcp || {
    echo "Failed to set IP configuration" | tee -a $LOG_FILE; exit 1;
}
# Generate Cloud-Init configuration
qm set $VM_ID --ide2 $STORAGE:cloudinit --ciuser $USER --cipassword $PASSWORD --sshkey $SSH_KEY_PATH || { 
    echo "Failed to set Cloud-Init disk" | tee -a $LOG_FILE; exit 1; 
}
# qm set $VM_ID --sshkey $SSH_KEY_PATH || {
#     echo "Failed to set SSH key" | tee -a $LOG_FILE; exit 1;
# }
# qm set $VM_ID --ciuser $USER --cipassword $PASSWORD || {
#     echo "Failed to set user credentials" | tee -a $LOG_FILE; exit 1;
# }

# Resize disk and set boot options
qm resize $VM_ID scsi0 $VM_DISK_SIZE || { echo "Failed to resize disk" | tee -a $LOG_FILE; exit 1; }
qm set $VM_ID --boot order=scsi0 || { echo "Failed to set boot options" | tee -a $LOG_FILE; exit 1; }


# Start the VM
qm start $VM_ID || { echo "Failed to start VM" | tee -a $LOG_FILE; exit 1; }

# Retrieve VM IP dynamically from guest agent
VM_IP=$(qm guest exec $VM_ID ip a | grep -oP 'inet \K[\d.]+' | head -n 1)
if [ -z "$VM_IP" ]; then
    echo "Failed to retrieve VM IP address via guest agent. Exiting." | tee -a $LOG_FILE
    # exit 1
fi

echo "Detected VM IP: $VM_IP"

# Attempt to retrieve IP from ARP table as a fallback
if [ -z "$VM_IP" ]; then
    echo "Attempting to retrieve VM IP from ARP table..."
    VM_MAC=$(qm config $VM_ID | grep net0 | awk -F= '{print $2}' | cut -d',' -f1)
    VM_IP=$(arp -n | grep $VM_MAC | awk '{print $1}')
    if [ -z "$VM_IP" ]; then
        echo "Failed to retrieve VM IP from ARP table. Exiting." | tee -a $LOG_FILE
        exit 1
    fi
fi

echo "Detected VM IP: $VM_IP"

# Wait for VM to become reachable
echo "Waiting for VM to become reachable..."
MAX_RETRIES=40
RETRY_DELAY=5
for i in $(seq 1 $MAX_RETRIES); do
    if ping -c 1 -W 1 ${VM_IP%%/*} > /dev/null 2>&1; then
        echo "VM is reachable!"
        break
    fi
    echo "Ping attempt $i/$MAX_RETRIES failed. Retrying in $RETRY_DELAY seconds..."
    sleep $RETRY_DELAY
done

if ! ping -c 1 -W 1 ${VM_IP%%/*} > /dev/null 2>&1; then
    echo "VM did not become reachable within the expected time. Exiting." | tee -a $LOG_FILE
    exit 1
fi

# Final output
echo "VM creation and configuration complete!"
