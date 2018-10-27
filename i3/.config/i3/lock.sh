i3lock \
	-c 282828 \
	-i $(ls ~/Pictures/SubtlePatterns/*dark.png | shuf -n 1) -t \
	-k \
	--datecolor=02f2f2ff \
	--date-font="xos4 Terminus" \
	--timecolor=02f2f2ff \
	--timestr="%H:%M" \
	--time-font="xos4 Terminus"
