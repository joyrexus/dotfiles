# Standard shell environment
 
. /usr/local/etc/bash_completion    # tab completion
. ~/.git-prompt.sh    			    # git-enhanced prompt
. ~/.powerline.sh                   # git-enhanced PS1
                                    # see gist.github.com/joyrexus/6994462
 
PS2='> '
PROFILE=~/.bash_profile
SHELL=/bin/bash

PATH=.:/usr/local/bin:/usr/bin:/usr/sbin:/usr/X11/bin:/bin:/sbin
MANPATH=/usr/local/share/man:/usr/share/man


# Colorize ls output
export LSCOLORS=exfxcxdxbxegedabagCxEx
export LS_OPTIONS='--color=auto'
export CLICOLOR=1
 
# User
REPOS=~/Repos

# Go
export GOPATH=$HOME/Repos/go
PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Node
export NPM_LIB=/usr/local/lib/node_modules
export NODE_PATH=.:$NPM_LIB

# Machines
export JOY="jvoigt@joy.uchicago.edu"
export JRX="jvoigt@joyrexus.spc.uchicago.edu"
export LFS="jvoigt@ldpfs.spc.uchicago.edu"
export RCC="jvoigt@midway.rcc.uchicago.edu"
export XRM="jvoigt@xromm.rcc.uchicago.edu"
export WS="jvoigt@ws.rcc.uchicago.edu"
export CORE1="jvoigt@coreos1.rcc.uchicago.edu"
export C1=$CORE1

# Settings
umask 022
set -o vi
set -o noclobber
set -o notify
# set -o allexport      # WAT! conflicts with bash-completion!
shopt -s expand_aliases
shopt -s extglob
shopt -s nocaseglob     # case-insensitive globbing (used in pathname expansion)
shopt -s cmdhist
shopt -s histappend     # append to ~/.bash_history rather than overwriting
 
# Supplements
. ~/.aliases
. ~/.functions
