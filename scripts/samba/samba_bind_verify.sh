#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <samba_config.sh>
# * Description       : <Verifying your Samba Server is up and running>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 06/21/2024	<iCarlosMendez>	<Insprired by consistency>
# *
# * /******************************************************************/


# ##################################################### #
# Context

# Purpose: Ensure your Samba server is configured and working.
# Expected Environment: Defined Network infrastructure and static IP's for everyone.
# Prerequisites: SSH/Root access, Internet connectivity.
# Prerequisites: Configured and useable storage (ZFS Pool).
# Prerequisites: LXC Template or full VM with suitable Linux Distro ready for use in Proxmox.
# Prerequisites: Perform the following commands before you copy this file to the server


# ##################################################### #
# Preparatory Procedures

# Ensure the samba directory exists and set permissions:
# mkdir -p root@192.168.1.100:/etc/samba/
# chmod 700 root@192.168.1.100:/etc/samba
# Copy the config file from the pwd into /etc/samba and set permissions
# scp ./smb.conf root@192.168.1.100:/etc/samba/
# chmod +x root@192.168.1.100:/etc/samba/samba.conf

# Use SCP to copy this script to your Samba container:
# scp this_script.sh root@YOUR_SERVER_IP:/root/
# SSH into the server:
# ssh root@YOUR_SERVER_IP
# Set executable permissions for the script:
# chmod +x /root/this_script.sh
# Run the script:
# bash this_script.sh

# The above functions run as root are probably fine when working in a lab 
# or test envrionment, but for prod work consider creating a non-root user 
# and execute the script using sudo instead of root, said every SysAdmin ever. 


# ##################################################### #
# General Server Admin Functions
# Prepare the VM/container Linux distro to take on a role

echo "Verifying Samba AD DC and BIND9 configuration..."

# Disable and stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved

# Remove symbolic link and create new /etc/resolv.conf
if [ -L /etc/resolv.conf ]; then
    sudo rm /etc/resolv.conf
fi
echo "nameserver 127.0.0.1" | sudo tee /etc/resolv.conf

# Check BIND9 configuration files
sudo named-checkconf
if [ $? -ne 0 ]; then
    echo "BIND9 configuration error."
    exit 1
fi

# Restart services
echo "Restarting samba-ad-dc and bind9"
sudo systemctl restart samba-ad-dc
sudo systemctl restart bind9

# Check Samba AD DC service status
echo "Checking status of samba-ad-dc"
sudo systemctl status samba-ad-dc

# Check Bind9 service status
echo "Checking status of bind9"
sudo systemctl status bind9

# Test DNS resolution
echo "Testing DNS resolution for icarlosmendez.info..."
dig icarlosmendez.info

# Test Active Directory SRV records
echo "Testing LDAP SRV record..."
dig _ldap._tcp.icarlosmendez.info SRV

# Test Kerberos SRV record to verify Kerberos service discovery
echo "Testing Kerberos SRV record..."
dig _kerberos._tcp.icarlosmendez.info SRV

# Initialize Kerberos ticket for the administrator user
echo "Initialize Kerberos ticket for administrator@ICARLOSMENDEZ.INFO"
kinit administrator@ICARLOSMENDEZ.INFO

# List the Kerberos tickets
echo "List Kerberos tickets"
klist

# Verify the contents of the DNS keytab file
echo "Verifying the contents of the DNS keytab file..."
sudo ktutil -k /var/lib/samba/private/dns.keytab list

# Check Samba logs
echo "Checking Samba logs for errors..."
sudo tail -n 50 /var/log/samba/log.samba

# Manual DNS update if samba_dnsupdate fails
if ! sudo samba-tool dns query icarlosmendez.info samba A -U Administrator | grep -q "192.168.1.100"; then
    sudo samba-tool dns add 127.0.0.1 icarlosmendez.info samba A 192.168.1.100 -U Administrator
fi

# Verify the manual DNS update
dig @127.0.0.1 samba.icarlosmendez.info

# Ensure the Samba AD DC is functioning properly by running Samba-specific commands to check the domain and users.
sudo samba-tool domain level show
sudo samba-tool user list

# Ensure that DNS forwarding is working correctly by querying an external domain.
dig google.com

echo "Verification complete. Please review the output for any errors."
