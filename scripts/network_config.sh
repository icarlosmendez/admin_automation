#!/bin/bash

# In Proxmox Host
# Step 1. Create a new Nework Bridge

# Step 2. Edit network config on Host and add settings for NAT

# ############### HOST NETWORK CONFIG SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/network/interface

# auto vmbr1
# iface vmbr1 inet static
# address 192.168.100.1
# netmask 255.255.255.0
# bridge-ports none
# bridge-stp off
# bridge-fd 0

# #NAT SPECIFIC SETTINGS
# post-up echo 1 > /proc/sys/net/ipv4/ip_forward
# post-up iptables -t nat -A POSTROUTING -s '192.168.100.0/24' -o vmbr0 -j MASQUERADE 
# post-down iptables -t nat -D POSTROUTING -s '192.168.100.0/24' -o vmbr0 -j MASQUERADE


# Step 3. Edit network config on VM/LXC and add settings for NAT

# ############### APPLIANCE NETWORK CONFIG SETTINGS: (LXC/VM) ###############
# 100(Samba)
# /etc/network/interface

# auto lo
# iface lo inet loopback
# auto eth0
# iface eth0 inet static
# address 192.168.100.102/24
# netmask 255.255.255.0
# gateway 192.168.100.1
# nameserver 8.8.8.8
# nameserver 1.1.1.1

# 101(LMStudio)
# /etc/network/interface

# auto lo
# iface lo inet loopback
# auto eth0
# iface eth0 inet static
# address 192.168.100.103/24
# netmask 255.255.255.0
# gateway 192.168.100.1
# nameserver 8.8.8.8
# nameserver 1.1.1.1


# ############### HOST NETWORK IPTABLES SETTINGS: (PROXMOX) ###############
# Proxmox
# /etc/sysconfig/iptables

# Step 5. Add the port to the external network and the vm/container that is now configured for NAT
# iptables -t nat -A PREROUTING -p tcp -d 192.168.1.101 --dport 7070 -i vmbr0 -j DNAT --to-destination 192.168.100.102:80

# Step 6. iptables-save

# Save the rule to the config file so that the rule is not lost/deleted/scrubbed on reboot
# Step 7. iptables-save > /etc/iptables.conf