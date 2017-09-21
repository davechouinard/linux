export TERM="xterm-256color"

# History related tweaks
bindkey '^R' history-incremental-search-backward
setopt append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
alias history='history 0'

[[ -f $HOME/.local.environment ]] && source $HOME/.local.environment
[[ -f /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh

zstyle ':completion:*' menu select

fpath=(~/zsh/zsh-completions/src $fpath)

POWERLEVEL9K_MODE='awesome-fontconfig'
source ~/zsh/powerlevel9k/powerlevel9k.zsh-theme
source ~/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -z "$TMUX" ]]; then                     # not already in a tmux session
  if [[ ! -z "$SSH_TTY" ]]; then              # we logged in via ssh (interactive)
    if [[ `pgrep -u $USER ssh-agent` ]];then  # ssh-agent already setup
      export SSH_AGENT_PID=`pgrep -u $USER ssh-agent`
      export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
    else                                      # do the ssh-agent setup
      `ssh-agent -k`
      rm -f $SSH_AUTH_SOCK
      unset SSH_AUTH_SOCK
      unset SSH_AGENT_PID
      export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
      `pgrep -u $USER ssh-agent | xargs kill 2>/dev/null`
      ssh-agent -a $SSH_AUTH_SOCK -s
      export SSH_AGENT_PID=`pgrep -u $USER ssh-agent`
      ssh-add $HOME/.ssh/id_rsa
    fi

    tmux && exec true;
  fi
fi
