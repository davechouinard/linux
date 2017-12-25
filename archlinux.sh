#!/bin/bash
# assumes 20G disk

timedatectl set-ntp true
(
echo n
echo p
echo 1
echo
echo +19G
echo n
echo p
echo 2
echo
echo
echo t
echo 2
echo 82
echo w
) | fdisk /dev/sda

mkswap /dev/sda2
swapon /dev/sda2

mkfs.ext4 /dev/sda1

mount /dev/sda1 /mnt
mkdir /mnt/boot
cp archlinux2.sh /mnt

cd /etc/pacman.d
mv mirrorlist mirrorlist.orig
grep 'kernel\.org' mirrorlist.orig > mirrorlist

pacstrap /mnt base
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

umount -R /mnt
echo 'type halt to shutdown, remove the iso image and reboot'
exit 0
