#!/bin/bash
source_custom colors

set -a

function maybe_git_branch() {
	branch_name="$(git branch-name)"
	if [[ "$branch_name" ]]; then
        branch_name="${YELLOW}git${NORMAL}:${AQUA}${branch_name}${NORMAL}"
        upstream_branch="$(git upstream-branch)"
        if [[ "$upstream_branch" ]]; then
            branch_name="${branch_name} <-> ${AQUA}${upstream_branch}${NORMAL}"
        fi
		echo -e "${branch_name}"
        echo -e "\r"
	fi
}

PS1="\$(maybe_git_branch)${CGREEN}\u${CAQUA}@${CRED}\h${CAQUA}:${CBLUE}\w${NORMAL}"
PS1="${PS1}\n${CGREEN}\$${CNORMAL} "
PROMPT_COMMAND="$CUSTOM_DIR/prompt-command"
bash_custom_prompt="true"

set +a
