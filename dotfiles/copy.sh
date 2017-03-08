#!/bin/bash
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
cp PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts

mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cp xfce4-terminal/colorschemes/*.theme ~/.local/share/xfce4/terminal/colorschemes/
for i in `grep FILE README.md | sed s/FILE//g`
do
  cp -a $i ~/
done
