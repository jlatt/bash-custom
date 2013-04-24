#!/bin/bash

set -a
prepend_path "$HOME/bin"
prepend_path "$CUSTOM_DIR/bin"
SHORT_HOSTNAME="$(echo "$HOSTNAME" | cut -d . -f 1)"
LESS="-FRXx4"
ACK_PAGER="less"
ACK_PAGER_COLOR="less $LESS"
SSH_HOST="$(echo "$SSH_CLIENT" | cut -d ' ' -f 1)"
HISTFILESIZE="2000"
HISTCONTROL="ignoredups"
ALTERNATE_EDITOR="emacs -nw"
EDITOR="editor"
VISUAL="$EDITOR"
GIT_EDITOR="$EDITOR"
MANPAGER="less"
PAGER="less"
MOST_SWITCHES="-s -t4"
set +a

source_custom "rc.$(uname -s)"
