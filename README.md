# Ubuntu xenial xfce VirtualBox desktop setup

```
dockerComposeVersion=1.15.0
mkdir -p ~/bin
sudo vi /etc/gai.conf # line 54 uncomment: precedence ::ffff:0:0/96  100
sudo apt-get -y remove libreoffice-common vlc thunderbird gimp* pidgin* rhythmbox* xfburn xplayer*
sudo apt-get clean
sudo apt-get -y autoremove
sudo apt-get update
sudo apt-get -y install vim xfonts-terminus fonts-inconsolata xfce4-clipman git i3-wm i3status terminator
sudo fc-cache -fv
mkdir -p ~/.config/xfce4/terminal
echo 'MiscHighlightUrls=FALSE' >> ~/.config/xfce4/terminal/terminalrc

xfce4-clipman &
# Add Clipman to 'Session and Startup' Application Autostart tab settings
# Right-click clipman, choose Properties and choose 'Sync selections'

# Install Docker: https://docs.docker.com/engine/installation/linux/ubuntu
# Use 'xenial' in place of $(lsb_release -cs) for the docker repo
sudo usermod -aG docker <USER>
curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` > ~/bin/docker-compose
chmod +x ~/bin/docker-compose

# Add search lines for domains to: /etc/resolvconf/resolv.conf.d/base

cd ~ ; git clone https://github.com/davechouinard/linux.git
cd linux/dotfiles ; ./copy.sh ; cd ~
cd linux/fonts ; ./install.sh ; cd ~

echo "[[ -f ~/.local.environment ]] && . ~/.local.environment" >> .bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# update the system and reboot
```
