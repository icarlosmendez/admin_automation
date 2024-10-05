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

# Copy the script to your guest vm
# scp -i ~/.ssh/samba_id_rsa guest_network_config.sh ubuntu@192.168.30.4:~/guest_network_config.sh

# ############### APPLIANCE NETWORK CONFIG SETTINGS: (LXC/VM) ###############
# /etc/network/interfaces
# Function to configure the guest bridge and add settings for NAT
configure_guest_bridge() {
    local bridge_id=$1
    local vlan_id=$2
    local ip_address=$3
    local gateway="192.168.${vlan_id}.1"
    local nameserver1=$4
    local nameserver2=$5

    echo "Configuring guest bridge and adding settings for NAT..."
    cat >> /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto vmbr${bridge_id}.${vlan_id}
iface vmbr${bridge_id}.${vlan_id} inet static
    address ${ip_address}
    netmask 255.255.255.0
    gateway ${gateway}
    dns-nameservers ${nameserver1} ${nameserver2}
EOF

    echo "Bringing up the interface..."
    sudo ip link set vmbr${bridge_id}.${vlan_id} up

    echo "Setting up the default route..."
    sudo ip route add default via ${gateway} dev vmbr${bridge_id}.${vlan_id}
}

# Prompt for Bridge ID
read -p "Enter the Bridge ID for this VM (e.g., 1 for vmbr1, 2 for vmbr2, etc.): " BRIDGE_ID

# VLAN ID is generated based on the choice made for Bridge ID. 
# This method works under the IP/VLAN schedule defined for this project 
# but may not be useable in all network setups. 
# Adjust as necessary. Your mileage may vary.
VLAN_ID=$((BRIDGE_ID * 10))

# Prompt for the last value of the IP address using the VLAN ID for the third octet
read -p "Enter the last value for the IP address (e.g., 192.168.${VLAN_ID}.X): " LAST_VALUE

# Construct the full IP address using VLAN_ID and the provided last value
IP_ADDRESS="192.168.${VLAN_ID}.${LAST_VALUE}"
echo "Configured IP address: ${IP_ADDRESS}"

# Prompt for DNS nameservers with defaults
# Make sure the first of the nameservers is the LAN side IP of your edge router
# For most home routers its the same IP you use for the management interface 
# Unless you have a super cool one?
read -p "Enter the primary DNS nameserver (default: 192.168.1.10): " NAMESERVER1
NAMESERVER1=${NAMESERVER1:-192.168.1.10}

read -p "Enter the secondary DNS nameserver (default: 8.8.8.8): " NAMESERVER2
NAMESERVER2=${NAMESERVER2:-8.8.8.8}

# Call the function to configure the guest bridge
configure_guest_bridge "${BRIDGE_ID}" "${VLAN_ID}" "${IP_ADDRESS}" "${NAMESERVER1}" "${NAMESERVER2}"

# Restart the networking service
systemctl restart networking.service || echo "Failed to restart networking service. Please restart the VM manually."

# Optionally prompt for reboot
read -p "Do you want to reboot the VM now? (yes/no): " response
if [[ $response =~ ^([yY][eE][sS]|[yY]) ]]; then
    reboot
else
    echo "Skipping reboot."
fi

# Call the VLAN testing script 
./vlan_testing_script.sh

# Verify the Bridge
# Once the system is up, you can check if the bridge was successfully created and is up using:
brctl show
