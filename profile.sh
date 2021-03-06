#!/bin/bash
source_custom prompt

alias df="df -h"
alias du="du -sh"
alias ls="ls -FhG"
alias la="ls -a"
alias ll="ls -l"
alias grep="grep --color=auto"

if has_executable hub; then
    eval "$(hub alias -s)"
fi

# Ruby Version Manager: https://rvm.io/
source_file "$HOME/.rvm/scripts/rvm"

source_custom "profile.$(uname -s)"

function cdr() {
    cd "$(git rev-parse --show-toplevel)"
}
