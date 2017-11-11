#!/bin/bash
mkdir -p ~/.fonts
cp fonts/* ~/.fonts/
fc-cache -vf ~/.fonts

if [[ ! -f /etc/arch-release ]];
then
  mkdir -p ~/.config/fontconfig/conf.d
  cp 10-symbols.conf ~/.config/fontconfig/conf.d/
fi

exit 0
