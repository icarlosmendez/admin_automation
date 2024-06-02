# !bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <singularity_config.sh>
# * Description       : <Setup Singularity>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by Failure>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Local LLMs, what else?

# Prerequisites:
# Logged in as root. Not anyone with a sudoers account. Root.
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/singularity_config.sh

# https://apptainer.org/user-docs/master/quick_start.html
# Prep the dist for package install
# Ensure repositories are up-to-date
apt-get update
# Install debian packages for dependencies
apt-get install -y \
   autoconf \
   automake \
   cryptsetup \
   git \
   libfuse-dev \
   libglib2.0-dev \
   libseccomp-dev \
   libtool \
   pkg-config \
   runc \
   squashfs-tools \
   squashfs-tools-ng \
   uidmap \
   wget \
   zlib1g-dev

# Install GO (Select appropriate version for your host)
# https://go.dev/dl/
# Replace/Adjust the values as needed
export VERSION=1.22.3 OS=linux ARCH=amd64 && \  
    # Downloads the specified verions of Go
    wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
    # Extracts the archive 
    sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && \ 
    # Deletes the ``tar`` file
    rm go$VERSION.$OS-$ARCH.tar.gz    

# Set the Environment variable PATH to point to Gol
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc && \
  source ~/.bashrc
export PATH=$PATH:/usr/local/go/bin

# Add Go to the root user's PATH
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify Go installation
go version

# Install Singularity
# https://github.com/apptainer/singularity/releases
# Replace/Adjust the values as needed
export VERSION=4.1.0 && \
    # Downloads the specified verions of
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz && \
    # Extracts the archive
    tar -xzf singularity-ce-${VERSION}.tar.gz && \
    # Deletes the ``tar`` file
    cd singularity-ce-${VERSION}

# Compile the source code for Singularity
# In order for this next code to run, you have to be inside the Singularity directory or it will constantly fail. At least I experienced that on Ubuntu.
# I notice when I was about to add the cd command down here that it is the last line in the block of code above, but for some reason, it never seemed to work. I had to manually cd and then the code below will run. ?
# I think hardcoding the version might be the way to get it to run as expected.

./mconfig && \
    make -C builddir && \
    make -C builddir install


**********************************************************************
# sudo lshw -c video