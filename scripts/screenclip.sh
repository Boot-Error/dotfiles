#!/bin/bash

# Requires slop
# Run screenclip.sh
# I use in along with sxhkd to screenshot when I press PrintScreen

read -r G < <(slop -f "%g")
FILENAME="Screenshot_from_$(date +%Y-%m-%d_%H-%M-%S).jpg"
echo $FILENAME
pkill compton # kill compton to remove terminal transperancy
import -window root -crop $G ~/Pictures/screenshots/$FILENAME
compton -b # restart compton, todo make it import args from .xinitrc
notify-send "Screenshot captured $FILENAME"
