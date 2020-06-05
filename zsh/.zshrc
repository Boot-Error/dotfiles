# Path to your oh-my-zsh installation.
export ZSH="/home/booterror/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
export ZSHCONF=$HOME/.zsh

for conf in $(ls $ZSHCONF/*.zsh); do
	source $conf
done
unset conf

# fzf plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /home/booterror/.travis/travis.sh ] && source /home/booterror/.travis/travis.sh

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# z.lua
eval "$(lua /usr/share/z.lua/z.lua --init zsh)"

# virtualenvwrapper
source $(which virtualenvwrapper.sh)
