# ubuntu-xenial xfce desktop setup

```
sudo apt-get -y remove libreoffice-common vlc firefox thunderbird gimp* pidgin* rhythmbox* xfburn xplayer*
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y install xfonts-terminus xfce4-clipman git
echo 'MiscHighlightUrls=FALSE' >> ~/.config/xfce4/terminal/terminalrc
sudo apt-get install -y --no-install-recommends     apt-transport-https     ca-certificates     curl     software-properties-common
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-xenial main"
sudo apt-get update
sudo apt-get -y install docker-engine
# add Clipman to 'Session and Startup' Application Autostart tab settings
# logout/login
# click clipman properties and choose 'Sync selections'
```
