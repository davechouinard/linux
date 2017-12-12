#!/bin/bash
# Run this script from the dotfiles directory:
# ./setup.sh

dir_backup=~/dotfiles_old
mkdir -p $dir_backup

declare -a FILES_TO_SYMLINK=(

  'colors.sh'
  '.config'
  '.ctags'
  '.fonts'
  '.gitconfig'
  '.i3status.conf'
  '.local.environment'
  'tmux-colors.sh'
  '.tmux.conf'
  '.vimrc'
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
