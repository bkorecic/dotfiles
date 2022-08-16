#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source $HOME/.profile

source $HOME/.bashaliases

export EDITOR=nvim
export VISUAL=nvim

alias g="g++ -std=c++17 -Wall -D_GLIBCXX_DEBUG -O2 "
alias l="ls -alh "
export PATH="$HOME/.local/bin/:$PATH"
