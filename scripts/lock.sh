#!/bin/bash

LOCK_CMD='i3lock-fancy -g -p -t ${uname -n}'

case $1 in
	'suspend') $LOCK_CMD && systemctl suspend ;;
	*) $LOCK_CMD ;;
esac
