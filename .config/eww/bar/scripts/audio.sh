#!/bin/bash

print_json() {
	vol=$(pamixer --get-volume)
	mute=$(pamixer --get-mute)

	if [ "$mute" = true ]; then
		icon=""
		vol=0
	else
		if [ "$vol" -le 33 ]; then
			icon=""
		elif [ "$vol" -le 66 ]; then
			icon=""
    elif [ "$vol" -ge 100 ]; then
      setlock=$(pamixer --set-volume 100 && pamixer --get-volume)
      vol=$setlock
      icon=""
		else
			icon=""
		fi
	fi

	# Output proper JSON
  printf '{"icon":"%s","value":"%s"}\n' "$icon" "$vol%"
}

# Emit once on start
print_json

# Watch for sink change events
pactl subscribe | stdbuf -oL grep --line-buffered "Event 'change' on sink" | while read -r _; do
	print_json
done


