#!/bin/bash
# run this last after git and other system packages have been installed

#mkdir -p ~/github-source; mkdir -p ~/zsh
git clone https://github.com/davechouinard/linux.git ~/github-source/linux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/bhilburn/powerlevel9k.git ~/zsh/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ~/zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-completions.git ~/zsh/zsh-completions
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~/github-source/linux/dotfiles; ./copy.sh 
fc-cache -vf ~/.fonts
echo "[[ -f ~/.local.environment ]] && . ~/.local.environment" >> ~/.bashrc
vim +PlugInstall
exit 0
