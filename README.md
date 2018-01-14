# linux

This repo holds automation for Linux OS installs and dotfiles etc.

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
