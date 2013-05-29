#!/bin/bash

set -a
append_path "$HOME/Projects/git-hooks"
prepend_path "/usr/local/sbin"
prepend_path "/usr/local/bin"
MANPATH="/usr/share/man:/usr/local/man:/usr/local/share/man"
LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.mp3=01;33:*.wav=01;33:*.ogg=01;33:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.rar=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.JPG=01;35:*.jpeg=01;35:*.JPEG=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:*.asf=01;37:*.wmv=01;37:*.mpeg=01;37:*.swf=01;37:*.ram=01;37:*.rm=01;37"

if has_executable brew; then
    ARCHFLAGS="-arch x86_64"
    PYTHONPATH="/usr/local/lib/python2.7/site-packages"
fi
set +a
