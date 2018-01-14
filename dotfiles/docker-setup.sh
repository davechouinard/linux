#!/bin/bash
# ./docker-setup.sh

pip install --user tmuxp
git clone https://github.com/bhilburn/powerlevel9k.git ~/zsh/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ~/zsh/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-completions.git ~/zsh/zsh-completions
./setup.sh
#read -p ' - What is your github author name? ' git_authorname
#read -p ' - What is your github author email? ' git_authoremail
#sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" .gitconfig.local.example > ~/.gitconfig.local
exit 0
