#!/bin/bash

# --- Loading from env ---
ENV_FILE="$HOME/.env/env.json"

if [[ ! -f "$ENV_FILE" ]]; then
	echo "Error: Environment JSON file $ENV_FILE not found."
	exit 1
fi

# --- Variables ---
API_KEY=$(jq -r '.WEATHER_API_KEY' "$ENV_FILE")
LOCATION=$(jq -r '.LOCATION' "$ENV_FILE")
CACHE_FILE="/tmp/weather"

# --- Function to print weather from a raw JSON argument ---
print_weather() {
	echo "$1" | jq -r '
    .current |
    (
      .condition.text as $cond |
      {
        "Sunny": "󰖙",
        "Clear": "󰖙",
        "Partly cloudy": "⛅",
        "Cloudy": "󰖐",
        "Overcast": "󰖐",
        "Mist": "🌫️",
        "Patchy rain possible": "🌦️",
        "Patchy snow possible": "🌨️",
        "Patchy sleet possible": "🌨️",
        "Patchy freezing drizzle possible": "🌧️",
        "Thundery outbreaks possible": "⛈️",
        "Blowing snow": "🌨️",
        "Blizzard": "🌨️",
        "Fog": "󰖑",
        "Freezing fog": "🌫️",
        "Patchy light drizzle": "🌦️",
        "Light drizzle": "🌦️",
        "Freezing drizzle": "🌧️",
        "Heavy freezing drizzle": "🌧️",
        "Patchy light rain": "🌦️",
        "Light rain": "󰖗",
        "Moderate rain at times": "🌧️",
        "Moderate rain": "🌧️",
        "Heavy rain at times": "🌧️",
        "Heavy rain": "🌧️",
        "Light freezing rain": "🌧️",
        "Moderate or heavy freezing rain": "🌧️",
        "Light sleet": "🌨️",
        "Moderate or heavy sleet": "🌨️",
        "Patchy light snow": "🌨️",
        "Light snow": "🌨️",
        "Patchy moderate snow": "🌨️",
        "Moderate snow": "🌨️",
        "Patchy heavy snow": "🌨️",
        "Heavy snow": "🌨️",
        "Ice pellets": "🌨️",
        "Light rain shower": "🌦️",
        "Moderate or heavy rain shower": "🌧️",
        "Torrential rain shower": "⛈️",
        "Light sleet showers": "🌨️",
        "Moderate or heavy sleet showers": "🌨️",
        "Light snow showers": "🌨️",
        "Moderate or heavy snow showers": "🌨️",
        "Light showers of ice pellets": "🌨️",
        "Moderate or heavy showers of ice pellets": "🌨️",
        "Patchy light rain with thunder": "⛈️",
        "Moderate or heavy rain with thunder": "⛈️",
        "Patchy light snow with thunder": "⛈️",
        "Moderate or heavy snow with thunder": "⛈️"
      }[$cond] // "🌈"
    ) + " " + (.temp_c|tostring) + "°C"

  '
}

# --- Main Logic ---

# Check if network is available (using Google DNS)
if ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1; then
	# Fetch from API, show and cache
	RESPONSE=$(curl -s "https://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$LOCATION&aqi=yes")
	print_weather "$RESPONSE"
	echo "$RESPONSE" >"$CACHE_FILE"
else
	# No network, use cache if exists
	if [[ -f "$CACHE_FILE" ]]; then
		print_weather "$(cat "$CACHE_FILE")"
	fi
fi
