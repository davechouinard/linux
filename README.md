# linux

This repo holds automation for Linux OS installs.

## Arch Linux Desktop

Create a VirtualBox VM with a 20GB disk. Boot off the archlinux ISO.

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
wget -P ~/Downloads/ https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
git clone https://github.com/davechouinard/dotfiles.git ~/src/github.com/davechouinard/dotfiles
cd ~/src/github.com/davechouinard/dotfiles
./full-setup.sh
```
