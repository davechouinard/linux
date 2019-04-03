#!/bin/bash

# sudo - no password
sed -i '/^%sudo/c\%sudo ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers

# Guest Additions and packages
apt-get update

# Install pre-reqs for guest additions, vscode, misc utils
apt-get -y install \
  linux-headers-$(uname -r) build-essential dkms \
  libgconf2-4 \
  flashplugin-installer fonts-powerline fonts-firacode git htop python-pip tmux tmuxp vim-nox zsh

# Terminal themes, font properties
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

cat << EOF > /usr/share/xfce4/terminal/colorschemes/onedark.theme
[Scheme]
Name=One Dark
ColorForeground=#ABB2BF
ColorCursor=#ABB2BF
ColorBackground=#282C34
ColorSelection=#3B4451
ColorSelectionUseDefault=FALSE
ColorBold=#B9C0CB
ColorBoldUseDefault=FALSE
ColorPalette=#282C34;#E06C75;#98C379;#E5C07B;#61AFEF;#C678DD;#56B6C2;#ABB2BF;#3E4452;#BE5046;#98C379;#D19A66;#61AFEF;#C678DD;#56B6C2;#5C6370
EOF

cat << EOF > /etc/environment
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:no-stem-darkening=1 autofitter:warping=1"
EOF

# Font setup
cd /etc/fonts/conf.d
ln -s ../conf.avail/10-no-sub-pixel.conf
rm 10-hinting-slight.conf
ln -s ../conf.avail/10-hinting-full.conf 
cd

# Docker
mkdir -p /etc/docker
cat << EOF > /etc/docker/daemon.json
{
  "bip": "192.168.2.1/24"
}
EOF

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
usermod -aG docker $SUDO_USER

su $SUDO_USER -c "pip install --user ansible molecule docker"
git clone https://github.com/txdavec/dotfiles.git /home/$SUDO_USER/src/github.com/txdavec/dotfiles
chown -R $SUDO_USER /home/$SUDO_USER/src
cd /home/$SUDO_USER/src/github.com/txdavec/dotfiles
su $SUDO_USER -c ./setup.sh

cd /media/$SUDO_USER/VBox_GAs_*/
sudo ./VBoxLinuxAdditions.run
cd
echo
echo 'setup script finished, please reboot...'

exit 0
