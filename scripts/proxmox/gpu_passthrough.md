This tutorial provides a comprehensive guide on installing and configuring GPU passthrough in Proxmox for use with a Windows 11 virtual machine. This step-by-step guide offers clear instructions and explanations to navigate the process smoothly. From understanding the basics of GPU passthrough to completing the installation, users will find all the necessary guidance here.

Step by Step tasks:

Step 1: Edit GRUB  
  Execute: nano /etc/default/grub 
     Change this line from 
   GRUB_CMDLINE_LINUX_DEFAULT="quiet"
     to 
   GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt pcie_acs_override=downstream,multifunction nofb nomodeset video=vesafb:off,efifb:off"
  Save file and exit the text editor  
   
Step 2: Update GRUB  
  Execute the command: update-grub 
   
Step 3: Edit the module files   
  Execute: nano /etc/modules 
     Add these lines: 
   vfio
   vfio_iommu_type1
   vfio_pci
   vfio_virqfd
  Save file and exit the text editor  
   
Step 4: IOMMU remapping  
 a) Execute: nano /etc/modprobe.d/iommu_unsafe_interrupts.conf 
     Add this line: 
   options vfio_iommu_type1 allow_unsafe_interrupts=1
     Save file and exit the text editor  
 b) Execute: nano /etc/modprobe.d/kvm.conf 
     Add this line: 
   options kvm ignore_msrs=1
  Save file and exit the text editor  
   
Step 5: Blacklist the GPU drivers  
  Execute: nano /etc/modprobe.d/blacklist.conf 
     Add these lines: 
   blacklist radeon
   blacklist nouveau
   blacklist nvidia
   blacklist nvidiafb
  Save file and exit the text editor  
   
Step 6: Adding GPU to VFIO  
 a) Execute: lspci -v 
     Look for your GPU and take note of the first set of numbers 
 b) Execute: lspci -n -s (PCI card address) 
   This command gives you the GPU vendors number.
 c) Execute: nano /etc/modprobe.d/vfio.conf 
     Add this line with your GPU number and Audio number: 
   options vfio-pci ids=(GPU number,Audio number) disable_vga=1
  Save file and exit the text editor  
   
Step 7: Command to update everything and Restart  
 a) Execute: update-initramfs -u 
 b) Then restart the your Proxmox Node