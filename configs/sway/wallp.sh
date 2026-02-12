#!/usr/bin/env bash
#
# ░█░█░█▀█░█░░░█░░░█▀█░█▀█░█▀█░█▀▀░█▀▄░█▀▀
# ░█▄█░█▀█░█░░░█░░░█▀▀░█▀█░█▀▀░█▀▀░█▀▄░▀▀█
# ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀░▀░▀░░░▀▀▀░▀░▀░▀▀▀
#

src_dir=~/wallpapers/ 
interval=900 # seconds

killall swaybg
swaybg -i $(find $src_dir -maxdepth 1 -type f | shuf -n1) -m fill &
old_pid=$!

while true; do
    sleep $interval
    swaybg -i $(find $src_dir -maxdepth 1 -type f | shuf -n1) -m fill &
    next_pid=$!
    sleep 5
    kill $old_pid
    old_pid=$next_pid
done
