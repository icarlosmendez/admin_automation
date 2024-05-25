#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <proxmox_config.sh>
# * Description       : <Get a new install of Proxmox up and running>
# *                    
# * Revision History  :
# * Date		    Author 			    Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by Techno Tim>
# *
# * /******************************************************************/

# Purpose: Configure a Proxmox VE server with best practices, and offer guided or expedited installation options.
# Expected Environment: Fresh install of Proxmox VE.
# Prerequisites: SSH/Root access, Internet connectivity.

# Use SCP to copy this script to your Proxmox server:
# scp this_script.sh root@YOUR_SERVER_IP:/root/
# Then SSH into the server and run the script:
# ssh root@YOUR_SERVER_IP
# bash this_script.sh


# ##################################################### #

echo "Beginning Proxmox VE configuration script..."

update_package_lists=false

# Function to update package lists only if necessary
conditional_update() {
  if [ "$update_package_lists" = true ]; then
    echo "Running apt-get update to ensure all packages are up to date..."
    apt-get update || { echo "Failed to update package lists"; exit 1; }
    echo "Package lists updated successfully."
    update_package_lists=false
  fi
}

# Function to upgrade the Proxmox distribution
# apt-get dist-upgrade is a Linux command that installs or removes packages to upgrade a system, 
# while apt upgrade only upgrades packages that have a new release available. 
# apt dist-upgrade is a more comprehensive solution that can handle complex dependency changes 
# and minimize the impact on other packages. 
# It may install new packages or remove existing ones, and can also install the new kernel version. 
# apt dist-upgrade is recommended for keeping a system up to date with the latest security patches and bug fixes.
perform_distribution_upgrade() {
    echo "An upgrade of all packages to the latest versions will be performed now. This may include kernel upgrades, which could require a system reboot to apply."
    read -p "Would you like to proceed with the system upgrade? (yes/no) " response
    if [[ "$response" =~ ^[Yy]es$ ]]; then
        echo "Performing system upgrade..."
        apt-get dist-upgrade -y || { echo "System upgrade failed"; exit 1; }
        echo "System upgrade completed successfully. A reboot is recommended to apply all changes."
    else
        echo "System upgrade skipped by user request."
    fi
}


# Function to pause for user input during incremental installation
pause_for_input() {
  if [[ $INSTALL_MODE == "incremental" ]]; then
    read -p "Press [Enter] key to proceed to the next step..."
  fi
}

# Start script execution with user choice for installation mode
echo "Select Installation Mode:"
select INSTALL_MODE in "incremental" "expedited"; do
    case $INSTALL_MODE in
        incremental ) echo "Incremental installation selected. You will be prompted at each step."; break;;
        expedited ) echo "Expedited installation selected. The script will proceed without waiting for user input."; break;;
    esac
done

# Adding repositories and ensuring the system is up to date
echo "Configuring APT repositories and updating system packages..."
update_package_lists=true


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


# ##################################################### #

# Your provided repository configuration logic here...
# Reminder to call pause_for_input and conditional_update as necessary

# Define repositories to be added to /etc/apt/sources.list
# Guidance taken from Proxmox docs: https://pve.proxmox.com/pve-docs/chapter-sysadmin.html
# Scroll down to Proxmox VE No-Subscription Repository

# Define the distribution name used in repository URLs
DISTRO_NAME="bookworm"


# Define array with lines to be added
sources_list_lines=(
  "deb http://ftp.debian.org/debian $DISTRO_NAME main contrib"
  "deb http://ftp.debian.org/debian $DISTRO_NAME-updates main contrib"
  "deb http://download.proxmox.com/debian/pve $DISTRO_NAME pve-no-subscription"
  "deb http://security.debian.org/debian-security $DISTRO_NAME-security main contrib"
)

# Update /etc/apt/sources.list by adding specific lines if they don't already exist
add_to_sources_list() {
  local line_to_add="$1"
  local file_path="/etc/apt/sources.list"

  # Check if the line exists in the file
  if ! grep -Fxq "$line_to_add" "$file_path"; then
    echo "Adding line to $file_path:" 
    echo "$line_to_add"
    echo "$line_to_add" >> "$file_path"
  else
    echo "Line already exists in $file_path:" 
    echo "$line_to_add"
    echo "No addition needed."
  fi
}

# Loop through the array and add the lines if they don't exist
for line in "${sources_list_lines[@]}"; do
  add_to_sources_list "$line"
done

echo "Addition of Proxmox VE No-Subscription repositories completed."


# Define array with lines to be commented out
enterprise_list_lines=(
  "deb https://enterprise.proxmox.com/debian/pve $DISTRO_NAME pve-enterprise",
  "deb https://enterprise.proxmox.com/debian/ceph-quincy $DISTRO_NAME enterprise"
)

# Update /etc/apt/sources.list.d/pve-enterprise.list by commenting out specific lines if they aren't already
comment_enterprise_list() {
  local line_to_comment="$1"
  local file_path=(
      "/etc/apt/sources.list.d/pve-enterprise.list"
      "/etc/apt/sources.list.d/ceph.list"
  )
  # Check if the line exists and is not already commented out
  if grep -q "^$line_to_comment" "$file_path"; then
    echo "Commenting out the line in $file_path:"
    echo "$line_to_comment"
    # Use sed to comment out the specific line
    sed -i "s|^$line_to_comment|# $line_to_comment|g" "$file_path"
    echo "Line commented out successfully."
  else
    echo "Line is already commented out or does not exist in $file_path."
  fi
}

# Loop through the array and comment the lines out as neccessary
for line in "${enterprise_list_lines[@]}"; do
  comment_enterprise_list "$line"
done

echo "Commenting out of Proxmox VE 'Enterprise' Subscription repositories completed."


# Define array with lines to be commented out
comment_grub_list_lines=(
  GRUB_CMDLINE_LINUX_DEFAULT="quiet"
)

# Update /etc/default/grub by commenting out specific lines if they aren't already
comment_grub_list() {
  local line_to_comment="$1"
  local file_path="/etc/default/grub"

  # Check if the line exists and is not already commented out
  if grep -q "^$line_to_comment" "$file_path"; then
    echo "Commenting out the line in $file_path:"
    echo "$line_to_comment"
    # Use sed to comment out the specific line
    sed -i "s|^$line_to_comment|# $line_to_comment|g" "$file_path"
    echo "Line commented out successfully."
  else
    echo "Line is already commented out or does not exist in $file_path."
  fi
}

# Loop through the array and comment the lines out as neccessary
for line in "${comment_grub_list_lines[@]}"; do
  comment_grub_list "$line"
done

echo "Commenting out of GRUB_CMDLINE_LINUX_DEFAULT="quiet" in /etc/default/grub completed."


# Define array with lines to be added
add_grub_list_lines=(
  GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"
)

# Update /etc/default/grub by adding specific lines if they don't already exist
add_to_grub_list() {
  local line_to_add="$1"
  local file_path="/etc/default/grub"

  # Check if the line exists in the file
  if ! grep -Fxq "$line_to_add" "$file_path"; then
    echo "Adding line to $file_path:" 
    echo "$line_to_add"
    echo "$line_to_add" >> "$file_path"
  else
    echo "Line already exists in $file_path:" 
    echo "$line_to_add"
    echo "No addition needed."
  fi
}

# Loop through the array and add the lines if they don't exist
for line in "${add_grub_list_lines[@]}"; do
  add_to_grub_list "$line"
done

echo "Addition of iommu specific lines to /etc/default/grub completed."

# Run update-grub which will update /boot/grub/grub.cfg
echo "Running update grub..."
update-grub


# Define array with lines to be added
modules_list_lines=(
  "vfio"
  "vfio_iommu_type1"
  "vfio_pci"
  "vfio_virqfd"
)

# Update /etc/modules by adding specific lines if they don't already exist
add_to_modules_list() {
  local line_to_add="$1"
  local file_path="/etc/modules"

  # Check if the line exists in the file
  if ! grep -Fxq "$line_to_add" "$file_path"; then
    echo "Adding line to $file_path:" 
    echo "$line_to_add"
    echo "$line_to_add" >> "$file_path"
  else
    echo "Line already exists in $file_path:" 
    echo "$line_to_add"
    echo "No addition needed."
  fi
}

# Loop through the array and add the lines if they don't exist
for line in "${modules_list_lines[@]}"; do
  add_to_modules_list "$line"
done

echo "Addition of modules completed."

# Remember to use conditional_update before installing additional packages
# Call the conditional_update method to accomplish this
conditional_update

# Call the system upgrade function
perform_distribution_upgrade

# This is the logical conclusion to this script preppring the Proxmox install for use

# Call the conditional reboot function
conditional_reboot

# ##################################################### #


# After incorporating your specific steps
echo "Now, let's enhance the script with additional best practices from the Proxmox community."

# Here we would continue with further community-recommended practices...
# Each new section would be prefaced with pause_for_input for incremental mode

echo "Script execution complete. Please review any messages above for additional instructions."

# echo "Script completion. Your Proxmox server is now fortified with best practices and ready for the deployment of magical constructs. 🎉"

# Next, to ensure the capture all the essential best practices from the community, let's identify key areas for enhancement:
# 1. Security Hardening
# 2. Performance Tuning
# 3. Backup and Recovery Strategies
# 4. Virtual Machine Management
# 5. Networking Configuration

# These areas often contain the most valuable insights for optimizing Proxmox VE setups. I'll look into each, ensuring this script not only sets up the server but optimizes it for reliability, performance, and security.

