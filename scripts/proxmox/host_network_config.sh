#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <network_config.sh>
# * Description       : <Add NAT level config to your host and VMs>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by Code Owl>
# *
# * /******************************************************************/


# In Proxmox Host
# Step 1. Create a new Nework Bridge
# This is effectively done through adapting the config file at the location outlined in step 2.

# Before this script can be used, it needs to have conditional logic applied to ensure that it doesn't overwrite any existing configuration. This is designed to be applied to a new server that will have basic networking configuration already established and we don't want to break that, only add to it.

# Step 2. Edit network config on Host and add settings for NAT

# ############### HOST NETWORK CONFIG SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/network/interfaces
# Function to edit network configuration on Host and add settings for NAT
edit_host_network_config() {
    echo "Editing network configuration on Host and adding settings for NAT..."
    cat >> /etc/network/interfaces <<EOF
auto vmbr1
iface vmbr1 inet static
address 192.168.100.1
netmask 255.255.255.0
bridge-ports none
bridge-stp off
bridge-fd 0

# NAT SPECIFIC SETTINGS
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up iptables -t nat -A POSTROUTING -s '192.168.100.0/24' -o vmbr0 -j MASQUERADE 
post-down iptables -t nat -D POSTROUTING -s '192.168.100.0/24' -o vmbr0 -j MASQUERADE
EOF
}


# Step 3. Edit network config on VM/LXC and add settings for NAT

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
address 192.168.100.102/24
netmask 255.255.255.0
gateway 192.168.100.1
nameserver 8.8.8.8
nameserver 1.1.1.1

# 101(LMStudio/Ollama)
# /etc/network/interfaces
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
address 192.168.100.103/24
netmask 255.255.255.0
gateway 192.168.100.1
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF
}

# ############### HOST NETWORK IPTABLES SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/sysconfig/iptables

# Step 5. Add the port to the external network and the vm/container that is now configured for NAT
# Function to edit host network iptables settings
edit_host_network_iptables() {
    echo "Editing host network iptables settings..."
    cat >> /etc/sysconfig/iptables <<EOF
iptables -t nat -A PREROUTING -p tcp -d 192.168.1.101 --dport 7070 -i vmbr0 -j DNAT --to-destination 192.168.100.102:80
EOF
}

# Step 6. iptables-save
# Save the rule to the config file so that the rule is not lost/deleted/scrubbed on reboot
# /etc/iptables.conf
# Function to save the iptables rule to the config file
save_iptables_rule() {
    echo "Saving the iptables rule to the config file..."
    iptables-save > /etc/iptables.conf
}

# Main function to execute all the necessary steps
main() {
    # create_network_bridge
    edit_host_network_config
    # edit_vm_network_config
    edit_host_network_iptables
    systemctl restart networking.service
    save_iptables_rule
}

# Call the main function
main
