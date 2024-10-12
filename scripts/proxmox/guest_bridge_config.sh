#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <guest_network_config.sh>
# * Description       : <Add NAT level config to your VMs>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 06/23/2024	    <iCarlosMendez>	    <Insprired by Code Owl>
# *
# * /******************************************************************/


# ############### APPLIANCE NETWORK CONFIG SETTINGS: (LXC/VM) ###############
# /etc/network/interfaces
# Function to edit network configuration on VM/LXC and add settings for NAT
configure_guest_bridge() {
    local vlan=$1
    local ip_address=$2
    local gateway=$3
    local nameserver1=$4
    local nameserver2=$5

    echo "Configuring guest bridge and adding settings for NAT..."
    cat >> /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto ${interface}
iface ${interface} inet static
    address ${ip_address}
    netmask 255.255.255.0
    gateway ${gateway}
    dns-nameservers ${nameserver1} ${nameserver2}
EOF
}


# Determine the network interface name
INTERFACE=$(ip -o -4 route show to default | awk '{print $5}')

# Example usage for different VLANs
# Adjust the IP address, gateway, and VLAN as necessary

# VLAN 1 (Management)
configure_guest_bridge ${INTERFACE} "10.10.10.10" "10.10.10.1" "1.1.1.1" "9.9.9.9"

# VLAN 2 (Security)
configure_guest_bridge ${INTERFACE} "10.10.20.10" "10.10.20.1" "1.1.1.1" "9.9.9.9"

# VLAN 3 (Internal Services)
configure_guest_bridge ${INTERFACE} "10.10.30.10" "10.10.30.1" "1.1.1.1" "9.9.9.9"

# VLAN 4 (DMZ)
configure_guest_bridge ${INTERFACE} "10.10.40.10" "10.10.40.1" "1.1.1.1" "9.9.9.9"

# After editing, save the changes and exit the text editor. To apply the changes, restart the networking service
systemctl restart networking.service

read -p "Do you want to reboot the Proxmox server now? (yes/no): " response
if [[ $response =~ ^([yY][eE][sS]|[yY]) ]]
then
    reboot
else
    echo "Skipping reboot."
fi

# Verify the Bridge
# Once the system is up, you can check if the bridge was successfully created and is up using:
brctl show

/etc/netplan/01-netcfg.yaml