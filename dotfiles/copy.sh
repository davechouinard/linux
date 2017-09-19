#!/bin/bash
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cp xfce4-terminal/colorschemes/*.theme ~/.local/share/xfce4/terminal/colorschemes/

for i in `grep FILE README.md | sed s/FILE//g`
do
  cp -a $i ~/
done
