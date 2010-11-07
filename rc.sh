#!/bin/bash
set -a

prepend_path "$HOME/bin"
SHORT_HOSTNAME="$(echo "$HOSTNAME" | cut -d . -f 1)"
LESS="-FRX -x 4"
ACK_PAGER="less"
ACK_PAGER_COLOR="less $LESS"
SSH_HOST="$(echo "$SSH_CLIENT" | cut -d ' ' -f 1)"
HISTFILESIZE="2000"
HISTCONTROL="ignoredups"
EDITOR="emacsclient -c"
VISUAL="$EDITOR"
PAGER="less"
bash_custom_rc="true"

set +a

source_custom "rc.$(uname -s)"
