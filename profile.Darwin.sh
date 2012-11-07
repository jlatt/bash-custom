#!/bin/bash
# This file is a per-arch config called from `profile.sh`.

if has_executable brew; then
    source_file "$(brew --prefix)/etc/bash_completion"
fi
