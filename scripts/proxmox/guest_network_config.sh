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


# ############### APPLIANCE NETWORK CONFIG SETTINGS: (LXC/VM) ###############
# /etc/network/interfaces
# Function to edit network configuration on VM/LXC and add settings for NAT
edit_vm_network_config() {
    local vlan=$1
    local ip_address=$2
    local gateway=$3
    local nameserver1=$4
    local nameserver2=$5

    echo "Editing network configuration on VM/LXC and adding settings for NAT..."
    cat >> /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
    address ${ip_address}
    netmask 255.255.255.0
    gateway ${gateway}
    nameserver ${nameserver1}
    nameserver ${nameserver2}
EOF
}

# Example usage for different VLANs
# VLAN 1 (Management)
edit_vm_network_config 1 "192.168.10.10" "192.168.10.1" "8.8.8.8" "1.1.1.1"

# VLAN 2 (Security)
edit_vm_network_config 2 "192.168.20.10" "192.168.20.1" "8.8.8.8" "1.1.1.1"

# VLAN 3 (Internal Services)
edit_vm_network_config 3 "192.168.30.10" "192.168.30.1" "8.8.8.8" "1.1.1.1"

# VLAN 4 (DMZ)
edit_vm_network_config 4 "192.168.40.10" "192.168.40.1" "8.8.8.8" "1.1.1.1"

# After editing, save the changes and exit the text editor. To apply the changes, restart the networking service
systemctl restart networking.service

# or reboot the Proxmox server:
reboot

# Verify the Bridge
# Once the system is up, you can check if the bridge was successfully created and is up using:
brctl show