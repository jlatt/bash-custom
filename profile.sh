#!/bin/bash
source_custom prompt

alias df="df -h"
alias du="du -sh"
alias ls="ls -FhG"
alias la="ls -a"
alias ll="ls -l"
if which -s hub; then
    eval "$(hub alias -s)"
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source_custom "profile.$(uname -s)"
