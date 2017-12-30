#!/bin/bash

if [[ "$1" == "base" ]]; then

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
  cp $0 /mnt

  cd /etc/pacman.d
  mv mirrorlist mirrorlist.orig
  grep 'kernel\.org' mirrorlist.orig > mirrorlist

  pacstrap /mnt base
  genfstab -U /mnt >> /mnt/etc/fstab

  arch-chroot /mnt

  umount -R /mnt
  echo 'type halt to shutdown, remove the iso image and reboot'
  exit 0

fi

if [[ "$1" == "chroot" ]]; then

  # this script will be run inside the chroot

  echo '-------------------------------------'
  ip addr
  echo '-------------------------------------'

  echo 'dhcp interface? (e.g. enp0s3) '
  read myinterface

  echo 'archlinux' > /etc/hostname
  echo '127.0.1.1	archlinux.localdomain	archlinux' >> /etc/hosts
  systemctl enable dhcpcd@$myinterface.service

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

  echo 'installing packages'
  echo
  echo 'choose: libglvnd and virtualbox-guest-modules-arch'
  echo
  sleep 5
  pacman -S xf86-video-fbdev xf86-video-vesa xorg-server xorg-apps xorg-xinit virtualbox-guest-utils

  pacman -S dnsutils make openssh python python-pip python2 sudo wget \
    compton ctags dmenu feh git i3 i3blocks parcellite screenfetch termite tmux vim zsh \
    awesome-terminal-fonts terminus-font ttf-dejavu ttf-inconsolata 

  ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
  ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

  echo 'installing docker'
  tee /etc/modules-load.d/loop.conf <<< "loop"
  modprobe loop 
  pacman -S --noconfirm docker
  systemctl enable docker
  cat << EOF > /etc/docker/daemon.json
{
  "bip": "192.168.16.1/24"
}
EOF

  sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^# //g' /etc/sudoers

  systemctl enable sshd.socket
  systemctl enable vboxservice.service

  echo 'setting root passwd'
  passwd

  echo 'if you have special dns domains to search'
  echo 'add: search_domains="<domain>" to /etc/resolvconf.conf'
  exit 0

fi
