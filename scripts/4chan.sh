#!/bin/bash

URL='http://a.4cdn.org/'
FUNCTION=$1
BOARD=$2
QUERY=$3

# To open thread with linux mentioned
# $ 4chan.sh check g "linux"

case $FUNCTION in
	'check') thread_no=$(curl -s https://a.4cdn.org/$2/catalog.json \
		| jq ".[].threads[] | select(.com != null) | select(.com | test(\"${QUERY}\")) | .no");
		[ -z "${thread_no}" ] \
			&& echo Found nothing \
			|| for tno in $(echo $thread_no | tr ' ' '\n' ); do 
			firefox "https://boards.4chan.org/${BOARD}/thread/${tno}";
			done ;;
	*) echo Command not found ;;
esac

