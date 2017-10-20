#!/bin/bash
# assumes 20G disk, two dhcp interfaces at enp0s3 and enp0s8
# replace 'myhostname' in this script with something actual
# wget https://raw.githubusercontent.com/davechouinard/linux/master/archlinux1.sh
# wget https://raw.githubusercontent.com/davechouinard/linux/master/archlinux2.sh
# chmod +x *.sh
# ./archlinux1.sh
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

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'KEYMAP=dvorak' > /etc/vconsole.conf
echo 'myhostname' > /etc/hostname
echo '127.0.1.1	myhostname.localdomain	myhostname' >> /etc/hosts

pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd@enp0s3.service
systemctl enable dhcpcd@enp0s8.service

echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/40-ipv6.conf

passwd
exit
umount -R /mnt
echo 'press any key for shutdown'
read x
halt
