#!/usr/bin/env bash

case "$1" in
a) GOV="reset" 
  bluetoothctl power on
  ;;
pw) GOV="powersave" 
  bluetoothctl power off 
  ;;
pf) GOV="performance" 
  bluetoothctl power on
  ;;
*)
	echo "Usage: $0 {a|pw|pf}"
	exit 1
	;;
esac

export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority

eww update poprev=false
pkexec auto-cpufreq --force "$GOV"
