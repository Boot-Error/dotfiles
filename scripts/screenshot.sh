#!/bin/bash

# `screenshot.sh take-full` takes screenshot of full screen
# `screenshot.sh term-to-paper` converts dark terminal screenshots to whit backgrounds, saves ink while printing :)
# `screenshot.sh record` select an area on screen and record, useful for showing how-to-do gifs
# `screenshot.sh upload FILENAME` uploads to imgur, todo this

COMMAND=$1
OPTS=$2

FILENAME="Screenshot_from_$(date +%Y-%m-%d_%H-%M-%S).jpg"

function optimize_paper {
	convert $1 \
		-negate \
		-colorspace gray \
		-intensity Brightness \
		-normalize \
		-black-threshold 50% \
		$(echo $1 | sed 's/.jpg/_paper.jpg/')
}

function screen_record {
	RECORDFNAME=$(echo $FILENAME | sed -e 's/Screenshot/Screenrecord/' -e 's/.jpg/.mp4/')
	read -r X Y W H G < <(slop -f "%x %y %w %h %g")
	echo "Recording video $W $H $X $Y"
	ffmpeg \
		-framerate 25 \
		-f x11grab \
		-video_size "$W"x"$H" \
		-i :0.0+$X,$Y \
		-f alsa -ac 2 -i hw:0 \
		~/Videos/screenrecords/$RECORDFNAME
	notify-send "Screen Record saved $RECORDFNAME"
}

case $COMMAND in
	"take-full")
		import -window root ~/Pictures/screenshots/$FILENAME;
		echo "Screenshot taken!" ;;
	"upload")
		;;
	"term-to-paper")
		optimize_paper $OPTS ;;
	"record")
		screen_record ;;
	*)
		;;
esac
