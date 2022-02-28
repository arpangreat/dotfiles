# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)

# colored GCC warnings and errors
shellfetch
EDITOR=/usr/bin/nvim

#eval `dircolors /path/to/dircolorsdb`
set -o vi

# Custom aliases
alias e='emacs'
alias v='vim'
alias nv='nvim'
alias brc='vim ~/.bashrc'
alias vrc='vim ~/.vimrc'
alias ec='emacsclient'
alias nrc='nvim ~/.config/nvim/init.vim'
alias s='sudo'
alias sv='sudo vim'
alias snv='sudo nvim'
alias se='sudo emacs'
alias sec='sudo emacsclient'
alias ch='sudo chmod +x'
alias chu='sudo chmod u+x'
alias rd='sudo rmdir'
alias rf='sudo rm -rf'
alias g='git'
alias gc='git clone'
alias gp='git pull'
alias arc='vim ~/.config/alacritty/alacritty.yml'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
source ~/.local/share/blesh/ble.sh
