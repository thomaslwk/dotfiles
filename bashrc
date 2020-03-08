#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[\e[1;31m\][\[\e[m\]\[\e[1;33m\]\u\[\e[m\]\[\e[0;32m\]@\[\e[m\]\[\e[36m\]\h\[\e[m\]:\[\e[0;35m\]\W\[\e[m\]\[\e[1;31m\]]\[\e[m\]\[\e[1;37m\]\\$\[\e[0;37m\] "



