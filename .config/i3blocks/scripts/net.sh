#!/usr/bin/env sh

ssid=$(nmcli -t -f NAME connection show --active | head -n1)
ip=$(hostname | awk '{print $1}')
[ -n "$ip" ] && echo "󰖩 $ssid" || echo "󰖪 Offline"
