#!/bin/sh

# 1. Define your persistent workspaces
STATIC_WS="[1, 2, 3, 4, 5, 6]"

# 2. Define icons for each workspace ID
#ICONS='{
#    "1": "󰈹",
#    "2": "",
#    "3": "",
#    "4": "󰙯",
#    "5": "󰠮",
#    "6": "󰡨",
#    "7": "󰌱",
#    "8": "󰍳",
#    "9": "󰹞"
#     "9": "󰈦"
#}'

ICONS='{
    "1": "I",
    "2": "II",
    "3": "III",
    "4": "IV",
    "5": "V",
    "6": "VI"
}'

print_workspaces() {
    swaymsg -t get_workspaces -r | jq -c --argjson static "$STATIC_WS" --argjson icons "$ICONS" '
        # Store current sway workspaces
        . as $current_ws |
        
        # Iterate over the static list
        $static | map(
            . as $id |
            # Find matching workspace
            ($current_ws | map(select(.num == $id)) | .[0]) as $match |
            
            {
                id: $id,
                # Lookup icon; default to the ID number if no icon is defined
                icon: ($icons[$id | tostring] // $id), 
                status: (
                    if $match == null then 
                        "empty"
                    elif $match.focused then 
                        "focused"
                    elif $match.urgent then 
                        "urgent"
                    else 
                        "occupied" 
                    end
                )
            }
        )
    '
}

# Initial print
print_workspaces

# Subscribe to changes
swaymsg -t subscribe -m '["workspace"]' | while read -r _; do
    print_workspaces
done
