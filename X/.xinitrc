# flameshot & # must fix this
# compton --config ~/.config/compton/compton.conf -b
# dunst -conf ~/.config/dunst/dunstrc &
# feh --bg-scale wallpaper.jpg
# conky -c ~/.config/conky/conky-task.conf &
# albert &
# exec awesome

autorandr -c

dunst &
udiskie &
flameshot &
albert &
volctl &
mictray &
blueman-applet &

exec i3
