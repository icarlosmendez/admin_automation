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

# Before this script can be used, it needs to have conditional logic applied to ensure that it doesn't overwrite any existing configuration. This is designed to be applied to a new server that will have basic networking configuration already established and we don't want to break that, only add to it.

# Edit network config on Host and add settings for NAT

# ############### HOST NETWORK CONFIG SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/network/interfaces
# Function to edit network configuration on Host and add settings for NAT
edit_host_network_config() {
    echo "Editing network configuration on Host and adding settings for NAT..."
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
}

# ############### HOST NETWORK IPTABLES SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/sysconfig/iptables

# Add a port to an external network and the LXC/VM now configured for NAT
# Function to edit host network iptables settings for NAT
# This rule is for DNAT (Destination Network Address Translation)
# It forwards incoming traffic on port 8080 from the external IP 192.168.1.11 to the internal IP 192.168.40.3 on port 80
# This is useful for exposing a service running on a VM/LXC to the outside world

edit_host_network_iptables() {
    # Inform the user that the script is editing the host network iptables settings
    echo "Editing host network iptables settings..."
    # Append the following rule to the /etc/sysconfig/iptables file
    cat >> /etc/sysconfig/iptables <<EOF
iptables -t nat -A PREROUTING -p tcp -d 192.168.1.11 --dport 8080 -i vmbr0 -j DNAT --to-destination 192.168.40.3:80
EOF
}

# iptables-save
# Save the rule to the config file so that the rule is not lost/deleted/scrubbed on reboot
# /etc/iptables.conf
# Function to save the iptables rule to the config file
save_iptables_rule() {
    echo "Saving the iptables rule to the config file..."
    iptables-save > /etc/iptables.conf
}

# Main function to execute all the necessary steps
main() {
    # create_network_bridge # This might need to be implemented? Not sure yet.
    edit_host_network_config
    # edit_host_network_iptables
    systemctl restart networking.service # Restart networking service to apply changes
    save_iptables_rule
}

# Call the main function
main
