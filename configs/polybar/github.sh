#!/bin/sh

USER="rellotscrewdriver"
TOKEN="$(<$HOME/key.txt)"

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
	notify-send "Github" "You have $notifications new message(s)"
	#echo "%{F#FF69B4} %{F-}$notifications"
else
	notify-send "Github" "You have no new messages"
  #echo "%{F#FF69B4} %{F-}0"
fi
