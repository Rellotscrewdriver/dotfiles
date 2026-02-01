#!/bin/bash

print_json() {
	vol=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '{print $5}' | tr -d "%")
	mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

	if [[ "$mute" == "yes" ]]; then
		icon="󰍭"
		vol=0
	else
		icon="󰍬"
	fi

	# Output proper JSON
	echo "{\"value\": $vol, \"icon\": \"$icon\"}"
}

# Emit once on start
print_json

# Watch for sink change events
while true; do
	print_json
	sleep 1
done
