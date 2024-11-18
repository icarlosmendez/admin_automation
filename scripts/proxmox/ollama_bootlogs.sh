ubuntu@ollama:~$ sudo dmesg
[    0.000000] Linux version 5.15.0-125-generic (buildd@lcy02-amd64-040) (gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #135-Ubuntu SMP Fri Sep 27 13:53:58 UTC 2024 (Ubuntu 5.15.0-125.135-generic 5.15.167)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.15.0-125-generic root=UUID=bf453e68-d55e-403f-b45d-f64c29d4ee88 ro console=tty1 console=ttyS0
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai  
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000805fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000806000-0x0000000000807fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000000808000-0x000000000080ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000810000-0x00000000008fffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000000900000-0x00000000be683fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000be684000-0x00000000be692fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000be693000-0x00000000becf6fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000becf7000-0x00000000bedf8fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000bedf9000-0x00000000bf8ebfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bf8ec000-0x00000000bfb6bfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000bfb6c000-0x00000000bfb7dfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000bfb7e000-0x00000000bfbfdfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000bfbfe000-0x00000000bfedbfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bfedc000-0x00000000bff5ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000bff60000-0x00000000bfffffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000043fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xbdfc2018-0xbdfcba57] usable ==> usable
[    0.000000] e820: update [mem 0xbdfc2018-0xbdfcba57] usable ==> usable
[    0.000000] e820: update [mem 0xbdfa6018-0xbdfc1857] usable ==> usable
[    0.000000] e820: update [mem 0xbdfa6018-0xbdfc1857] usable ==> usable
[    0.000000] e820: update [mem 0xbdf7e018-0xbdfa5457] usable ==> usable
[    0.000000] e820: update [mem 0xbdf7e018-0xbdfa5457] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000000805fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000806000-0x0000000000807fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000000808000-0x000000000080ffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000810000-0x00000000008fffff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000000900000-0x00000000bdf7e017] usable
[    0.000000] reserve setup_data: [mem 0x00000000bdf7e018-0x00000000bdfa5457] usable
[    0.000000] reserve setup_data: [mem 0x00000000bdfa5458-0x00000000bdfa6017] usable
[    0.000000] reserve setup_data: [mem 0x00000000bdfa6018-0x00000000bdfc1857] usable
[    0.000000] reserve setup_data: [mem 0x00000000bdfc1858-0x00000000bdfc2017] usable
[    0.000000] reserve setup_data: [mem 0x00000000bdfc2018-0x00000000bdfcba57] usable
[    0.000000] reserve setup_data: [mem 0x00000000bdfcba58-0x00000000be683fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000be684000-0x00000000be692fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000be693000-0x00000000becf6fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000becf7000-0x00000000bedf8fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000bedf9000-0x00000000bf8ebfff] usable
[    0.000000] reserve setup_data: [mem 0x00000000bf8ec000-0x00000000bfb6bfff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000bfb6c000-0x00000000bfb7dfff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000bfb7e000-0x00000000bfbfdfff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000bfbfe000-0x00000000bfedbfff] usable
[    0.000000] reserve setup_data: [mem 0x00000000bfedc000-0x00000000bff5ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000bff60000-0x00000000bfffffff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000043fffffff] usable
[    0.000000] efi: EFI v2.70 by Proxmox distribution of EDK II
[    0.000000] efi: SMBIOS=0xbf91c000 ACPI=0xbfb7d000 ACPI 2.0=0xbfb7d014 MEMATTR=0xbe0e7018 MOKvar=0xbf916000 
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    0.000000] Hypervisor detected: KVM
[    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000] kvm-clock: cpu 0, msr 192401001, primary cpu clock
[    0.000001] kvm-clock: using sched offset of 5698653956 cycles
[    0.000003] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000024] tsc: Detected 3099.996 MHz processor
[    0.000112] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000115] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000123] last_pfn = 0x440000 max_arch_pfn = 0x400000000
[    0.000151] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000158] last_pfn = 0xbfedc max_arch_pfn = 0x400000000
[    0.014832] Using GB pages for direct mapping
[    0.015129] secureboot: Secure boot disabled
[    0.015131] RAMDISK: [mem 0xb7c37000-0xbbf5dfff]
[    0.015133] ACPI: Early table checksum verification disabled
[    0.015137] ACPI: RSDP 0x00000000BFB7D014 000024 (v02 BOCHS )
[    0.015141] ACPI: XSDT 0x00000000BFB7C0E8 000064 (v01 BOCHS  BXPC     00000001      01000013)
[    0.015147] ACPI: FACP 0x00000000BFB77000 000074 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.015153] ACPI: DSDT 0x00000000BFB78000 00320B (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.015158] ACPI: FACS 0x00000000BFBDB000 000040
[    0.015161] ACPI: APIC 0x00000000BFB76000 000090 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.015165] ACPI: SSDT 0x00000000BFB75000 0000CA (v01 BOCHS  VMGENID  00000001 BXPC 00000001)
[    0.015169] ACPI: HPET 0x00000000BFB74000 000038 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.015173] ACPI: VIOT 0x00000000BFB73000 000058 (v00 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.015176] ACPI: WAET 0x00000000BFB72000 000028 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.015180] ACPI: VFCT 0x00000000BE684000 00E284 (v01 BOCHS  BXPC     00000001 AMD  31504F47)
[    0.015184] ACPI: BGRT 0x00000000BFB71000 000038 (v01 INTEL  EDK2     00000002      01000013)
[    0.015187] ACPI: Reserving FACP table memory at [mem 0xbfb77000-0xbfb77073]
[    0.015189] ACPI: Reserving DSDT table memory at [mem 0xbfb78000-0xbfb7b20a]
[    0.015190] ACPI: Reserving FACS table memory at [mem 0xbfbdb000-0xbfbdb03f]
[    0.015191] ACPI: Reserving APIC table memory at [mem 0xbfb76000-0xbfb7608f]
[    0.015192] ACPI: Reserving SSDT table memory at [mem 0xbfb75000-0xbfb750c9]
[    0.015193] ACPI: Reserving HPET table memory at [mem 0xbfb74000-0xbfb74037]
[    0.015194] ACPI: Reserving VIOT table memory at [mem 0xbfb73000-0xbfb73057]
[    0.015195] ACPI: Reserving WAET table memory at [mem 0xbfb72000-0xbfb72027]
[    0.015196] ACPI: Reserving VFCT table memory at [mem 0xbe684000-0xbe692283]
[    0.015197] ACPI: Reserving BGRT table memory at [mem 0xbfb71000-0xbfb71037]
[    0.015493] No NUMA configuration found
[    0.015495] Faking a node at [mem 0x0000000000000000-0x000000043fffffff]
[    0.015503] NODE_DATA(0) allocated [mem 0x43ffd6000-0x43fffffff]
[    0.015768] Zone ranges:
[    0.015769]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.015771]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.015773]   Normal   [mem 0x0000000100000000-0x000000043fffffff]
[    0.015774]   Device   empty
[    0.015775] Movable zone start for each node
[    0.015778] Early memory node ranges
[    0.015778]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.015780]   node   0: [mem 0x0000000000100000-0x0000000000805fff]
[    0.015781]   node   0: [mem 0x0000000000808000-0x000000000080ffff]
[    0.015782]   node   0: [mem 0x0000000000900000-0x00000000be683fff]
[    0.015783]   node   0: [mem 0x00000000be693000-0x00000000becf6fff]
[    0.015784]   node   0: [mem 0x00000000bedf9000-0x00000000bf8ebfff]
[    0.015785]   node   0: [mem 0x00000000bfbfe000-0x00000000bfedbfff]
[    0.015786]   node   0: [mem 0x0000000100000000-0x000000043fffffff]
[    0.015788] Initmem setup node 0 [mem 0x0000000000001000-0x000000043fffffff]
[    0.015795] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.015812] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.015813] On node 0, zone DMA: 2 pages in unavailable ranges
[    0.015830] On node 0, zone DMA: 240 pages in unavailable ranges
[    0.021854] On node 0, zone DMA32: 15 pages in unavailable ranges
[    0.021884] On node 0, zone DMA32: 258 pages in unavailable ranges
[    0.021898] On node 0, zone DMA32: 786 pages in unavailable ranges
[    0.048394] On node 0, zone Normal: 292 pages in unavailable ranges
[    0.049283] ACPI: PM-Timer IO Port: 0xb008
[    0.049297] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.049335] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
[    0.049339] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.049340] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.049341] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.049343] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
[    0.049344] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
[    0.049347] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.049349] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.049360] e820: update [mem 0xbe0f8000-0xbe11bfff] usable ==> reserved
[    0.049372] TSC deadline timer available
[    0.049379] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.049396] kvm-guest: KVM setup pv remote TLB flush
[    0.049398] kvm-guest: setup PV sched yield
[    0.049411] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.049413] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.049414] PM: hibernation: Registered nosave memory: [mem 0x00806000-0x00807fff]
[    0.049416] PM: hibernation: Registered nosave memory: [mem 0x00810000-0x008fffff]
[    0.049417] PM: hibernation: Registered nosave memory: [mem 0xbdf7e000-0xbdf7efff]
[    0.049419] PM: hibernation: Registered nosave memory: [mem 0xbdfa5000-0xbdfa5fff]
[    0.049420] PM: hibernation: Registered nosave memory: [mem 0xbdfa6000-0xbdfa6fff]
[    0.049421] PM: hibernation: Registered nosave memory: [mem 0xbdfc1000-0xbdfc1fff]
[    0.049422] PM: hibernation: Registered nosave memory: [mem 0xbdfc2000-0xbdfc2fff]
[    0.049424] PM: hibernation: Registered nosave memory: [mem 0xbdfcb000-0xbdfcbfff]
[    0.049425] PM: hibernation: Registered nosave memory: [mem 0xbe0f8000-0xbe11bfff]
[    0.049427] PM: hibernation: Registered nosave memory: [mem 0xbe684000-0xbe692fff]
[    0.049428] PM: hibernation: Registered nosave memory: [mem 0xbecf7000-0xbedf8fff]
[    0.049430] PM: hibernation: Registered nosave memory: [mem 0xbf8ec000-0xbfb6bfff]
[    0.049431] PM: hibernation: Registered nosave memory: [mem 0xbfb6c000-0xbfb7dfff]
[    0.049431] PM: hibernation: Registered nosave memory: [mem 0xbfb7e000-0xbfbfdfff]
[    0.049433] PM: hibernation: Registered nosave memory: [mem 0xbfedc000-0xbff5ffff]
[    0.049434] PM: hibernation: Registered nosave memory: [mem 0xbff60000-0xbfffffff]
[    0.049435] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xfeffbfff]
[    0.049436] PM: hibernation: Registered nosave memory: [mem 0xfeffc000-0xfeffffff]
[    0.049436] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.049438] [mem 0xc0000000-0xfeffbfff] available for PCI devices
[    0.049439] Booting paravirtualized kernel on KVM
[    0.049441] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.049448] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
[    0.049593] percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u524288
[    0.049599] pcpu-alloc: s217088 r8192 d28672 u524288 alloc=1*2097152
[    0.049601] pcpu-alloc: [0] 0 1 2 3 
[    0.049634] kvm-guest: setup async PF for cpu 0
[    0.049637] kvm-guest: stealtime: cpu 0, msr 42fc34080
[    0.049640] kvm-guest: PV spinlocks enabled
[    0.049642] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.049648] Built 1 zonelists, mobility grouping on.  Total pages: 4125153
[    0.049649] Policy zone: Normal
[    0.049650] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.15.0-125-generic root=UUID=bf453e68-d55e-403f-b45d-f64c29d4ee88 ro console=tty1 console=ttyS0
[    0.049702] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-5.15.0-125-generic", will be passed to user space.
[    0.050414] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.050767] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.050851] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.095683] Memory: 16253232K/16770456K available (16392K kernel code, 4397K rwdata, 10972K rodata, 3368K init, 18700K bss, 516964K reserved, 0K cma-reserved)
[    0.095920] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.095933] Kernel/User page tables isolation: enabled
[    0.095963] ftrace: allocating 50777 entries in 199 pages
[    0.114338] ftrace: allocated 199 pages with 5 groups
[    0.114445] rcu: Hierarchical RCU implementation.
[    0.114446] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
[    0.114448] 	Rude variant of Tasks RCU enabled.
[    0.114448] 	Tracing variant of Tasks RCU enabled.
[    0.114449] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.114450] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.117604] NR_IRQS: 524544, nr_irqs: 456, preallocated irqs: 16
[    0.117782] random: crng init done
[    0.117810] Console: colour dummy device 80x25
[    0.118010] printk: console [tty1] enabled
[    0.198331] printk: console [ttyS0] enabled
[    0.198616] ACPI: Core revision 20210730
[    0.199040] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.199722] APIC: Switch to symmetric I/O mode setup
[    0.200310] x2apic enabled
[    0.200713] Switched APIC routing to physical x2apic.
[    0.201058] kvm-guest: setup PV IPIs
[    0.202274] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.202689] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2caf43f3779, max_idle_ns: 440795254891 ns
[    0.203379] Calibrating delay loop (skipped) preset value.. 6199.99 BogoMIPS (lpj=12399984)
[    0.207437] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.207894] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.208239] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.208639] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.209196] Spectre V2 : Mitigation: Retpolines
[    0.209499] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.210030] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.210503] Speculative Store Bypass: Vulnerable
[    0.210807] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.211378] MMIO Stale Data: Unknown: No mitigations
[    0.211707] SRBDS: Unknown: Dependent on hypervisor status
[    0.212079] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.212582] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.212993] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.213404] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.213808] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.229177] Freeing SMP alternatives memory: 44K
[    0.229496] pid_max: default: 32768 minimum: 301
[    0.230984] LSM: Security Framework initializing
[    0.231297] landlock: Up and running.
[    0.231378] Yama: becoming mindful.
[    0.231630] AppArmor: AppArmor initialized
[    0.231935] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.232442] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.233204] smpboot: CPU0: Intel(R) Core(TM) i7-4770S CPU @ 3.10GHz (family: 0x6, model: 0x3c, stepping: 0x3)
[    0.233949] Performance Events: Haswell events, full-width counters, Intel PMU driver.
[    0.234571] ... version:                2
[    0.234861] ... bit width:              48
[    0.235197] ... generic registers:      4
[    0.235377] ... value mask:             0000ffffffffffff
[    0.235377] ... max period:             00007fffffffffff
[    0.235377] ... fixed-purpose events:   3
[    0.235377] ... event mask:             000000070000000f
[    0.235377] signal: max sigframe size: 1776
[    0.235398] rcu: Hierarchical SRCU implementation.
[    0.236097] smp: Bringing up secondary CPUs ...
[    0.236471] x86: Booting SMP configuration:
[    0.236771] .... node  #0, CPUs:      #1
[    0.085600] kvm-clock: cpu 1, msr 192401041, secondary cpu clock
[    0.237297] kvm-guest: setup async PF for cpu 1
[    0.237297] kvm-guest: stealtime: cpu 1, msr 42fcb4080
[    0.237297]  #2
[    0.085600] kvm-clock: cpu 2, msr 192401081, secondary cpu clock
[    0.237297] kvm-guest: setup async PF for cpu 2
[    0.237297] kvm-guest: stealtime: cpu 2, msr 42fd34080
[    0.239468]  #3
[    0.085600] kvm-clock: cpu 3, msr 1924010c1, secondary cpu clock
[    0.239996] kvm-guest: setup async PF for cpu 3
[    0.240274] kvm-guest: stealtime: cpu 3, msr 42fdb4080
[    0.240627] smp: Brought up 1 node, 4 CPUs
[    0.240627] smpboot: Max logical packages: 1
[    0.240627] smpboot: Total of 4 processors activated (24799.96 BogoMIPS)
[    0.244111] devtmpfs: initialized
[    0.244111] x86/mm: Memory block size: 128MB
[    0.244749] ACPI: PM: Registering ACPI NVS region [mem 0x00806000-0x00807fff] (8192 bytes)
[    0.244749] ACPI: PM: Registering ACPI NVS region [mem 0x00810000-0x008fffff] (983040 bytes)
[    0.244749] ACPI: PM: Registering ACPI NVS region [mem 0xbfb7e000-0xbfbfdfff] (524288 bytes)
[    0.247386] ACPI: PM: Registering ACPI NVS region [mem 0xbff60000-0xbfffffff] (655360 bytes)
[    0.247995] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.248655] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.249146] pinctrl core: initialized pinctrl subsystem
[    0.249640] PM: RTC time: 17:58:01, date: 2024-11-17
[    0.250187] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.250770] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
[    0.251351] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.251492] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.252044] audit: initializing netlink subsys (disabled)
[    0.252416] audit: type=2000 audit(1731866280.828:1): state=initialized audit_enabled=0 res=1
[    0.252416] thermal_sys: Registered thermal governor 'fair_share'
[    0.252416] thermal_sys: Registered thermal governor 'bang_bang'
[    0.252515] thermal_sys: Registered thermal governor 'step_wise'
[    0.252931] thermal_sys: Registered thermal governor 'user_space'
[    0.253321] thermal_sys: Registered thermal governor 'power_allocator'
[    0.253742] EISA bus registered
[    0.255386] cpuidle: using governor ladder
[    0.255658] cpuidle: using governor menu
[    0.256075] ACPI: bus type PCI registered
[    0.256359] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.256919] PCI: Using configuration type 1 for base access
[    0.257307] core: PMU erratum BJ122, BV98, HSD29 workaround disabled, HT off
[    0.258906] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.259423] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.259902] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.260386] fbcon: Taking over console
[    0.260386] ACPI: Added _OSI(Module Device)
[    0.260386] ACPI: Added _OSI(Processor Device)
[    0.263380] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.263724] ACPI: Added _OSI(Processor Aggregator Device)
[    0.264094] ACPI: Added _OSI(Linux-Dell-Video)
[    0.264393] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.264795] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.266553] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.267598] ACPI: Interpreter enabled
[    0.267880] ACPI: PM: (supports S0 S3 S4 S5)
[    0.268171] ACPI: Using IOAPIC for interrupt routing
[    0.268504] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.269149] PCI: Using E820 reservations for host bridge windows
[    0.269683] ACPI: Enabled 3 GPEs in block 00 to 0F
[    0.273537] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.273969] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.274522] acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
[    0.275500] acpiphp: Slot [3] registered
[    0.275807] acpiphp: Slot [5] registered
[    0.276093] acpiphp: Slot [16] registered
[    0.276389] acpiphp: Slot [18] registered
[    0.276735] acpiphp: Slot [6] registered
[    0.277009] acpiphp: Slot [7] registered
[    0.277282] acpiphp: Slot [8] registered
[    0.277555] acpiphp: Slot [9] registered
[    0.277849] acpiphp: Slot [10] registered
[    0.278129] acpiphp: Slot [11] registered
[    0.278428] acpiphp: Slot [12] registered
[    0.278730] acpiphp: Slot [13] registered
[    0.279009] acpiphp: Slot [14] registered
[    0.279288] acpiphp: Slot [15] registered
[    0.279392] acpiphp: Slot [17] registered
[    0.279691] acpiphp: Slot [19] registered
[    0.279978] acpiphp: Slot [20] registered
[    0.280260] acpiphp: Slot [21] registered
[    0.280584] acpiphp: Slot [22] registered
[    0.280864] acpiphp: Slot [23] registered
[    0.281142] acpiphp: Slot [24] registered
[    0.281434] acpiphp: Slot [25] registered
[    0.281723] acpiphp: Slot [26] registered
[    0.282000] acpiphp: Slot [27] registered
[    0.282298] acpiphp: Slot [28] registered
[    0.282599] acpiphp: Slot [29] registered
[    0.282875] PCI host bridge to bus 0000:00
[    0.283147] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.283379] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.283830] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.284285] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.284798] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
[    0.285294] pci_bus 0000:00: root bus resource [mem 0x7000000000-0x707fffffff window]
[    0.285908] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.286893] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.287826] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.289866] pci 0000:00:01.1: reg 0x20: [io  0xc1c0-0xc1cf]
[    0.290860] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    0.291350] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.291380] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    0.291862] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.292501] pci 0000:00:01.2: [8086:7020] type 00 class 0x0c0300
[    0.294420] pci 0000:00:01.2: reg 0x20: [io  0xc1a0-0xc1bf]
[    0.296065] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.296799] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PIIX4 ACPI
[    0.297294] pci 0000:00:01.3: quirk: [io  0xb100-0xb10f] claimed by PIIX4 SMB
[    0.298623] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
[    0.299941] pci 0000:00:02.0: reg 0x10: [mem 0xc0000000-0xc0ffffff pref]
[    0.302883] pci 0000:00:02.0: reg 0x18: [mem 0xc1546000-0xc1546fff]
[    0.307862] pci 0000:00:02.0: reg 0x30: [mem 0xffff0000-0xffffffff pref]
[    0.308513] pci 0000:00:02.0: BAR 0: assigned to efifb
[    0.308940] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.310078] pci 0000:00:03.0: [1af4:1002] type 00 class 0x00ff00
[    0.310914] pci 0000:00:03.0: reg 0x10: [io  0xc140-0xc17f]
[    0.312684] pci 0000:00:03.0: reg 0x20: [mem 0x7030200000-0x7030203fff 64bit pref]
[    0.314945] pci 0000:00:04.0: [1af4:1057] type 00 class 0x00ff00
[    0.316952] pci 0000:00:04.0: reg 0x20: [mem 0x7030204000-0x7030207fff 64bit pref]
[    0.319210] pci 0000:00:05.0: [1af4:1004] type 00 class 0x010000
[    0.319950] pci 0000:00:05.0: reg 0x10: [io  0xc100-0xc13f]
[    0.320884] pci 0000:00:05.0: reg 0x14: [mem 0xc1545000-0xc1545fff]
[    0.322928] pci 0000:00:05.0: reg 0x20: [mem 0x7030208000-0x703020bfff 64bit pref]
[    0.326733] pci 0000:00:10.0: [1002:744c] type 00 class 0x030000
[    0.331410] pci 0000:00:10.0: reg 0x10: [mem 0x7000000000-0x700fffffff 64bit pref]
[    0.339416] pci 0000:00:10.0: reg 0x18: [mem 0x7030000000-0x70301fffff 64bit pref]
[    0.347407] pci 0000:00:10.0: reg 0x20: [io  0xc000-0xc0ff]
[    0.355406] pci 0000:00:10.0: reg 0x24: [mem 0xc1400000-0xc14fffff]
[    0.363415] pci 0000:00:10.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
[    0.365110] pci 0000:00:10.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.367135] pci 0000:00:10.1: [1002:ab30] type 00 class 0x040300
[    0.368203] pci 0000:00:10.1: reg 0x10: [mem 0xc1540000-0xc1543fff]
[    0.374457] pci 0000:00:12.0: [1af4:1000] type 00 class 0x020000
[    0.375389] pci 0000:00:12.0: reg 0x10: [io  0xc180-0xc19f]
[    0.376312] pci 0000:00:12.0: reg 0x14: [mem 0xc1544000-0xc1544fff]
[    0.378317] pci 0000:00:12.0: reg 0x20: [mem 0x703020c000-0x703020ffff 64bit pref]
[    0.379356] pci 0000:00:12.0: reg 0x30: [mem 0xfffc0000-0xffffffff pref]
[    0.382888] pci 0000:00:1e.0: [1b36:0001] type 01 class 0x060400
[    0.384144] pci 0000:00:1e.0: reg 0x10: [mem 0x7030211000-0x70302110ff 64bit]
[    0.386039] pci 0000:00:1f.0: [1b36:0001] type 01 class 0x060400
[    0.387135] pci 0000:00:1f.0: reg 0x10: [mem 0x7030210000-0x70302100ff 64bit]
[    0.388780] pci_bus 0000:01: extended config space not accessible
[    0.389380] acpiphp: Slot [0] registered
[    0.389674] acpiphp: Slot [1-2] registered
[    0.389972] acpiphp: Slot [2] registered
[    0.390258] acpiphp: Slot [3-2] registered
[    0.390584] acpiphp: Slot [4] registered
[    0.390869] acpiphp: Slot [5-2] registered
[    0.391167] acpiphp: Slot [6-2] registered
[    0.391397] acpiphp: Slot [7-2] registered
[    0.391696] acpiphp: Slot [8-2] registered
[    0.391995] acpiphp: Slot [9-2] registered
[    0.392734] acpiphp: Slot [10-2] registered
[    0.393096] acpiphp: Slot [11-2] registered
[    0.393462] acpiphp: Slot [12-2] registered
[    0.393767] acpiphp: Slot [13-2] registered
[    0.394077] acpiphp: Slot [14-2] registered
[    0.394386] acpiphp: Slot [15-2] registered
[    0.394692] acpiphp: Slot [16-2] registered
[    0.394995] acpiphp: Slot [17-2] registered
[    0.395303] acpiphp: Slot [18-2] registered
[    0.395397] acpiphp: Slot [19-2] registered
[    0.395696] acpiphp: Slot [20-2] registered
[    0.396037] acpiphp: Slot [21-2] registered
[    0.396336] acpiphp: Slot [22-2] registered
[    0.396632] acpiphp: Slot [23-2] registered
[    0.396929] acpiphp: Slot [24-2] registered
[    0.397265] acpiphp: Slot [25-2] registered
[    0.397563] acpiphp: Slot [26-2] registered
[    0.397858] acpiphp: Slot [27-2] registered
[    0.398195] acpiphp: Slot [28-2] registered
[    0.398492] acpiphp: Slot [29-2] registered
[    0.398786] acpiphp: Slot [30] registered
[    0.399091] acpiphp: Slot [31] registered
[    0.404683] pci 0000:00:1e.0: PCI bridge to [bus 01]
[    0.405082] pci 0000:00:1e.0:   bridge window [mem 0xc1200000-0xc13fffff]
[    0.405581] pci 0000:00:1e.0:   bridge window [mem 0x7010000000-0x701fffffff 64bit pref]
[    0.406622] pci_bus 0000:02: extended config space not accessible
[    0.407212] acpiphp: Slot [0-2] registered
[    0.407398] acpiphp: Slot [1-3] registered
[    0.407691] acpiphp: Slot [2-2] registered
[    0.408025] acpiphp: Slot [3-3] registered
[    0.408318] acpiphp: Slot [4-2] registered
[    0.408608] acpiphp: Slot [5-3] registered
[    0.408923] acpiphp: Slot [6-3] registered
[    0.409234] acpiphp: Slot [7-3] registered
[    0.409525] acpiphp: Slot [8-3] registered
[    0.409816] acpiphp: Slot [9-3] registered
[    0.410148] acpiphp: Slot [10-3] registered
[    0.410447] acpiphp: Slot [11-3] registered
[    0.410743] acpiphp: Slot [12-3] registered
[    0.411060] acpiphp: Slot [13-3] registered
[    0.411358] acpiphp: Slot [14-3] registered
[    0.411396] acpiphp: Slot [15-3] registered
[    0.411758] acpiphp: Slot [16-3] registered
[    0.412055] acpiphp: Slot [17-3] registered
[    0.412352] acpiphp: Slot [18-3] registered
[    0.412693] acpiphp: Slot [19-3] registered
[    0.413012] acpiphp: Slot [20-3] registered
[    0.413309] acpiphp: Slot [21-3] registered
[    0.413622] acpiphp: Slot [22-3] registered
[    0.413948] acpiphp: Slot [23-3] registered
[    0.414244] acpiphp: Slot [24-3] registered
[    0.414542] acpiphp: Slot [25-3] registered
[    0.414857] acpiphp: Slot [26-3] registered
[    0.415153] acpiphp: Slot [27-3] registered
[    0.415396] acpiphp: Slot [28-3] registered
[    0.415738] acpiphp: Slot [29-3] registered
[    0.416054] acpiphp: Slot [30-2] registered
[    0.416351] acpiphp: Slot [31-2] registered
[    0.421718] pci 0000:00:1f.0: PCI bridge to [bus 02]
[    0.422090] pci 0000:00:1f.0:   bridge window [mem 0xc1000000-0xc11fffff]
[    0.422577] pci 0000:00:1f.0:   bridge window [mem 0x7020000000-0x702fffffff 64bit pref]
[    0.424163] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
[    0.427503] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    0.428139] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.428762] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    0.429569] ACPI: PCI: Interrupt link LNKS configured for IRQ 9
[    0.430463] iommu: Default domain type: Translated 
[    0.430463] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.431602] SCSI subsystem initialized
[    0.431866] libata version 3.00 loaded.
[    0.431866] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.431866] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.432420] pci 0000:00:10.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.432975] pci 0000:00:02.0: vgaarb: no bridge control possible
[    0.433395] pci 0000:00:10.0: vgaarb: bridge control possible
[    0.433791] vgaarb: loaded
[    0.434025] ACPI: bus type USB registered
[    0.434307] usbcore: registered new interface driver usbfs
[    0.435390] usbcore: registered new interface driver hub
[    0.435772] usbcore: registered new device driver usb
[    0.436146] pps_core: LinuxPPS API ver. 1 registered
[    0.436500] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.437118] PTP clock support registered
[    0.437397] EDAC MC: Ver: 3.0.0
[    0.437397] Registered efivars operations
[    0.437397] NetLabel: Initializing
[    0.437397] NetLabel:  domain hash size = 128
[    0.437397] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.439396] NetLabel:  unlabeled traffic allowed by default
[    0.439819] PCI: Using ACPI for IRQ routing
[    0.439819] PCI: pci_cache_line_size set to 64 bytes
[    0.439887] e820: reserve RAM buffer [mem 0x00806000-0x008fffff]
[    0.439889] e820: reserve RAM buffer [mem 0x00810000-0x008fffff]
[    0.439890] e820: reserve RAM buffer [mem 0xbdf7e018-0xbfffffff]
[    0.439891] e820: reserve RAM buffer [mem 0xbdfa6018-0xbfffffff]
[    0.439893] e820: reserve RAM buffer [mem 0xbdfc2018-0xbfffffff]
[    0.439894] e820: reserve RAM buffer [mem 0xbe0f8000-0xbfffffff]
[    0.439895] e820: reserve RAM buffer [mem 0xbe684000-0xbfffffff]
[    0.439896] e820: reserve RAM buffer [mem 0xbecf7000-0xbfffffff]
[    0.439897] e820: reserve RAM buffer [mem 0xbf8ec000-0xbfffffff]
[    0.439898] e820: reserve RAM buffer [mem 0xbfedc000-0xbfffffff]
[    0.439903] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.439903] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    0.445493] clocksource: Switched to clocksource kvm-clock
[    0.452175] VFS: Disk quotas dquot_6.6.0
[    0.452542] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.453140] AppArmor: AppArmor Filesystem Enabled
[    0.453486] pnp: PnP ACPI init
[    0.453860] pnp 00:02: [dma 2]
[    0.454130] pnp: PnP ACPI: found 4 devices
[    0.461466] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.462249] NET: Registered PF_INET protocol family
[    0.462728] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.464890] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.465510] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.466097] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.466770] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.467321] TCP: Hash tables configured (established 131072 bind 65536)
[    0.467836] MPTCP token hash table entries: 16384 (order: 6, 393216 bytes, linear)
[    0.468411] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.468906] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.469453] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.469858] NET: Registered PF_XDP protocol family
[    0.470203] pci 0000:00:12.0: can't claim BAR 6 [mem 0xfffc0000-0xffffffff pref]: no compatible bridge window
[    0.470883] pci 0000:00:12.0: BAR 6: assigned [mem 0xc1500000-0xc153ffff pref]
[    0.471365] pci 0000:00:1e.0: PCI bridge to [bus 01]
[    0.472265] pci 0000:00:1e.0:   bridge window [mem 0xc1200000-0xc13fffff]
[    0.473023] pci 0000:00:1e.0:   bridge window [mem 0x7010000000-0x701fffffff 64bit pref]
[    0.474159] pci 0000:00:1f.0: PCI bridge to [bus 02]
[    0.474945] pci 0000:00:1f.0:   bridge window [mem 0xc1000000-0xc11fffff]
[    0.475719] pci 0000:00:1f.0:   bridge window [mem 0x7020000000-0x702fffffff 64bit pref]
[    0.476844] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.477252] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.477688] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.478142] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfffff window]
[    0.478587] pci_bus 0000:00: resource 8 [mem 0x7000000000-0x707fffffff window]
[    0.479077] pci_bus 0000:01: resource 1 [mem 0xc1200000-0xc13fffff]
[    0.479490] pci_bus 0000:01: resource 2 [mem 0x7010000000-0x701fffffff 64bit pref]
[    0.480001] pci_bus 0000:02: resource 1 [mem 0xc1000000-0xc11fffff]
[    0.480412] pci_bus 0000:02: resource 2 [mem 0x7020000000-0x702fffffff 64bit pref]
[    0.480998] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.481387] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.481814] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    0.500333] ACPI: \_SB_.LNKD: Enabled at IRQ 11
[    0.518132] pci 0000:00:01.2: quirk_usb_early_handoff+0x0/0x160 took 34789 usecs
[    0.518754] pci 0000:00:10.1: D0 power state depends on 0000:00:10.0
[    0.519213] PCI: CLS 64 bytes, default 64
[    0.519686] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.519795] Trying to unpack rootfs image as initramfs...
[    0.520145] software IO TLB: mapped [mem 0x00000000b3c37000-0x00000000b7c37000] (64MB)
[    0.521120] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2caf43f3779, max_idle_ns: 440795254891 ns
[    0.522517] Initialise system trusted keyrings
[    0.522869] Key type blacklist registered
[    0.523273] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    0.524600] zbud: loaded
[    0.524976] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.525558] fuse: init (API version 7.34)
[    0.526145] integrity: Platform Keyring initialized
[    0.534408] Key type asymmetric registered
[    0.534742] Asymmetric key parser 'x509' registered
[    0.535095] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
[    0.535726] io scheduler mq-deadline registered
[    0.536424] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.537043] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    0.537577] ACPI: button: Power Button [PWRF]
[    0.556926] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.559262] Linux agpgart interface v0.103
[    0.560102] virtio_iommu virtio0: input address: 64 bits
[    0.560487] virtio_iommu virtio0: page mask: 0xfffffffffffff000
[    0.562607] loop: module loaded
[    0.563225] ata_piix 0000:00:01.1: Adding to iommu group 0
[    0.563610] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.564050] ata_piix 0000:00:01.1: version 2.13
[    0.565301] scsi host0: ata_piix
[    0.565863] scsi host1: ata_piix
[    0.566133] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc1c0 irq 14
[    0.566622] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc1c8 irq 15
[    0.567251] tun: Universal TUN/TAP device driver, 1.6
[    0.567806] PPP generic driver version 2.4.2
[    0.568241] VFIO - User Level meta-driver version: 0.3
[    0.568748] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.569206] ehci-pci: EHCI PCI platform driver
[    0.569519] ehci-platform: EHCI generic platform driver
[    0.569947] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.570381] ohci-pci: OHCI PCI platform driver
[    0.570719] ohci-platform: OHCI generic platform driver
[    0.571082] uhci_hcd: USB Universal Host Controller Interface driver
[    0.571932] uhci_hcd 0000:00:01.2: Adding to iommu group 0
[    0.590963] uhci_hcd 0000:00:01.2: UHCI Host Controller
[    0.591339] uhci_hcd 0000:00:01.2: new USB bus registered, assigned bus number 1
[    0.591886] uhci_hcd 0000:00:01.2: detected 2 ports
[    0.592272] uhci_hcd 0000:00:01.2: irq 11, io base 0x0000c1a0
[    0.592838] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.15
[    0.593402] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.593997] usb usb1: Product: UHCI Host Controller
[    0.594362] usb usb1: Manufacturer: Linux 5.15.0-125-generic uhci_hcd
[    0.594829] usb usb1: SerialNumber: 0000:00:01.2
[    0.595310] hub 1-0:1.0: USB hub found
[    0.595580] hub 1-0:1.0: 2 ports detected
[    0.596057] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    0.597305] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.597720] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.598291] mousedev: PS/2 mouse device common for all mice
[    0.598917] rtc_cmos 00:03: RTC can wake from S4
[    0.599584] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
[    0.600596] rtc_cmos 00:03: registered as rtc0
[    0.601003] rtc_cmos 00:03: setting system clock to 2024-11-17T17:58:02 UTC (1731866282)
[    0.601682] rtc_cmos 00:03: alarms up to one day, y3k, 242 bytes nvram
[    0.602167] i2c_dev: i2c /dev entries driver
[    0.602488] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    0.603379] device-mapper: uevent: version 1.0.3
[    0.603811] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@redhat.com
[    0.604461] platform eisa.0: Probing EISA bus 0
[    0.604812] platform eisa.0: EISA: Cannot allocate resource for mainboard
[    0.605305] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.605790] platform eisa.0: Cannot allocate resource for EISA slot 2
[    0.606260] platform eisa.0: Cannot allocate resource for EISA slot 3
[    0.606717] platform eisa.0: Cannot allocate resource for EISA slot 4
[    0.607146] platform eisa.0: Cannot allocate resource for EISA slot 5
[    0.607608] platform eisa.0: Cannot allocate resource for EISA slot 6
[    0.608093] platform eisa.0: Cannot allocate resource for EISA slot 7
[    0.608562] platform eisa.0: Cannot allocate resource for EISA slot 8
[    0.609029] platform eisa.0: EISA: Detected 0 cards
[    0.609396] intel_pstate: CPU model not supported
[    0.609910] ledtrig-cpu: registered to indicate activity on CPUs
[    0.610393] efifb: probing for efifb
[    0.610680] efifb: framebuffer at 0xc0000000, using 4000k, total 4000k
[    0.611124] efifb: mode is 1280x800x32, linelength=5120, pages=1
[    0.611553] efifb: scrolling: redraw
[    0.611820] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.612365] Console: switching to colour frame buffer device 160x50
[    0.615353] fb0: EFI VGA frame buffer device
[    0.615739] EFI Variables Facility v0.08 2004-May-17
[    0.617293] drop_monitor: Initializing network drop monitor service
[    0.617951] NET: Registered PF_INET6 protocol family
[    0.726424] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    0.727917] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
[    0.730177] sr 1:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
[    0.730694] cdrom: Uniform CD-ROM driver Revision: 3.20
[    0.802715] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    0.802820] sr 1:0:0:0: Attached scsi generic sg0 type 5
[    0.844700] Freeing initrd memory: 68764K
[    0.850458] Segment Routing with IPv6
[    0.850840] In-situ OAM (IOAM) with IPv6
[    0.851231] NET: Registered PF_PACKET protocol family
[    0.851839] Key type dns_resolver registered
[    0.852652] IPI shorthand broadcast: enabled
[    0.853042] sched_clock: Marking stable (771003117, 81600725)->(908970716, -56366874)
[    0.853919] registered taskstats version 1
[    0.854522] Loading compiled-in X.509 certificates
[    0.855738] Loaded X.509 cert 'Build time autogenerated kernel key: 50f8389f72b9f395b63717976d9cb0869dd1de98'
[    0.857007] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
[    0.858198] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
[    0.858940] blacklist: Loading compiled-in revocation X.509 certificates
[    0.859416] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    0.860168] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
[    0.860911] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
[    0.862693] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
[    0.863914] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
[    0.865146] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
[    0.866425] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
[    0.867650] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
[    0.869015] zswap: loaded using pool lzo/zbud
[    0.870427] Key type .fscrypt registered
[    0.871283] Key type fscrypt-provisioning registered
[    0.874683] Key type encrypted registered
[    0.875503] AppArmor: AppArmor sha1 policy hashing enabled
[    0.876611] integrity: Loading X.509 certificate: UEFI:MokListRT (MOKvar table)
[    0.878201] integrity: Loaded X.509 cert 'Canonical Ltd. Master Certificate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'
[    0.879742] ima: No TPM chip found, activating TPM-bypass!
[    0.880692] Loading compiled-in module X.509 certificates
[    0.882128] Loaded X.509 cert 'Build time autogenerated kernel key: 50f8389f72b9f395b63717976d9cb0869dd1de98'
[    0.883390] ima: Allocated hash algorithm: sha1
[    0.884308] ima: No architecture policies found
[    0.885222] evm: Initialising EVM extended attributes:
[    0.886226] evm: security.selinux
[    0.887027] evm: security.SMACK64
[    0.887824] evm: security.SMACK64EXEC
[    0.888631] evm: security.SMACK64TRANSMUTE
[    0.889462] evm: security.SMACK64MMAP
[    0.890325] evm: security.apparmor
[    0.891103] evm: security.ima
[    0.891843] evm: security.capability
[    0.892592] evm: HMAC attrs: 0x1
[    0.893740] pcieport 0000:00:1e.0: Adding to iommu group 1
[    0.894651] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.895184] shpchp 0000:00:1e.0: Requesting control of SHPC hotplug via OSHP (\_SB_.PCI0.SF0_)
[    0.897666] shpchp 0000:00:1e.0: Requesting control of SHPC hotplug via OSHP (\_SB_.PCI0)
[    0.898818] shpchp 0000:00:1e.0: Cannot get control of SHPC hotplug
[    0.899835] pcieport 0000:00:1f.0: Adding to iommu group 2
[    0.900744] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.901171] shpchp 0000:00:1f.0: Requesting control of SHPC hotplug via OSHP (\_SB_.PCI0.SF8_)
[    0.903696] shpchp 0000:00:1f.0: Requesting control of SHPC hotplug via OSHP (\_SB_.PCI0)
[    0.904802] shpchp 0000:00:1f.0: Cannot get control of SHPC hotplug
[    0.905897] virtio-pci 0000:00:03.0: Adding to iommu group 3
[    0.906842] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.925000] ACPI: \_SB_.LNKC: Enabled at IRQ 10
[    0.928451] Free page reporting enabled
[    0.929387] virtio-pci 0000:00:05.0: Adding to iommu group 4
[    0.930396] usb 1-1: new full-speed USB device number 2 using uhci_hcd
[    0.931440] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.949820] ACPI: \_SB_.LNKA: Enabled at IRQ 10
[    0.952675] virtio-pci 0000:00:12.0: Adding to iommu group 5
[    0.953584] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.972514] ACPI: \_SB_.LNKB: Enabled at IRQ 11
[    0.978248] agpgart-intel 0000:00:00.0: Adding to iommu group 6
[    0.979919] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    0.980712] PM:   Magic number: 0:555:997
[    0.983553] RAS: Correctable Errors collector initialized.
[    0.984583] clk: Disabling unused clocks
[    0.986553] Freeing unused decrypted memory: 2036K
[    0.987997] Freeing unused kernel image (initmem) memory: 3368K
[    0.989076] Write protecting the kernel read-only data: 30720k
[    0.991208] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    0.992532] Freeing unused kernel image (rodata/data gap) memory: 1316K
[    1.030479] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.031573] x86/mm: Checking user space page tables
[    1.069863] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.070907] Run /init as init process
[    1.071724]   with arguments:
[    1.071726]     /init
[    1.071727]   with environment:
[    1.071727]     HOME=/
[    1.071728]     TERM=linux
[    1.071728]     BOOT_IMAGE=/boot/vmlinuz-5.15.0-125-generic
[    1.119463] usb 1-1: New USB device found, idVendor=0627, idProduct=0001, bcdDevice= 0.00
[    1.121338] usb 1-1: New USB device strings: Mfr=1, Product=3, SerialNumber=10
[    1.122499] usb 1-1: Product: QEMU USB Tablet
[    1.125499] usb 1-1: Manufacturer: QEMU
[    1.126408] usb 1-1: SerialNumber: 28754-0000:00:01.2-1
[    1.158232] scsi host2: Virtio SCSI HBA
[    1.160823] scsi 2:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
[    1.168446] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input4
[    1.171300] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input3
[    1.173717] cryptd: max_cpu_qlen set to 1000
[    1.173871] FDC 0 is a S82078B
[    1.179822] AVX2 version of gcm_enc/dec engaged.
[    1.180007] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    1.180030] sd 2:0:0:0: Power-on or device reset occurred
[    1.180231] sd 2:0:0:0: [sda] 167772160 512-byte logical blocks: (85.9 GB/80.0 GiB)
[    1.180256] sd 2:0:0:0: [sda] Write Protect is off
[    1.180257] sd 2:0:0:0: [sda] Mode Sense: 63 00 00 08
[    1.180295] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.184055]  sda: sda1 sda14 sda15
[    1.188016] AES CTR mode by8 optimization enabled
[    1.188456] sd 2:0:0:0: [sda] Attached SCSI disk
[    1.197414] hid: raw HID events driver (C) Jiri Kosina
[    1.208903] usbcore: registered new interface driver usbhid
[    1.210477] usbhid: USB HID core driver
[    1.216003] amdkcl: loading out-of-tree module taints kernel.
[    1.218592] amdkcl: module verification failed: signature and/or required key missing - tainting kernel
[    1.229468] virtio_net virtio3 ens18: renamed from eth0
[    1.238099] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:01.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input5
[    1.240112] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:01.2-1/input0
[    1.539891] [drm] amdgpu kernel modesetting enabled.
[    1.541571] [drm] amdgpu version: 6.8.5
[    1.542500] [drm] OS DRM version: 5.15.0
[    1.543560] amdgpu: Virtual CRAT table created for CPU
[    1.544694] amdgpu: Topology: Add CPU node
[    1.548103] amdgpu 0000:00:10.0: Adding to iommu group 7
[    1.549255] iommu: Failed to allocate default IOMMU domain of type 11 for group (null) - Falling back to IOMMU_DOMAIN_DMA
[    1.568116] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x744C 0x1EAE:0x7905 0xCC).
[    1.570716] [drm] register mmio base: 0xC1400000
[    1.571586] [drm] register mmio size: 1048576
[    1.576385] [drm] add ip block number 0 <soc21_common>
[    1.577362] [drm] add ip block number 1 <gmc_v11_0>
[    1.578300] [drm] add ip block number 2 <ih_v6_0>
[    1.579217] [drm] add ip block number 3 <psp>
[    1.580080] [drm] add ip block number 4 <smu>
[    1.580928] [drm] add ip block number 5 <dm>
[    1.581801] [drm] add ip block number 6 <gfx_v11_0>
[    1.582690] [drm] add ip block number 7 <sdma_v6_0>
[    1.583526] [drm] add ip block number 8 <vcn_v4_0>
[    1.584412] [drm] add ip block number 9 <jpeg_v4_0>
[    1.585293] [drm] add ip block number 10 <mes_v11_0>
[    1.586201] amdgpu 0000:00:10.0: amdgpu: Fetched VBIOS from VFCT
[    1.587141] amdgpu: ATOM BIOS: 113-31TESHAS1-L02
[    1.588272] amdgpu 0000:00:10.0: amdgpu: CP RS64 enable
[    1.589363] [drm] VCN(0) encode/decode are enabled in VM mode
[    1.590310] [drm] VCN(1) encode/decode are enabled in VM mode
[    1.591304] amdgpu 0000:00:10.0: [drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
[    1.593040] Console: switching to colour dummy device 80x25
[    1.593515] amdgpu 0000:00:10.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[    1.594273] amdgpu 0000:00:10.0: amdgpu: MEM ECC is not presented.
[    1.594746] amdgpu 0000:00:10.0: amdgpu: SRAM ECC is not presented.
[    1.595192] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    1.595811] [drm] System can't access extended configuration space, please check!!
[    1.602151] amdgpu 0000:00:10.0: BAR 2: releasing [mem 0x7030000000-0x70301fffff 64bit pref]
[    1.602819] amdgpu 0000:00:10.0: BAR 0: releasing [mem 0x7000000000-0x700fffffff 64bit pref]
[    1.603522] amdgpu 0000:00:10.0: BAR 0: assigned [mem 0x7000000000-0x700fffffff 64bit pref]
[    1.604205] amdgpu 0000:00:10.0: BAR 2: assigned [mem 0x7030000000-0x70301fffff 64bit pref]
[    1.604879] pci 0000:00:1e.0: PCI bridge to [bus 01]
[    1.605980] pci 0000:00:1e.0:   bridge window [mem 0xc1200000-0xc13fffff]
[    1.606927] pci 0000:00:1e.0:   bridge window [mem 0x7010000000-0x701fffffff 64bit pref]
[    1.608430] pci 0000:00:1f.0: PCI bridge to [bus 02]
[    1.609483] pci 0000:00:1f.0:   bridge window [mem 0xc1000000-0xc11fffff]
[    1.610547] pci 0000:00:1f.0:   bridge window [mem 0x7020000000-0x702fffffff 64bit pref]
[    1.623695] amdgpu 0000:00:10.0: amdgpu: VRAM: 20464M 0x0000008000000000 - 0x00000084FEFFFFFF (20464M used)
[    1.624727] amdgpu 0000:00:10.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
[    1.625457] [drm] Detected VRAM RAM=20464M, BAR=256M
[    1.625861] [drm] RAM width 320bits GDDR6
[    1.626440] [drm] amdgpu: 20464M of VRAM memory ready
[    1.626856] [drm] amdgpu: 7991M of GTT memory ready.
[    1.627287] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    1.627843] [drm] PCIE GART of 512M enabled (table at 0x0000008000000000).
[    1.630356] [drm] Loading DMUB firmware via PSP: version=0x07002A00
[    1.631145] [drm] Found VCN firmware Version ENC: 1.22 DEC: 8 VEP: 0 Revision: 0
[    3.249343] amdgpu 0000:00:10.0: amdgpu: PSP load kdb failed!
[    3.430830] [drm:psp_v13_0_ring_destroy [amdgpu]] *ERROR* Fail to stop psp ring
[    3.431662] amdgpu 0000:00:10.0: amdgpu: PSP firmware loading failed
[    3.432317] [drm:amdgpu_device_fw_loading [amdgpu]] *ERROR* hw_init of IP block <psp> failed -22
[    3.433129] amdgpu 0000:00:10.0: amdgpu: amdgpu_device_ip_init failed
[    3.433571] amdgpu 0000:00:10.0: amdgpu: Fatal error during GPU init
[    3.434073] amdgpu 0000:00:10.0: amdgpu: amdgpu: finishing device.
[    3.434579] ------------[ cut here ]------------
[    3.434922] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.435848] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.438345] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G           OE     5.15.0-125-generic #135-Ubuntu
[    3.439040] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.439655] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.440217] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.441499] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.441912] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.442405] RDX: 0000000000000000 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.442930] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.443424] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.443935] R13: 0000000000000000 R14: ffff8af691a80000 R15: 0000000000000001
[    3.444427] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.444996] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.445403] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.445923] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.446417] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.446937] Call Trace:
[    3.447112]  <TASK>
[    3.447291]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.447587]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.447923]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.448502]  ? show_regs.part.0+0x23/0x29
[    3.448820]  ? show_regs.cold+0x8/0xd
[    3.449070]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.449589]  ? __warn+0x8c/0x100
[    3.449863]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.450382]  ? report_bug+0xa4/0xd0
[    3.450635]  ? handle_bug+0x39/0x90
[    3.450905]  ? exc_invalid_op+0x19/0x70
[    3.451157]  ? asm_exc_invalid_op+0x1b/0x20
[    3.451481]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.452008]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.452591]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.453206]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.453646]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.454165]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.454837]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.455312]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.455732]  local_pci_probe+0x4b/0x90
[    3.455986]  pci_device_probe+0x119/0x200
[    3.456253]  really_probe+0x222/0x420
[    3.456509]  __driver_probe_device+0xe8/0x140
[    3.456867]  driver_probe_device+0x23/0xc0
[    3.457142]  __driver_attach+0xf7/0x1f0
[    3.457399]  ? __device_attach_driver+0x140/0x140
[    3.457797]  bus_for_each_dev+0x7f/0xd0
[    3.458075]  driver_attach+0x1e/0x30
[    3.458315]  bus_add_driver+0x148/0x220
[    3.458597]  driver_register+0x95/0x100
[    3.458911]  __pci_register_driver+0x68/0x70
[    3.459197]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.459700]  ? 0xffffffffc1409000
[    3.459941]  do_one_initcall+0x49/0x1e0
[    3.460200]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.460511]  do_init_module+0x52/0x260
[    3.460821]  load_module+0xb45/0xbe0
[    3.461074]  __do_sys_finit_module+0xbf/0x120
[    3.461365]  __x64_sys_finit_module+0x18/0x20
[    3.461714]  x64_sys_call+0x1ac3/0x1fa0
[    3.461991]  do_syscall_64+0x56/0xb0
[    3.462242]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.462516]  ? x64_sys_call+0x1e12/0x1fa0
[    3.462835]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.463164]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.463483]  ? x64_sys_call+0x3b9/0x1fa0
[    3.463798]  ? do_syscall_64+0x63/0xb0
[    3.464050]  ? do_syscall_64+0x63/0xb0
[    3.464311]  ? do_syscall_64+0x63/0xb0
[    3.464562]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.464954] RIP: 0033:0x7f9f5dea788d
[    3.465198] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.466488] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.467062] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.467539] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.468064] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.468540] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.469065] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.469536]  </TASK>
[    3.469743] ---[ end trace 977c9eb411d0c01a ]---
[    3.470080] ------------[ cut here ]------------
[    3.470389] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.471330] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.473983] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.474656] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.475281] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.475851] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.477664] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.478092] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.478710] RDX: 0000000000000002 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.479186] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.479732] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.480209] R13: 0000000000000002 R14: ffff8af691a80000 R15: 0000000000000001
[    3.480735] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.481284] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.481717] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.482189] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.482712] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.483190] Call Trace:
[    3.483375]  <TASK>
[    3.483526]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.483864]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.484164]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.484777]  ? show_regs.part.0+0x23/0x29
[    3.485053]  ? show_regs.cold+0x8/0xd
[    3.485303]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.485834]  ? __warn+0x8c/0x100
[    3.486058]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.486564]  ? report_bug+0xa4/0xd0
[    3.486843]  ? handle_bug+0x39/0x90
[    3.487087]  ? exc_invalid_op+0x19/0x70
[    3.487347]  ? asm_exc_invalid_op+0x1b/0x20
[    3.487673]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.488168]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.488752]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.489347]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.489773]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.490293]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.490947]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.491416]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.491806]  local_pci_probe+0x4b/0x90
[    3.492055]  pci_device_probe+0x119/0x200
[    3.492333]  really_probe+0x222/0x420
[    3.492605]  __driver_probe_device+0xe8/0x140
[    3.492933]  driver_probe_device+0x23/0xc0
[    3.493205]  __driver_attach+0xf7/0x1f0
[    3.493472]  ? __device_attach_driver+0x140/0x140
[    3.493856]  bus_for_each_dev+0x7f/0xd0
[    3.494134]  driver_attach+0x1e/0x30
[    3.494386]  bus_add_driver+0x148/0x220
[    3.494706]  driver_register+0x95/0x100
[    3.494963]  __pci_register_driver+0x68/0x70
[    3.495246]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.495756]  ? 0xffffffffc1409000
[    3.495979]  do_one_initcall+0x49/0x1e0
[    3.496234]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.496555]  do_init_module+0x52/0x260
[    3.496858]  load_module+0xb45/0xbe0
[    3.497100]  __do_sys_finit_module+0xbf/0x120
[    3.497389]  __x64_sys_finit_module+0x18/0x20
[    3.497759]  x64_sys_call+0x1ac3/0x1fa0
[    3.498036]  do_syscall_64+0x56/0xb0
[    3.498276]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.498548]  ? x64_sys_call+0x1e12/0x1fa0
[    3.498878]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.499197]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.499511]  ? x64_sys_call+0x3b9/0x1fa0
[    3.499836]  ? do_syscall_64+0x63/0xb0
[    3.500088]  ? do_syscall_64+0x63/0xb0
[    3.500337]  ? do_syscall_64+0x63/0xb0
[    3.500586]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.500985] RIP: 0033:0x7f9f5dea788d
[    3.501226] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.502497] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.503074] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.503538] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.504066] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.504529] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.505040] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.505516]  </TASK>
[    3.505713] ---[ end trace 977c9eb411d0c01b ]---
[    3.506065] ------------[ cut here ]------------
[    3.506385] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.507350] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.509843] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.510504] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.511131] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.511694] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.512983] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.513346] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.513869] RDX: 0000000000000003 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.514387] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.514901] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.515397] R13: 0000000000000003 R14: ffff8af691a80000 R15: 0000000000000001
[    3.515925] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.516481] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.516895] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.517398] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.517908] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.518434] Call Trace:
[    3.518603]  <TASK>
[    3.518785]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.519074]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.519408]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.519977]  ? show_regs.part.0+0x23/0x29
[    3.520286]  ? show_regs.cold+0x8/0xd
[    3.520533]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.521045]  ? __warn+0x8c/0x100
[    3.521310]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.521837]  ? report_bug+0xa4/0xd0
[    3.522089]  ? handle_bug+0x39/0x90
[    3.522365]  ? exc_invalid_op+0x19/0x70
[    3.522644]  ? asm_exc_invalid_op+0x1b/0x20
[    3.522943]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.523467]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.524040]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.524701]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.525067]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.525636]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.526256]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.526792]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.527116]  local_pci_probe+0x4b/0x90
[    3.527376]  pci_device_probe+0x119/0x200
[    3.527718]  really_probe+0x222/0x420
[    3.527975]  __driver_probe_device+0xe8/0x140
[    3.528266]  driver_probe_device+0x23/0xc0
[    3.528570]  __driver_attach+0xf7/0x1f0
[    3.528874]  ? __device_attach_driver+0x140/0x140
[    3.529189]  bus_for_each_dev+0x7f/0xd0
[    3.529470]  driver_attach+0x1e/0x30
[    3.529766]  bus_add_driver+0x148/0x220
[    3.530056]  driver_register+0x95/0x100
[    3.530313]  __pci_register_driver+0x68/0x70
[    3.530643]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.531114]  ? 0xffffffffc1409000
[    3.531337]  do_one_initcall+0x49/0x1e0
[    3.531639]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.531972]  do_init_module+0x52/0x260
[    3.532238]  load_module+0xb45/0xbe0
[    3.532479]  __do_sys_finit_module+0xbf/0x120
[    3.532835]  __x64_sys_finit_module+0x18/0x20
[    3.533134]  x64_sys_call+0x1ac3/0x1fa0
[    3.533393]  do_syscall_64+0x56/0xb0
[    3.533710]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.534002]  ? x64_sys_call+0x1e12/0x1fa0
[    3.534282]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.534641]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.534978]  ? x64_sys_call+0x3b9/0x1fa0
[    3.535239]  ? do_syscall_64+0x63/0xb0
[    3.535501]  ? do_syscall_64+0x63/0xb0
[    3.535811]  ? do_syscall_64+0x63/0xb0
[    3.536060]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.536405] RIP: 0033:0x7f9f5dea788d
[    3.536673] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.537961] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.538470] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.538994] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.539458] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.539980] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.540442] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.540965]  </TASK>
[    3.541116] ---[ end trace 977c9eb411d0c01c ]---
[    3.541428] ------------[ cut here ]------------
[    3.541805] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.542732] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.545176] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.545886] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.546471] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.547047] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.548337] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.548717] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.549209] RDX: 0000000000000004 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.549732] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.550248] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.550759] R13: 0000000000000004 R14: ffff8af691a80000 R15: 0000000000000001
[    3.551249] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.551836] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.552242] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.552754] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.553250] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.553771] Call Trace:
[    3.553959]  <TASK>
[    3.554138]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.554429]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.554765]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.555340]  ? show_regs.part.0+0x23/0x29
[    3.555606]  ? show_regs.cold+0x8/0xd
[    3.555900]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.556409]  ? __warn+0x8c/0x100
[    3.556646]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.557191]  ? report_bug+0xa4/0xd0
[    3.557426]  ? handle_bug+0x39/0x90
[    3.557704]  ? exc_invalid_op+0x19/0x70
[    3.557993]  ? asm_exc_invalid_op+0x1b/0x20
[    3.558303]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.558818]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.559397]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.560003]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.560414]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.560957]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.561595]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.562130]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.562496]  local_pci_probe+0x4b/0x90
[    3.562785]  pci_device_probe+0x119/0x200
[    3.563052]  really_probe+0x222/0x420
[    3.563332]  __driver_probe_device+0xe8/0x140
[    3.563657]  driver_probe_device+0x23/0xc0
[    3.563939]  __driver_attach+0xf7/0x1f0
[    3.564213]  ? __device_attach_driver+0x140/0x140
[    3.564567]  bus_for_each_dev+0x7f/0xd0
[    3.564858]  driver_attach+0x1e/0x30
[    3.565097]  bus_add_driver+0x148/0x220
[    3.565362]  driver_register+0x95/0x100
[    3.565697]  __pci_register_driver+0x68/0x70
[    3.566000]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.566469]  ? 0xffffffffc1409000
[    3.566740]  do_one_initcall+0x49/0x1e0
[    3.566998]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.567306]  do_init_module+0x52/0x260
[    3.567601]  load_module+0xb45/0xbe0
[    3.567876]  __do_sys_finit_module+0xbf/0x120
[    3.568166]  __x64_sys_finit_module+0x18/0x20
[    3.568463]  x64_sys_call+0x1ac3/0x1fa0
[    3.568787]  do_syscall_64+0x56/0xb0
[    3.569026]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.569298]  ? x64_sys_call+0x1e12/0x1fa0
[    3.569608]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.569982]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.570301]  ? x64_sys_call+0x3b9/0x1fa0
[    3.570587]  ? do_syscall_64+0x63/0xb0
[    3.570889]  ? do_syscall_64+0x63/0xb0
[    3.571140]  ? do_syscall_64+0x63/0xb0
[    3.571387]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.571783] RIP: 0033:0x7f9f5dea788d
[    3.572036] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.573305] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.573860] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.574356] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.574871] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.575347] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.575861] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.576339]  </TASK>
[    3.576490] ---[ end trace 977c9eb411d0c01d ]---
[    3.576853] ------------[ cut here ]------------
[    3.577164] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.578130] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.580563] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.581238] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.581867] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.582405] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.583717] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.584096] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.584560] RDX: 0000000000000005 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.585103] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.585568] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.586117] R13: 0000000000000005 R14: ffff8af691a80000 R15: 0000000000000001
[    3.586600] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.587206] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.587581] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.588137] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.588599] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.589138] Call Trace:
[    3.589304]  <TASK>
[    3.589449]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.589783]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.590125]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.590717]  ? show_regs.part.0+0x23/0x29
[    3.591009]  ? show_regs.cold+0x8/0xd
[    3.591268]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.591780]  ? __warn+0x8c/0x100
[    3.592007]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.592499]  ? report_bug+0xa4/0xd0
[    3.592770]  ? handle_bug+0x39/0x90
[    3.593003]  ? exc_invalid_op+0x19/0x70
[    3.593288]  ? asm_exc_invalid_op+0x1b/0x20
[    3.593579]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.594157]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.594737]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.595331]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.595748]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.596281]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.596941]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.597436]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.597818]  local_pci_probe+0x4b/0x90
[    3.598088]  pci_device_probe+0x119/0x200
[    3.598385]  really_probe+0x222/0x420
[    3.598659]  __driver_probe_device+0xe8/0x140
[    3.598972]  driver_probe_device+0x23/0xc0
[    3.599280]  __driver_attach+0xf7/0x1f0
[    3.599537]  ? __device_attach_driver+0x140/0x140
[    3.599885]  bus_for_each_dev+0x7f/0xd0
[    3.600154]  driver_attach+0x1e/0x30
[    3.600420]  bus_add_driver+0x148/0x220
[    3.600714]  driver_register+0x95/0x100
[    3.600974]  __pci_register_driver+0x68/0x70
[    3.601295]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.601777]  ? 0xffffffffc1409000
[    3.602019]  do_one_initcall+0x49/0x1e0
[    3.602311]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.602661]  do_init_module+0x52/0x260
[    3.602921]  load_module+0xb45/0xbe0
[    3.603172]  __do_sys_finit_module+0xbf/0x120
[    3.603493]  __x64_sys_finit_module+0x18/0x20
[    3.603819]  x64_sys_call+0x1ac3/0x1fa0
[    3.604073]  do_syscall_64+0x56/0xb0
[    3.604325]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.604646]  ? x64_sys_call+0x1e12/0x1fa0
[    3.604931]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.605244]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.605612]  ? x64_sys_call+0x3b9/0x1fa0
[    3.605923]  ? do_syscall_64+0x63/0xb0
[    3.606171]  ? do_syscall_64+0x63/0xb0
[    3.606466]  ? do_syscall_64+0x63/0xb0
[    3.606751]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.607081] RIP: 0033:0x7f9f5dea788d
[    3.607319] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.608660] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.609163] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.609725] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.610197] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.610739] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.611200] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.611726]  </TASK>
[    3.611889] ---[ end trace 977c9eb411d0c01e ]---
[    3.612201] ------------[ cut here ]------------
[    3.612508] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.613434] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.615906] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.616563] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.617181] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.617726] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.619014] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.619372] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.619888] RDX: 0000000000000002 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.620350] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.620881] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.621346] R13: 0000000000000002 R14: ffff8af691a80000 R15: 0000000000000001
[    3.621887] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.622428] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.622888] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.623353] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.623912] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.624375] Call Trace:
[    3.624542]  <TASK>
[    3.624737]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.625061]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.625351]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.625989]  ? show_regs.part.0+0x23/0x29
[    3.626267]  ? show_regs.cold+0x8/0xd
[    3.626510]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.627071]  ? __warn+0x8c/0x100
[    3.627290]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.627805]  ? report_bug+0xa4/0xd0
[    3.628084]  ? handle_bug+0x39/0x90
[    3.628318]  ? exc_invalid_op+0x19/0x70
[    3.628571]  ? asm_exc_invalid_op+0x1b/0x20
[    3.628885]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.629394]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.629973]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.630576]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.630964]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.631495]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.632180]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.632714]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.633039]  local_pci_probe+0x4b/0x90
[    3.633331]  pci_device_probe+0x119/0x200
[    3.633610]  really_probe+0x222/0x420
[    3.633906]  __driver_probe_device+0xe8/0x140
[    3.634228]  driver_probe_device+0x23/0xc0
[    3.634516]  __driver_attach+0xf7/0x1f0
[    3.634803]  ? __device_attach_driver+0x140/0x140
[    3.635117]  bus_for_each_dev+0x7f/0xd0
[    3.635403]  driver_attach+0x1e/0x30
[    3.635691]  bus_add_driver+0x148/0x220
[    3.635949]  driver_register+0x95/0x100
[    3.636238]  __pci_register_driver+0x68/0x70
[    3.636534]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.637014]  ? 0xffffffffc1409000
[    3.637270]  do_one_initcall+0x49/0x1e0
[    3.637526]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.637896]  do_init_module+0x52/0x260
[    3.638165]  load_module+0xb45/0xbe0
[    3.638437]  __do_sys_finit_module+0xbf/0x120
[    3.638778]  __x64_sys_finit_module+0x18/0x20
[    3.639067]  x64_sys_call+0x1ac3/0x1fa0
[    3.639352]  do_syscall_64+0x56/0xb0
[    3.639591]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.639911]  ? x64_sys_call+0x1e12/0x1fa0
[    3.640179]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.640524]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.640889]  ? x64_sys_call+0x3b9/0x1fa0
[    3.641152]  ? do_syscall_64+0x63/0xb0
[    3.641436]  ? do_syscall_64+0x63/0xb0
[    3.641744]  ? do_syscall_64+0x63/0xb0
[    3.642028]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.642396] RIP: 0033:0x7f9f5dea788d
[    3.642662] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.643947] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.644488] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.644991] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.645503] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.646010] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.646540] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.647037]  </TASK>
[    3.647187] ---[ end trace 977c9eb411d0c01f ]---
[    3.647548] ------------[ cut here ]------------
[    3.647887] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.648835] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.651272] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.651984] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.652537] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.653105] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.654376] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.654790] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.655264] RDX: 0000000000000003 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.655779] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.656255] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.656769] R13: 0000000000000003 R14: ffff8af691a80000 R15: 0000000000000001
[    3.657245] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.657831] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.658239] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.658733] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.659232] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.659734] Call Trace:
[    3.659924]  <TASK>
[    3.660070]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.660372]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.660692]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.661251]  ? show_regs.part.0+0x23/0x29
[    3.661530]  ? show_regs.cold+0x8/0xd
[    3.661839]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.662348]  ? __warn+0x8c/0x100
[    3.662570]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.663101]  ? report_bug+0xa4/0xd0
[    3.663335]  ? handle_bug+0x39/0x90
[    3.663580]  ? exc_invalid_op+0x19/0x70
[    3.663905]  ? asm_exc_invalid_op+0x1b/0x20
[    3.664185]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.664705]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.665264]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.665896]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.666283]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.666824]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.667440]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.667979]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.668313]  local_pci_probe+0x4b/0x90
[    3.668560]  pci_device_probe+0x119/0x200
[    3.668892]  really_probe+0x222/0x420
[    3.669167]  __driver_probe_device+0xe8/0x140
[    3.669458]  driver_probe_device+0x23/0xc0
[    3.669775]  __driver_attach+0xf7/0x1f0
[    3.670096]  ? __device_attach_driver+0x140/0x140
[    3.670408]  bus_for_each_dev+0x7f/0xd0
[    3.670689]  driver_attach+0x1e/0x30
[    3.670928]  bus_add_driver+0x148/0x220
[    3.671229]  driver_register+0x95/0x100
[    3.671488]  __pci_register_driver+0x68/0x70
[    3.671808]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.672288]  ? 0xffffffffc1409000
[    3.672512]  do_one_initcall+0x49/0x1e0
[    3.672806]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.673156]  do_init_module+0x52/0x260
[    3.673408]  load_module+0xb45/0xbe0
[    3.673692]  __do_sys_finit_module+0xbf/0x120
[    3.674000]  __x64_sys_finit_module+0x18/0x20
[    3.674334]  x64_sys_call+0x1ac3/0x1fa0
[    3.674590]  do_syscall_64+0x56/0xb0
[    3.674864]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.675145]  ? x64_sys_call+0x1e12/0x1fa0
[    3.675446]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.675798]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.676112]  ? x64_sys_call+0x3b9/0x1fa0
[    3.676420]  ? do_syscall_64+0x63/0xb0
[    3.676709]  ? do_syscall_64+0x63/0xb0
[    3.676959]  ? do_syscall_64+0x63/0xb0
[    3.677232]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.677589] RIP: 0033:0x7f9f5dea788d
[    3.677885] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.679181] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.679744] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.680207] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.680751] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.681214] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.681766] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.682252]  </TASK>
[    3.682437] ---[ end trace 977c9eb411d0c020 ]---
[    3.682793] ------------[ cut here ]------------
[    3.683107] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.684065] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.686548] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.687243] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.687864] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.688396] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.689747] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.690112] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.690597] RDX: 0000000000000004 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.691110] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.691585] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.692096] R13: 0000000000000004 R14: ffff8af691a80000 R15: 0000000000000001
[    3.692571] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.693139] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.693516] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.694064] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.694539] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.695064] Call Trace:
[    3.695232]  <TASK>
[    3.695377]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.695709]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.696024]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.696560]  ? show_regs.part.0+0x23/0x29
[    3.696894]  ? show_regs.cold+0x8/0xd
[    3.697140]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.697662]  ? __warn+0x8c/0x100
[    3.697919]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.698396]  ? report_bug+0xa4/0xd0
[    3.698648]  ? handle_bug+0x39/0x90
[    3.698917]  ? exc_invalid_op+0x19/0x70
[    3.699186]  ? asm_exc_invalid_op+0x1b/0x20
[    3.699465]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.700002]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.700537]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.701156]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.701522]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.702095]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.702741]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.703231]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.703563]  local_pci_probe+0x4b/0x90
[    3.703886]  pci_device_probe+0x119/0x200
[    3.704154]  really_probe+0x222/0x420
[    3.704412]  __driver_probe_device+0xe8/0x140
[    3.704755]  driver_probe_device+0x23/0xc0
[    3.705060]  __driver_attach+0xf7/0x1f0
[    3.705317]  ? __device_attach_driver+0x140/0x140
[    3.705683]  bus_for_each_dev+0x7f/0xd0
[    3.705992]  driver_attach+0x1e/0x30
[    3.706233]  bus_add_driver+0x148/0x220
[    3.706501]  driver_register+0x95/0x100
[    3.706796]  __pci_register_driver+0x68/0x70
[    3.707112]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.707560]  ? 0xffffffffc1409000
[    3.707811]  do_one_initcall+0x49/0x1e0
[    3.708100]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.708413]  do_init_module+0x52/0x260
[    3.708712]  load_module+0xb45/0xbe0
[    3.708953]  __do_sys_finit_module+0xbf/0x120
[    3.709272]  __x64_sys_finit_module+0x18/0x20
[    3.709564]  x64_sys_call+0x1ac3/0x1fa0
[    3.709879]  do_syscall_64+0x56/0xb0
[    3.710171]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.710445]  ? x64_sys_call+0x1e12/0x1fa0
[    3.710746]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.711112]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.711432]  ? x64_sys_call+0x3b9/0x1fa0
[    3.711723]  ? do_syscall_64+0x63/0xb0
[    3.711983]  ? do_syscall_64+0x63/0xb0
[    3.712266]  ? do_syscall_64+0x63/0xb0
[    3.712517]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.712907] RIP: 0033:0x7f9f5dea788d
[    3.713182] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.714475] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.715024] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.715530] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.716017] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.716522] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.717019] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.717525]  </TASK>
[    3.717730] ---[ end trace 977c9eb411d0c021 ]---
[    3.718064] ------------[ cut here ]------------
[    3.718416] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.719347] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.721838] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.722509] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.723130] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.723724] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.725002] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.725346] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af691660a40
[    3.725900] RDX: 0000000000000005 RSI: ffffffffc0d69270 RDI: ffff8af691a80000
[    3.726382] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.726923] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aa56c0
[    3.727386] R13: 0000000000000005 R14: ffff8af691a80000 R15: 0000000000000001
[    3.727932] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.728465] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.728904] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.729379] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.729914] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.730410] Call Trace:
[    3.730576]  <TASK>
[    3.730782]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.731071]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.731370]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.731962]  ? show_regs.part.0+0x23/0x29
[    3.732230]  ? show_regs.cold+0x8/0xd
[    3.732486]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.732998]  ? __warn+0x8c/0x100
[    3.733215]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.733776]  ? report_bug+0xa4/0xd0
[    3.734020]  ? handle_bug+0x39/0x90
[    3.734253]  ? exc_invalid_op+0x19/0x70
[    3.734520]  ? asm_exc_invalid_op+0x1b/0x20
[    3.734848]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.735326]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.735934]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.736506]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.736934]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.737430]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.738098]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.738562]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.738950]  local_pci_probe+0x4b/0x90
[    3.739203]  pci_device_probe+0x119/0x200
[    3.739467]  really_probe+0x222/0x420
[    3.739741]  __driver_probe_device+0xe8/0x140
[    3.740065]  driver_probe_device+0x23/0xc0
[    3.740340]  __driver_attach+0xf7/0x1f0
[    3.740597]  ? __device_attach_driver+0x140/0x140
[    3.741006]  bus_for_each_dev+0x7f/0xd0
[    3.741263]  driver_attach+0x1e/0x30
[    3.741502]  bus_add_driver+0x148/0x220
[    3.741803]  driver_register+0x95/0x100
[    3.742104]  __pci_register_driver+0x68/0x70
[    3.742389]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.742894]  ? 0xffffffffc1409000
[    3.743129]  do_one_initcall+0x49/0x1e0
[    3.743386]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.743723]  do_init_module+0x52/0x260
[    3.744006]  load_module+0xb45/0xbe0
[    3.744259]  __do_sys_finit_module+0xbf/0x120
[    3.744550]  __x64_sys_finit_module+0x18/0x20
[    3.744872]  x64_sys_call+0x1ac3/0x1fa0
[    3.745158]  do_syscall_64+0x56/0xb0
[    3.745410]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.745726]  ? x64_sys_call+0x1e12/0x1fa0
[    3.746049]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.746378]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.746734]  ? x64_sys_call+0x3b9/0x1fa0
[    3.747028]  ? do_syscall_64+0x63/0xb0
[    3.747277]  ? do_syscall_64+0x63/0xb0
[    3.747538]  ? do_syscall_64+0x63/0xb0
[    3.747813]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.748179] RIP: 0033:0x7f9f5dea788d
[    3.748430] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.749765] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.750311] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.750826] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.751315] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.751817] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.752314] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.752824]  </TASK>
[    3.752976] ---[ end trace 977c9eb411d0c022 ]---
[    3.753320] ------------[ cut here ]------------
[    3.753664] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.754599] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.757082] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.757777] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.758394] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.758961] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.760253] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.760646] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af6910ad358
[    3.761126] RDX: 0000000000000000 RSI: ffffffffc0d70790 RDI: ffff8af691a80000
[    3.761675] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.762159] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aacb98
[    3.762698] R13: 0000000000000000 R14: ffff8af691a80000 R15: 0000000000000001
[    3.763161] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.763765] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.764142] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.764685] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.765151] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.765702] Call Trace:
[    3.765890]  <TASK>
[    3.766035]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.766323]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.766676]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.767229]  ? show_regs.part.0+0x23/0x29
[    3.767500]  ? show_regs.cold+0x8/0xd
[    3.767823]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.768306]  ? __warn+0x8c/0x100
[    3.768523]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.769063]  ? report_bug+0xa4/0xd0
[    3.769297]  ? handle_bug+0x39/0x90
[    3.769529]  ? exc_invalid_op+0x19/0x70
[    3.769848]  ? asm_exc_invalid_op+0x1b/0x20
[    3.770162]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.770680]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.771226]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.771841]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.772220]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.772769]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.773375]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.773900]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.774254]  local_pci_probe+0x4b/0x90
[    3.774504]  pci_device_probe+0x119/0x200
[    3.774822]  really_probe+0x222/0x420
[    3.775068]  __driver_probe_device+0xe8/0x140
[    3.775367]  driver_probe_device+0x23/0xc0
[    3.775666]  __driver_attach+0xf7/0x1f0
[    3.775946]  ? __device_attach_driver+0x140/0x140
[    3.776257]  bus_for_each_dev+0x7f/0xd0
[    3.776525]  driver_attach+0x1e/0x30
[    3.776829]  bus_add_driver+0x148/0x220
[    3.777086]  driver_register+0x95/0x100
[    3.777340]  __pci_register_driver+0x68/0x70
[    3.777672]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.778120]  ? 0xffffffffc1409000
[    3.778342]  do_one_initcall+0x49/0x1e0
[    3.778608]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.778970]  do_init_module+0x52/0x260
[    3.779221]  load_module+0xb45/0xbe0
[    3.779459]  __do_sys_finit_module+0xbf/0x120
[    3.779804]  __x64_sys_finit_module+0x18/0x20
[    3.780103]  x64_sys_call+0x1ac3/0x1fa0
[    3.780358]  do_syscall_64+0x56/0xb0
[    3.780596]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.780939]  ? x64_sys_call+0x1e12/0x1fa0
[    3.781208]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.781522]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.781928]  ? x64_sys_call+0x3b9/0x1fa0
[    3.782210]  ? do_syscall_64+0x63/0xb0
[    3.782464]  ? do_syscall_64+0x63/0xb0
[    3.782750]  ? do_syscall_64+0x63/0xb0
[    3.783044]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.783378] RIP: 0033:0x7f9f5dea788d
[    3.783615] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.784963] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.785465] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.786024] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.786518] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.787051] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.787524] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.788055]  </TASK>
[    3.788217] ---[ end trace 977c9eb411d0c023 ]---
[    3.788532] ------------[ cut here ]------------
[    3.788873] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.789820] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.792325] CPU: 1 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.792984] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.793580] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.794176] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.795482] RSP: 0018:ffffa05a805fb900 EFLAGS: 00010246
[    3.795872] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af6910ad358
[    3.796361] RDX: 0000000000000001 RSI: ffffffffc0d70790 RDI: ffff8af691a80000
[    3.796870] RBP: ffffa05a805fb920 R08: 0000000000000000 R09: 0000000000000019
[    3.797361] R10: 0000000000000280 R11: 3020757067646d61 R12: ffff8af691aacb98
[    3.797869] R13: 0000000000000001 R14: ffff8af691a80000 R15: 0000000000000001
[    3.798400] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc80000(0000) knlGS:0000000000000000
[    3.798964] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.799384] CR2: 00007f49ea9b3e24 CR3: 000000010eade004 CR4: 0000000000170ee0
[    3.799882] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.800391] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.800890] Call Trace:
[    3.801056]  <TASK>
[    3.801212]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.801534]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.801868]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.802477]  ? show_regs.part.0+0x23/0x29
[    3.802780]  ? show_regs.cold+0x8/0xd
[    3.803026]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.803552]  ? __warn+0x8c/0x100
[    3.803819]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.804301]  ? report_bug+0xa4/0xd0
[    3.804584]  ? handle_bug+0x39/0x90
[    3.804854]  ? exc_invalid_op+0x19/0x70
[    3.805110]  ? asm_exc_invalid_op+0x1b/0x20
[    3.805388]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.805940]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.806484]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.807114]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.807482]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.808050]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.808715]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.809176]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.809498]  local_pci_probe+0x4b/0x90
[    3.809829]  pci_device_probe+0x119/0x200
[    3.810116]  really_probe+0x222/0x420
[    3.810359]  __driver_probe_device+0xe8/0x140
[    3.810690]  driver_probe_device+0x23/0xc0
[    3.810984]  __driver_attach+0xf7/0x1f0
[    3.811240]  ? __device_attach_driver+0x140/0x140
[    3.811551]  bus_for_each_dev+0x7f/0xd0
[    3.811856]  driver_attach+0x1e/0x30
[    3.812111]  bus_add_driver+0x148/0x220
[    3.812369]  driver_register+0x95/0x100
[    3.812652]  __pci_register_driver+0x68/0x70
[    3.812983]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.813424]  ? 0xffffffffc1409000
[    3.813685]  do_one_initcall+0x49/0x1e0
[    3.813969]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.814293]  do_init_module+0x52/0x260
[    3.814543]  load_module+0xb45/0xbe0
[    3.814834]  __do_sys_finit_module+0xbf/0x120
[    3.815137]  __x64_sys_finit_module+0x18/0x20
[    3.815430]  x64_sys_call+0x1ac3/0x1fa0
[    3.815713]  do_syscall_64+0x56/0xb0
[    3.815974]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.816259]  ? x64_sys_call+0x1e12/0x1fa0
[    3.816525]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.816893]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.817211]  ? x64_sys_call+0x3b9/0x1fa0
[    3.817482]  ? do_syscall_64+0x63/0xb0
[    3.817788]  ? do_syscall_64+0x63/0xb0
[    3.818049]  ? do_syscall_64+0x63/0xb0
[    3.818297]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.818669] RIP: 0033:0x7f9f5dea788d
[    3.818934] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.820212] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.820752] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.821246] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.821782] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.822275] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.822790] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.823281]  </TASK>
[    3.823432] ---[ end trace 977c9eb411d0c024 ]---
[    3.824830] ------------[ cut here ]------------
[    3.825190] WARNING: CPU: 2 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.826189] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.828641] CPU: 2 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.829344] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.829954] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.830514] Code: 74 0d 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 44 89 ea 4c 89 e6 4c 89 f7 e8 d9 fc ff ff 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc <0f> 0b b8 ea ff ff ff eb cf b8 ea ff ff ff eb c8 b8 fe ff ff ff eb
[    3.831833] RSP: 0018:ffffa05a805fb930 EFLAGS: 00010246
[    3.832210] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff8af6910adf90
[    3.832727] RDX: 0000000000000000 RSI: ffffffffc0d3f770 RDI: ffff8af691a80000
[    3.833224] RBP: ffffa05a805fb950 R08: 0000000000000002 R09: 00000000002eec94
[    3.833755] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8af691a80c28
[    3.834270] R13: 0000000000000000 R14: ffff8af691a80000 R15: ffff8af691a80010
[    3.834783] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afd00000(0000) knlGS:0000000000000000
[    3.835336] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.835745] CR2: 00007f7c13175e24 CR3: 000000010eade002 CR4: 0000000000170ee0
[    3.836217] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.836724] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.837198] Call Trace:
[    3.837393]  <TASK>
[    3.837538]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.837889]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.838178]  ? gmc_v11_0_hw_fini+0x25/0x90 [amdgpu]
[    3.838725]  ? show_regs.part.0+0x23/0x29
[    3.839013]  ? show_regs.cold+0x8/0xd
[    3.839257]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.839815]  ? __warn+0x8c/0x100
[    3.840051]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.840559]  ? report_bug+0xa4/0xd0
[    3.840828]  ? handle_bug+0x39/0x90
[    3.841073]  ? exc_invalid_op+0x19/0x70
[    3.841336]  ? asm_exc_invalid_op+0x1b/0x20
[    3.841710]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.842223]  gmc_v11_0_hw_fini+0x25/0x90 [amdgpu]
[    3.842753]  amdgpu_device_fini_hw+0x3f6/0x50a [amdgpu]
[    3.843349]  ? blocking_notifier_chain_unregister+0x56/0xb0
[    3.843780]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.844287]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.844956]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.845433]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[    3.845844]  local_pci_probe+0x4b/0x90
[    3.846098]  pci_device_probe+0x119/0x200
[    3.846364]  really_probe+0x222/0x420
[    3.846661]  __driver_probe_device+0xe8/0x140
[    3.846960]  driver_probe_device+0x23/0xc0
[    3.847230]  __driver_attach+0xf7/0x1f0
[    3.847485]  ? __device_attach_driver+0x140/0x140
[    3.847857]  bus_for_each_dev+0x7f/0xd0
[    3.848114]  driver_attach+0x1e/0x30
[    3.848353]  bus_add_driver+0x148/0x220
[    3.848661]  driver_register+0x95/0x100
[    3.848928]  __pci_register_driver+0x68/0x70
[    3.849210]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.849713]  ? 0xffffffffc1409000
[    3.849946]  do_one_initcall+0x49/0x1e0
[    3.850200]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.850507]  do_init_module+0x52/0x260
[    3.850824]  load_module+0xb45/0xbe0
[    3.851074]  __do_sys_finit_module+0xbf/0x120
[    3.851362]  __x64_sys_finit_module+0x18/0x20
[    3.851687]  x64_sys_call+0x1ac3/0x1fa0
[    3.851973]  do_syscall_64+0x56/0xb0
[    3.852210]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.852480]  ? x64_sys_call+0x1e12/0x1fa0
[    3.852795]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.853132]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.853445]  ? x64_sys_call+0x3b9/0x1fa0
[    3.853772]  ? do_syscall_64+0x63/0xb0
[    3.854027]  ? do_syscall_64+0x63/0xb0
[    3.854294]  ? do_syscall_64+0x63/0xb0
[    3.854543]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.854925] RIP: 0033:0x7f9f5dea788d
[    3.855176] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    3.856443] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.856983] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    3.857464] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    3.857999] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    3.858505] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    3.859018] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    3.859479]  </TASK>
[    3.859677] ---[ end trace 977c9eb411d0c025 ]---
[    3.879789] amdgpu: probe of 0000:00:10.0 failed with error -22
[    3.967599] ------------[ cut here ]------------
[    3.967955] WARNING: CPU: 0 PID: 174 at /tmp/amd.wzTIDVXS/drm_buddy.c:192 amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.968740] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.971231] CPU: 0 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    3.971908] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    3.972558] RIP: 0010:amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.973014] Code: 77 d0 49 8b 44 24 20 49 39 44 24 28 75 20 49 8b 7c 24 08 e8 12 bb a1 f6 49 8b 3c 24 e8 09 bb a1 f6 5b 41 5c 5d c3 cc cc cc cc <0f> 0b eb be 0f 0b eb dc 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55
[    3.974357] RSP: 0018:ffffa05a805fb8f0 EFLAGS: 00010206
[    3.974775] RAX: 0000000000000c00 RBX: 0000000000000000 RCX: ffff8af691a8faf8
[    3.975284] RDX: ffff8af691a7fd20 RSI: ffff8af690051438 RDI: ffff8af691a8faa8
[    3.975800] RBP: ffffa05a805fb900 R08: 0000000000000001 R09: 0000000000000000
[    3.976299] R10: 0000000000000001 R11: ffff8af684942b00 R12: ffff8af691a8faa8
[    3.977356] R13: ffff8af691a8fb08 R14: ffff8af691a8faa8 R15: ffff8af691a8fae8
[    3.977906] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc00000(0000) knlGS:0000000000000000
[    3.978471] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.978915] CR2: 000055ef5f2af208 CR3: 000000010eade006 CR4: 0000000000170ef0
[    3.979420] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.979940] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.980438] Call Trace:
[    3.980632]  <TASK>
[    3.980813]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.981105]  ? show_trace_log_lvl+0x1d6/0x2ea
[    3.981415]  ? amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    3.982093]  ? show_regs.part.0+0x23/0x29
[    3.982385]  ? show_regs.cold+0x8/0xd
[    3.982683]  ? amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.983039]  ? __warn+0x8c/0x100
[    3.983255]  ? amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.983649]  ? report_bug+0xa4/0xd0
[    3.983906]  ? handle_bug+0x39/0x90
[    3.984138]  ? exc_invalid_op+0x19/0x70
[    3.984411]  ? asm_exc_invalid_op+0x1b/0x20
[    3.984724]  ? amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.985090]  amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    3.985722]  amdgpu_ttm_fini+0x254/0x320 [amdgpu]
[    3.986208]  amdgpu_bo_fini+0x27/0xc0 [amdgpu]
[    3.986734]  gmc_v11_0_sw_fini+0x2b/0x40 [amdgpu]
[    3.987236]  amdgpu_device_fini_sw+0x116/0x570 [amdgpu]
[    3.987825]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[    3.988351]  devm_drm_dev_init_release+0x4d/0x80 [drm]
[    3.988801]  devm_action_release+0x15/0x20
[    3.989073]  release_nodes+0x40/0xb0
[    3.989332]  devres_release_all+0x9b/0xd0
[    3.989698]  really_probe+0x11d/0x420
[    3.989956]  __driver_probe_device+0xe8/0x140
[    3.990266]  driver_probe_device+0x23/0xc0
[    3.990562]  __driver_attach+0xf7/0x1f0
[    3.990868]  ? __device_attach_driver+0x140/0x140
[    3.991177]  bus_for_each_dev+0x7f/0xd0
[    3.991452]  driver_attach+0x1e/0x30
[    3.991759]  bus_add_driver+0x148/0x220
[    3.992017]  driver_register+0x95/0x100
[    3.992271]  __pci_register_driver+0x68/0x70
[    3.992603]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.993083]  ? 0xffffffffc1409000
[    3.993306]  do_one_initcall+0x49/0x1e0
[    3.993592]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    3.993973]  do_init_module+0x52/0x260
[    3.994234]  load_module+0xb45/0xbe0
[    3.994481]  __do_sys_finit_module+0xbf/0x120
[    3.994855]  __x64_sys_finit_module+0x18/0x20
[    3.995154]  x64_sys_call+0x1ac3/0x1fa0
[    3.995416]  do_syscall_64+0x56/0xb0
[    3.995726]  ? ksys_mmap_pgoff+0x154/0x2c0
[    3.996002]  ? x64_sys_call+0x1e12/0x1fa0
[    3.996266]  ? exit_to_user_mode_prepare+0x37/0xb0
[    3.996581]  ? syscall_exit_to_user_mode+0x2c/0x50
[    3.996958]  ? x64_sys_call+0x3b9/0x1fa0
[    3.997222]  ? do_syscall_64+0x63/0xb0
[    3.997470]  ? do_syscall_64+0x63/0xb0
[    3.997797]  ? do_syscall_64+0x63/0xb0
[    3.998091]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    3.998425] RIP: 0033:0x7f9f5dea788d
[    3.998736] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    4.000022] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    4.000524] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    4.001031] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    4.001516] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    4.002067] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    4.002573] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    4.003092]  </TASK>
[    4.003244] ---[ end trace 977c9eb411d0c026 ]---
[    4.003588] ------------[ cut here ]------------
[    4.003948] WARNING: CPU: 0 PID: 174 at /tmp/amd.wzTIDVXS/drm_buddy.c:196 amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.004678] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    4.007157] CPU: 0 PID: 174 Comm: systemd-udevd Tainted: G        W  OE     5.15.0-125-generic #135-Ubuntu
[    4.007865] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 4.2023.08-4 02/15/2024
[    4.008425] RIP: 0010:amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.008884] Code: 44 24 20 49 39 44 24 28 75 20 49 8b 7c 24 08 e8 12 bb a1 f6 49 8b 3c 24 e8 09 bb a1 f6 5b 41 5c 5d c3 cc cc cc cc 0f 0b eb be <0f> 0b eb dc 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 49 89 f8 48
[    4.010189] RSP: 0018:ffffa05a805fb8f0 EFLAGS: 00010287
[    4.010550] RAX: 00000004ff000000 RBX: 0000000000000009 RCX: ffffffffb7e67b5c
[    4.011088] RDX: 000000008038001b RSI: ffffffffc0144081 RDI: ffff8af68023ca00
[    4.011553] RBP: ffffa05a805fb900 R08: 0000000000000001 R09: 0000000000000000
[    4.012093] R10: 0000000000000001 R11: ffff8af684942b00 R12: ffff8af691a8faa8
[    4.012559] R13: ffff8af691a8fb08 R14: ffff8af691a8faa8 R15: ffff8af691a8fae8
[    4.013066] FS:  00007f9f5d7ad8c0(0000) GS:ffff8af9afc00000(0000) knlGS:0000000000000000
[    4.013661] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.014075] CR2: 000055ef5f2af208 CR3: 000000010eade006 CR4: 0000000000170ef0
[    4.014563] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    4.015082] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    4.015566] Call Trace:
[    4.015757]  <TASK>
[    4.015902]  ? show_trace_log_lvl+0x1d6/0x2ea
[    4.016214]  ? show_trace_log_lvl+0x1d6/0x2ea
[    4.016526]  ? amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    4.017105]  ? show_regs.part.0+0x23/0x29
[    4.017375]  ? show_regs.cold+0x8/0xd
[    4.017706]  ? amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.018102]  ? __warn+0x8c/0x100
[    4.018322]  ? amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.018727]  ? report_bug+0xa4/0xd0
[    4.018960]  ? handle_bug+0x39/0x90
[    4.019215]  ? exc_invalid_op+0x19/0x70
[    4.019473]  ? asm_exc_invalid_op+0x1b/0x20
[    4.019788]  ? amddrm_buddy_fini+0x41/0x80 [amddrm_buddy]
[    4.020165]  ? amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.020524]  amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    4.021088]  amdgpu_ttm_fini+0x254/0x320 [amdgpu]
[    4.021554]  amdgpu_bo_fini+0x27/0xc0 [amdgpu]
[    4.022135]  gmc_v11_0_sw_fini+0x2b/0x40 [amdgpu]
[    4.022634]  amdgpu_device_fini_sw+0x116/0x570 [amdgpu]
[    4.023184]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[    4.023714]  devm_drm_dev_init_release+0x4d/0x80 [drm]
[    4.024112]  devm_action_release+0x15/0x20
[    4.024386]  release_nodes+0x40/0xb0
[    4.024642]  devres_release_all+0x9b/0xd0
[    4.024928]  really_probe+0x11d/0x420
[    4.025214]  __driver_probe_device+0xe8/0x140
[    4.025504]  driver_probe_device+0x23/0xc0
[    4.025852]  __driver_attach+0xf7/0x1f0
[    4.026148]  ? __device_attach_driver+0x140/0x140
[    4.026484]  bus_for_each_dev+0x7f/0xd0
[    4.026774]  driver_attach+0x1e/0x30
[    4.027014]  bus_add_driver+0x148/0x220
[    4.027301]  driver_register+0x95/0x100
[    4.027569]  __pci_register_driver+0x68/0x70
[    4.027874]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    4.028330]  ? 0xffffffffc1409000
[    4.028576]  do_one_initcall+0x49/0x1e0
[    4.028867]  ? kmem_cache_alloc_trace+0x19e/0x2e0
[    4.029198]  do_init_module+0x52/0x260
[    4.029450]  load_module+0xb45/0xbe0
[    4.029776]  __do_sys_finit_module+0xbf/0x120
[    4.030086]  __x64_sys_finit_module+0x18/0x20
[    4.030395]  x64_sys_call+0x1ac3/0x1fa0
[    4.030700]  do_syscall_64+0x56/0xb0
[    4.030941]  ? ksys_mmap_pgoff+0x154/0x2c0
[    4.031230]  ? x64_sys_call+0x1e12/0x1fa0
[    4.031497]  ? exit_to_user_mode_prepare+0x37/0xb0
[    4.031850]  ? syscall_exit_to_user_mode+0x2c/0x50
[    4.032182]  ? x64_sys_call+0x3b9/0x1fa0
[    4.032468]  ? do_syscall_64+0x63/0xb0
[    4.032753]  ? do_syscall_64+0x63/0xb0
[    4.033013]  ? do_syscall_64+0x63/0xb0
[    4.033281]  entry_SYSCALL_64_after_hwframe+0x6c/0xd6
[    4.033665] RIP: 0033:0x7f9f5dea788d
[    4.033951] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    4.035232] RSP: 002b:00007ffd0ffad1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    4.035763] RAX: ffffffffffffffda RBX: 000055ef5f290090 RCX: 00007f9f5dea788d
[    4.036266] RDX: 0000000000000000 RSI: 00007f9f5e03f441 RDI: 000000000000001a
[    4.036769] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[    4.037274] R10: 000000000000001a R11: 0000000000000246 R12: 00007f9f5e03f441
[    4.037815] R13: 000055ef5f28c5f0 R14: 000055ef5f286940 R15: 000055ef5f290bb0
[    4.038327]  </TASK>
[    4.038478] ---[ end trace 977c9eb411d0c027 ]---
[    4.038972] [drm] amdgpu: ttm finalized
[    4.039281] amdgpu: legacy kernel without apple_gmux_detect()
[    5.213617] raid6: avx2x4   gen() 35377 MB/s
[    5.281617] raid6: avx2x4   xor() 12993 MB/s
[    5.349617] raid6: avx2x2   gen() 33876 MB/s
[    5.417617] raid6: avx2x2   xor() 21027 MB/s
[    5.485617] raid6: avx2x1   gen() 31469 MB/s
[    5.553617] raid6: avx2x1   xor() 18514 MB/s
[    5.621617] raid6: sse2x4   gen() 19632 MB/s
[    5.689618] raid6: sse2x4   xor() 10892 MB/s
[    5.757618] raid6: sse2x2   gen() 18743 MB/s
[    5.825618] raid6: sse2x2   xor() 12069 MB/s
[    5.893618] raid6: sse2x1   gen() 16424 MB/s
[    5.961618] raid6: sse2x1   xor() 10862 MB/s
[    5.961962] raid6: using algorithm avx2x4 gen() 35377 MB/s
[    5.962323] raid6: .... xor() 12993 MB/s, rmw enabled
[    5.962690] raid6: using avx2x2 recovery algorithm
[    5.964029] xor: automatically using best checksumming function   avx       
[    5.965379] async_tx: api initialized (async)
[    6.019586] Btrfs loaded, crc32c=crc32c-intel, zoned=yes, fsverity=yes
[    6.132196] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null). Quota mode: none.
[    6.409652] systemd[1]: Inserted module 'autofs4'
[    6.433540] systemd[1]: systemd 249.11-0ubuntu3.12 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    6.436039] systemd[1]: Detected virtualization kvm.
[    6.436384] systemd[1]: Detected architecture x86-64.
[    6.439717] systemd[1]: Hostname set to <ollama>.
[    6.705837] systemd[1]: Configuration file /run/systemd/system/netplan-ovs-cleanup.service is marked world-inaccessible. This has no effect as configuration data is accessible via APIs without restrictions. Proceeding anyway.
[    6.732728] systemd[1]: /lib/systemd/system/snapd.service:23: Unknown key name 'RestartMode' in section 'Service', ignoring.
[    6.852184] systemd[1]: Queued start job for default target Graphical Interface.
[    6.854172] systemd[1]: Created slice Slice /system/modprobe.
[    6.854952] systemd[1]: Created slice Slice /system/systemd-fsck.
[    6.855678] systemd[1]: Created slice User and Session Slice.
[    6.856144] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    6.856869] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    6.857573] systemd[1]: Reached target Slice Units.
[    6.857988] systemd[1]: Reached target Mounting snaps.
[    6.858363] systemd[1]: Reached target Swaps.
[    6.858722] systemd[1]: Reached target Local Verity Protected Volumes.
[    6.859236] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    6.859800] systemd[1]: Listening on LVM2 poll daemon socket.
[    6.860284] systemd[1]: Listening on multipathd control socket.
[    6.860798] systemd[1]: Listening on Syslog Socket.
[    6.861220] systemd[1]: Listening on fsck to fsckd communication Socket.
[    6.861812] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    6.862410] systemd[1]: Listening on Journal Audit Socket.
[    6.862897] systemd[1]: Listening on Journal Socket (/dev/log).
[    6.863386] systemd[1]: Listening on Journal Socket.
[    6.863868] systemd[1]: Listening on Network Service Netlink Socket.
[    6.864424] systemd[1]: Listening on udev Control Socket.
[    6.864895] systemd[1]: Listening on udev Kernel Socket.
[    6.865986] systemd[1]: Mounting Huge Pages File System...
[    6.867293] systemd[1]: Mounting POSIX Message Queue File System...
[    6.868513] systemd[1]: Mounting Kernel Debug File System...
[    6.869868] systemd[1]: Mounting Kernel Trace File System...
[    6.872202] systemd[1]: Starting Journal Service...
[    6.873885] systemd[1]: Starting Set the console keyboard layout...
[    6.875533] systemd[1]: Starting Create List of Static Device Nodes...
[    6.877112] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    6.878554] systemd[1]: Condition check resulted in LXD - agent being skipped.
[    6.880653] systemd[1]: Starting Load Kernel Module configfs...
[    6.882497] systemd[1]: Starting Load Kernel Module drm...
[    6.884190] systemd[1]: Starting Load Kernel Module efi_pstore...
[    6.886690] systemd[1]: Starting Load Kernel Module fuse...
[    6.888890] systemd[1]: Condition check resulted in OpenVSwitch configuration for cleanup being skipped.
[    6.890313] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[    6.895472] systemd[1]: Starting Load Kernel Modules...
[    6.897196] systemd[1]: Starting Remount Root and Kernel File Systems...
[    6.899122] systemd[1]: Starting Coldplug All udev Devices...
[    6.903174] systemd[1]: Mounted Huge Pages File System.
[    6.904497] systemd[1]: Mounted POSIX Message Queue File System.
[    6.904835] EXT4-fs (sda1): re-mounted. Opts: discard,errors=remount-ro. Quota mode: none.
[    6.906155] pstore: Using crash dump compression: deflate
[    6.906727] pstore: Registered efi as persistent store backend
[    6.907090] systemd[1]: Mounted Kernel Debug File System.
[    6.907889] systemd[1]: Mounted Kernel Trace File System.
[    6.908718] systemd[1]: Finished Create List of Static Device Nodes.
[    6.909409] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    6.911115] systemd[1]: Finished Load Kernel Module configfs.
[    6.912118] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    6.913126] systemd[1]: Finished Load Kernel Module drm.
[    6.914324] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
[    6.915391] systemd[1]: Finished Load Kernel Module efi_pstore.
[    6.916366] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    6.917366] systemd[1]: Finished Load Kernel Module fuse.
[    6.918537] systemd[1]: Finished Load Kernel Modules.
[    6.919566] systemd[1]: Finished Remount Root and Kernel File Systems.
[    6.921473] systemd[1]: Mounting FUSE Control File System...
[    6.925376] systemd[1]: Mounting Kernel Configuration File System...
[    6.927345] systemd[1]: Starting Device-Mapper Multipath Device Controller...
[    6.928353] systemd[1]: Condition check resulted in Platform Persistent Storage Archival being skipped.
[    6.930592] systemd[1]: Starting Load/Save Random Seed...
[    6.932000] systemd[1]: Starting Apply Kernel Variables...
[    6.933171] alua: device handler registered
[    6.933745] systemd[1]: Starting Create System Users...
[    6.935314] emc: device handler registered
[    6.936367] systemd[1]: Started Journal Service.
[    6.938504] rdac: device handler registered
[    6.946676] systemd-journald[409]: Received client request to flush runtime journal.
[    7.063826] loop0: detected capacity change from 0 to 130960
[    7.068326] loop1: detected capacity change from 0 to 130448
[    7.072183] loop2: detected capacity change from 0 to 178240
[    7.079146] loop3: detected capacity change from 0 to 178256
[    7.083851] loop4: detected capacity change from 0 to 79328
[    7.090789] loop5: detected capacity change from 0 to 79520
[    7.310153] virtio_net virtio3 eth0: renamed from ens18
[    7.655138] audit: type=1400 audit(1731866289.552:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=559 comm="apparmor_parser"
[    7.655145] audit: type=1400 audit(1731866289.552:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=559 comm="apparmor_parser"
[    7.656138] audit: type=1400 audit(1731866289.552:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=558 comm="apparmor_parser"
[    7.666890] audit: type=1400 audit(1731866289.564:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=563 comm="apparmor_parser"
[    7.666894] audit: type=1400 audit(1731866289.564:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=563 comm="apparmor_parser"
[    7.666896] audit: type=1400 audit(1731866289.564:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=563 comm="apparmor_parser"
[    7.673055] audit: type=1400 audit(1731866289.568:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ubuntu_pro_apt_news" pid=561 comm="apparmor_parser"
[    7.677951] audit: type=1400 audit(1731866289.576:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="tcpdump" pid=564 comm="apparmor_parser"
[    7.679186] audit: type=1400 audit(1731866289.576:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=560 comm="apparmor_parser"
[    7.679191] audit: type=1400 audit(1731866289.576:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=560 comm="apparmor_parser"
[    9.358779] ISO 9660 Extensions: RRIP_1991A
[   12.619608] loop6: detected capacity change from 0 to 8
[   12.926589] kauditd_printk_skb: 31 callbacks suppressed
[   12.926592] audit: type=1400 audit(1731866294.824:43): apparmor="STATUS" operation="profile_replace" profile="unconfined" name="/usr/lib/snapd/snap-confine" pid=790 comm="apparmor_parser"
[   12.942662] audit: type=1400 audit(1731866294.840:44): apparmor="STATUS" operation="profile_replace" profile="unconfined" name="/usr/lib/snapd/snap-confine//mount-namespace-capture-helper" pid=790 comm="apparmor_parser"
[   13.681047] audit: type=1400 audit(1731866295.576:45): apparmor="STATUS" operation="profile_load" profile="unconfined" name="docker-default" pid=866 comm="apparmor_parser"
[   14.493373] Initializing XFRM netlink socket
[   14.525814] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[   14.893628] docker0: port 1(vethaef5d2f) entered blocking state
[   14.893632] docker0: port 1(vethaef5d2f) entered disabled state
[   14.893723] device vethaef5d2f entered promiscuous mode
[   14.893840] docker0: port 1(vethaef5d2f) entered blocking state
[   14.893842] docker0: port 1(vethaef5d2f) entered forwarding state
[   14.893908] docker0: port 1(vethaef5d2f) entered disabled state
[   15.198070] eth0: renamed from veth2a3f9dc
[   15.226316] IPv6: ADDRCONF(NETDEV_CHANGE): vethaef5d2f: link becomes ready
[   15.226364] docker0: port 1(vethaef5d2f) entered blocking state
[   15.226368] docker0: port 1(vethaef5d2f) entered forwarding state
[   15.226411] IPv6: ADDRCONF(NETDEV_CHANGE): docker0: link becomes ready


Just the lines that have "amd" in them
ubuntu@ollama:~$ sudo dmesg | grep "amd"
[    0.000000] Linux version 5.15.0-125-generic (buildd@lcy02-amd64-040) (gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #135-Ubuntu SMP Fri Sep 27 13:53:58 UTC 2024 (Ubuntu 5.15.0-125.135-generic 5.15.167)
[    1.216003] amdkcl: loading out-of-tree module taints kernel.
[    1.218592] amdkcl: module verification failed: signature and/or required key missing - tainting kernel
[    1.539891] [drm] amdgpu kernel modesetting enabled.
[    1.541571] [drm] amdgpu version: 6.8.5
[    1.543560] amdgpu: Virtual CRAT table created for CPU
[    1.544694] amdgpu: Topology: Add CPU node
[    1.548103] amdgpu 0000:00:10.0: Adding to iommu group 7
[    1.586201] amdgpu 0000:00:10.0: amdgpu: Fetched VBIOS from VFCT
[    1.587141] amdgpu: ATOM BIOS: 113-31TESHAS1-L02
[    1.588272] amdgpu 0000:00:10.0: amdgpu: CP RS64 enable
[    1.591304] amdgpu 0000:00:10.0: [drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
[    1.593515] amdgpu 0000:00:10.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[    1.594273] amdgpu 0000:00:10.0: amdgpu: MEM ECC is not presented.
[    1.594746] amdgpu 0000:00:10.0: amdgpu: SRAM ECC is not presented.
[    1.602151] amdgpu 0000:00:10.0: BAR 2: releasing [mem 0x7030000000-0x70301fffff 64bit pref]
[    1.602819] amdgpu 0000:00:10.0: BAR 0: releasing [mem 0x7000000000-0x700fffffff 64bit pref]
[    1.603522] amdgpu 0000:00:10.0: BAR 0: assigned [mem 0x7000000000-0x700fffffff 64bit pref]
[    1.604205] amdgpu 0000:00:10.0: BAR 2: assigned [mem 0x7030000000-0x70301fffff 64bit pref]
[    1.623695] amdgpu 0000:00:10.0: amdgpu: VRAM: 20464M 0x0000008000000000 - 0x00000084FEFFFFFF (20464M used)
[    1.624727] amdgpu 0000:00:10.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
[    1.626440] [drm] amdgpu: 20464M of VRAM memory ready
[    1.626856] [drm] amdgpu: 7991M of GTT memory ready.
[    3.249343] amdgpu 0000:00:10.0: amdgpu: PSP load kdb failed!
[    3.430830] [drm:psp_v13_0_ring_destroy [amdgpu]] *ERROR* Fail to stop psp ring
[    3.431662] amdgpu 0000:00:10.0: amdgpu: PSP firmware loading failed
[    3.432317] [drm:amdgpu_device_fw_loading [amdgpu]] *ERROR* hw_init of IP block <psp> failed -22
[    3.433129] amdgpu 0000:00:10.0: amdgpu: amdgpu_device_ip_init failed
[    3.433571] amdgpu 0000:00:10.0: amdgpu: Fatal error during GPU init
[    3.434073] amdgpu 0000:00:10.0: amdgpu: amdgpu: finishing device.
[    3.434922] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.435848] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.439655] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.447923]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.449070]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.449863]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.451481]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.452008]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.452591]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.453646]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.454165]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.454837]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.459197]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.470389] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.471330] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.475281] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.484164]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.485303]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.486058]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.487673]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.488168]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.488752]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.489773]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.490293]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.490947]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.495246]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.506385] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.507350] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.511131] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.519408]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.520533]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.521310]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.522943]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.523467]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.524040]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.525067]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.525636]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.526256]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.530643]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.541805] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.542732] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.546471] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.554765]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.555900]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.556646]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.558303]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.558818]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.559397]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.560414]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.560957]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.561595]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.566000]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.577164] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.578130] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.581867] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.590125]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.591268]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.592007]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.593579]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.594157]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.594737]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.595748]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.596281]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.596941]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.601295]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.612508] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.613434] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.617181] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.625351]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.626510]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.627290]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.628885]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.629394]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.629973]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.630964]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.631495]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.632180]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.636534]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.647887] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.648835] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.652537] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.660692]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.661839]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.662570]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.664185]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.664705]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.665264]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.666283]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.666824]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.667440]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.671808]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.683107] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.684065] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.687864] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.696024]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.697140]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.697919]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.699465]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.700002]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.700537]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.701522]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.702095]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.702741]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.707112]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.718416] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.719347] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.723130] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.731370]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.732486]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.733215]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.734848]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.735326]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.735934]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.736934]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.737430]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.738098]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.742389]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.753664] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.754599] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.758394] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.766676]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.767823]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.768523]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.770162]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.770680]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.771226]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.772220]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.772769]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.773375]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.777672]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.788873] WARNING: CPU: 1 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.789820] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.793580] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.801868]  ? amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.803026]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.803819]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.805388]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.805940]  amdgpu_fence_driver_hw_fini+0x10b/0x150 [amdgpu]
[    3.806484]  amdgpu_device_fini_hw+0xe9/0x50a [amdgpu]
[    3.807482]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.808050]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.808715]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.812983]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.825190] WARNING: CPU: 2 PID: 174 at /tmp/amd.wzTIDVXS/amd/amdgpu/amdgpu_irq.c:633 amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.826189] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.829954] RIP: 0010:amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.838178]  ? gmc_v11_0_hw_fini+0x25/0x90 [amdgpu]
[    3.839257]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.840051]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.841710]  ? amdgpu_irq_put+0x94/0xb0 [amdgpu]
[    3.842223]  gmc_v11_0_hw_fini+0x25/0x90 [amdgpu]
[    3.842753]  amdgpu_device_fini_hw+0x3f6/0x50a [amdgpu]
[    3.843780]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[    3.844287]  amdgpu_driver_load_kms.cold+0x18/0x2e [amdgpu]
[    3.844956]  amdgpu_pci_probe+0x1ed/0x4e0 [amdgpu]
[    3.849210]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    3.879789] amdgpu: probe of 0000:00:10.0 failed with error -22
[    3.967955] WARNING: CPU: 0 PID: 174 at /tmp/amd.wzTIDVXS/drm_buddy.c:192 amdrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.968740] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    3.972558] RIP: 0010:amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.981415]  ? amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    3.982683]  ? amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.983255]  ? amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.984724]  ? amddrm_buddy_fini+0x70/0x80 [amddrm_buddy]
[    3.985090]  amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    3.985722]  amdgpu_ttm_fini+0x254/0x320 [amdgpu]
[    3.986208]  amdgpu_bo_fini+0x27/0xc0 [amdgpu]
[    3.986734]  gmc_v11_0_sw_fini+0x2b/0x40 [amdgpu]
[    3.987236]  amdgpu_device_fini_sw+0x116/0x570 [amdgpu]
[    3.987825]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[    3.992603]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    4.003948] WARNING: CPU: 0 PID: 174 at /tmp/amd.wzTIDVXS/drm_buddy.c:196 amdrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.004678] Modules linked in: amdgpu(OE+) amddrm_ttm_helper(OE) amdttm(OE) amdxcp(OE) amddrm_buddy(OE) amd_sched(OE) hid_generic amdkcl(OE) i2c_algo_bit drm_kms_helper syscopyarea crct10dif_pclmul sysfillrect sysimgblt usbhid fb_sys_fops crc32_pclmul ghash_clmulni_intel sha256_ssse3 cec sha1_ssse3 hid aesni_intel crypto_simd cryptd psmouse rc_core virtio_net drm net_failover failover virtio_scsi floppy
[    4.008425] RIP: 0010:amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.016526]  ? amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    4.017706]  ? amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.018322]  ? amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.019788]  ? amddrm_buddy_fini+0x41/0x80 [amddrm_buddy]
[    4.020165]  ? amddrm_buddy_fini+0x74/0x80 [amddrm_buddy]
[    4.020524]  amdgpu_vram_mgr_fini+0x1b0/0x1e0 [amdgpu]
[    4.021088]  amdgpu_ttm_fini+0x254/0x320 [amdgpu]
[    4.021554]  amdgpu_bo_fini+0x27/0xc0 [amdgpu]
[    4.022135]  gmc_v11_0_sw_fini+0x2b/0x40 [amdgpu]
[    4.022634]  amdgpu_device_fini_sw+0x116/0x570 [amdgpu]
[    4.023184]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[    4.027874]  amdgpu_init+0x9d/0x1000 [amdgpu]
[    4.038972] [drm] amdgpu: ttm finalized
[    4.039281] amdgpu: legacy kernel without apple_gmux_detect()