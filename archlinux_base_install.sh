#!/bin/zsh -xv

# This script is my attempt to automate installation of Archlinux using its
# installation media.
# What I need:
# Simply a scripted version of the installation guide. Just simple write-up
# that can run by itself.

# Usage note:
# Prepare the arch image, for Virtualbox just dowload it
# For install on your hardware, write it to a usb pen.
# Boot the installation media
# run this script
# enjoy
echo "Here we go again, let's install ArchLinux"

# check that we loaded in UEFI mode

if [[ -z $(ls -1 /sys/firmware/efi/efivars) ]]; then
    echo "Booted in BIOS mode"
else
    echo "Booted to UEFI mode"
fi

timedatectl set-ntp true

echo "Partitons on /dev/sda:"
sgdisk -p /dev/sda

echo "Partitioning /dev/sda:"
echo "Doing stuff..."
sgdisk -og /dev/sda

if [[ -d /sys/firmware/efi/efivars ]]; then
    echo "Creating UEFI system partition (ESP)"
    # UEFI needs a larger partition
    sgdisk -n 1:0:+304M -t 1:0xef00 -c 1:"EFI_system_partition" /dev/sda
else
    echo "Creating bios boot partition"
    # bios gpt needs a BIOS boot partition of size at least 31KiB but I choose 4MiB
    sgdisk -n 1:0:+4M -t 1:0xef02 -c 1:"BIOS_boot_partition" /dev/sda
fi

sgdisk -n 2:0:0 -t 2:0x8300 -c 2:"ArchLinux" /dev/sda

echo "Partitions on /dev/sda:"
sgdisk -p /dev/sda

echo "Yes, this worked"

mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/sda2

mount -o defaults,noatime,discard,ssd,space_cache,compress=lzo /dev/sda2 /mnt

btrfs subvolume create /mnt/__active

umount /mnt

mount -o defaults,noatime,discard,ssd,space_cache,compress=lzo,subvol=__active /dev/sda2 /mnt

#  here I need to edit /etc/pacman.d/mirrorlist
# 1. /^S/#S/g
# 2. find first line with #Norway and uncomment the next line
sed -ie 's/^Server/#Server/g' /etc/pacman.d/mirrorlist
sed -ie '/## Norway/{n;s/^#Server/Server/}' /etc/pacman.d/mirrorlist

pacstrap /mnt base grub btrfs-progs vim dialog
if [[ -d /sys/firmware/efi/efivars ]]; then
    pacstrap /mnt efibootmgr
fi

arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
arch-chroot /mnt hwclock --systohc

# uncomment en_US.UTF-8 UTF-8 in /etc/locale.gen
sed -ie 's/#en_US.UTF-8/en_US.UTF-8/' /mnt/etc/locale.gen

arch-chroot /mnt locale-gen
echo 'LANG=en_US.UTF-8' > /mnt/etc/locale.conf

echo 'archonvb' > /mnt/etc/hostname
echo '127.0.1.1 archonvb.localdomain archonvb'  >> /mnt/etc/hosts

arch-chroot /mnt passwd << EOF
root
root
EOF

if [[ -d /sys/firmware/efi/efivars ]]; then
    mkdir -p /mnt/boot/efi
    mount /dev/sda1 /mnt/boot/efi
fi

genfstab -U /mnt >> /mnt/etc/fstab

if [[ -d /sys/firmware/efi/efivars ]]; then
    arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
else
    arch-chroot /mnt grub-install --target=i386-pc /dev/sda
fi

arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

if [[ -z $(grep hypervisor /proc/cpuinfo) ]]; then
    echo "Running on bare metal"
else
    echo "Running in a virtual machine, will create startup.nsh"
    if [[ -d /sys/firmware/efi/efivars ]]; then
        echo 'fs0:\EFI\grub\grubx64.efi' > /mnt/boot/efi/startup.nsh
    fi
fi

if [[ -d /sys/firmware/efi/efivars ]]; then
    umount /mnt/boot/efi
fi
umount /mnt
