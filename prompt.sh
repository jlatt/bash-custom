#!/bin/bash
source_custom colors

git="$(which git)"

function maybe_git_branch() {
	branch_name="$($git branch-name)"
	if [[ "$branch_name" ]]; then
        prompt="${YELLOW}b${NORMAL}:${AQUA}${branch_name}${NORMAL}"
        upstream_branch="$($git upstream-branch)"
        if [[ "$upstream_branch" ]]; then
            merge="m"
            if [[ "$($git config --bool branch.${branch_name}.rebase)" == 'true' ]]; then
                merge="r"
            fi
            upstream_branch="${upstream_branch/%${branch_name}/*}"
            prompt="${prompt} ${YELLOW}${merge}${NORMAL}:${AQUA}${upstream_branch}${NORMAL}"
        fi
        echo -e "\r"
		echo -e "${prompt}"
	fi
}

PS1="${CGREEN}\u${CAQUA}@${CRED}\h${CAQUA}:${CBLUE}\w${CNORMAL}\$(maybe_git_branch)\n${CGREEN}\$${CNORMAL} "


export bash_custom_prompt="true" maybe_git_branch PS1
