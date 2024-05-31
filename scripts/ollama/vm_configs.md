### Initial state of fresh clone
root@proxmox:~# cat /etc/pve/qemu-server/101.conf
boot: c
bootdisk: scsi0
cipassword: $5$K42kD3dn$y/WSieEoahTOT93Tw4BXJtpE5rhtPTWsHyOSxrr2IR4
ciuser: ubuntu
cores: 2
ide2: local-lvm:vm-101-cloudinit,media=cdrom,size=4M
ipconfig0: ip=dhcp
memory: 2048
meta: creation-qemu=8.1.5,ctime=1717092278
name: ollama
net0: virtio=BC:24:11:66:D0:2F,bridge=vmbr0
scsi0: local-lvm:vm-101-disk-0,size=2252M
scsihw: virtio-scsi-pci
serial0: socket
smbios1: uuid=e62403cd-fc29-4923-ba1b-ced493c3b172
sshkeys: ssh-rsa <hidden>
vga: serial0
vmgenid: 57d02894-8519-4080-85a6-2792f9a80301

### End state of adapted clone
root@proxmox:~# cat /etc/pve/qemu-server/101.conf
bios: ovmf
boot: c
bootdisk: scsi0
cipassword: $5$K42kD3dn$y/WSieEoahTOT93Tw4BXJtpE5rhtPTWsHyOSxrr2IR4
ciuser: ubuntu
cores: 4
efidisk0: local-lvm:vm-101-disk-1,efitype=4m,pre-enrolled-keys=1,size=4M
hostpci0: 0000:03:00.0
ide2: local-lvm:vm-101-cloudinit,media=cdrom,size=4M
ipconfig0: ip=192.168.1.101/24,gw=192.168.1.1
machine: q35
memory: 16384
meta: creation-qemu=8.1.5,ctime=1717092278
name: ollama
net0: virtio=BC:24:11:63:24:12,bridge=vmbr0
numa: 0
scsi0: local-lvm:vm-101-disk-0,size=84172M
scsihw: virtio-scsi-pci
serial0: socket
smbios1: uuid=747716ca-8b7c-40bb-a815-d26eea1df803
sockets: 1
sshkeys: ssh-rsa <hidden>
vga: serial0
vmgenid: 7fa35698-77f7-4dbc-b242-ed55c7459d25