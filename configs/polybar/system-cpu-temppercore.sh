#!/bin/sh
temCore=$( sensors | grep -m 1 Core | awk '{print substr($3, 2, length($3) - 5)}' )

degree="°C"
temperatureValues=(40 50 60 70 80 90 100 110)
temperatureColors=("#f4cb24" "#6bff49" "#ff8819" "#ff3205" "#f40202" "#ef02db" "#9502d9" "#05f2d3")
temperatureIcons=(       ☢)

if [ $temCore -lt 40 ];
then
  tmpEcho="${temperatureIcons[0]}%{F-} %{F${temperatureColors[0]}}$temCore$degree "
else
  for (( i=1; i<=7; i++ ))
  do 
      if [ $temCore -ge ${temperatureValues[$i-1]} -a $temCore -lt ${temperatureValues[$i]} ];
      then
        tmpEcho="%{F${temperatureColors[$i]}} ${temperatureIcons[$i]}%{F-} $temCore$degree"
      fi
  done
fi

echo $tmpEcho
