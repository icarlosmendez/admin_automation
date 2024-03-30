#!/bin/bash
# macOS Nix Package Manager Removal Script

# Define ANSI color codes
RED='\033[0;31m'    # Red text
GREEN='\033[0;32m'  # Green text
BLUE='\033[0;34m'   # Blue text
NC='\033[0m'        # No color (resets text attributes)

# Function to print dots one at a time with a delay
print_dots() {
  local dots=""
  local count=0
  local max_count=3  # Adjust the number of dots as needed

  while [ $count -lt $max_count ]; do
    dots+="."
    echo -ne "\r$1$dots   "  # -ne allows overwriting the line
    sleep 1  # Adjust the sleep duration as needed
    ((count++))
  done

  echo ""  # Move to the next line after the dots
}

# Example usage
# echo "Processing something"
# print_dots "Working"

# Function to remove lines sourcing nix-daemon.sh from a file
remove_nix_lines() {
  local file="$1"
  # Use grep to check if lines sourcing nix-daemon.sh exist in the working file
  if grep -q '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' "$file"; then
    # Indicate that the lines were found and will be removed
    echo "Lines sourcing nix-daemon.sh found in $file and will be removed."
    echo ""
    print_dots "Working"
    echo ""
    # Use sed to remove the following lines from the working file
    # Nix
    #  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    #    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    #  fi
    # End Nix

    echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
    echo ""
    echo "I am executing:"
    echo "    sudo sed '/# Nix/,/# End Nix/d' "$file" > "$file.temp" && sudo mv "$file.temp" "$file""
    echo ""
    print_dots "Working"
    echo ""

    # Use a temporary file to store the modified content, 
    # which is then moved back to the original file
    sudo sed '/# Nix/,/# End Nix/d' "$file" > "$file.temp" && sudo mv "$file.temp" "$file"

    # Indicate that the lines were removed
    echo "Lines sourcing nix-daemon.sh removed from $file."
    echo ""
    print_dots "Working"
    echo ""

    # Remove the backup file
    echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
    echo ""
    echo "I am executing:"
    echo "    sudo rm "$file.backup-before-nix""
    echo ""
    print_dots "Working"
    echo ""
    sudo rm "$file.backup-before-nix"

  else
    # Indicate that no lines were found and none were removed
    echo "No lines sourcing nix-daemon.sh found in $file and none were removed."
    echo ""
    
    # Remove the backup file
    echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
    echo ""
    echo "I am executing:"
    echo "    sudo rm "$file.backup-before-nix""
    echo ""
    print_dots "Working"
    echo ""
    sudo rm "$file.backup-before-nix"
  fi
}

# Stop and remove Nix daemon services
echo "Stopping and removing Nix daemon services..."
echo ""
print_dots "Preparing"
echo ""

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo "I am executing:"
echo "    sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist"
echo ""
print_dots "Working"
echo ""
sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist"
echo ""
print_dots "Working"
echo ""
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist"
echo ""
print_dots "Working"
echo ""
sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist"
echo ""
print_dots "Working"
echo ""
sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist

# Remove lines sourcing nix-daemon.sh from configuration files
echo "Removing Nix package manager configuration..."
echo ""
print_dots "Working"
echo ""
remove_nix_lines "/etc/zshrc"
remove_nix_lines "/etc/bashrc"
remove_nix_lines "/etc/bash.bashrc"

# Remove the nixbld group and the _nixbuildN users
echo "Removing nixbld group and _nixbuildN users..."
echo ""
print_dots "Working"
echo ""

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo dscl . -delete /Groups/nixbld"
echo ""
print_dots "Working"
echo ""
sudo dscl . -delete /Groups/nixbld
for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done

# Edit fstab to prevent automatic mounting of Nix Store volume
echo "Editing fstab to prevent Nix Store volume mounting..."
echo ""
print_dots "Working"
echo ""

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo vifs -s <<EOF
          /grep UUID=<uuid> \/nix/d
          /grep LABEL=Nix\040Store \/nix/d
          EOF"
echo ""
print_dots "Working"
echo ""
sudo vifs -s <<EOF
/grep UUID=<uuid> \/nix/d
/grep LABEL=Nix\040Store \/nix/d
EOF

# Edit synthetic.conf to remove the Nix line
echo "Editing synthetic.conf to remove Nix line..."
echo ""

print_dots "Working"
echo ""
if [ -e "/etc/synthetic.conf" ]; then
  
  echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
  echo ""
  echo "I am executing:"
  echo "    sudo sed -i.bak '/nix/d' /etc/synthetic.conf"
  echo ""
  print_dots "Working"
  echo ""
  sudo sed -i.bak '/nix/d' /etc/synthetic.conf
else

  echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
  echo ""
  echo "I am executing:"
  echo "    sudo rm /etc/synthetic.conf"
  echo ""
  print_dots "Working"
  echo ""
  sudo rm /etc/synthetic.conf
fi

# Remove Nix-related files and directories
echo "Removing Nix-related files and directories..."
echo ""
print_dots "Working"
echo ""

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels"
echo ""
print_dots "Working"
echo ""
sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels

# Remove the Nix Store volume
echo "Removing the Nix Store volume..."
echo ""
print_dots "Working"
echo ""

echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
echo ""
echo "I am executing:"
echo "    sudo diskutil apfs deleteVolume /nix"
echo ""
print_dots "Working"
echo ""
sudo diskutil apfs deleteVolume /nix

# Check for unmounted Nix Store volume
nix_volume_exists=$(diskutil list | grep "Nix Store")
if [ -n "$nix_volume_exists" ]; then
  echo "Unmounted Nix Store volume found. Deleting..."
  echo ""
  print_dots "Working"
  echo ""
  nix_volume_identifier=$(echo "$nix_volume_exists" | awk '{print $6}')

  echo -e "${BLUE}---- sudo execution ------------------------------------------------------------${NC}"
  echo ""
  echo "I am executing:"
  echo "    sudo diskutil apfs deleteVolume "$nix_volume_identifier""
  echo ""
  print_dots "Working"
  echo ""
  sudo diskutil apfs deleteVolume "$nix_volume_identifier"
fi

# Script completed successfully
echo ""
echo "You do not have to reboot to finish uninstalling Nix."
echo ""
print_dots "Finishing"
echo ""
echo "The empty /nix directory will disappear after a system reboot."
echo ""
print_dots "Cleaning"
echo ""
echo "Nix package manager removal completed successfully."
echo ""
echo "Have a great day!"