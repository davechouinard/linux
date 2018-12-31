#!/bin/bash

# sudo - no password
sed -i '/^%sudo/c\%sudo ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers

# Guest Additions and packages
apt-get update

# install pre-reqs for guest additions, vscode, misc utils
apt-get -y install \
  linux-headers-$(uname -r) build-essential dkms \
  libgconf2-4 \
  fonts-powerline fonts-firacode git htop python-pip screenfetch tmux tmuxp vim-nox zsh

# Terminal theme - Dracula, font properties
cat << EOF > /usr/share/xfce4/terminal/colorschemes/dracula.theme
[Scheme]
Name=Dracula
ColorBackground=#28282a2a3636
ColorForeground=#f8f8f8f8f2f2
ColorSelection=#363639394848
ColorBold=#f4f47676c3c3
ColorCursor=#5050fafa7b7b
TabActivityColor=#5050fafa7b7b
ColorPalette=#000000000000;#9a9a40404646;#90907979b3b3;#929298986363;#3d3d98985a5a;#9a9a53538282;#3a3a4d4d5b5b;#8bfc8bfc8ccc;#4d4d4d4d4d4d;#ffff55555555;#cacaa9a9fafa;#f1f1fafa8c8c;#5050fafa7b7b;#ffff7979c6c6;#8b8be9e9fdfd;#f8f8f8f8f2f2
ColorSelectionUseDefault=FALSE
ColorBoldUseDefault=FALSE
EOF
echo 'FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:no-stem-darkening=1 autofitter:warping=1"' >> /etc/environment

# font setup
cd /etc/fonts/conf.d
ln -s ../conf.avail/10-no-sub-pixel.conf
rm 10-hinting-slight.conf
ln -s ../conf.avail/10-hinting-full.conf 
cd

# Docker
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get -y install docker-ce

exit 0
