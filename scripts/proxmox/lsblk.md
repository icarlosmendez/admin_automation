root@proxmox:~# lsblk
NAME                            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                               8:0    0 447.1G  0 disk 
├─sda1                            8:1    0  1007K  0 part 
├─sda2                            8:2    0     1G  0 part 
└─sda3                            8:3    0 446.1G  0 part 
  ├─pve-swap                    252:0    0     8G  0 lvm  [SWAP]
  ├─pve-root                    252:1    0    96G  0 lvm  /
  ├─pve-data_tmeta              252:2    0   3.3G  0 lvm  
  │ └─pve-data-tpool            252:4    0 319.6G  0 lvm  
  │   ├─pve-data                252:5    0 319.6G  1 lvm  
  │   ├─pve-vm--5000--cloudinit 252:6    0     4M  0 lvm  
  │   ├─pve-vm--100--cloudinit  252:7    0     4M  0 lvm  
  │   ├─pve-vm--100--disk--0    252:8    0   2.2G  0 lvm  
  │   ├─pve-base--5000--disk--0 252:9    0   2.2G  1 lvm  
  │   ├─pve-vm--101--cloudinit  252:10   0     4M  0 lvm  
  │   ├─pve-vm--101--disk--0    252:11   0  82.2G  0 lvm  
  │   └─pve-vm--101--disk--1    252:13   0     4M  0 lvm  
  ├─pve-data_tdata              252:3    0 319.6G  0 lvm  
  │ └─pve-data-tpool            252:4    0 319.6G  0 lvm  
  │   ├─pve-data                252:5    0 319.6G  1 lvm  
  │   ├─pve-vm--5000--cloudinit 252:6    0     4M  0 lvm  
  │   ├─pve-vm--100--cloudinit  252:7    0     4M  0 lvm  
  │   ├─pve-vm--100--disk--0    252:8    0   2.2G  0 lvm  
  │   ├─pve-base--5000--disk--0 252:9    0   2.2G  1 lvm  
  │   ├─pve-vm--101--cloudinit  252:10   0     4M  0 lvm  
  │   ├─pve-vm--101--disk--0    252:11   0  82.2G  0 lvm  
  │   └─pve-vm--101--disk--1    252:13   0     4M  0 lvm  
  └─pve-vm----disk--1           252:12   0     4M  0 lvm  
sdb                               8:16   0   3.6T  0 disk 
├─sdb1                            8:17   0   3.6T  0 part 
└─sdb9                            8:25   0     8M  0 part 
sdc                               8:32   0   3.6T  0 disk 
├─sdc1                            8:33   0   3.6T  0 part 
└─sdc9                            8:41   0     8M  0 part 
sdd                               8:48   0   3.6T  0 disk 
├─sdd1                            8:49   0   3.6T  0 part 
└─sdd9                            8:57   0     8M  0 part 
sde                               8:64   0   3.6T  0 disk 
├─sde1                            8:65   0   3.6T  0 part 
└─sde9                            8:73   0     8M  0 part

*************************************************************

root@proxmox:~# parted -l
Model: ATA SanDisk SSD PLUS (scsi)
Disk /dev/sda: 480GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name  Flags
 1      17.4kB  1049kB  1031kB                     bios_grub
 2      1049kB  1075MB  1074MB  fat32              boot, esp
 3      1075MB  480GB   479GB                      lvm


Model: ATA ST4000VN0001-1SF (scsi)
Disk /dev/sdb: 4001GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name                  Flags
 1      1049kB  4001GB  4001GB  zfs          zfs-ff949a1396d2cbf3
 9      4001GB  4001GB  8389kB


Model: ATA ST4000VN0001-1SF (scsi)
Disk /dev/sdc: 4001GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name                  Flags
 1      1049kB  4001GB  4001GB  zfs          zfs-c5e5bee203017e5f
 9      4001GB  4001GB  8389kB


Model: ATA ST4000VN0001-1SF (scsi)
Disk /dev/sdd: 4001GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name                  Flags
 1      1049kB  4001GB  4001GB  zfs          zfs-d65eefeabcc8855a
 9      4001GB  4001GB  8389kB


Model: ATA ST4000VN0001-1SF (scsi)
Disk /dev/sde: 4001GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name                  Flags
 1      1049kB  4001GB  4001GB  zfs          zfs-7263276181c86999
 9      4001GB  4001GB  8389kB

*************************************************************

 root@proxmox:~# blkid
/dev/sda1: PARTUUID="514f1507-b14c-4378-8290-6c6e585d4bf3"
/dev/sda2: UUID="EDB3-6D91" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="6e9c90b7-3ce7-4544-a75f-b924c9a980c4"
/dev/sda3: UUID="vG8tYw-uabd-U6uo-jnVs-FFde-LxPM-OdO0B6" TYPE="LVM2_member" PARTUUID="da707e74-6b59-43b4-9d1c-ac535afe21b9"

/dev/mapper/pve-root: UUID="d0348e64-f366-48f5-8880-46dfdff01cfd" BLOCK_SIZE="4096" TYPE="ext4"
/dev/sdb1: LABEL="PoolShark" UUID="4153583550715663322" UUID_SUB="6513722974806436276" BLOCK_SIZE="4096" TYPE="zfs_member" PARTLABEL="zfs-ff949a1396d2cbf3" PARTUUID="b4444321-36b0-ca4c-bb39-1592ec68c5b5"
/dev/sdc1: LABEL="PoolShark" UUID="4153583550715663322" UUID_SUB="13981576552789078481" BLOCK_SIZE="4096" TYPE="zfs_member" PARTLABEL="zfs-c5e5bee203017e5f" PARTUUID="bf625f64-cea1-f04d-9f95-d693b5de4357"
/dev/sdd1: LABEL="PoolShark" UUID="4153583550715663322" UUID_SUB="10715749065649250940" BLOCK_SIZE="4096" TYPE="zfs_member" PARTLABEL="zfs-d65eefeabcc8855a" PARTUUID="bc4019c9-3135-504a-9743-a9512c52085a"
/dev/sde1: LABEL="PoolShark" UUID="4153583550715663322" UUID_SUB="5754055294281641549" BLOCK_SIZE="4096" TYPE="zfs_member" PARTLABEL="zfs-7263276181c86999" PARTUUID="8c81039a-e53d-a747-b1d6-a5d5472f232b"

/dev/mapper/pve-swap: UUID="28e37e00-95f5-4f3f-ad3f-086ab5929464" TYPE="swap"

/dev/mapper/pve-vm--5000--cloudinit: BLOCK_SIZE="2048" UUID="2024-05-30-08-05-45-00" LABEL="cidata" TYPE="iso9660"
/dev/mapper/pve-base--5000--disk--0: PTUUID="9f5b3651-9dc6-43a4-9dc9-098d74f29237" PTTYPE="gpt"

/dev/mapper/pve-vm--100--disk--0: PTUUID="9f5b3651-9dc6-43a4-9dc9-098d74f29237" PTTYPE="gpt"

/dev/mapper/pve-vm--101--cloudinit: BLOCK_SIZE="2048" UUID="2024-05-31-17-55-06-00" LABEL="cidata" TYPE="iso9660"
/dev/mapper/pve-vm--101--disk--0: PTUUID="9f5b3651-9dc6-43a4-9dc9-098d74f29237" PTTYPE="gpt"

/dev/sdb9: PARTUUID="cd77ab5d-db54-2c48-b4f0-82ff6231ba23"
/dev/sdc9: PARTUUID="dc053e16-c87f-3748-8afc-e59f3986100e"
/dev/sdd9: PARTUUID="28271d42-166d-eb45-8a79-99c557f6e710"
/dev/sde9: PARTUUID="fe1d1749-3853-d546-993b-2d5b0b8ec409"
