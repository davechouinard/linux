# virtualbox desktop linux

Basic quick setup instructions for Linux virtual desktops.
For all distros, create a VirtualBox VM with a 20GB disk. Boot off the ISO.

## xubuntu 18.04

```bash
curl https://raw.githubusercontent.com/davechouinard/linux/master/xubuntu.sh | sudo bash

# VirtualBox: Device->Insert Guest Additions CD Image...
cd /media/<user>/VBox...
sudo ./VBoxLinuxAdditions.run
sudo reboot

# Terminal Preferences: 
General->Unlimited scrollback
General->Scrollbar disabled
Colors->Load Presets...->Dracula
Advanced->Automatically copy selection to clipboard

# ansible and powerline
pip install --user powerline-status ansible molecule docker

# Dotfiles
git clone https://github.com/davechouinard/dotfiles.git ~/src/github.com/davechouinard/dotfiles
cd ~/src/github.com/davechouinard/dotfiles
./setup.sh
cd

# reboot
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
