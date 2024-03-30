#!/bin/bash

# This script is designed to be run on a fresh install of Proxmox Virtural Environment

# You will need to SCP this file to the server
# scp this_script.sh root@YOUR_IP_ADDRESS:/root/this_script.sh

# You will then need to SSH into the server to run this script
# ssh root@YOUR_IP_ADDRESS

# ##################################################### #


# Your provided Terraform installation logic here...
# Ensure all packages are up to date and install "lsb-release" for HashiCorp repo addition

echo "Installing lsb-release to enable addition of Terraform repositories..."
apt-get install -y lsb-release || { echo "Failed to install lsb-release"; exit 1; }
echo "lsb-release installation successful."

echo "Cleaning up package lists..."
apt-get clean all
echo "Clean up complete."

echo "Proceeding with Terraform installation..."

# Prepare for Terraform installation by ensuring a clean environment and adding the HashiCorp repository.

# Define file paths for potential cleanup to prevent errors during Terraform installation.
file_paths=(
    "/usr/share/keyrings/hashicorp-archive-keyring.gpg"
    "/etc/apt/sources.list.d/pve-enterprise.list"
    "/etc/apt/sources.list.d/ceph.list"
)

# Function to remove a file if it exists.
remove_file() {
  local file_to_remove="$1"

  if [ -e "$file_to_remove" ]; then
    echo "Removing existing file to prevent conflicts: $file_to_remove"
    rm -f "$file_to_remove" && echo "File removed successfully."
  else
    echo "No existing file to remove: $file_to_remove"
  fi
}

# Remove any existing files that could conflict with new installations.
for path in "${file_paths[@]}"; do
  remove_file "$path"
done

# Add the HashiCorp GPG key to the keyring securely.
if wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg; then
  echo "HashiCorp GPG key added successfully."
else
  echo "Failed to add HashiCorp GPG key." >&2
  exit 1
fi

# Add the HashiCorp repository to sources.list.d
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

# Update package repositories and install Terraform with apt-get.
# Marking that package lists need an update
update_package_lists=true

# Ensure all packages are up to date before installing Terraform
# Call the conditional_update method to accomplish this
conditional_update

echo "Installing Terraform..."
apt-get install -y terraform || { echo "Failed to install Terraform." >&2; exit 1; }

echo "Cleaning up package lists..."
apt-get clean all

# Verify the Terraform installation.
echo "Verifying the Terraform installation..."
if terraform --version; then
  echo "Terraform installation verified. Your work is done, time to celebrate!"
else
  echo "Terraform installation verification failed." >&2
  exit 1
fi