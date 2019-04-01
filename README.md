# virtualbox desktop linux

Basic quick setup instructions for Linux virtual desktops.
For all distros, create a VirtualBox VM with a 20GB disk. Boot off the ISO.

## Xubuntu

```bash
wget -O - https://raw.githubusercontent.com/txdavec/linux/master/xubuntu.sh | sudo bash

# Terminal Preferences: 
General->Unlimited scrollback
General->Scrollbar disabled
Advanced->Automatically copy selection to clipboard
```

## Arch

```
wget https://raw.githubusercontent.com/txdavec/linux/master/arch.sh
sh ./arch.sh base
sh ./arch.sh chroot
useradd -m -G wheel,docker -s /bin/bash <username>
passwd <username>
exit
# shutdown, remove ISO, reboot
# login as <username>
git clone https://github.com/txdavec/dotfiles.git ~/src/github.com/txdavec/dotfiles
cd ~/src/github.com/txdavec/dotfiles
./setup.sh
```
