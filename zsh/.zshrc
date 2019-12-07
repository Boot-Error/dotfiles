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

# lazily fixing some stupid persmission with my zsh not cd into home directory
# cd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /home/booterror/.travis/travis.sh ] && source /home/booterror/.travis/travis.sh

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

eval "$(lua /home/booterror/Development/Contributing/hacktoberfest/z.lua/z.lua --init zsh)"
