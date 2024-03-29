#!/bin/sh
USER="rellotscrewdriver"
TOKEN="$(</.config/github/token)"

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
		# echo "%{F#FF69B4} %{F-}$notifications"
		notify-send "Github" "You have $notifications new message(s)"
else
    # echo "%{F#FF69B4} %{F-}0"
		notify-send "Github" "You have no new messages"
fi
