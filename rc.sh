#!/bin/bash

prepend_path "$HOME/bin"
prepend_path "$CUSTOM_DIR/bin"
SHORT_HOSTNAME="$(echo "$HOSTNAME" | cut -d . -f 1)"
LESS="-FRXx4"
ACK_PAGER="less"
ACK_PAGER_COLOR="less $LESS"
SSH_HOST="$(echo "$SSH_CLIENT" | cut -d ' ' -f 1)"
HISTFILESIZE="2000"
HISTCONTROL="ignoredups"
ALTERNATE_EDITOR="emacs"
EDITOR="editor"
VISUAL="$EDITOR"
GIT_EDITOR="git-editor"
MANPAGER="less"
PAGER="less"
MOST_SWITCHES="-s -t4"

export PATH SHORT_HOSTNAME LESS ACK_PAGER_COLOR ACK_PAGER SSH_HOST HISTFILESIZE HISTCONTROL ALTERNATE_EDITOR EDITOR VISUAL GIT_EDITOR MANPAGER PAGER MOST_SWITCHES bash_custom_rc="true" NODE_PATH

source_custom "rc.$(uname -s)"
