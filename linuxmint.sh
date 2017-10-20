#!/bin/bash
# wget https://raw.githubusercontent.com/davechouinard/linux/master/linuxmint.sh && chmod +x *.sh
# Add search lines for domains to: /etc/resolvconf/resolv.conf.d/base

sudo apt-get update && sudo apt-get -y install ansible git
mkdir -p ~/github-source; mkdir -p ~/zsh; mkdir -p ~/.vim/bundle; mkdir -p ~/.config/terminator
git clone https://github.com/davechouinard/linux.git ~/github-source/linux
git clone https://github.com/bhilburn/powerlevel9k.git ~/zsh/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ~/zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-completions.git ~/zsh/zsh-completions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/github-source/linux
ansible-playbook playbook.yml

cd ~/github-source/linux/dotfiles ; ./copy.sh 
vim +PluginInstall +qall
[[ -d ~/.vim/bundle/vim-colorschemes ]] && cp vim/dracula.vim ~/.vim/bundle/vim-colorschemes/colors/dracula.vim
[[ -d ~/.vim/bundle/vim-airline-themes ]] && cp vim/airline/dracula.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/dracula.vim
[[ -d ~/.config/terminator ]] && cp config-terminator ~/.config/terminator/config
echo "[[ -f ~/.local.environment ]] && . ~/.local.environment" >> ~/.bashrc

cd ~/github-source/linux/fonts ; ./install.sh

echo 'update the system and reboot'
exit 0
