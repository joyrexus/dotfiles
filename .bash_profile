export PROFILE=$HOME/.bash_profile
export REPOS=$HOME/Repos

export GOPATH=$HOME/Repos/go
export PATH=$PATH:$GOPATH/bin

set -o vi
set -o noclobber
set -o notify
shopt -s expand_aliases
shopt -s extglob
shopt -s nocaseglob     # case-insensitive globbing (used in pathname expansion)
shopt -s cmdhist
shopt -s histappend     # append to ~/.bash_history rather than overwriting
 
# Git completion (see gist.github.com/joyrexus/6994462)
COMPLETE=/usr/local/etc/bash_completion.d
. $COMPLETE/hub.bash_completion.sh
. $COMPLETE/git-completion.bash
. $COMPLETE/git-prompt.sh                            # git-enhanced prompt

GIT_PS1_SHOWDIRTYSTATE=1
STATUS=$(__git_ps1 ':%s')
BACKGROUND="\[$(tput setab 0)\]"
CWD_COLOR="\[$(tput setaf 10)\]"
STATUS_COLOR="\[$(tput setaf 14)\]"
RESET="\[\033[0m\]"
PS1="\n${BACKGROUND}${CWD_COLOR}\w${STATUS_COLOR}${STATUS}${RESET}\n⚡ "
PS2='> '

. ~/.functions
. ~/.aliases
