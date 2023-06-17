#!/bin/sh

USER="rellotscrewdriver"

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
	echo "%{F#FF69B4} %{F-}$notifications"
else
  echo "%{F#FF0000} %{F-}"
fi
