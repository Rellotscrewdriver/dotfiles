#!/bin/bash

user="rellotscrewdriver"
token=`cat ~/.config/waybar/token`
#count=`curl -u "rellotscrewdriver":${token} https://api.github.com/notifications | jq '. | length'`
count=$(echo "user = \"$user:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [[ "$count" != "0" ]]; then
    echo '{"text":'$count',"tooltip":"you have '$count' notifications","class":"$class"}'
else
    echo '{"text":"0","tooltip":"you have 0 notifications","class":"$class"}'
fi
