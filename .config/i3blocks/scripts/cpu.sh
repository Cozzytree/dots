#!/bin/sh

get_cpu_usage() {
    read -r _ u1 n1 s1 i1 w1 irq1 sirq1 st1 _ _ < /proc/stat

    total1=$((u1 + n1 + s1 + i1 + w1 + irq1 + sirq1 + st1))
    idle1=$((i1 + w1))

    sleep 0.2

    read -r _ u2 n2 s2 i2 w2 irq2 sirq2 st2 _ _ < /proc/stat

    total2=$((u2 + n2 + s2 + i2 + w2 + irq2 + sirq2 + st2))
    idle2=$((i2 + w2))

    total_delta=$((total2 - total1))
    idle_delta=$((idle2 - idle1))

    if [ "$total_delta" -gt 0 ]; then
        echo $(((total_delta - idle_delta) * 100 / total_delta))
    else
        echo 0
    fi
}

get_cpu_temp() {
    for zone in /sys/class/thermal/thermal_zone*/temp; do
        [ -r "$zone" ] || continue

        temp=$(cat "$zone" 2>/dev/null)

        case "$temp" in
            ''|*[!0-9]*) continue ;;
        esac

        echo $((temp / 1000))
        return
    done

    echo "?"
}

cpu="$(get_cpu_usage)"
temp=$(sensors 2>/dev/null |
    awk '/Tctl:/{gsub(/\+|°C/,"",$2); print int($2); exit}')

if [ "$cpu" -lt 30 ]; then
    color="#9ece6a"
elif [ "$cpu" -lt 70 ]; then
    color="#e0af68"
else
    color="#f7768e"
fi

printf '󰍛 %s%%   %s°C\n' "$cpu" "$temp"
printf '%s%% %s°C\n' "$cpu" "$temp"
printf '%s\n' "$color"
