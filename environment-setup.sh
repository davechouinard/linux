#!/bin/bash
# run this last after git and other system packages have been installed

mkdir -p ~/github-source; mkdir -p ~/zsh; mkdir -p ~/.vim/bundle; mkdir -p ~/.config/terminator
git clone https://github.com/davechouinard/linux.git ~/github-source/linux
git clone https://github.com/bhilburn/powerlevel9k.git ~/zsh/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ~/zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-completions.git ~/zsh/zsh-completions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/github-source/linux/dotfiles ; ./copy.sh 
vim +PluginInstall +qall
[[ -d ~/.config/terminator ]] && cp config-terminator ~/.config/terminator/config
echo "[[ -f ~/.local.environment ]] && . ~/.local.environment" >> ~/.bashrc
cd ~/github-source/linux/fonts ; ./install.sh

# arch font has a different name
if [[ -f /etc/arch-release ]];
then
  sed -i '/font = Terminus/s/Terminus/xos4 Terminus/g' ~/.config/terminator/config
fi

exit 0
