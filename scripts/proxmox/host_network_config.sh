#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <host_network_config.sh>
# * Description       : <Add Bridge, VLAN, NAT config to Proxmox>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 06/23/2024	    <iCarlosMendez>	    <Insprired by Code Owl>
# *
# * /******************************************************************/


# This script contains conditional logic to ensure it doesn't overwrite any existing configuration. 
# This is designed to be applied to a new server that will have basic networking configuration already established
# and we don't want to break that, only add to it.

# On Proxmox Host
# Create a Network Bridge for each required VLAN
# This is done by the create_network_bridges method below.

# Bridge identifiers: One for each VLAN to be added.
BRIDGES=("vmbr1" "vmbr2" "vmbr3" "vmbr4")
# Subnet IPs: One for each VLAN to be added. Adjust these according to your preferred IP structure.
ADDRESSES=("192.168.10.1" "192.168.20.1" "192.168.30.1" "192.168.40.1")
# Slash Twenty-four. Add this to the end of the IPs.
CIDR_SUFFIX="/24"
# VLAN IDs: One for each VLAN to be added.
VLAN_IDS=("10" "20" "30" "40")

# Function to configure bridges in /etc/network/interfaces
configure_bridges() {
    local bridge=$1
    # local address=$2
    # local cidr_address="${address}${CIDR_SUFFIX}"
    # Ensure the bridge is configured in /etc/network/interfaces
    if ! grep -q "$bridge" /etc/network/interfaces; then
        echo "Adding configuration for $bridge to /etc/network/interfaces..."
        cat >> /etc/network/interfaces <<EOF
auto $bridge
# iface $bridge inet static
iface $bridge inet manual
    # address $cidr_address
    bridge-ports none
    bridge-stp off
    bridge-fd 0
    bridge-vlan-aware yes
    bridge-vids 2-4094

EOF
    # else
    #     echo "Configuration for $bridge already exists in /etc/network/interfaces. Updating..."
    #     # Use sed to replace only the address line to avoid redundancy
    #     sed -i "/iface $bridge inet static/{n;s/.*/    address $address/}" /etc/network/interfaces
    fi
}

# Function to configure VLANs in /etc/network/interfaces
configure_vlans() {
    local bridge=$1
    local vlan_id=$2
    local address=$3
    local cidr_address="${address}${CIDR_SUFFIX}"
    local vlan_interface="${bridge}.${vlan_id}"

    if ! grep -q "$vlan_interface" /etc/network/interfaces; then
        echo "Adding configuration for $vlan_interface to /etc/network/interfaces..."
        cat >> /etc/network/interfaces <<EOF
auto $vlan_interface
iface $vlan_interface inet static
    address $cidr_address
    vlan-raw-device $bridge
EOF
    else
        echo "Configuration for $vlan_interface already exists in /etc/network/interfaces. Skipping..."
    fi
}

# Add NAT Settings: If they don't exist, append them to the interfaces file
add_nat_settings() {
    local nat_settings=(
        "post-up echo 1 > /proc/sys/net/ipv4/ip_forward"
    )    
    # Dynamic NAT Rules: 
    # By looping through the ADDRESSES array, 
    # we dynamically generate the NAT rules based on the addresses, 
    # ensuring consistency and reducing hardcoding.
    for address in "${ADDRESSES[@]}"; do
        # Subnet Calculation: 
        # The ${address%.*}.0/24 syntax extracts the subnet from the IP address 
        # (e.g., 192.168.10.1 becomes 192.168.10.0/24)
        subnet="${address%.*}.0/24"
        # Appending Rules: 
        # The nat_settings array dynamically constructs the rules, 
        # -A appends a rule, and -D deletes a rule in iptables
        nat_settings+=("post-up iptables -t nat -A POSTROUTING -s '$subnet' -o vmbr0 -j MASQUERADE")
        nat_settings+=("post-down iptables -t nat -D POSTROUTING -s '$subnet' -o vmbr0 -j MASQUERADE")
    done

    for setting in "${nat_settings[@]}"; do
        # Check to see if they don’t already exist
        if ! grep -qF "$setting" /etc/network/interfaces; then
            # if not, add them to the interfaces file 
            echo "$setting" >> /etc/network/interfaces
        fi
    done
}

# Enable IP forwarding and apply sysctl settings
enable_ip_forwarding() {
    echo "Enabling IP forwarding..."
    if ! grep -q "^net.ipv4.ip_forward=1" /etc/sysctl.conf; then
        echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
    fi
    sysctl -p
}

# Function to reload network configuration
reload_network_configuration() {
    echo "Reloading network configuration..."
    systemctl restart networking.service
}

# Main: Execute all the things
main() {

    # Configure network bridges in /etc/network/interfaces
    for i in "${!BRIDGES[@]}"; do
        configure_bridges "${BRIDGES[$i]}" "${ADDRESSES[$i]}"
    done

    # Configure VLANs in /etc/network/interfaces
    for i in "${!BRIDGES[@]}"; do
        configure_vlans "${BRIDGES[$i]}" "${VLAN_IDS[$i]}" "${ADDRESSES[$i]}"
    done

    # Add NAT settings
    add_nat_settings

    # Enable IP forwarding
    enable_ip_forwarding

    # Restart networking service to apply changes
    reload_network_configuration 
}

# Call the main function
main


# network interface settings; autogenerated
#
# Please do NOT modify this file directly, unless you know what
# you're doing.
#
# If you want to manage parts of the network configuration manually,
# please utilize the 'source' or 'source-directory' directives to do
# so.
#
# PVE will preserve these directives, but will NOT read its network
# configuration from sourced files, so do not attempt to move any of
# the PVE managed interfaces into external files!

# auto lo
# iface lo inet loopback

# iface eno1 inet manual

# iface enp5s0 inet manual

# auto vmbr0
# iface vmbr0 inet static
#     address 192.168.1.11/24
#     gateway 192.168.1.1
#     bridge-ports eno1
#     bridge-stp off
#     bridge-fd 0
#     bridge-vlan-aware yes
#     bridge-vids 2-4094
#     nameserver 8.8.8.8
#     nameserver 1.1.1.1

# auto vmbr1
# iface vmbr1 inet manual
#     bridge-ports none
#     bridge-stp off
#     bridge-fd 0
#     bridge-vlan-aware yes
#     bridge-vids 2-4094

# auto vmbr2
# iface vmbr2 inet manual
#     bridge-ports none
#     bridge-stp off
#     bridge-fd 0
#     bridge-vlan-aware yes
#     bridge-vids 2-4094

# auto vmbr3
# iface vmbr3 inet manual
#     bridge-ports none
#     bridge-stp off
#     bridge-fd 0
#     bridge-vlan-aware yes
#     bridge-vids 2-4094

# auto vmbr4
# iface vmbr4 inet manual
#     bridge-ports none
#     bridge-stp off
#     bridge-fd 0
#     bridge-vlan-aware yes
#     bridge-vids 2-4094

# auto vmbr1.10
# iface vmbr1.10 inet static
#     address 192.168.10.1/24
#     vlan-raw-device vmbr1

# auto vmbr2.20
# iface vmbr2.20 inet static
#     address 192.168.20.1/24
#     vlan-raw-device vmbr2

# auto vmbr3.30
# iface vmbr3.30 inet static
#     address 192.168.30.1/24
#     vlan-raw-device vmbr3

# auto vmbr4.40
# iface vmbr4.40 inet static
#     address 192.168.40.1/24
#     vlan-raw-device vmbr4

# post-up echo 1 > /proc/sys/net/ipv4/ip_forward
# post-up iptables -t nat -A POSTROUTING -s '192.168.10.0/24' -o vmbr0 -j MASQUERADE
# post-down iptables -t nat -D POSTROUTING -s '192.168.10.0/24' -o vmbr0 -j MASQUERADE
# post-up iptables -t nat -A POSTROUTING -s '192.168.20.0/24' -o vmbr0 -j MASQUERADE
# post-down iptables -t nat -D POSTROUTING -s '192.168.20.0/24' -o vmbr0 -j MASQUERADE
# post-up iptables -t nat -A POSTROUTING -s '192.168.30.0/24' -o vmbr0 -j MASQUERADE
# post-down iptables -t nat -D POSTROUTING -s '192.168.30.0/24' -o vmbr0 -j MASQUERADE
# post-up iptables -t nat -A POSTROUTING -s '192.168.40.0/24' -o vmbr0 -j MASQUERADE
# post-down iptables -t nat -D POSTROUTING -s '192.168.40.0/24' -o vmbr0 -j MASQUERADE