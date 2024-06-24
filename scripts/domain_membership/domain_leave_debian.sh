#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Function to clean up SSSD and PAM configuration
cleanup_sssd_pam() {
    echo "Stopping and disabling SSSD..."
    sudo systemctl stop sssd
    sudo systemctl disable sssd

    echo "Removing SSSD configuration..."
    sudo rm -f /etc/sssd/sssd.conf
    sudo rm -f /etc/sssd/sssd.conf.d/

    echo "Removing PAM configuration..."
    sudo pam-auth-update --remove mkhomedir

    echo "Removing domain admins from sudoers..."
    sudo sed -i '/%domain\\ admins ALL=(ALL:ALL) ALL/d' /etc/sudoers

    echo "Cleanup complete. A reboot is recommended to apply all changes. Reboot now? (yes/no):"
    read REBOOT_NOW
    if [ "$REBOOT_NOW" == "yes" ]; then
        sudo reboot
    else
        echo "Please remember to reboot the system later to apply all changes."
    fi
}

# Leave the domain
echo "Enter the domain name (e.g., icarlosmendez.info) to leave:"
read DOMAIN

echo "Checking if the client is a member of the domain..."
if realm list | grep -q "$DOMAIN"; then
    echo "Client is currently a member of the domain ${DOMAIN}. Proceeding with domain leave..."

    # Leave the domain
    sudo realm leave $DOMAIN

    # Verify the leave
    if [ $? -eq 0 ]; then
        echo "Successfully left the domain ${DOMAIN}"
        cleanup_sssd_pam
    else
        echo "Failed to leave the domain ${DOMAIN}"
        exit 1
    fi
else
    echo "Client is not a member of the domain ${DOMAIN}. No action needed."
fi
