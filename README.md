# linux

This repo holds automation for Linux OS installs and dotfiles etc.

## Arch Linux

Create a VirtualBox VM with a 20GB disk. Boot off the archlinux ISO.

```
wget https://raw.githubusercontent.com/davechouinard/linux/master/archlinux.sh
wget https://raw.githubusercontent.com/davechouinard/linux/master/archlinux2.sh
chmod +x *.sh
./archlinux.sh
./archlinux2.sh
# shutdown, remove ISO, reboot, login as root
useradd -m -G wheel -s /bin/bash <username>
passwd <username>
exit
# login as <username>
git clone https://github.com/davechouinard/linux.git ~/src/github.com/linux
cd ~/src/github.com/linux/dotfiles
./full-setup.sh
```
