### Outline of Steps to Disable Secure Boot Using Custom OVMF Firmware
Understanding OVMF and Secure Boot:

OVMF is a Unified Extensible Firmware Interface (UEFI) firmware for virtual machines.
https://en.wikipedia.org/wiki/UEFI

Secure Boot is a security feature that ensures only signed bootloaders and OS kernels are executed.

# Obtain a Custom OVMF Firmware File:

Download a pre-built OVMF firmware without Secure Boot, or
Compile your own OVMF firmware with Secure Boot disabled.
Configure the VM to Use the Custom OVMF Firmware:

Place the custom OVMF firmware file in a suitable directory.
Update the VM configuration to use this custom firmware.
Verify the Configuration:

Start the VM and ensure it uses the custom OVMF firmware.
Check Secure Boot status inside the VM.

### Detailed Steps
## 1. Understand OVMF and Secure Boot
OVMF (Open Virtual Machine Firmware) is a project to enable UEFI support for virtual machines. Secure Boot, part of the UEFI specification, aims to prevent unauthorized code from running during the boot process by verifying digital signatures.

## 2. Obtain a Custom OVMF Firmware File

# Option A: Download Pre-Built OVMF Firmware
Download a custom OVMF firmware without Secure Boot. Some resources provide these, but ensure you trust the source.

We'll download a pre-built OVMF firmware with Secure Boot disabled. One reliable source is the Arch Linux package repository, which provides pre-built OVMF files.

1. Download the Pre-Built OVMF Package:
```bash
wget https://archive.archlinux.org/packages/e/edk2-ovmf/edk2-ovmf-202311-1-any.pkg.tar.zst
```

Extract the Package:
We'll need to extract the pkg.tar.zst file to get the OVMF.fd file.
```bash
sudo apt-get install -y zstd
sudo mkdir -p /usr/share/ovmf/custom
tar -I zstd -xvf edk2-ovmf-202311-1-any.pkg.tar.zst -C /usr/share/ovmf/custom
```

2. Update VM Configuration
Edit the VM Configuration File:
Open the configuration file for your VM:
```bash
nano /etc/pve/qemu-server/101.conf
```

Update the Configuration to Use the Custom OVMF Firmware:
Modify the configuration file to use the custom firmware:
```plaintext
bios: ovmf
efidisk0: local-lvm:vm-101-disk-1,efitype=4m,pre-enrolled-keys=1,size=4M
args: -drive format=raw,readonly=off,file=/usr/share/ovmf/custom/usr/share/edk2/x64/OVMF_CODE.fd -drive format=raw,readonly=off,file=/usr/share/ovmf/custom/usr/share/edk2/x64/OVMF_VARS.fd
```

3. Start the VM and Verify
Start the VM:
```bash
qm start 101
```

Check Secure Boot Status:
Inside the VM, run:
```bash
mokutil --sb-state
```

# Option B: Compile Your Own OVMF Firmware
Install Build Dependencies:
```
    sudo apt-get update
    sudo apt-get install -y build-essential uuid-dev iasl git nasm gcc-5
```
Download EDK2 (OVMF Source):
```
    git clone https://github.com/tianocore/edk2.git
    cd edk2
    git submodule update --init
```

Set Up Build Environment:
```
    make -C BaseTools
    source edksetup.sh
```

Disable Secure Boot in OVMF:
Edit OvmfPkg/OvmfPkgX64.dsc to disable Secure Boot. Find and comment out or set the necessary configuration options.

Build OVMF:
```
    build -a X64 -t GCC5 -p OvmfPkg/OvmfPkgX64.dsc
```

Locate the Built Firmware:
The firmware file (OVMF.fd) should be in the Build/OvmfX64/DEBUG_GCC5/FV/ directory.

## 3. Configure the VM to Use the Custom OVMF Firmware
Place the Custom Firmware:
Move the custom OVMF.fd file to a suitable directory on your Proxmox host, for example, /usr/share/ovmf/custom/.
```
   sudo mkdir -p /usr/share/ovmf/custom
   sudo mv /path/to/custom/OVMF.fd /usr/share/ovmf/custom/OVMF.fd
```

Update VM Configuration:
Edit the VM configuration file to use the custom OVMF firmware.
```
    nano /etc/pve/qemu-server/101.conf
```

Add or modify the args line to point to the custom firmware:
```
    args: -drive if=pflash,format=raw,readonly=on,file=/usr/share/ovmf/custom/OVMF.fd
```

## 4. Verify the Configuration
Start the VM:
```
    qm start 101
```
Check Secure Boot Status:
Inside the VM, run:
```
mokutil --sb-state
```

Example Blog Post Structure
Introduction:

Brief overview of the problem.
Importance of disabling Secure Boot for certain installations (e.g., ROCm).
Step-by-Step Guide:

Detailed outline of steps.
Commands and explanations.
Compiling Custom OVMF:

Detailed instructions on compiling custom OVMF.
Tips and troubleshooting.
Configuring Proxmox VM:

How to configure the VM to use the custom OVMF.
Verification steps.
Conclusion:

Summary of steps.
Importance of documentation and sharing knowledge.


# Just in case. You might need these commands to clean up a dirty ovmf install?
apt-get remove --purge ovmf
apt-get update
apt-get install ovmf