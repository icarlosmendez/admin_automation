#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <port_forwarding_config.sh>
# * Description       : <Configure port forwarding rules for NAT>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 06/23/2024	    <iCarlosMendez>	    <Inspired by Code Owl>
# *
# * /******************************************************************/

# ############### HOST NETWORK IPTABLES SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/sysconfig/iptables

# This section is for adding port forwarding rules for NAT
# The rule is for DNAT (Destination Network Address Translation)
# It forwards incoming traffic from an external IP on a specified port, also known as a socket,
# to an internal IP on a specified port
# This is useful for making a service accessible from the outside world

# Function to edit host network iptables settings for NAT
edit_host_network_iptables() {
    # Inform the user that the script is editing the host network iptables settings
    echo "Editing host network iptables settings..."
    while true; do
        # Prompt the user to add port forwarding for a specific IP and port on the network
        read -p "Do you want to add port forwarding for a specific IP and port on the network? (yes/no): " PORT_FORWARDING
        if [ "$PORT_FORWARDING" == "yes" ]; then
            # Prompt the user for destination IP, source port, and destination port
            read -p "Enter the destination IP: " DESTINATION_IP
            read -p "Enter the source port: " SOURCE_PORT
            read -p "Enter the destination port: " DESTINATION_PORT
            # Append the rule to the /etc/sysconfig/iptables file using variables
            # Note: Using modern convention /etc/iptables/rules.v4 for saving iptables rules
            cat >> /etc/iptables/rules.v4 <<EOF
iptables -t nat -A PREROUTING -p tcp -d 192.168.1.11 --dport $SOURCE_PORT -i vmbr0 -j DNAT --to-destination $DESTINATION_IP:$DESTINATION_PORT
EOF
        else
            echo "Skipping port forwarding configuration..."
            break
        fi
    done
}

# Save the iptables rule to the config file so that the rule is not lost/deleted/scrubbed on reboot
# Note: Consistent with /etc/iptables/rules.v4
save_iptables_rule() {
    echo "Saving the iptables rule to the config file..."
    iptables-save > /etc/iptables/rules.v4
}

# Main function to execute all the necessary steps
main() {
    edit_host_network_iptables
    save_iptables_rule
    echo "Port forwarding rules have been configured and saved:"
    cat /etc/sysconfig/iptables
}

# Call the main function
main
