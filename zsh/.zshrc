# Path to your oh-my-zsh installation.
export ZSH="/home/booterror/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration
export ZSHCONF=$HOME/.zsh

for conf in $(ls $ZSHCONF/*.zsh); do
	source $conf
done
unset conf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
