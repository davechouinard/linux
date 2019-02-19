# virtualbox desktop linux

Basic quick setup instructions for Linux virtual desktops.
For all distros, create a VirtualBox VM with a 20GB disk. Boot off the ISO.

## Xubuntu

```bash
curl https://raw.githubusercontent.com/txdavec/linux/master/xubuntu.sh | sudo bash

# VirtualBox: Device->Insert Guest Additions CD Image...
cd /media/<user>/VBox...
sudo ./VBoxLinuxAdditions.run
sudo reboot

# Terminal Preferences: 
General->Unlimited scrollback
General->Scrollbar disabled
Advanced->Automatically copy selection to clipboard

# Local user install - Ansible
pip install --user ansible molecule docker

# Dotfiles
git clone https://github.com/txdavec/dotfiles.git ~/src/github.com/txdavec/dotfiles
cd ~/src/github.com/txdavec/dotfiles
./setup.sh
cd

# Local patched terminal font - vscode
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf

# Local user into docker group
sudo usermod -aG docker $USER
 
# reboot
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
