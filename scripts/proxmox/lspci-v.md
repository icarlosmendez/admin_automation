root@proxmox:~# lspci -v
00:00.0 Host bridge: Intel Corporation 4th Gen Core Processor DRAM Controller (rev 06)
	Subsystem: Super Micro Computer Inc 4th Gen Core Processor DRAM Controller
	Flags: bus master, fast devsel, latency 0, IOMMU group 0
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel driver in use: hsw_uncore

00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller
	Flags: bus master, fast devsel, latency 0, IRQ 25, IOMMU group 1
	Bus: primary=00, secondary=01, subordinate=03, sec-latency=0
	I/O behind bridge: e000-efff [size=4K] [16-bit]
	Memory behind bridge: f7800000-f7afffff [size=3M] [32-bit]
	Prefetchable memory behind bridge: e0000000-f01fffff [size=258M] [32-bit]
	Capabilities: [88] Subsystem: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller
	Capabilities: [80] Power Management version 3
	Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [a0] Express Root Port (Slot+), MSI 00
	Capabilities: [100] Virtual Channel
	Capabilities: [140] Root Complex Link
	Capabilities: [d94] Secondary PCI Express
	Kernel driver in use: pcieport

00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI (rev 05) (prog-if 30 [XHCI])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family USB xHCI
	Flags: bus master, medium devsel, latency 0, IRQ 40, IOMMU group 2
	Memory at f7f20000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: [70] Power Management version 2
	Capabilities: [80] MSI: Enable+ Count=8/8 Maskable- 64bit+
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:16.0 Communication controller: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 (rev 04)
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family MEI Controller
	Flags: bus master, fast devsel, latency 0, IRQ 56, IOMMU group 3
	Memory at f7f3b000 (64-bit, non-prefetchable) [size=16]
	Capabilities: [50] Power Management version 3
	Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:19.0 Ethernet controller: Intel Corporation Ethernet Connection I217-V (rev 05)
	DeviceName:  Onboard LAN
	Subsystem: Super Micro Computer Inc Ethernet Connection I217-V
	Flags: bus master, fast devsel, latency 0, IRQ 38, IOMMU group 4
	Memory at f7f00000 (32-bit, non-prefetchable) [size=128K]
	Memory at f7f39000 (32-bit, non-prefetchable) [size=4K]
	I/O ports at f020 [size=32]
	Capabilities: [c8] Power Management version 2
	Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [e0] PCI Advanced Features
	Kernel driver in use: e1000e
	Kernel modules: e1000e

00:1a.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #2 (rev 05) (prog-if 20 [EHCI])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family USB EHCI
	Flags: bus master, medium devsel, latency 0, IRQ 16, IOMMU group 5
	Memory at f7f38000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Capabilities: [98] PCI Advanced Features
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset High Definition Audio Controller (rev 05)
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset High Definition Audio Controller
	Flags: bus master, fast devsel, latency 0, IRQ 57, IOMMU group 6
	Memory at f7f30000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 2
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
	Capabilities: [100] Virtual Channel
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #1 (rev d5) (prog-if 00 [Normal decode])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Flags: bus master, fast devsel, latency 0, IRQ 26, IOMMU group 7
	Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
	I/O behind bridge: 2000-2fff [size=4K] [16-bit]
	Memory behind bridge: f0200000-f03fffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: 81f000000-81f1fffff [size=2M] [32-bit]
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Capabilities: [a0] Power Management version 3
	Kernel driver in use: pcieport

00:1c.3 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #4 (rev d5) (prog-if 00 [Normal decode])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Flags: bus master, fast devsel, latency 0, IRQ 27, IOMMU group 8
	Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
	I/O behind bridge: d000-dfff [size=4K] [16-bit]
	Memory behind bridge: f7e00000-f7efffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Capabilities: [a0] Power Management version 3
	Kernel driver in use: pcieport

00:1c.5 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #6 (rev d5) (prog-if 00 [Normal decode])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Flags: bus master, fast devsel, latency 0, IRQ 28, IOMMU group 9
	Bus: primary=00, secondary=06, subordinate=07, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: f7d00000-f7dfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Capabilities: [a0] Power Management version 3
	Kernel driver in use: pcieport

00:1c.6 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #7 (rev d5) (prog-if 00 [Normal decode])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Flags: bus master, fast devsel, latency 0, IRQ 29, IOMMU group 10
	Bus: primary=00, secondary=08, subordinate=08, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: f7c00000-f7cfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Capabilities: [a0] Power Management version 3
	Kernel driver in use: pcieport

00:1c.7 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #8 (rev d5) (prog-if 00 [Normal decode])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Flags: bus master, fast devsel, latency 0, IRQ 30, IOMMU group 11
	Bus: primary=00, secondary=09, subordinate=09, sec-latency=0
	I/O behind bridge: c000-cfff [size=4K] [16-bit]
	Memory behind bridge: f7b00000-f7bfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family PCI Express Root Port
	Capabilities: [a0] Power Management version 3
	Kernel driver in use: pcieport

00:1d.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #1 (rev 05) (prog-if 20 [EHCI])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family USB EHCI
	Flags: bus master, medium devsel, latency 0, IRQ 23, IOMMU group 12
	Memory at f7f37000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Capabilities: [98] PCI Advanced Features
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:1f.0 ISA bridge: Intel Corporation Z87 Express LPC Controller (rev 05)
	Subsystem: Super Micro Computer Inc Z87 Express LPC Controller
	Flags: bus master, medium devsel, latency 0, IOMMU group 13
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel driver in use: lpc_ich
	Kernel modules: lpc_ich

00:1f.2 SATA controller: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] (rev 05) (prog-if 01 [AHCI 1.0])
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode]
	Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 32, IOMMU group 13
	I/O ports at f070 [size=8]
	I/O ports at f060 [size=4]
	I/O ports at f050 [size=8]
	I/O ports at f040 [size=4]
	I/O ports at f000 [size=32]
	Memory at f7f36000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [70] Power Management version 3
	Capabilities: [a8] SATA HBA v1.0
	Kernel driver in use: ahci
	Kernel modules: ahci

00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller (rev 05)
	Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family SMBus Controller
	Flags: medium devsel, IRQ 18, IOMMU group 13
	Memory at f7f35000 (64-bit, non-prefetchable) [size=256]
	I/O ports at 0580 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

00:1f.6 Signal processing controller: Intel Corporation 8 Series Chipset Family Thermal Management Controller (rev 05)
	Subsystem: Super Micro Computer Inc 8 Series Chipset Family Thermal Management Controller
	Flags: bus master, fast devsel, latency 0, IRQ 18, IOMMU group 13
	Memory at f7f34000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [50] Power Management version 3
	Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
	Kernel driver in use: intel_pch_thermal
	Kernel modules: intel_pch_thermal

01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch (rev 10) (prog-if 00 [Normal decode])
	Flags: bus master, fast devsel, latency 0, IRQ 16, IOMMU group 1
	Memory at f7a00000 (32-bit, non-prefetchable) [size=16K]
	Bus: primary=01, secondary=02, subordinate=03, sec-latency=0
	I/O behind bridge: e000-efff [size=4K] [16-bit]
	Memory behind bridge: f7800000-f79fffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: e0000000-f01fffff [size=258M] [32-bit]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [58] Express Upstream Port, MSI 00
	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [270] Secondary PCI Express
	Capabilities: [320] Latency Tolerance Reporting
	Capabilities: [400] Data Link Feature <?>
	Capabilities: [410] Physical Layer 16.0 GT/s <?>
	Capabilities: [440] Lane Margining at the Receiver <?>
	Kernel driver in use: pcieport

02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch (rev 10) (prog-if 00 [Normal decode])
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
	Flags: bus master, fast devsel, latency 0, IRQ 31, IOMMU group 1
	Bus: primary=02, secondary=03, subordinate=03, sec-latency=0
	I/O behind bridge: e000-efff [size=4K] [16-bit]
	Memory behind bridge: f7800000-f79fffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: e0000000-f01fffff [size=258M] [32-bit]
	Capabilities: [50] Power Management version 3
	Capabilities: [58] Express Downstream Port (Slot-), MSI 00
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [270] Secondary PCI Express
	Capabilities: [2a0] Access Control Services
	Capabilities: [400] Data Link Feature <?>
	Capabilities: [410] Physical Layer 16.0 GT/s <?>
	Capabilities: [450] Lane Margining at the Receiver <?>
	Kernel driver in use: pcieport

03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 [Radeon RX 7900 XT/7900 XTX] (rev cc) (prog-if 00 [VGA controller])
	Subsystem: XFX Limited Navi 31 [Radeon RX 7900 XT/7900 XTX]
	Flags: fast devsel, IRQ 16, IOMMU group 1
	Memory at e0000000 (64-bit, prefetchable) [size=256M]
	Memory at f0000000 (64-bit, prefetchable) [size=2M]
	I/O ports at e000 [size=256]
	Memory at f7800000 (32-bit, non-prefetchable) [size=1M]
	Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [64] Express Legacy Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [200] Physical Resizable BAR
	Capabilities: [240] Power Budgeting <?>
	Capabilities: [270] Secondary PCI Express
	Capabilities: [2a0] Access Control Services
	Capabilities: [2d0] Process Address Space ID (PASID)
	Capabilities: [320] Latency Tolerance Reporting
	Capabilities: [410] Physical Layer 16.0 GT/s <?>
	Capabilities: [450] Lane Margining at the Receiver <?>
	Kernel driver in use: vfio-pci
	Kernel modules: amdgpu

03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 HDMI/DP Audio
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 HDMI/DP Audio
	Flags: fast devsel, IRQ 17, IOMMU group 1
	Memory at f7920000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [64] Express Legacy Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [2a0] Access Control Services
	Kernel driver in use: vfio-pci
	Kernel modules: snd_hda_intel

05:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Connection (rev 03)
	Subsystem: Super Micro Computer Inc I210 Gigabit Network Connection
	Flags: bus master, fast devsel, latency 0, IRQ 19, IOMMU group 14
	Memory at f7e00000 (32-bit, non-prefetchable) [size=512K]
	I/O ports at d000 [size=32]
	Memory at f7e80000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [40] Power Management version 3
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
	Capabilities: [a0] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [140] Device Serial Number 00-25-90-ff-ff-87-13-15
	Capabilities: [1a0] Transaction Processing Hints
	Kernel driver in use: igb
	Kernel modules: igb

06:00.0 PCI bridge: Tundra Semiconductor Corp. Device 8113 (rev 01) (prog-if 01 [Subtractive decode])
	Subsystem: Super Micro Computer Inc Device 0653
	Flags: bus master, fast devsel, latency 0, IOMMU group 15
	Bus: primary=06, secondary=07, subordinate=07, sec-latency=32
	I/O behind bridge: [disabled] [32-bit]
	Memory behind bridge: f7d00000-f7dfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [60] Subsystem: Super Micro Computer Inc Device 0653
	Capabilities: [a0] Power Management version 3

07:03.0 FireWire (IEEE 1394): Texas Instruments TSB43AB22A IEEE-1394a-2000 Controller (PHY/Link) [iOHCI-Lynx] (prog-if 10 [OHCI])
	Subsystem: Super Micro Computer Inc TSB43AB22A IEEE-1394a-2000 Controller (PHY/Link) [iOHCI-Lynx]
	Physical Slot: 4
	Flags: bus master, medium devsel, latency 32, IRQ 16, IOMMU group 15
	Memory at f7d04000 (32-bit, non-prefetchable) [size=2K]
	Memory at f7d00000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [44] Power Management version 2
	Kernel driver in use: firewire_ohci
	Kernel modules: firewire_ohci

08:00.0 USB controller: Renesas Technology Corp. uPD720202 USB 3.0 Host Controller (rev 02) (prog-if 30 [XHCI])
	Subsystem: Super Micro Computer Inc uPD720202 USB 3.0 Host Controller
	Flags: bus master, fast devsel, latency 0, IRQ 18, IOMMU group 16
	Memory at f7c00000 (64-bit, non-prefetchable) [size=8K]
	Capabilities: [50] Power Management version 3
	Capabilities: [70] MSI: Enable- Count=1/8 Maskable- 64bit+
	Capabilities: [90] MSI-X: Enable+ Count=8 Masked-
	Capabilities: [a0] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [150] Latency Tolerance Reporting
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

09:00.0 SATA controller: ASMedia Technology Inc. ASM1062 Serial ATA Controller (rev 01) (prog-if 01 [AHCI 1.0])
	Subsystem: Super Micro Computer Inc ASM1062 Serial ATA Controller
	Flags: bus master, fast devsel, latency 0, IRQ 39, IOMMU group 17
	I/O ports at c050 [size=8]
	I/O ports at c040 [size=4]
	I/O ports at c030 [size=8]
	I/O ports at c020 [size=4]
	I/O ports at c000 [size=32]
	Memory at f7b00000 (32-bit, non-prefetchable) [size=512]
	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [78] Power Management version 3
	Capabilities: [80] Express Legacy Endpoint, MSI 00
	Capabilities: [100] Virtual Channel
	Kernel driver in use: ahci
	Kernel modules: ahci