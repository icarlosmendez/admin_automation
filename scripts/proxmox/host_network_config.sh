#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <network_config.sh>
# * Description       : <Add NAT level config to your host and VMs>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 06/22/2024	    <iCarlosMendez>	    <Insprired by Code Owl>
# *
# * /******************************************************************/


# In Proxmox Host
# Create a Network Bridge for each VLAN
# This is done by the edit_host_network_config method below.

# This script contains conditional logic to ensure it doesn't overwrite any existing configuration. 
# This is designed to be applied to a new server that will have basic networking configuration already established
# and we don't want to break that, only add to it.

# Edit network config on Host and add settings for NAT

# ############### HOST NETWORK CONFIG SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/network/interfaces
# Function to edit network configuration on Host and add settings for NAT
edit_host_network_config() {
    echo "Editing network configuration on Host and adding settings for NAT..."

    # Check if content already exists in /etc/network/interfaces to avoid duplication
    if ! grep -q "vmbr1" /etc/network/interfaces; then
        cat >> /etc/network/interfaces <<EOF
# VLAN 1 (Management)
auto vmbr1
iface vmbr1 inet static
    address 192.168.10.1
    netmask 255.255.255.0
    bridge-ports none
    bridge-stp off
    bridge-fd 0

# VLAN 2 (Security)
auto vmbr2
iface vmbr2 inet static
    address 192.168.20.1
    netmask 255.255.255.0
    bridge-ports none
    bridge-stp off
    bridge-fd 0

# VLAN 3 (Internal Services)
auto vmbr3
iface vmbr3 inet static
    address 192.168.30.1
    netmask 255.255.255.0
    bridge-ports none
    bridge-stp off
    bridge-fd 0

# VLAN 4 (DMZ)
auto vmbr4
iface vmbr4 inet static
    address 192.168.40.1
    netmask 255.255.255.0
    bridge-ports none
    bridge-stp off
    bridge-fd 0

# NAT SPECIFIC SETTINGS
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up iptables -t nat -A POSTROUTING -s '192.168.10.0/24' -o vmbr0 -j MASQUERADE
post-up iptables -t nat -A POSTROUTING -s '192.168.20.0/24' -o vmbr0 -j MASQUERADE
post-up iptables -t nat -A POSTROUTING -s '192.168.30.0/24' -o vmbr0 -j MASQUERADE
post-up iptables -t nat -A POSTROUTING -s '192.168.40.0/24' -o vmbr0 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '192.168.10.0/24' -o vmbr0 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '192.168.20.0/24' -o vmbr0 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '192.168.30.0/24' -o vmbr0 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '192.168.40.0/24' -o vmbr0 -j MASQUERADE
EOF
    else
        echo "Network configuration for VLANs already exists in /etc/network/interfaces. Skipping..."
    fi
}

# Main function to execute all the necessary steps
main() {
    # create_network_bridge # This might need to be implemented? Not sure yet.
    edit_host_network_config
    systemctl restart networking.service # Restart networking service to apply changes
}

# Call the main function
main