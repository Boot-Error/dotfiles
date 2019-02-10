#!/bin/bash

# WIP
# `yt.sh YT_PLAYLIST_URL FOLDER_NAME`
# todo: read from a file and use parallel to download in parallel

YT_URL=$1
FOLDER=$2

cd $PWD/$FOLDER
if [ $? -eq 1 ]; then
	mkdir -v $FOLDER
fi
cd $PWD/$FOLDER

echo Downloading $YT_URL at $(pwd)

youtube-dl -i \
	--download-archive downloaded.txt \
	-o "%(title)s - (%(duration)ss) [%(resolution)s].%(ext)s" \
	-f bestaudio \
	--external-downloader aria2c \
	--external-downloader-args "-x 5" \
	--extract-audio \
	--audio-format "mp3" \
	--embed-thumbnail \
	$YT_URL
