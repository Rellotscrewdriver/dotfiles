#!/bin/bash

# Listen for mode changes via swaymsg
swaymsg -t subscribe -m '["mode"]' | while read -r line; do
    # Extract the mode name using jq
    MODE=$(echo "$line" | jq -r '.change')
    echo $MODE    
    # Update the EWW variable
    eww update sway_mode="$MODE"
done
