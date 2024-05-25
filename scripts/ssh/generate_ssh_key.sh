#!/bin/bash

# ##################################################### #
# Context

# Purpose: Interactive script to generate SSH key pairs for secure server access

# Expected Environment: A workstation with this script and a target server

# Prerequisites: See "Expected Environment"


# ##################################################### #
# Preparatory Procedures

# * Copy this script to your local ~/.ssh directory
# Copy/Paste or any other method of your choice

# * Set executable permissions for the script: 
# chmod +x ~/.ssh/generate_ssh_key.sh

# * Run the script:
# bash this_script.sh


# ##################################################### #
# Description

# * Functionality:
# This interactive script prompts for server details including a unique designator, hostname (or IP address), and the username required for SSH access.
# It generates a SSH key pair based on the provided information. You have the option to secure the key pair with a passphrase for enhanced security.

# * Key Usage:
# Upon completion, the script displays the public key. This should be added to the authorized_keys file on the intended server to facilitate SSH access using the newly generated key pair.

# * Features:
# The script stores server-specific information in designated variables, which are then used to suggest meaningful key pair names.
# It is designed for reusability, allowing for the quick creation of distinct SSH key pairs for different servers—streamlining and standardizing your deployment process.

# * Security Reminder:
# Maintain the confidentiality of your private keys. Share only the public keys with the intended servers.


# ##################################################### #
# Functions

# Function to gather user input with a default value
gather_input_with_default() {
  # Usage: gather_input_with_default "prompt" "default_value"
  read -r -p "$1 [$3]: " input
  if [[ -z "$input" ]]; then
    eval "$2='$3'"
  else
    eval "$2='$input'"
  fi
}

# Function to sanitize the server designator for file naming
sanitize() {
  # Remove characters that are not allowed in file names using 'tr' command
  # The tr command processes all characters, including the non-printing ones.
  # Characters to remove: \ / : * ? " < > |
  sanitized_name=$(echo "$1" | tr -d '\ /:*?"<>|')
  echo "$sanitized_name"
}

# Function to check for and clean up known_hosts entry if exists
check_known_hosts() {
  known_host_check=$(ssh-keygen -F "${server_address}")
  if [[ ! -z "$known_host_check" ]]; then
    echo "Found an existing entry in known_hosts for ${server_address}."
    read -r -p "Do you want to remove existing entries? (y/N): " remove_entries
    if [[ $remove_entries =~ ^[Yy]$ ]]; then
      echo "Cleaning up..."
      ssh-keygen -R "${server_address}"
    else
      echo "Aborting entry removal..."
      echo "Not removing the exiting entries for ${server_address}" 
      echo "could cause this script to fail."
      echo "If you need SSH access to a running server @ ${server_address}" 
      echo "then consider choosing and configuring a new IP"
      echo "and run this script again for this server."
      return    
    fi
  else  
    echo "No existing entry found in known_hosts for ${server_address}. Proceeding..."
  fi
}


# ##################################################### #
# The Script

# Define and collect server information to be stored as variables and used by the functions
clear
echo "Enter server information:"

# Name your server. This will be prepended to the SSH keys for easy identification
gather_input_with_default "Server designator (e.g., proxmox, linux, web_server, etc.)" server_designator
echo "Server designator set to: $server_designator"

# Enter either an FQDN or IP address as the target
gather_input_with_default "Server hostname or IP address" server_address
echo "Server hostname or IP address set to: $server_address"

# Enter the username you wish to use when initially logging into your server
# In most cases, this will likely be root here with the expectation of adding
# role based users for admin purposes once you're logged in to the server
gather_input_with_default "Username for SSH login" server_username
echo "Username for SSH login set to: $server_username"

# Prevent errors caused by hostname/fqdn/ip conflicts
check_known_hosts

# Sanitize the server designator for file naming
sanitized_server_designator=$(sanitize "$server_designator")

# Generate key names based on sanitized server designator
key_name="${sanitized_server_designator}_id_rsa"
private_key_file="${key_name}"
public_key_file="${key_name}.pub"

# Check if keys already exist
if [ -f "$private_key_file" ] || [ -f "$public_key_file" ]; then
  echo "SSH key pair already exists for $key_name."
  read -r -p "Do you want to overwrite the existing keys? (y/N): " overwrite_keys
  if [[ ! $overwrite_keys =~ ^[Yy]$ ]]; then
    echo "Aborting key generation."
    exit 0
  fi
fi

# Ask for passphrase (optional)
gather_input_with_default "Enter a passphrase for the private key (leave blank for no passphrase)" passphrase

# Generate the SSH key pair using 'ssh-keygen' command
ssh-keygen -t rsa -b 4096 -C "$server_username@$sanitized_server_designator" -N "$passphrase" -f "$private_key_file"

# Display the public key
echo "Public key for $key_name:"
cat "$public_key_file"

# Provide usage instructions
echo "Public key content shown above. Copy the content and add it to the authorized_keys file on the server."
echo "Make sure to keep the private key file ($private_key_file) secure and never share it."

# Ask the user if they want to proceed with transferring the public key to the server
read -r -p "Do you want to transfer the public key to the server now? (y/N): " transfer_key
if [[ $transfer_key =~ ^[Yy]$ ]]; then
  # Use the previously gathered server_address and server_username for the SCP command
  scp_cmd="scp ${public_key_file} ${server_username}@${server_address}:~/temp_pub_key.pub"
  echo "Executing: $scp_cmd"
  eval $scp_cmd

  # Use the previously gathered server_address and server_username for the SSH command
  ssh_cmd="ssh ${server_username}@${server_address} 'mkdir -p ~/.ssh && cat ~/temp_pub_key.pub >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys && rm ~/temp_pub_key.pub'"
  echo "Executing: $ssh_cmd"
  echo "This command will ensure the .ssh directory exists, append the public key to authorized_keys on the server, set correct permissions, and remove the temporary file."
  eval $ssh_cmd
fi

exit 0


# ##################################################### #
# Notes

# Some of the below actions have made it into the script above but maybe not as gracefully as they seem below.
# Seems like a little refactor party over a cup of coffee!


# ##################################################### #
# Instructions - could be moved to the top of this script

# Further instructions I want to add into this script to make it a complete process for creating the keys and getting onto the server they were created for right away.

# Locate Your Public Key: Ensure you know the path to your public SSH key on your local system. 
# By default, this might be ~/.ssh/id_rsa.pub for RSA keys or ~/.ssh/id_ed25519.pub for ED25519 keys. 
# If you've generated your key pair using this script, it should be wherever your script saved it. Usually that's the same directory the script was run in ans so it serves to store and execute this script in ~/.ssh.


# ##################################################### #
# Transfer keys to target server

# Transfer Your Public Key: You'll use the SCP command to transfer your public key file to your preferred server. 
# The general form of the command is as follows:
# scp /path/to/your/public_key.pub username@server_ip:/path/where/you/want/to/save

# For the sake of illustration, assuming your public key is ~/.ssh/id_rsa.pub, 
# the username is user, and the server IP is your_ip_address, the command will be:
# scp ~/.ssh/id_rsa.pub user@your_ip_address:~/temp_pub_key.pub

# This command transfers your public key to the home directory of user on the server, 
# temporarily naming it temp_pub_key.pub.


# ##################################################### #
# Append the Public Key to authorized_keys:

# First, SSH into your Proxmox server:
# ssh user@your_ip_address

# Then, append the public key to the ~/.ssh/authorized_keys file. 
# If ~/.ssh/authorized_keys doesn't exist, this command will create it:
# cat ~/temp_pub_key.pub >> ~/.ssh/authorized_keys


# ##################################################### #
# Ensure the permissions are correct:

# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/authorized_keys


# ##################################################### #
# Housekeeping

# Finally, you can remove the temporary public key file:
# rm ~/temp_pub_key.pub


# ##################################################### #
# Completion message

# By the completion of these steps, you will have securely transferred your public SSH key to your Proxmox 
# server and appended it to the authorized_keys file, granting you passwordless SSH access.


# ##################################################### #
# Flags used in the script

# -t: Specifies the type of key to create. 
# In this case, 'rsa' is used for RSA key.

# -b: Specifies the number of bits in the key. 
# 4096 bits is considered secure and recommended.

# -C: Adds a comment to the key, 
# typically in the format "username@server_designator".

# -N: Provides the passphrase to encrypt the private key. 
# If left empty, no passphrase will be set.

# -f: Specifies the output file for the private key. 
# The corresponding public key will have the '.pub' extension.

# -r: Do not allow backslashes to escape any characters (raw input).
# -p: Display the "prompt" without a trailing newline before reading the input.