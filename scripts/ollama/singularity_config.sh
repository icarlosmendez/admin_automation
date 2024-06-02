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
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/singularity_config.sh

# https://apptainer.org/user-docs/master/quick_start.html
# Prep the dist for package install
# Ensure repositories are up-to-date
sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
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
sudo echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc && \
  source ~/.bashrc
export PATH=$PATH:/usr/local/go/bin

# Add Go to the root user's PATH
sudo -i
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
exit

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
sudo ./mconfig && \
    sudo make -C builddir && \
    sudo make -C builddir install


**********************************************************************
# sudo lshw -c video
#   *-display                 
#        description: VGA compatible controller
#        product: Advanced Micro Devices, Inc. [AMD/ATI]
#        vendor: Advanced Micro Devices, Inc. [AMD/ATI]
#        physical id: 10
#        bus info: pci@0000:06:10.0
#        logical name: /dev/fb0
#        version: cc
#        width: 64 bits
#        clock: 33MHz
#        capabilities: pm msi vga_controller bus_master cap_list rom fb
#        configuration: depth=32 driver=amdgpu latency=0 resolution=1920,1200
#        resources: iomemory:80-7f iomemory:80-7f irq:40 memory:800000000-80fffffff memory:810000000-8101fffff ioport:6000(size=256) memory:80600000-806fffff memory:80720000-8073ffff
# ubuntu@ollama:~$ dmesg | grep amdgpu
# dmesg: read kernel buffer failed: Operation not permitted
# ubuntu@ollama:~$ sudo dmesg | grep amdgpu
# [    3.165029] [drm] amdgpu kernel modesetting enabled.
# [    3.165508] [drm] amdgpu version: 6.7.0
# [    3.166433] amdgpu: Virtual CRAT table created for CPU
# [    3.166870] amdgpu: Topology: Add CPU node
# [    3.182256] amdgpu: PeerDirect support was initialized successfully
# [    3.215852] amdgpu 0000:06:10.0: No more image in the PCI ROM
# [    3.249842] amdgpu 0000:06:10.0: amdgpu: Fetched VBIOS from ROM BAR
# [    3.250503] amdgpu: ATOM BIOS: 113-31TESHAS1-L02
# [    3.251523] amdgpu 0000:06:10.0: amdgpu: CP RS64 enable
# [    3.253668] amdgpu 0000:06:10.0: [drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
# [    3.255189] amdgpu 0000:06:10.0: vgaarb: deactivate vga console
# [    3.255736] amdgpu 0000:06:10.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
# [    3.256752] amdgpu 0000:06:10.0: amdgpu: PCIE atomic ops is not supported
# [    3.257457] amdgpu 0000:06:10.0: amdgpu: MEM ECC is not presented.
# [    3.258009] amdgpu 0000:06:10.0: amdgpu: SRAM ECC is not presented.
# [    3.266747] amdgpu 0000:06:10.0: BAR 2: releasing [mem 0x810000000-0x8101fffff 64bit pref]
# [    3.267677] amdgpu 0000:06:10.0: BAR 0: releasing [mem 0x800000000-0x80fffffff 64bit pref]
# [    3.268488] amdgpu 0000:06:10.0: BAR 0: assigned [mem 0x800000000-0x80fffffff 64bit pref]
# [    3.269351] amdgpu 0000:06:10.0: BAR 2: assigned [mem 0x810000000-0x8101fffff 64bit pref]
# [    3.281357] amdgpu 0000:06:10.0: amdgpu: VRAM: 20464M 0x0000008000000000 - 0x00000084FEFFFFFF (20464M used)
# [    3.282344] amdgpu 0000:06:10.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
# [    3.284445] [drm] amdgpu: 20464M of VRAM memory ready
# [    3.284935] [drm] amdgpu: 1470M of GTT memory ready.
# [    3.290636] amdgpu 0000:06:10.0: amdgpu: Will use PSP to load VCN firmware
# [    3.364377] amdgpu 0000:06:10.0: amdgpu: reserve 0x1300000 from 0x84fc000000 for PSP TMR
# [    3.510697] amdgpu 0000:06:10.0: amdgpu: RAP: optional rap ta ucode is not available
# [    3.511336] amdgpu 0000:06:10.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
# [    3.512090] amdgpu 0000:06:10.0: amdgpu: smu driver if version = 0x0000003d, smu fw if version = 0x00000040, smu fw program = 0, smu fw version = 0x004e7c00 (78.124.0)
# [    3.513170] amdgpu 0000:06:10.0: amdgpu: SMU driver if version not matched
# [    3.683648] amdgpu 0000:06:10.0: amdgpu: SMU is initialized successfully!
# [    3.723836] amdgpu 0000:06:10.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
# [    3.811787] amdgpu: HMM registered 20464MB device memory
# [    3.815819] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
# [    3.816225] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
# [    3.816729] amdgpu: Virtual CRAT table created for GPU
# [    3.817270] amdgpu: Topology: Add dGPU node [0x744c:0x1002]
# [    3.817627] kfd kfd: amdgpu: added device 1002:744c
# [    3.817981] amdgpu 0000:06:10.0: amdgpu: SE 6, SH per SE 2, CU per SH 8, active_cu_number 84
# [    3.818528] amdgpu 0000:06:10.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
# [    3.819049] amdgpu 0000:06:10.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
# [    3.819540] amdgpu 0000:06:10.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
# [    3.820047] amdgpu 0000:06:10.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
# [    3.820541] amdgpu 0000:06:10.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
# [    3.821056] amdgpu 0000:06:10.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
# [    3.821546] amdgpu 0000:06:10.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
# [    3.822052] amdgpu 0000:06:10.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
# [    3.822557] amdgpu 0000:06:10.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
# [    3.823070] amdgpu 0000:06:10.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
# [    3.823543] amdgpu 0000:06:10.0: amdgpu: ring sdma1 uses VM inv eng 13 on hub 0
# [    3.824030] amdgpu 0000:06:10.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
# [    3.824541] amdgpu 0000:06:10.0: amdgpu: ring vcn_unified_1 uses VM inv eng 1 on hub 8
# [    3.825094] amdgpu 0000:06:10.0: amdgpu: ring jpeg_dec uses VM inv eng 4 on hub 8
# [    3.825578] amdgpu 0000:06:10.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
# [    3.831964] amdgpu: legacy kernel without apple_gmux_detect()
# [    3.832407] amdgpu 0000:06:10.0: amdgpu: Using BACO for runtime pm
# [    3.833769] [drm] Initialized amdgpu 3.57.0 20150101 for 0000:06:10.0 on minor 0
# [    3.840249] fbcon: amdgpudrmfb (fb0) is primary device
# [    3.961251] amdgpu 0000:06:10.0: [drm] fb0: amdgpudrmfb frame buffer device