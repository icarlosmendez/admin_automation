#!/bin/bash

# Purpose: Configure a Samba server using best practices.
# Expected Environment: Fresh install of Proxmox VE, fresh creation of LXC Samba container.
# Expected Environment: Defined Network infrastructure and static IP's for everyone.
# Prerequisites: SSH/Root access, Internet connectivity.
# Prerequisites: Configured and useable storage (ZFS Pool).
# Prerequisites: LXC Template with suitable Linux Distro ready for use in Proxmox.
# Prerequisites: Perform the following commands before you copy this file to the server
# Ensure the samba directory exists and set permissions
# mkdir -p root@192.168.1.102:/etc/samba/
# chmod 700 root@192.168.1.102:/etc/samba
# Copy the config file from the pwd into /etc/samba and set permissions
# scp ./smb.conf root@192.168.1.102:/etc/samba/
# chmod +x root@192.168.1.102:/etc/samba/samba.conf

# Use SCP to copy this script to your Samba container:
# scp this_script.sh root@YOUR_SERVER_IP:/root/
# SSH into the server:
# ssh root@YOUR_SERVER_IP
# Set executable permissions for the script:
# chmod +x /root/this_script.sh
# Run the script:
# bash this_script.sh


# ##################################################### #

# General Server Admin Functions

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

# Function to pause for user input during incremental installation
pause_for_input() {
  if [[ $INSTALL_MODE == "incremental" ]]; then
    read -p "Press [Enter] key to proceed to the next step..."
  fi
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
    echo "Preparing to install Samba Server..."
    read -p "Proceed with Samba installation? (yes/no): " response
    if [[ "$response" =~ ^[Yy]es$ ]]; then
        echo "Installing Samba Server..."
        if apt-get install samba -y; then
            echo "Samba Server installed successfully."
        else
            echo "Samba installation failed." >&2
            exit 1
        fi
    else
        echo "Samba installation skipped by user request."
    fi
}


# ##################################################### #

# Samba Configuration actions

# Add user (something other than root)
add_user() {
    # include logic to allow for the addition of 'n' users sequentially
    # because this will simultaneously add groups as well, consider your architecture and use case
    # there is always a way back but it's better to not have to retreat if possible
    # it just takes a little planning
    # also, prompt the user to set a password for the user during creation,
    # otherwise, it will need to be done later and if it is overlooked, you're opening an attack vector
    echo "Adding new user for Samba..."
    echo "This method can be used to add multiple users or no users at this time"
    while true; do
        read -p "Enter new username (or leave blank to stop): " username
        if [ -z "$username" ]; then break; fi
        adduser "$username" && echo "User $username added successfully."
    done
}

# Append the following lines of code to /etc/samba/smb.conf
# We should be capturing the sharename and username using the read command prior to the append operation
# This user that is created here should be a admin/system level user
# This account and share is essentially being set up to host infrastructure assets
# and together they comprise the lab/services architechture
configure_share() {
    # Declare a few variables for use in the cat operation 
    local sharename=sys_admin_share
    local sharepath=/srv/samba/$sharename

    echo "Configuring Samba share: $sharename"
    cat >> /etc/samba/smb.conf <<EOF
[$sharename]
    comment = Samba File Server Share for SysAdmins
    path = $sharepath
    browsable = yes
    guest ok = yes 
    read only = no
    create mask = 0755
EOF
    echo "Samba share $sharename configured successfully."
}

# Restart the Samba Server service
service_restart() {
    echo "Restarting the Samba Server service in preparation for sharing files"
    systemctl restart smbd.service nmbd.service
}


# ##################################################### #

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
configure_share

# Service restart after adding users and running the config function
service_restart

# This is the logical conclusion to this script preppring the Samba container for use
# Call the conditional reboot function
conditional_reboot

# ##################################################### #