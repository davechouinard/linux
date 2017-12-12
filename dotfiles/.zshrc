export TERM="xterm-256color"

# History related tweaks
bindkey '^R' history-incremental-search-backward
setopt append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
alias history='history 0'

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[3~' delete-char

[[ -f $HOME/.local.environment ]] && source $HOME/.local.environment
[[ -f /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh

zstyle ':completion:*' menu select

fpath=(~/zsh/zsh-completions/src $fpath)

POWERLEVEL9K_MODE='awesome-fontconfig'
##POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
[[ -f $HOME/zsh/powerlevel9k/powerlevel9k.zsh-theme ]] && source $HOME/zsh/powerlevel9k/powerlevel9k.zsh-theme
[[ -f $HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# This section will run tmux if not already started.  Before tmux starts
# ssh-agent will be run to share the keys in all new tmux windows.
if [[ -z "$TMUX" ]] && [[ $- == *i* ]]; then      # not already in a tmux session and interactive
  export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
  if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
    ssh-agent -a $SSH_AUTH_SOCK > /dev/null 2>&1
    ssh-add 2>/dev/null
  fi
  tmux && exec true;
fi
