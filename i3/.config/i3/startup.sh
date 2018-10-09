#!/bin/bash

xrandr --output eDP-1 --mode 1920x1080 --dpi 108
feh --bg-scale /home/booterror/wallpaper.jpg
nm-applet &
dunst &
# udiskie &
compton &
flameshot &
flatpak run org.videolan.VLC --extraintf rc --rc-host localhost:51234 &
flatpak run org.telegram.desktop &
flatpak run com.github.hluk.copyq &

