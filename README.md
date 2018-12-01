# virtualbox desktop linux

Basic quick setup instructions for Linux virtual desktops.
For all distros, create a VirtualBox VM with a 20GB disk. Boot off the ISO.

## xubuntu 18.04

```bash
# sudo - no password
sudo sed -i '/^%sudo/c\%sudo ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers

# Guest Additions and packages
sudo apt-get update
sudo apt-get -y install \
  linux-headers-$(uname -r) build-essential dkms \ #(guest additions)
  libgconf2-4 pylint \ #(vscode)
  git htop vim-nox tmux tmuxp zsh
# VirtualBox: Device->Insert Guest Additions CD Image...
cd /media/<user>/VBox...
sudo ./VBoxLinuxAdditions.run
sudo reboot
# Terminal: Preferences->Advanced->Automatically copy selection to clipboard

# Fonts and powerline
sudo apt-get -y install powerline fonts-powerline fonts-firacode
cd /etc/fonts/conf.d
sudo ln -s ../conf.avail/10-no-sub-pixel.conf
sudo rm 10-hinting-slight.conf
sudo ln -s ../conf.avail/10-hinting-full.conf 
echo 'FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:no-stem-darkening=1 autofitter:warping=1"' >> /etc/environment

# Dotfiles
git clone https://github.com/davechouinard/dotfiles.git ~/src/github.com/davechouinard/dotfiles
cd ~/src/github.com/davechouinard/dotfiles
./setup.sh
cd

# Docker
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo usermod -aG docker $USER
# logout

# Terminal theme - Dracula
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
```

## Arch Linux Desktop

```
wget https://raw.githubusercontent.com/davechouinard/linux/master/install-arch.sh
sh ./install-arch.sh base
sh ./install-arch.sh chroot
useradd -m -G wheel,docker -s /bin/bash <username>
passwd <username>
exit
# shutdown, remove ISO, reboot
# login as <username>
git clone https://github.com/davechouinard/dotfiles.git ~/src/github.com/davechouinard/dotfiles
cd ~/src/github.com/davechouinard/dotfiles
./setup.sh
```
