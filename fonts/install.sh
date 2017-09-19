#!/bin/bash
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
cp fonts/* ~/.fonts/
cp 10-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts

exit 0
