#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.local.environment ]] && . ~/.local.environment
PS1='[\u@\h \W]\$ '
