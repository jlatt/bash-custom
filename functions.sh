#!/bin/bash

# append a path to $PATH
function append_path() {
	[[ -d "$1" ]] || return 1
	if [[ "$PATH" ]]; then
		PATH="$PATH:$1"
	else
		PATH="$1"
	fi
}

# prepend a path to $PATH
function prepend_path() {
	[[ -d "$1" ]] || return 1
	if [[ "$PATH" ]]; then
		PATH="$1:$PATH"
	else
		PATH="$1"
	fi
}

# Conditionally source a file, if it exists.
function source_file() {
	[[ -r "$1" ]] || return 1
	source "$1"
}

CUSTOM_DIR="$(dirname ${BASH_ARGV[0]})"

function source_custom() {
	source_file "$CUSTOM_DIR/$1.sh"
}

function has_executable() {
    which -s "$@"
}

function time_call() {
    echo "timing $@"
    time "$@"
}

export append_path prepend_path source_file source_custom has_executable
