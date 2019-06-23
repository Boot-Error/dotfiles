#!/bin/bash

for i in $(seq 41 49); do
	for j in $(seq 31 39); do
		printf '\033['$i'm\033['$j'm Sample \033[39\033[49'
	done
	echo
done
