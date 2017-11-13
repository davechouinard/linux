setxkbmap -variant dvorak
xset s off -dpms
VBoxClient --clipboard 
VBoxClient --display
exec i3
autocutsel -selection PRIMARY -fork 
