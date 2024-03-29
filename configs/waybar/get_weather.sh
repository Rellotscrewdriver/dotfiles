#!/usr/bin/env bash
# get_weather.sh
for i in {1..5}
do
    text=$(curl -s "https://wttr.in/$1?format=%c+%t\n&m" | tr -d +)
    if [[ $? == 0 ]]
    then
        text=$(echo "$text" | sed -E "s/\s+/ /g")
        tooltip=$(curl -s "https://wttr.in/$1?format=2")
        if [[ $? == 0 ]]
        then
            echo "$text"
						echo "$tooltip"
				exit
        fi
    fi
    sleep 2
done
