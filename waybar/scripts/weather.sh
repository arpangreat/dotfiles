#!/bin/bash

# Weather script using Open-Meteo API (no API key needed)
# Set your coordinates below

LAT="24.1760"  # Rampurhat latitude
LON="87.7858"  # Rampurhat longitude

# Fetch weather data
WEATHER_DATA=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current_weather=true&temperature_unit=celsius")

# Parse temperature and weather code
TEMP=$(echo "$WEATHER_DATA" | jq -r '.current_weather.temperature')
WEATHER_CODE=$(echo "$WEATHER_DATA" | jq -r '.current_weather.weathercode')

# Map weather codes to icons
case $WEATHER_CODE in
    0) ICON="☀️" ;;           # Clear sky
    1|2|3) ICON="⛅" ;;      # Partly cloudy
    45|48) ICON="🌫️" ;;     # Fog
    51|53|55) ICON="🌦️" ;;  # Drizzle
    61|63|65) ICON="🌧️" ;;  # Rain
    71|73|75) ICON="🌨️" ;;  # Snow
    80|81|82) ICON="🌧️" ;;  # Rain showers
    95|96|99) ICON="⛈️" ;;   # Thunderstorm
    *) ICON="🌡️" ;;         # Unknown
esac

# Check if data was fetched successfully
if [ -n "$TEMP" ] && [ "$TEMP" != "null" ]; then
    # Add +/- sign
    if (( $(echo "$TEMP >= 0" | bc -l) )); then
        SIGN="+"
    else
        SIGN=""  # Negative sign is already included
    fi
    echo "${ICON} ${SIGN}${TEMP}°C"
else
    echo "󰼱N/A"
fi
