#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Disable systemd-resolved
echo "Disabling systemd-resolved..."
systemctl disable systemd-resolved
systemctl stop systemd-resolved

# Remove the symbolic link and create a new resolv.conf
echo "Configuring DNS settings..."
rm /etc/resolv.conf
echo "nameserver 192.168.1.100" > /etc/resolv.conf

# Install necessary packages
echo "Installing necessary packages..."
apt update
apt install -y realmd sssd sssd-tools libnss-sss libpam-sss adcli packagekit samba-common krb5-user

# Prompt for the domain name
read -p "Enter the domain name (e.g., icarlosmendez.info): " DOMAIN

# Check if the client is already a member of the domain
echo "Checking if the client is already a member of the domain..."
if realm list | grep -q "$DOMAIN"; then
    echo "Client is already a member of the domain ${DOMAIN}. Proceeding..."
else
    # Discover the domain
    echo "Discovering the domain..."
    realm discover $DOMAIN

    # Join the domain
    echo "Joining the domain..."
    read -p "Enter the domain administrator username: " ADMIN_USER
    read -sp "Enter password for ${ADMIN_USER}: " ADMIN_PASS

    # Join the domain using the provided credentials
    echo $ADMIN_PASS | realm join --user=$ADMIN_USER $DOMAIN

    # Verify the join
    if [ $? -eq 0 ]; then
        echo "Successfully joined the domain ${DOMAIN}"
    else
        echo "Failed to join the domain ${DOMAIN}"
        exit 1
    fi
fi

# Configure SSSD
echo "Configuring SSSD..."
cat <<EOF >/etc/sssd/sssd.conf
[sssd]
domains = $DOMAIN
config_file_version = 2
services = nss, pam

[domain/$DOMAIN]
ad_domain = $DOMAIN
krb5_realm = ${DOMAIN^^}
realmd_tags = manages-system joined-with-samba
cache_credentials = True
id_provider = ad
krb5_store_password_if_offline = True
default_shell = /bin/bash
ldap_id_mapping = True
use_fully_qualified_names = False
fallback_homedir = /home/%u@%d
access_provider = ad
EOF

chmod 600 /etc/sssd/sssd.conf

# Restart and enable SSSD service
systemctl restart sssd
systemctl enable sssd

# Update PAM configuration
echo "Updating PAM configuration..."
cat <<EOF >>/etc/pam.d/common-auth
auth    [success=1 default=ignore]      pam_sss.so use_first_pass
EOF

cat <<EOF >>/etc/pam.d/common-account
account [success=1 new_authtok_reqd=done default=ignore]        pam_sss.so
EOF

cat <<EOF >>/etc/pam.d/common-password
password        [success=2 default=ignore]      pam_sss.so use_authtok
EOF

cat <<EOF >>/etc/pam.d/common-session
session optional        pam_sss.so
EOF

# Add domain admins to sudoers
echo "Adding domain admins to sudoers..."
echo "%domain\\ admins ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Reboot the system to apply changes
read -p "Configuration complete. A reboot is recommended to apply all changes. Reboot now? (yes/no): " REBOOT
if [[ "$REBOOT" =~ ^(yes|y)$ ]]; then
    reboot
else
    echo "Please reboot the system manually to apply changes."
fi
