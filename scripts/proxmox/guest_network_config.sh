#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <network_config.sh>
# * Description       : <Add NAT level config to your VMs>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 05/11/2024	    <iCarlosMendez>	    <Insprired by Code Owl>
# *
# * /******************************************************************/


# This will require further verification before moving into production use.


# Step 1. Edit network config on VM/LXC and add settings for NAT

# ############### APPLIANCE NETWORK CONFIG SETTINGS: (LXC/VM) ###############
# 100(Samba)
# /etc/network/interfaces
# Function to edit network configuration on VM/LXC and add settings for NAT
edit_vm_network_config() {
    echo "Editing network configuration on VM/LXC and adding settings for NAT..."
    cat >> /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
address 192.168.1.100/24
netmask 255.255.255.0
gateway 192.168.1.1
nameserver 8.8.8.8
nameserver 1.1.1.1

# 101(LMStudio/Ollama)
# /etc/network/interfaces
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
address 192.168.100.101/24
netmask 255.255.255.0
gateway 192.168.100.1
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF
}

# After editing, save the changes and exit the text editor. To apply the changes, restart the networking service
systemctl restart networking.service

# or reboot the Proxmox server:
reboot

# Verify the Bridge
# Once the system is up, you can check if the bridge was successfully created and is up using:
brctl show