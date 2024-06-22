#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <samba_config.sh>
# * Description       : <Get your Samba Server up and running>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by consistency>
# *
# * /******************************************************************/


# ##################################################### #
# Context

# Purpose: Configure a Samba server using best practices.
# Expected Environment: Fresh install of Proxmox VE, fresh creation of LXC Samba container.
# Alternate Expected Environment: Fresh install of Proxmox VE, install directly onto the Proxmox VE sans LXC container.
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

echo "Beginning Samba configuration script..."

update_package_lists=false

# Function to update package lists only if necessary
conditional_update() {
    if [ "$update_package_lists" = true ]; then
        echo "Updating package lists..."
        if apt-get update; then
            echo "Package lists updated successfully."
        else
            echo "Failed to update package lists. Exiting." >&2
            exit 1
        fi
        update_package_lists=false
    fi
}

# Function to upgrade the Samba distribution
# apt-get dist-upgrade is a Linux command that installs or removes packages to upgrade a system, 
# while apt upgrade only upgrades packages that have a new release available. 
# apt dist-upgrade is a more comprehensive solution that can handle complex dependency changes 
# and minimize the impact on other packages. 
# It may install new packages or remove existing ones, and can also install the new kernel version. 
# apt dist-upgrade is recommended for keeping a system up to date with the latest security patches and bug fixes.
perform_distribution_upgrade() {
    echo "Preparing for a system upgrade. This may include kernel upgrades."
    read -p "Proceed with the system upgrade? (yes/no): " response
    case "$response" in
        [Yy]es|[Yy])
            echo "Upgrading the system..."
            if apt-get dist-upgrade -y; then
                echo "System upgraded successfully. A reboot is recommended."
            else
                echo "System upgrade failed. Please check the logs." >&2
                exit 1
            fi
            ;;
        *)
            echo "System upgrade cancelled by the user."
            ;;
    esac
}

# Start script execution with user choice for installation mode
select_installation_mode() {
    echo "Select Installation Mode (incremental/expedited):"
    read -p "Mode: " INSTALL_MODE
    case $INSTALL_MODE in
        incremental)
            echo "Incremental installation selected. You will be prompted at each step."
            ;;
        expedited)
            echo "Expedited installation selected. The script will proceed without interruptions."
            ;;
        *)
            echo "Invalid mode selected. Defaulting to incremental."
            INSTALL_MODE="incremental"
            ;;
    esac
}

# Adding repositories and ensuring the system is up to date
echo "Configuring APT repositories and updating system packages..."
update_package_lists=true

# Reboot the server to apply changes
conditional_reboot() {
    echo "A reboot is recommended to apply all changes made by this script."
    read -p "Would you like to reboot now? (yes/no) " response
    case "$response" in
        [Yy]* )
            echo "Rebooting now..."
            /sbin/shutdown -r now
            ;;
        [Nn]* )
            echo "Reboot deferred. Please remember to reboot your system manually to apply changes."
            ;;
        * )
            echo "Invalid response. Reboot deferred. Please remember to reboot your system manually to apply changes."
            ;;
    esac
}

# Install the Samba Server 
install_samba() {
    echo "Preparing to install Samba Server and dependencies..."
    read -p "Proceed with Samba installation? (yes/no): " response
    if [[ "$response" =~ ^[Yy]es$ ]]; then
        if ! dpkg -s samba &> /dev/null; then
            echo "Installing Samba Server..."
            if apt-get install samba samba-dsdb-modules samba-vfs-modules winbind libnss-winbind libpam-winbind krb5-user krb5-config -y; then
                echo "Samba Server installed successfully."
            else
                echo "Samba installation failed." >&2
                exit 1
            fi
        else
            echo "Samba Server is already installed."
        fi
    else
        echo "Samba installation skipped by user request."
    fi
}

# ##################################################### #
# Samba Specific Configuration Functions

add_admin_user() {
    echo "Add any new Domain-Level Admin users for Samba..."
    echo "This method can be used to add multiple users or no users at this time"
    while true; do
        read -p "Enter new domain admin username (or leave blank to skip): " NEW_ADMIN_USER
        if [ -z "$NEW_ADMIN_USER" ]; then break; fi
        read -sp "Enter password for ${NEW_ADMIN_USER}: " NEW_ADMIN_PASS
        echo

        # Create the user
        if sudo samba-tool user create $NEW_ADMIN_USER $NEW_ADMIN_PASS; then
            echo "User ${NEW_ADMIN_USER} created successfully."
        else
            echo "Failed to create user ${NEW_ADMIN_USER}."
            continue
        fi

        # Add the user to Domain Admins group
        if sudo samba-tool group addmembers "Domain Admins" $NEW_ADMIN_USER; then
            echo "User ${NEW_ADMIN_USER} added to Domain Admins successfully."
        else
            echo "Failed to add user ${NEW_ADMIN_USER} to Domain Admins."
            continue
        fi
    done
}

# Add user (something other than root)
add_user() {
    # include logic to allow for the addition of 'n' users sequentially
    # because this will simultaneously add groups as well, consider your architecture and use case
    # there is always a way back but it's better to not have to retreat if possible
    # it just takes a little planning
    # also, prompt the user to set a password for the user during creation,
    # otherwise, it will need to be done later and if it is overlooked, you're opening an attack vector
    echo "Current users in the system:"
    cut -d: -f1 /etc/passwd
    
    echo "Add any new standard users for Samba..."
    echo "This method can be used to add multiple users or no users at this time"
    while true; do
        read -p "Enter new username (or leave blank to skip): " username
        if [ -z "$username" ]; then break; fi
        adduser "$username" && echo "User $username added successfully."
    done
}

# Append the following lines of code to /etc/samba/smb.conf
# We should be capturing the sharename and username using the read command prior to the append operation
# This user that is created here should be a admin/system level user
# This account and share is essentially being set up to host infrastructure assets
# and together they comprise the lab/services architechture
configure_shares() {
    # Declare a few variables for use in the cat operation 
    local sys_admin_sharename=sys_admin_share
    local sys_admin_sharepath=/srv/samba/$sys_admin_sharename
    local public_sharename=public_share
    local public_sharepath=/srv/samba/$public_sharename

    echo "Configuring Samba share: $sys_admin_sharename"
    mkdir -p "$sys_admin_sharepath"
    cat >> /etc/samba/smb.conf <<EOF
[$sys_admin_sharename]
    comment = Samba File Server Share for SysAdmins
    path = $sys_admin_sharepath
    public = no
    writable = yes
    browsable = yes
    guest ok = no
    read only = no
    create mask = 0770
    directory mask = 0770
    valid users = @sysadmins
EOF

    echo "Configuring Samba share: $public_sharename"
    mkdir -p "$public_sharepath"
    cat >> /etc/samba/smb.conf <<EOF
[public_sharename]
    comment = Samba File Server Share for Public
    path = $public_sharepath
    public = yes
    writable = yes
    browsable = yes
    guest ok = yes
    read only = no
    create mask = 0664
    directory mask = 0775
    force user = nobody
    force group = nogroup
EOF
    echo "Samba share $sys_admin_sharename configured successfully."
    echo "Samba share $public_sharename configured successfully."

    # Instructions on accessing the shares
    echo "To access the shared machine:"
    # On Windows, use this pattern to access the share
    echo "Windows: Open File Explorer and enter \\\\$HOSTNAME"
    # On Mac, use this pattern to access the share
    echo "Macintosh: Open Finder, then click Go -> Connect to Server, and enter smb://\$HOSTNAME/public"
}

# Set permissions and ownership for the smb.conf file
set_smb_conf_permissions(){
    echo "Setting permissions and ownership for the smb.conf file..."
    sudo chmod 644 /etc/samba/smb.conf
    sudo chown root:root /etc/samba/smb.conf
}

# Restart the Samba Server service
service_restart() {
    echo "Restarting the Samba Server service in preparation for sharing files"
    sudo systemctl unmask samba-ad-dc
    sudo systemctl enable samba-ad-dc
    sudo systemctl start samba-ad-dc

    if systemctl is-active --quiet samba-ad-dc; then
        echo "Samba AD DC service restarted successfully."
    else
        echo "Failed to restart Samba service." >&2
        sudo systemctl status samba-ad-dc
        sudo journalctl -xeu samba-ad-dc
        exit 1
    fi
}

# Provision Samba AD DC
provision_samba_ad_dc() {
    echo "Provisioning Samba as an Active Directory Domain Controller..."
    # Ensure smb.conf does not exist
    rm -f /etc/samba/smb.conf

    samba-tool domain provision --use-rfc2307 --interactive
    if [ $? -eq 0 ]; then
        echo "Samba AD DC provisioned successfully."
    else
        echo "Samba AD DC provisioning failed." >&2
        exit 1
    fi
}

# This function configures the BIND9 DNS server for use with the Samba AD DC. 
# It sets up forwarders for DNS resolution, 
# includes the Samba DNS configuration, 
# and restarts the BIND9 service.
configure_bind9() {
    echo "Configuring bind9 for Samba AD DC..."
    apt-get install bind9 bind9utils bind9-doc -y

    # Include all four DNS forwarders in the named.conf.options file
    cat > /etc/bind/named.conf.options <<EOF
options {
    directory "/var/cache/bind";

    forwarders {
        # Google Public DNS
        8.8.8.8;
        # Cloudflare DNS
        1.1.1.1;
        # OpenDNS
        208.67.222.222;
        # Quad9
        9.9.9.9;
    };

    dnssec-validation no;

    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };

    tkey-gssapi-keytab "/var/lib/samba/private/dns.keytab";

};
EOF

    if ! grep -q "include \"/var/lib/samba/bind-dns/named.conf\"" /etc/bind/named.conf.local; then
        echo "include \"/var/lib/samba/bind-dns/named.conf\";" >> /etc/bind/named.conf.local
    fi

    chown bind:bind /var/lib/samba/bind-dns/named.conf
    chown bind:bind /var/lib/samba/bind-dns/dns.keytab

    systemctl restart bind9
    if systemctl is-active --quiet named.service; then
        echo "Bind9 configured and restarted successfully."
    else
        echo "Failed to restart bind9." >&2
        sudo systemctl status named.service
        sudo journalctl -xeu named.service
        exit 1
    fi
}


# Test DNS functionality
test_dns() {
    echo "Testing DNS resolution..."
    read -p "Enter the domain name associated with the AD DC server: " domain_name
    dig $domain_name
    if [ $? -eq 0 ]; then
        echo "DNS resolution test successful."
    else
        echo "DNS resolution test failed." >&2
        exit 1
    fi
}


# ##################################################### #
# The Script

# Call this function early to set the installation mode
select_installation_mode

# Remember to use conditional_update before installing additional packages
# Call the conditional_update method to accomplish this
conditional_update

# Call the system upgrade function
perform_distribution_upgrade

# Install the Samba Server
install_samba

# Add a non-root but administrative user to Samba
add_user

# Configure the initial share location for infrastructure assets
configure_shares

# Set the necessary permissions for the Samba configuration file.
set_smb_conf_permissions

# Provision Samba as an AD DC
provision_samba_ad_dc

# Configure DNS with BIND9
configure_bind9

# Test DNS functionality
test_dns

# Service restart after adding users and running the config function
service_restart

# Call the verification script as the last thing before reboot to ensure we have everything working.
bash samba_bind_verify.sh

# This is the logical conclusion to this script prepping the Samba container for use
# Call the conditional reboot function
conditional_reboot

# ##################################################### #
# Notes

# There is a call to the add-user() function, but it might be good to 
# move it up in the execution order, or have another version of it that is 
# not tied to directory creation? 

# Need to consider that to make this script more resilient and 
# in accord with best practices. 

# Some important notes about shared storage caputured from the forums
# https://forum.proxmox.com/threads/ubuntu-file-media-server-nas-on-proxmox.83922/

# You can't passthrough a datataset into a VM. 

# If you want to access your files on the ZFS pool from inside the VM 
# you need to use some kind of network protocol like NFS.

# And datasets can only be created on the pool, 
# so you need to do that on your host and not inside the VM. 

# The guest has no access to ZFS at all.