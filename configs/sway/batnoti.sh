#!/bin/bash

# Set the low battery threshold (in percent)
WARNING_LEVEL=10

# Set how often to check (in minutes)
CHECK_INTERVAL=5

ALARM="/home/Rellot/.config/sway/low.mp3"
ALARM_FULL="/home/Rellot/.config/sway/full.mp3"

while true; do
    # Get current battery percentage
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    if [ $BATTERY_LEVEL -lt 98] && acpi -b | grep -q "Charging"; then
        notify-send -u critical "Battery Full!" "Battery at ${BATTERY_LEVEL}%! Plug in soon."
        
        [ -n "$ALARM_FULL" ] && paplay "$ALARM_FULL" &
    fi

    if [ $BATTERY_LEVEL -lt $WARNING_LEVEL ] && ! acpi -b | grep -q "Charging"; then
        notify-send -u critical "Low Battery!" "Battery at ${BATTERY_LEVEL}%! Plug in soon."
        
        [ -n "$ALARM" ] && paplay "$ALARM" &

    elif [ $BATTERY_LEVEL -lt 4 ] && ! acpi -b | grep -q "Charging";
    then
        notify-send -u critical "Low Battery!" "you're gonna kill the battery mate"        
    fi

    sleep ${CHECK_INTERVAL}m
done
