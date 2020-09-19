#!/usr/bin/zsh

alias vim="nvim"
alias e="vim"
alias v="vim"
alias o="xdg-open"
alias g="git"

alias ls="ls --color=auto"
alias ll="exa -lh"
alias la="exa -lah"
alias lt="exa -Tl"

alias grep="grep --color=auto"

alias cp="cp -rvf"
alias mv="mv -v"
alias rm="rm -v"
alias mkdir="mkdir -pv"

# git aliases
alias gcl="git clone"
alias gstat="git status"
alias gad="git add ."
alias gcm="git commit -am"
alias gpom="git push -u origin master"

# others
alias tst="date -Iseconds"
alias cproc="ps aux | grep "

# taskwarrior
alias t="task"
# alias in="task add +in"
alias tin="task in"
alias tadd="task add +in"
alias think='tickle +1d'

# # topydo
# alias t="topydo"
# alias tcol="topydo columns"
# alias tadd="topydo add"
#
# notes
alias vn="v +VimwikiIndex"
