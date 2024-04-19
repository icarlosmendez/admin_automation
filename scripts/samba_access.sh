#!/bin/bash

# Description: Script to install and configure Samba in Ubuntu.
# Orignal Author: Gustavo Salazar L.
# Date: 2013-03-27
# Modified and adapted by: Carlos Mendez
# Date: 2024-04-03

#
# How to use:
#   chmod +x samba-access.sh
#   ./samba-access.sh PATH_TO_SHARED_DIRECTORY  PERMISSIONS
#
#
# $1 = path , e.g. /home/myuser/publicdir
# $2 = permissions  ,  e.g  755
#


if [ -z "$1" ];then
  echo "How to use this script?"
  echo "./samba-acess.sh  PATH_TO_SHARED_DIRECTORY  PERMISSIONS"
  exit 0
fi

if [ -z "$2" ];then
  echo "Pass the persmissions of the directory you want to share as the second parameter."
  exit 0
fi



# Install Samba

samba_not_installed=$(dpkg -s samba 2>&1 | grep "not installed")
if [ -n "$samba_not_installed" ];then
  echo "Installing Samba"
  apt-get install samba -y
fi

# Configure directory that will be accessed with Samba

echo "
[public]
comment = My Public Folder
path = $1
public = yes
writable = yes
create mast = 0$2
# force user = nobody
# force group = nogroup
guest ok = yes
security = SHARE
# security = USER
" | tee -a /etc/samba/smb.conf


# Restart Samba service

/etc/init.d/smbd restart

# Give persmissions to shared directory

chmod -R $2 $1

# Message to the User
echo "To access the shared machine:"
echo "Windows: Open File Explorer and enter \\\\$HOSTNAME"
echo "Macintosh: Open Finder, then click Go -> Connect to Server, and enter smb://\$HOSTNAME/public"