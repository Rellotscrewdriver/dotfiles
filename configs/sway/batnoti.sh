#!/bin/bash

# Set the low battery threshold (in percent)
WARNING_LEVEL=10

# Set how often to check (in minutes)
CHECK_INTERVAL=5

ALARM="/home/Rellot/.config/sway/low.mp3"
ALARM_FULL="/home/Rellot/.config/sway/full.mp3"
ALARM_DEAD="/home/Rellot/.config/sway/batterydead.mp3"

while true; do
    # Get current battery percentage
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    if [ $BATTERY_LEVEL -gt 95 ] && acpi -b | grep -q "Charging"; then
        notify-send -u critical --app-icon=battery-full "Full Battery!" "Battery at ${BATTERY_LEVEL}%! Please unplug."
        
        [ -n "$ALARM_FULL" ] && paplay "$ALARM_FULL" &
    fi

    if [ $BATTERY_LEVEL -lt $WARNING_LEVEL ] && ! acpi -b | grep -q "Charging"; then
        notify-send -u critical --app-icon=battery-low "Low Battery!" "Battery at ${BATTERY_LEVEL}%! Plug in soon."
        
        [ -n "$ALARM" ] && paplay "$ALARM" &
      if [ $BATTERY_LEVEL -lt 4 ] && ! acpi -b | grep -q "Charging"; then
        notify-send -u critical --app-icon=battery-empty "Critically Low Battery!" "you're gonna kill the battery mate"
        [ -n "$ALARM_DEAD" ] && paplay "$ALARM_DEAD" & 
      fi
    fi

    sleep ${CHECK_INTERVAL}m
done
