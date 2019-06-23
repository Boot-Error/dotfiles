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

# lazily fixing some stupid persmission with my zsh not cd into home directory
# cd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /home/booterror/.travis/travis.sh ] && source /home/booterror/.travis/travis.sh
