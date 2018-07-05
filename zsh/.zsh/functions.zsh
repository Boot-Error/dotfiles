#!/usr/bin/zsh

function extract() {
	print "Work in Progress!\n"
}

# https://www.reddit.com/r/linux/comments/8vzr3y/whats_the_most_frequent_terminal_command_you_use/
function cmdstat() {
	history \
		| awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' \
		| grep -v "./" \
		| column -c3 -s " " -t \
		| sort -nr \
		| nl \
		| head -n5 \
}

# function to edit my dotfiles
function edots() {
	# generic one $EDITOR $(find $HOME/dotfiles -path $HOME/dotfiles/.git -prune -o -type f | fzf)
	# requires fzf
	dotf=$(find $HOME/dotfiles -path $HOME/dotfiles/.git -prune -o -type f | cut -c26- | fzf)
	[[ -z ${dotf} ]] && echo || $EDITOR $HOME/dotfiles/$dotf
}