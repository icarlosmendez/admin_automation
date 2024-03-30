#!/bin/bash

# Interactive script to generate SSH key pair for server access

# The first thing that will need to be done is
# You may need to "show" hidden files
# To do this on Mac, in Finder, use the keyboard shortcut ctrl + shift + .
# From there you should see your hidden files in Terminal as well

# Copy this script to your ~/.ssh directory

# Then ensure the script is executable, 
# Set permissions using the following cmd
# chmod +x ~/.ssh/generate_ssh_key.sh

# When you run the script (./generate_ssh_key.sh), 
# it will interactively prompt you for the server information, 
# including a designator, hostname or IP address and username for SSH login. 
# It will then generate a key pair with the specified information. 
# If desired, you can provide a passphrase for additional security.

# The script will display the public key, 
# which you can then add to the authorized_keys file on the server
# to enable SSH access using the generated key pair.

# The script is interactive and includes variables to hold values 
# relevant to the server you are preparing to administer.
# Additionally, the script uses the variables 
# to provide reasonable naming recommendations for the keys.

# You can run this same script again and again, 
# allowing you to easily generate unique SSH key pairs 
# for unique servers in a consistent manner, 
# making your deployment process more efficient and standardized. 
# Remember to keep your private keys secure 
# and only share the public keys with the appropriate servers.

# Function to read user input with a default value
read_with_default() {
  # Usage: read_with_default "prompt" "default_value"
  # -r: Do not allow backslashes to escape any characters (raw input).
  # -p: Display the "prompt" without a trailing newline before reading the input.
  read -r -p "$1 [$3]: " input
  if [[ -z "$input" ]]; then
    eval "$2='$3'"
  else
    eval "$2='$input'"
  fi
}

# Function to sanitize the server designator for file naming
sanitize_for_filename() {
  # Remove characters that are not allowed in file names using 'tr' command
  # The tr command processes all characters, including the non-printing ones.
  # Characters to remove: \ / : * ? " < > |
  sanitized_name=$(echo "$1" | tr -d '\ /:*?"<>|')
  echo "$sanitized_name"
}

# Function to check for and clean up known_hosts entry if exists
check_for_known_hosts() {
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

# Define and collect server information to be stored as variables and used in our functions
echo "Enter server information:"
# Name your server. This will be prepended to the SSH keys for easy identification
read_with_default "Server designator (e.g., Proxmox, Linux, Web Server, etc.)" server_designator
echo "Server designator set to: $server_designator"
# Enter either an FQDN or IP address as the target
read_with_default "Server hostname or IP address" server_address
echo "Server hostname or IP address set to: $server_address"
# Enter the username you wish to use when initially logging into your server
# In most cases, this will likely be root here with the expectation of adding
# role based users for admin purposes once you're logged in to the server
read_with_default "Username for SSH login" server_username
echo "Username for SSH login set to: $server_username"

# Do what the function call suggests to prevent errors due to prior use of the same server info
check_for_known_hosts

# Sanitize the server designator for file naming
sanitized_server_designator=$(sanitize_for_filename "$server_designator")

# Generate key names based on the server information
key_name="${sanitized_server_designator}_id_rsa"
private_key_file="${key_name}"
public_key_file="${key_name}.pub"

# Check if keys already exist
# -f: Specifies the output file for the private key. The corresponding public key will have the '.pub' extension.
# -r: Do not allow backslashes to escape any characters (raw input).
# -p: Display the "prompt" without a trailing newline before reading the input.
if [ -f "$private_key_file" ] || [ -f "$public_key_file" ]; then
  echo "SSH key pair already exists for $key_name."
  read -r -p "Do you want to overwrite the existing keys? (y/N): " overwrite_keys
  if [[ ! $overwrite_keys =~ ^[Yy]$ ]]; then
    echo "Aborting key generation."
    exit 0
  fi
fi

# Ask for passphrase (optional)
read_with_default "Enter a passphrase for the private key (leave blank for no passphrase)" passphrase

# Generate the SSH key pair using 'ssh-keygen' command
# Flags used:
# -t: Specifies the type of key to create. In this case, 'rsa' is used for RSA key.
# -b: Specifies the number of bits in the key. 4096 bits is considered secure and recommended.
# -C: Adds a comment to the key, typically in the format "username@server_designator".
# -N: Provides the passphrase to encrypt the private key. If left empty, no passphrase will be set.
# -f: Specifies the output file for the private key. The corresponding public key will have the '.pub' extension.
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


# Further instructions I want to add into this script to make it a complete process for creating the keys 
# and getting onto the server they were created for right away.

# Locate Your Public Key: Ensure you know the path to your public SSH key on your local system. 
# By default, this might be ~/.ssh/id_rsa.pub for RSA keys or ~/.ssh/id_ed25519.pub for ED25519 keys. 
# If you've generated your key pair using your script, it should be wherever your script saved it.

# Transfer Your Public Key: You'll use the SCP command to transfer your public key file to your Proxmox server. 
# The general form of the command is as follows:
# scp /path/to/your/public_key.pub username@server_ip:/path/where/you/want/to/save

# For the sake of illustration, assuming your public key is ~/.ssh/id_rsa.pub, 
# the username is user, and the server IP is 192.168.1.101, the command will be:
# scp ~/.ssh/id_rsa.pub user@192.168.1.101:~/temp_pub_key.pub

# This command transfers your public key to the home directory of user on the server, 
# temporarily naming it temp_pub_key.pub.

# Append the Public Key to authorized_keys:

# First, SSH into your Proxmox server:
# ssh user@192.168.1.101

# Then, append the public key to the ~/.ssh/authorized_keys file. 
# If ~/.ssh/authorized_keys doesn't exist, this command will create it:
# cat ~/temp_pub_key.pub >> ~/.ssh/authorized_keys

# Ensure the permissions are correct:
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/authorized_keys

# Finally, you can remove the temporary public key file:
# rm ~/temp_pub_key.pub

# By the completion of these steps, you will have securely transferred your public SSH key to your Proxmox 
# server and appended it to the authorized_keys file, granting you passwordless SSH access.