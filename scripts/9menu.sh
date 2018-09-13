#!/bin/bash

NMENU='9menu -teleport -label Control_Center'
OPT=$1

case $OPT in
	"mpd")
		$NMENU \
			play:'mpc play' \
			pause:'mpc pause' \
			next:'mpc next' \
			previous:'mpc prev' \
			back:'pkill 9menu; 9menu.sh' ;;
	"vol")
		$NMENU \
			'vol +':'amixer set Master playback 5%+' \
			'vol -':'amixer set Master playback 5%-' \
			back:'pkill 9menu; 9menu.sh' ;;
	"screen")
		$NMENU \
			'bklight +':'xbacklight -inc +10%' \
			'bklight -':'xbacklight -inc -10%' \
			'back':'pkill 9menu; 9menu.sh' ;;
	
	"lock")
		$NMENU \
			lock:'i3lock-fancy -g -p -t $(uname -n)' \
			suspend:'i3lock-fancy -g -p -t $(uname -n) && systemctl suspend' ;; 
	*)
		$NMENU -popup \
			'lock':'9menu.sh lock' \
			'music':'9menu.sh mpd' \
			'volume':'9menu.sh vol' \
			'brightness':'9menu.sh screen' \
			'quit':'echo Bye!' ;;
esac
