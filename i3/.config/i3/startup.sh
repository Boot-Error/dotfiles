#!/bin/zsh

autorandr -c

dunst -conf ~/.config/dunst/dunstrc

# feh --bg-scale /home/booterror/wallpaper.jpg
# nm-applet &
dunst &
udiskie &
flameshot &
albert &
volctl &
mictray &
blueman-applet &

# libinput-gestures-setup start
