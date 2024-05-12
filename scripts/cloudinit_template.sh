# !bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <cloudinit_template.sh>
# * Description       : <Create Cloudinit template for Proxmox>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by Jim's Garage>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Create a Cloud Init template for quickly spinning up VM's in Proxmox
# Expected Environment: Running install of Proxmox waiting to be populated with VM's

# Prerequisites: SSH/Root access, Internet connectivity in your proxmox node.
# Prerequisites: Configured and useable storage.
# Prerequisites: Choice of Linux/Ubuntu distro.
# Recommended: https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# ##################################################### #
# Preparatory Procedures

# From your terminal or shell, not in Proxmox...

# * Use SCP to copy this script to your Proxmox server:
# scp this_script.sh root@YOUR_SERVER_IP:/root/

# * SSH into the server:
# ssh root@YOUR_SERVER_IP

# * Set executable permissions for the script:
# chmod +x /root/this_script.sh

# * Run the script:
# bash this_script.sh

# ##################################################### #
# Variables

# Instantiate the variables that will be used in the VM creation.
# I have used the examples provided by Jim in his excellent video.
# You can/should set these to whatever you think they should be
# based on your 'bespoke' environment and preferences.

VM_ID="5000"
VM_RAM="2048"
VM_Cores="2"
VM_Name="jammy-cloud"
Network_ID="virtio"
Bridge_ID="vmbr0"
Storage_ID="local-lvm"
Dist_URL="https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
Dist_Name=$(basename $Dist_URL)
Dest_Path="/var/lib/vz/template/iso/"
Default_User="ubuntu"
Default_Pass="ubuntu"

# ##################################################### #
# Functions

# Function to display a progress counter
progress_counter() {
    local message=$1
    local duration=$2
    local progress_char="."

    echo -n "$message: "
    while [ $duration -gt 0 ]; do
        echo -n $progress_char
        sleep 1
        duration=$((duration-1))
    done
    echo
}

# Function to check for dist image in directory and download if not found
check_and_download_image() {
    # Information for user flow. Check to see if dist image exists
    progress_counter "Check for dist image in directory" 5
    echo ""

    # Check to see if the image associated with $Dist_URL exists prior to downloading
    if [ -f "$Dest_Path/$(basename $Dist_URL)" ]; then
        echo "Image exists in target directory."
        progress_counter "Skipping download" 3
        echo ""
    
    else
        echo "Image does not exist in target directory."
        progress_counter "Proceeding with download" 3
        echo ""
        
        # Check if curl is installed
        if ! command -v curl &> /dev/null
        then
            echo ""
            echo "curl could not be found. Install it? (yes/no)"
            echo ""
            read response
            if [ "$response" = "yes" ]; then
                apt-get install curl -y
            else
                echo ""
                echo "Since you have chosen not to install curl,"
                echo "You must download dist image using the Proxmox GUI."
                echo ""
                echo "Go to Jim's Garage for instructions on how to do that"
                echo "https://www.youtube.com/watch?v=Kv6-_--y5CM"
                echo "Timestamp is 3:48"
                echo ""
                echo "Then come back here and..."
                echo "Press any key to continue after you have downloaded the image."
                echo ""
                read -n 1 -s
            fi
        
        else
            # Download the image you will be using for the VM
            progress_counter "Downloading dist image for VM" 3
            echo ""

            # Download the image
            curl -O $Dist_URL
        fi
    fi
}

# ##################################################### #
# The Script

# Create the VM
clear
progress_counter "Creating the VM" 5
echo ""
qm create $VM_ID --memory $VM_RAM --core $VM_Cores --name $VM_Name --net0 $Network_ID,bridge=$Bridge_ID

# CD to the directory where you'll store the image file
progress_counter "Change directory to where dist image will be stored" 5
echo ""
cd $Dest_Path

# Call the function to check for dist image and download if not found
check_and_download_image

# Ascii Art Yoda
echo "__.-.__"
echo "'-._'7'"
echo " /'.-c"
echo " |  /T"
echo "_)_/LI"

# Import the distro image file into your preferred storage location
progress_counter "Patience young Jedi" 2
progress_counter "Creating Logical Volume for $Dist_Name" 3
progress_counter "Importing dist image to $Storage_ID" 5
echo ""
qm importdisk $VM_ID $Dist_Name $Storage_ID
sleep 2

# Set/mount the virtual HD to use as the boot device
echo ""
qm set $VM_ID --scsihw $Network_ID-scsi-pci --scsi0 $Storage_ID:vm-$VM_ID-disk-0
progress_counter "Setting virtual HD as boot device" 5
echo ""

# Using cloudinit to create an iso and mount it in a virtual cd-rom drive
qm set $VM_ID --ide2 $Storage_ID:cloudinit
progress_counter "Creating cloudinit ISO and mounting as virtual CD-ROM drive" 7
echo ""

# Set the bootloader to use the scsi0 drive
qm set $VM_ID --boot c --bootdisk scsi0
progress_counter "Setting bootloader to use scsi0 drive" 5
echo ""

# Create a virtual RS-232 serial port adapter for a VNC connection to the VM 
# This can be helpful in the case of SSH difficulties
qm set $VM_ID --serial0 socket --vga serial0
progress_counter "Creating virtual RS-232 Serial Port adapter for VNC connection" 5
echo ""

# Add a default user to the template
qm set $VM_ID --ciuser $Default_User
progress_counter "Adding default user" 5
echo ""

# Add a default password to the template
qm set $VM_ID --cipassword $Default_Pass
progress_counter "Adding default password" 5
echo ""

# Copy SSH keys from Proxmox host to the VM
qm set $VM_ID --sshkey /root/.ssh/id_rsa.pub --ciuser $Default_User
progress_counter "Copying public SSH key to VM" 5
echo ""

# Set IP config to DHCP for the VM
qm set $VM_ID --ipconfig0 "ip=dhcp"
progress_counter "Setting $Network_ID (net0) to DHCP for initial IP Config" 5
echo ""

# Convert this VM into a cloud-init template for rapid deployment
qm template $VM_ID
progress_counter "Converting VM $VM_ID to cloud-init template" 5

# Return to your SSH entrypoint
echo ""
progress_counter "Returning to your SSH entrypoint" 5
cd /root/

# Clean up after yourself
echo ""
progress_counter "Cleaning up after myself" 2

# Delete the script
rm cloudinit_template.sh
progress_counter "Deleting script" 2

# Closing script
progress_counter "Closing scripting session" 2

# Close SSH
progress_counter "Don't forget to exit your SSH session" 2

# Salutations
echo ""
echo "Happy VM deployments!"
sleep 5

exit