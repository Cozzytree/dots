#!/usr/bin/env bash

STATE_FILE="/tmp/net_speed_state"
MIN_KB=1

iface=$(ip route show default 2>/dev/null | awk '{print $5; exit}')
if [ -z "$iface" ]; then
    rm -f "$STATE_FILE"
    echo "󰖪 Offline"
    exit 0
fi

rx=$(cat "/sys/class/net/$iface/statistics/rx_bytes")
tx=$(cat "/sys/class/net/$iface/statistics/tx_bytes")
now=$(date +%s)

if [ -f "$STATE_FILE" ]; then
    read -r t0 r0 s0 < "$STATE_FILE"
    dt=$((now - t0))
else
    dt=0
fi
printf '%s %s %s\n' "$now" "$rx" "$tx" > "$STATE_FILE"

human() {
    awk -v k="$1" 'BEGIN{
        if (k >= 1048576) printf "%.1fG", k/1048576;
        else if (k >= 1024) printf "%.0fM", k/1024;
        else printf "%.0fK", k
    }'
}

if [ "$dt" -le 0 ]; then
    echo "󰛴  0K  0K"
    exit 0
fi

rkb=$(((rx - r0) / dt / 1024))
skb=$(((tx - s0) / dt / 1024))

out=""
[ "$rkb" -ge "$MIN_KB" ] && out=" $(human "$rkb")"
[ "$skb" -ge "$MIN_KB" ] && out="$out  $(human "$skb")"

echo "${out:-󰤯 idle}"
