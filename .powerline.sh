#!/usr/bin/env bash

__powerline() {

    # Unicode symbols
    ARROW_SEP=""
    GIT_BRANCH_SYMBOL=' '
    GIT_BRANCH_CHANGED_SYMBOL='+'
    GIT_NEED_PUSH_SYMBOL='⇡'
    GIT_NEED_PULL_SYMBOL='⇣'

    # Solarized colorscheme
    FG_BASE03="\[$(tput setaf 8)\]"
    FG_BASE02="\[$(tput setaf 0)\]"
    FG_BASE01="\[$(tput setaf 10)\]"
    FG_BASE00="\[$(tput setaf 11)\]"
    FG_BASE0="\[$(tput setaf 12)\]"
    FG_BASE1="\[$(tput setaf 14)\]"
    FG_BASE2="\[$(tput setaf 7)\]"
    FG_BASE3="\[$(tput setaf 15)\]"

    BG_BASE03="\[$(tput setab 8)\]"
    BG_BASE02="\[$(tput setab 0)\]"
    BG_BASE01="\[$(tput setab 10)\]"
    BG_BASE00="\[$(tput setab 11)\]"
    BG_BASE0="\[$(tput setab 12)\]"
    BG_BASE1="\[$(tput setab 14)\]"
    BG_BASE2="\[$(tput setab 7)\]"
    BG_BASE3="\[$(tput setab 15)\]"

    FG_YELLOW="\[$(tput setaf 3)\]"
    FG_ORANGE="\[$(tput setaf 9)\]"
    FG_RED="\[$(tput setaf 1)\]"
    FG_MAGENTA="\[$(tput setaf 5)\]"
    FG_VIOLET="\[$(tput setaf 13)\]"
    FG_BLUE="\[$(tput setaf 4)\]"
    FG_CYAN="\[$(tput setaf 6)\]"
    FG_GREEN="\[$(tput setaf 2)\]"

    BG_YELLOW="\[$(tput setab 3)\]"
    BG_ORANGE="\[$(tput setab 9)\]"
    BG_RED="\[$(tput setab 1)\]"
    BG_MAGENTA="\[$(tput setab 5)\]"
    BG_VIOLET="\[$(tput setab 13)\]"
    BG_BLUE="\[$(tput setab 4)\]"
    BG_CYAN="\[$(tput setab 6)\]"
    BG_GREEN="\[$(tput setab 2)\]"

    DIM="\[$(tput dim)\]"
    REVERSE="\[$(tput rev)\]"
    RESET="\[$(tput sgr0)\]"
    BOLD="\[$(tput bold)\]"

    __git_branch() { 
        [ -z "$(which git)" ] && return    # no git command found

        # try to get current branch or or SHA1 hash for detached head
        local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)"
        [ -z "$branch" ] && return  # not a git branch

        local marks

        # branch is modified
        [ -n "$(git status --porcelain)" ] && marks+=" $GIT_BRANCH_CHANGED_SYMBOL"

        # check if local branch is ahead/behind of remote 
        # and by how many commits
        local remote="$(git config branch.$branch.remote)"
        local remote_ref="$(git config branch.$branch.merge)"
        local remote_branch="${remote_ref##refs/heads/}"
        local tracking_branch="refs/remotes/$remote/$remote_branch"
        if [ -n "$remote" ]; then
            local pushN="$(git rev-list $tracking_branch..HEAD|wc -l|tr -d ' ')"
            local pullN="$(git rev-list HEAD..$tracking_branch|wc -l|tr -d ' ')"
            [ "$pushN" != "0" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$pushN"
            [ "$pullN" != "0" ] && marks+=" $GIT_NEED_PULL_SYMBOL$pullN"
        fi

        # print the git branch segment without a trailing newline
        printf " $GIT_BRANCH_SYMBOL$branch$marks "
    }

    ps1() {
        if [[ $(__git_ps1) =~ \*\)$ ]]; then
            # a file has been modified but not added
            local BG_BRANCH="$BG_RED"
        elif [[ $(__git_ps1) =~ \+\)$ ]]; then
            # a file has been added, but not commited
            local BG_BRANCH="$BG_BLUE" 
        else
            # the state is clean, changes are commited
            local BG_BRANCH="$BG_GREEN"
        fi

        PS1="\n$BG_BASE03$FG_BASE02 \w $RESET"
        PS1+="$BG_BRANCH$FG_BASE03$(__git_branch)$RESET\n⚡ "
    }

    PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
