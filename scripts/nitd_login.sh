#!/bin/bash

USERNAME="151210036"
PASSWD="amulya@1"

function login() {
	MAGIC=$(curl "http://172.16.1.1:1000/login? | grep magic | cut -c52-67")
	curl -X POST \
		 -H "Content-Type: application/x-www-form-urlencoded" \
		 -H "Accept: text/plain" \
		 --data-urlencode "4Tredir=http://example.com" \
		 --data-urlencode "magic=$MAGIC" \
		 --data-urlencode "username=$USERNAME" \
		 --data-urlencode "password=$PASSWD" \
		 "http://172.16.1.1:1000/login?"
}

# check if already logged in
curl "http://172.16.1.1:1000/keepalive?TRUE"
if [[ $? -ne 0 ]]; then
	echo "Logging in: "
	login
else
	echo "Logged in already!"
fi
