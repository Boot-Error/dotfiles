#!/bin/bash

app_name=$1


firefox1="sudo docker run --rm -d \
	--name firefox_normal \
	--net host
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	--device /dev/snd \
	--device /dev/dri \
	--group-add 92 \
	-v $HOME/.mozilla:/home/developer/.mozilla \
	firefox2-install \
	firefox --no-remote";

telegram="docker run --rm -d \
	--name Telegram_Desktop \
	--net host \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /etc/localtime:/etc/localtime \
	-e DISPLAY=$DISPLAY \
	--device /dev/snd \
	--group-add 92 \
	-v $HOME/.telegram_userspace:/root \
	telegram-gui-install"

thunderbird="docker run --rm -d \
	--name Thunderbird \
	--net host \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /etc/localtime:/etc/localtime \
	-e DISPLAY=$DISPLAY \
	-v $HOME/.thunderbird-root:/root \
	thunderbird-install thunderbird"

chromium="docker run --rm -d \
	--name ungoogle_chromium \
	--net host
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /run/dbus:/run/dbus \
	-e DISPLAY=$DISPLAY \
	--device /dev/snd \
	--device /dev/dri \
	--group-add 92 \
	-v $HOME/.chromium:/home/developer/.chrome \
	ungoogle-chromium-install";

case $app_name in 
	firefox) echo "Starting firefox1";
		($firefox1) ;;
	telegram) echo "Starting Telegram";
		($telegram) ;;
	thunderbird) echo "Starting Thunderbird";
		($thunderbird) ;;
	chromium) echo "Starting Chromium";
		($chromium) ;;
	*) echo "Not Found" ;;
esac
