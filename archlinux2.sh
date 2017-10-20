#!/bin/bash
# this script will be run inside the chroot
# update myhostname and interfaces as desired

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'KEYMAP=dvorak' > /etc/vconsole.conf
echo 'myhostname' > /etc/hostname
echo '127.0.1.1	myhostname.localdomain	myhostname' >> /etc/hosts

pacman -S --noconfirm grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd@enp0s3.service
systemctl enable dhcpcd@enp0s8.service

echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/40-ipv6.conf

passwd
echo 'type exit to exit chroot'
exit 0
