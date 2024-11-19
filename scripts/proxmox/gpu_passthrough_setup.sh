#!/bin/bash

set -e

# Configuration Variables (Update these as needed)
VMID=101
GPU_PCI_ID="0000:03:00.0"
AUDIO_PCI_ID="0000:03:00.1"
ROM_OUTPUT_DIR="/usr/share/kvm"
ROM_FILE="$ROM_OUTPUT_DIR/gpu.rom"

# Ensure Required Directories Exist
mkdir -p "$ROM_OUTPUT_DIR"

# Step 1: Verify GPU Visibility
echo "Verifying GPU visibility..."
lspci -nnk | grep VGA -A 2 || { echo "GPU not found. Exiting."; exit 1; }

# Step 2: Verify IOMMU Group
echo "Verifying IOMMU group..."
find /sys/kernel/iommu_groups/ -type l | grep "$GPU_PCI_ID" || {
    echo "GPU not isolated in an IOMMU group. Ensure BIOS settings are correct. Exiting."
    exit 1
}

# Step 3: Configure Grub for IOMMU
echo "Configuring GRUB for IOMMU..."
GRUB_FILE="/etc/default/grub"
if ! grep -q "intel_iommu=on" "$GRUB_FILE"; then
    sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="/&intel_iommu=on iommu=pt /' "$GRUB_FILE"
    update-grub
    echo "GRUB updated. Please reboot the system and rerun this script."
    exit 0
fi

# Step 4: Bind GPU to vfio-pci
echo "Binding GPU to vfio-pci..."
echo "$GPU_PCI_ID" > /sys/bus/pci/devices/$GPU_PCI_ID/driver/unbind || true
echo "$AUDIO_PCI_ID" > /sys/bus/pci/devices/$AUDIO_PCI_ID/driver/unbind || true
echo "vfio-pci" > /sys/bus/pci/devices/$GPU_PCI_ID/driver_override
echo "vfio-pci" > /sys/bus/pci/devices/$AUDIO_PCI_ID/driver_override
echo "$GPU_PCI_ID" > /sys/bus/pci/drivers_probe
echo "$AUDIO_PCI_ID" > /sys/bus/pci/drivers_probe

# Step 5: Extract ROM File (if necessary)
if [ ! -f "$ROM_FILE" ]; then
    echo "Extracting GPU ROM..."
    echo 1 > /sys/bus/pci/devices/$GPU_PCI_ID/rom
    cat /sys/bus/pci/devices/$GPU_PCI_ID/rom > "$ROM_FILE" || {
        echo "ROM extraction failed. Skipping ROM setup."
        rm -f "$ROM_FILE"
    }
    echo 0 > /sys/bus/pci/devices/$GPU_PCI_ID/rom
else
    echo "ROM file already exists: $ROM_FILE"
fi

# Step 6: Configure VM for GPU Passthrough
echo "Configuring VM $VMID for GPU passthrough..."
qm set $VMID -hostpci0 $GPU_PCI_ID,romfile="$ROM_FILE"
qm set $VMID -hostpci1 $AUDIO_PCI_ID
qm set $VMID -machine q35
qm set $VMID -cpu host,kvm=off
qm set $VMID -bios ovmf

# Step 7: Verify VM Configuration
echo "Verifying VM configuration..."
qm config $VMID

# Step 8: Start VM
echo "Starting VM $VMID..."
qm start $VMID

# Step 9: Verify GPU Initialization in VM
echo "Checking GPU initialization in VM..."
if qm status $VMID | grep -q "running"; then
    echo "VM is running. Check inside the VM for GPU presence with 'lspci' and 'dmesg'."
else
    echo "VM failed to start. Check Proxmox logs for more details."
fi

echo "GPU passthrough setup complete!"
