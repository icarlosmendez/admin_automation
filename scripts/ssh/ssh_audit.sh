# !bin/bash

# ##################################################### #
# Context

# Purpose: 

# ##################################################### #
# Preparatory Procedures

# From your terminal

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

# Instantiate the variables that will be used in the work with ssh

Key_Path="/root/.ssh/id_rsa.pub"
Init_User="username"
Init_IP="your_ip_addr"

# ##################################################### #
# Functions

# Function to check if the keys exist on the target machine
check_ssh_keys() {
    if ssh -q -o "BatchMode yes" $Init_User@$Init_IP "test -e ~/.ssh/authorized_keys; echo \$?" | grep -q 0; then
        echo "SSH keys already exist on the target machine."
    else
        echo "SSH keys do not exist on the target machine."
        # Copy SSH keys from Proxmos host back to your workstation
        # ssh-copy-id -i /path/to/public_key user@original_machine_ip
        ssh-copy-id -i $Key_Path $Init_User@$Init_IP
        progress_counter "Copying public SSH key" 2
        progress_counter "adding it to your authorized_keys file" 3
        echo ""
    fi
}

# Check for Proxmox SSH key on session host 
# and copy to authorized_keys if not there 
check_ssh_keys