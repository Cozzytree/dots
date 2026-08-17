#!/usr/bin/env sh

info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1)
ac=$(upower -i /org/freedesktop/UPower/devices/line_power_ACAD)

percent=$(echo "$info" | awk '/percentage:/ {print $2}')
online=$(echo "$ac" | awk '/online:/ {print $2}')

echo "󰁹 $percent"

if [ "$online" = "yes" ]; then
    echo "󰂄 $percent"
else
    echo "󰁹 $percent"
fi
