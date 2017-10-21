#!/bin/bash
useradd -m -G wheel -s /bin/bash dave
passwd dave

# install docker
tee /etc/modules-load.d/loop.conf <<< "loop"
modprobe loop 
pacman -S --noconfirm docker
systemctl start docker
systemctl enable docker

pacman -S sudo xf86-video-fbdev xf86-video-vesa xorg-server xorg-apps xorg-xinit \
virtualbox-guest-utils i3 dmenu terminator ttf-dejavu terminus-font tmux zsh vim screenfetch
#choose: virtualbox-guest-modules-arch

sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^# //g' /etc/sudoers

systemctl enable vboxservice.service
systemctl start vboxservice.service

cat << EOF > /home/dave/.xinitrc
setxkbmap -variant dvorak
VBoxClient --clipboard 
VBoxClient --display
exec i3
EOF

echo "login as 'dave', type: startx"

exit 0
