# ubuntu-xenial xfce VirtualBox desktop setup

```
mkdir -p ~/bin
sudo vi /etc/gai.conf # line 54 uncomment: precedence ::ffff:0:0/96  100
sudo apt-get -y remove libreoffice-common vlc firefox thunderbird gimp* pidgin* rhythmbox* xfburn xplayer*
sudo apt-get clean
sudo apt-get -y autoremove
sudo apt-get update
sudo apt-get -y install xfonts-terminus fonts-inconsolata xfce4-clipman git
sudo fc-cache -fv
mkdir -p ~/.config/xfce4/terminal
echo 'MiscHighlightUrls=FALSE' >> ~/.config/xfce4/terminal/terminalrc
xfce4-clipman &

# Add Clipman to 'Session and Startup' Application Autostart tab settings
# Click clipman properties and choose 'Sync selections'
# Install Docker: https://docs.docker.com/engine/installation/linux/ubuntu

curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > ~/bin/docker-compose
chmod +x ~/bin/docker-compose

# Add search lines for domains to: /etc/resolvconf/resolv.conf.d/base

cd ~
git clone https://github.com/davechouinard/linux.git
cd linux/dotfiles ; ./copy.sh

# Add to .bashrc:
[[ -f ~/.local.environment ]] && . ~/.local.environment

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim :PluginInstall
# logout/login
```
