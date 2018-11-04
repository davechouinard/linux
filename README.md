# virtualbox desktop linux

Basic quick setup instructions for Linux virtual desktops.
For all distros, create a VirtualBox VM with a 20GB disk. Boot off the ISO.

## xubuntu 18.04

```bash
# sudo
sudo visudo
# %sudo	ALL=(ALL:ALL) NOPASSWD: ALL

# Guest Additions and packages
sudo apt-get update
sudo apt-get -y install \
  linux-headers-$(uname -r) build-essential dkms \
  libgconf2-4 \ #(vscode)
  git htop vim-nox tmux tmuxp zsh
VirtualBox:Device->Insert Guest Additions CD Image...
cd /media/<user>/VBox...
sudo ./VBoxLinuxAdditions.run
sudo reboot
# Terminal: Preferences->Advanced->Automatically copy selection to clipboard

# Fonts and powerline
sudo apt-get -y install powerline fonts-powerline fonts-firacode

# Dotfiles
git clone https://github.com/davechouinard/dotfiles.git ~/src/github.com/davechouinard/dotfiles
cd ~/src/github.com/davechouinard/dotfiles
./full-setup.sh
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
usermod -aG docker $USER
# logout
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
./full-setup.sh
```

## Ubuntu 16.04 Live

Setup wifi

```
setxkbmap us dvorak
sudo apt-add-repository "deb http://archive.canonical.com/ubuntu xenial partner"
sudo apt-get update && sudo apt-get -y install adobe-flashplugin curl git tmux vim zsh
mkdir -p ~/.fonts
wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
fc-cache -fv
git clone https://github.com/davechouinard/dotfiles.git ~/src/github.com/davechouinard/dotfiles
cd ~/src/github.com/davechouinard/dotfiles
./full-setup.sh
cd
curl -fsSL get.docker.com -o get-docker.sh && sh ./get-docker.sh
```
Select Inconsolata font in terminal

