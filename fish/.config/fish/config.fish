
set -x PATH $PATH /usr/local/bin $HOME/.cargo/bin $DEVEL/dotfiles/scripts
set -x PATH $PATH $GOPATH/bin
set -x GDK_SCALE 1 
# set -x QT_SCALE_FACTOR 2
set -U EDITOR nvim

set -x SOFT $HOME/Softwares
set -x DEVEL $HOME/Development
set -x GOPATH $DEVEL/godev

set -x _JAVA_AWT_WM_NONREPARENTING 2

alias ll="ls -lh"
alias la="ls -ah"
alias vim="nvim"

# git aliases
alias gcl="git clone"
alias gch="git checkout"
alias gcm="git commit"
alias gad="git add ."
