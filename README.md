# ubuntu-xenial xfce desktop setup

```
sudo apt-get -y remove libreoffice-common vlc firefox thunderbird gimp* pidgin* rhythmbox* xfburn xplayer*
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y install xfonts-terminus xfce4-clipman git python-pip python-dev build-essential
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
echo 'MiscHighlightUrls=FALSE' >> ~/.config/xfce4/terminal/terminalrc
xfce4-clipman &
# Add Clipman to 'Session and Startup' Application Autostart tab settings
# Click clipman properties and choose 'Sync selections'
# Install Docker: https://docs.docker.com/engine/installation/linux/ubuntu
# logout/login
```
