#!/bin/bash

# 1. get temperature

## a. split response
## Core 0:       +143.6°F  (high = +186.8°F, crit = +212.0°F)
get_cpu_temp(){
degree="°C"
temperatureValues=(40 50 60 70 80 90 100 110)
temperatureIcons=(       ☢)

IFS=')' read -ra core_temp_arr <<< $(sensors | grep -m 14 Core  | awk '{print substr($3, 2, length($3) - 5)}') #echo "${core_temp_arr[0]}"


## b. find cpu usage
total_cpu_temp=0
index=0
for i in "${core_temp_arr[@]}"; do :
    temp=$(echo $i | sed -n 's/°C.*//; s/.*[+-]//; p; q')
    let index++
    total_cpu_temp=$(echo "$total_cpu_temp + $temp" | bc)
done
avg_cpu_temp=$(echo "scale=2; $total_cpu_temp / $index" | bc)

v=$(echo "$avg_cpu_temp" | tr -cd '[:digit:]')
let v1=$v/100

if [ $v1 -lt 40 ];
then
  tmpEcho="${temperatureIcons[0]}"
else
  for (( i=1; i<=7; i++ ))
  do 
      if [ $v1 -ge ${temperatureValues[$i-1]} -a $v1 -lt ${temperatureValues[$i]} ];
      then
        tmpEcho="${temperatureIcons[$i]}"
      fi
  done
fi
}

while true; do
  get_cpu_temp

  echo "{\"tempIcon\": \"${tmpEcho}\", \"tempNo\": ${v1}, \"tempColor\": \"${tmpEcho}\"}"

  sleep 2
done
