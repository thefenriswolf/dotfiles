- [Windows](#windows)
  - [Visual Studio](#visual-studio)
- [Linux](#linux)
  - [Ansible](#ansible)
  - [git](#git)
  - [ZFS](#zfs)
    - [recycle drives from a former zfs array](#recycle-drives-from-a-former-zfs-array)
  - [NixOS](#nixos)
    - [Build private packages](#build-private-packages)
    - [Installation](#installation)
      - [Install script (convetional)](#install-script-convetional)
      - [Install script (zfs)](#install-script-zfs)
    - [Caveats of root on ZFS](#caveats-of-root-on-zfs)

# Windows
## Visual Studio
- it's HUGE! > 16GB
- can do C#, F#, Python and C++
# Linux
## Ansible
## git
## ZFS
### recycle drives from a former zfs array
ZFS puts it's metadata in the first and last sectors of a drive. A drive with this metadata will show up as zfs_member for other utilities. The official way to wipe all traces of zfs from a drive is:

``` bash
zpool import
zpool destroy "POOL"
zpool labelclear -f /dev/sdX
```
This often fails to actually wipe all traces of zfs_member from the drive, insteal use `dd` to overwrite all metadata:

```bash
dd if=/dev/zero of=/dev/sdXX bs=512 count=10
dd if=/dev/zero of=/dev/sdXX bs=512 seek=$(( $(blockdev --getsz /dev/sdXX) - 4096 )) count=1M
```

## NixOS
### Build private packages
1. clone nixpkgs tree from Github `git clone https://github.com/NixOS/nixpkgs.git`
2. `export NIX_PATH="nixpkgs=path/to/cloned/package/tree"`
3. add `{ pkgs ? import <nixpkgs> {} }: \n with nixpkgs;` at the top of pkg.nix
4. run `nix-build pkg.nix`
   
### Installation
1. Partition and format disk
2. mount root partition under `/mnt` and boot under `/mnt/boot`
3. run `nixos-generate-config --root /mnt`
4. edit `/mnt/etc/nixos/configuration.nix`
5. run `nixos-install`

#### Install script (convetional)
#### Install script (zfs)
##### Partitioning
```bash
disk1=/dev/disk/by-id/ata-XXX
disk2=/dev/disk/by-id/ata-XXX
# boot partition, legacy (BIOS) boot
sgdisk -a1 -n2:34:2047 -t2:EF02 $DISK
# EFI partition:
sgdisk -n3:1M:+512M -t3:EF00 $DISK
# main ZFS partition, using up the remaining space
sgdisk -n1:0:0 -t1:BF01 $DISK
# copy partition table to another disk (raidX setup)
sfdisk -d /dev/sda | sfdisk /dev/sdb
```
##### zpool creation
```bash
zpool create \
 -O atime=off \
 -O compression=lz4 \
 -O xattr=sa \
 -O acltype=posixacl \
 -O mountpoint=none -R /mnt rpool mirror $diska-partX %diskb-partX

# create as many datasets as you like but never mount the root dataset "rpool"
zfs create -o mountpoint=none rpool/root
zfs create -o mountpoint=legacy rpool/root/nixos
zfs create -o mountpoint=legacy rpool/home
zfs create -o mountpoint=legacy rpool/nix

# always mount root first
mount -t zfs rpool/root/nixos /mnt

mkdir -p /mnt/home
mkdir -p /mnt/nix
mkdir -p /mnt/boot
mount -t zfs rpool/home /mnt/home
mount -t zfs rpool/nix /mnt/nix
```
##### boot mirror
```bash
# create a raid mirror for the boot partition and format it in a filesystem grub can read
mdadm --create /dev/md127 --metadata=0.90 --level=1 --raid-devices=2 $diska-partX %diskb-partX
mkfs.ext4 -m 0 -L boot -j /dev/md127
# or
mkfs.xfs -L boot /dev/md127
mount /dev/md127 /mnt/boot
```
##### generate config
```bash
nixos-generate-config --root /mnt
```
##### necessary settings in /mnt/etc/nixos/configuration.nix
```bash
boot.loader.grub.devices = [ "/dev/sda" "/dev/sdb"];
boot.loader.grub.copyKernels = true;
boot.supportedFilesystems = ["zfs"];
# set max (2048 MB) and min (512 MB) ARC size so zfs doesn't just use ALL THE RAM
# settings are in bits just because
boot.kernelParams = ["zfs.zfs_arc_max=2147483648" "zfs.zfs_arc_min=536870912"];
networking.hostId = ""; # use `head -c 8 /etc/machine-id` to get a machine specific hex string
```
##### also check /mnt/etc/nixos/hardware-configuration.nix
```bash
  fileSystems."/boot" =
    { device = "/dev/md127"; # use name of mirror instead of device ID!
      fsType = "XYZ";
    };
```
### Caveats of root on ZFS
- zfs on bios and a 4k sector drive will not work
- users need to be in the zfs group
