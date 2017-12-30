#!/bin/bash
# Run this script from the dotfiles directory:
# ./setup.sh

dir_backup=~/dotfiles_old
mkdir -p $dir_backup

## '.fonts'

declare -a FILES_TO_SYMLINK=(

  '.bashrc'
  'colors.sh'
  '.config'
  '.ctags'
  '.gitconfig'
  '.i3blocks.conf'
  '.local.environment'
  '.tmux.conf'
  '.vimrc'
  'weather.py'
  '.xinitrc'
  '.zshrc'

)

for i in ${FILES_TO_SYMLINK[@]}; do

  echo "=============================="
  echo "Moving any existing dotfile: $i from ~ to $dir_backup"
  mv ~/$i $dir_backup
  ln -fs $(pwd)/$i ~/$i
  echo "=============================="
done
