#!/bin/bash
# this script will be run inside the chroot

##############################################
# update myhostname and interfaces as desired
echo 'myhostname' > /etc/hostname
echo '127.0.1.1	myhostname.localdomain	myhostname' >> /etc/hosts
systemctl enable dhcpcd@enp0s3.service
systemctl enable dhcpcd@enp0s8.service
##############################################

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'KEYMAP=dvorak' > /etc/vconsole.conf

pacman -S --noconfirm grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/40-ipv6.conf

echo 'installing docker'
tee /etc/modules-load.d/loop.conf <<< "loop"
modprobe loop 
pacman -S --noconfirm docker
systemctl enable docker

echo 'installing packages'
echo 'choose: virtualbox-guest-modules-arch'
sleep 5
pacman -S sudo xf86-video-fbdev xf86-video-vesa xorg-server xorg-apps xorg-xinit \
openssh virtualbox-guest-utils i3 dmenu terminator ttf-dejavu terminus-font \
ansible python git ruby tmux zsh vim screenfetch
gem install tmuxinator --no-user-install

sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^# //g' /etc/sudoers

systemctl enable sshd.socket
systemctl enable vboxservice.service

echo 'setting root passwd'
passwd

useradd -m -G wheel -s /bin/bash dave
echo 'setting user passwd'
passwd dave

echo 'if you have special dns domains to search'
echo 'add: search_domains="<domain>" to /etc/resolvconf.conf'
echo
echo 'type exit to exit chroot and finish the install'
exit 0
