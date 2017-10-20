#!/bin/bash
# assumes 20G disk, two dhcp interfaces at enp0s3 and enp0s8
# replace 'myhostname' in this script with something actual
# wget https://raw.githubusercontent.com/davechouinard/linux/master/archlinux.sh
# wget https://raw.githubusercontent.com/davechouinard/linux/master/archlinux2.sh
# chmod +x *.sh
# ./archlinux.sh
# ./archlinux2.sh

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

cd /etc/pacman.d
mv mirrorlist mirrorlist.orig
grep 'edu/' mirrorlist.orig > mirrorlist

pacstrap /mnt base

genfstab -U /mnt >> /mnt/etc/fstab
cp archlinux2.sh /mnt
arch-chroot /mnt

umount -R /mnt
echo 'press any key for shutdown'
read x
halt
