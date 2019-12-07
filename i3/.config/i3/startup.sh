#!/bin/bash

xrandr --output eDP1 --mode 1920x1080
autorandr -l standalone
# xinput set-prop 13 283 1

autorandr

feh --bg-scale /home/booterror/wallpaper.jpg
nm-applet &
dunst &
udiskie &
flameshot &
albert &
# flatpak run org.videolan.VLC --extraintf rc --rc-host localhost:51234 &
flatpak run org.telegram.desktop &
# flatpak run com.github.hluk.copyq &

libinput-gestures-setup start
