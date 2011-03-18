#!/bin/bash
source_custom colors

set -a

function maybe_git_branch() {
	branch_name="$(git branch-name)"
	if [[ "$?" -eq 0 ]]; then
		echo -ne " ${NORMAL}[${YELLOW}git${NORMAL}:${AQUA}${branch_name}${NORMAL}]"
	fi
}

PS1="${CGREEN}\u${CAQUA}@${CRED}\h${CAQUA}:${CBLUE}\w\$(maybe_git_branch)"
PS1="${PS1}\n${CGREEN}\$${CNORMAL} "
PROMPT_COMMAND="$CUSTOM_DIR/prompt-command"
bash_custom_prompt="true"

set +a
