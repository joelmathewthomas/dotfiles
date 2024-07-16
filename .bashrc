#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="/usr/lib/ccache/bin/:$PATH"
export MAKEFLAGS="-j3 -l2"

# Custom Aliases
alias fast='wget -O /dev/null http://speedtest.tele2.net/10GB.zip'

