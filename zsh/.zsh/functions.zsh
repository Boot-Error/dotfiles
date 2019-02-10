#!/usr/bin/zsh

function extract() {
	print "Work in Progress!\n"
	print "Don't need this anymore\n"
}

# https://www.reddit.com/r/linux/comments/8vzr3y/whats_the_most_frequent_terminal_command_you_use/
function cmdstat() {
	history \
		| awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' \
		| grep -v "./" \
		| column -c3 -s " " -t \
		| sort -nr \
		| nl \
		| head -n10 \
}

# function to edit my dotfiles
function edots() {
	# generic one $EDITOR $(find $HOME/dotfiles -path $HOME/dotfiles/.git -prune -o -type f | fzf)
	# requires fzf
	dotf=$(find $HOME/dotfiles -path $HOME/dotfiles/.git -prune -o -type f | cut -c26- | fzf)
	[[ -z ${dotf} ]] && echo || $EDITOR $HOME/dotfiles/$dotf
}

function goto() {
	cd $(fd -t d | fzf --reverse --height 40%)
}

# function to search and kill a process
function skill() {
    local pids=$(
      ps -f -u $USER | sed 1d | fzf --multi | tr -s [:blank:] | cut -d' ' -f3
      )
    if [ -n "$pids" ]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

# function to access cheat.sh
function cheat() {
	curl cheat.sh/$1
}

# cheap console log xD
function disp4ever() {
	while true; do
		eval $@
		sleep 1
		clear
	done
}


# crazy ones
function cat() {
	realcat='/usr/bin/cat'
	case "$(shuf -e -n1 a b c)" in
		'a') echo meow ;;
		*) $realcat $@ ;;
	esac
}

function saybig() {
	figlet "$@" 
}

# control vlc from socket interface
function vlctl() {
	echo $@ | nc localhost 51234 > /dev/null
}
