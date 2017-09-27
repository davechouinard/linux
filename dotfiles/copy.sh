#!/bin/bash
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cp xfce4-terminal/colorschemes/*.theme ~/.local/share/xfce4/terminal/colorschemes/
[[ -d ~/.vim/bundle/vim-colorschemes ]] && cp vim/dracula.vim ~/.vim/bundle/vim-colorschemes/colors/dracula.vim
[[ -d ~/.vim/bundle/vim-airline-themes ]] && cp vim/airline/dracula.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/dracula.vim
[[ -d ~/.config/terminator ]] && cp config-terminator ~/.config/terminator/config

for i in `grep FILE README.md | sed s/FILE//g`
do
  cp -a $i ~/
done
