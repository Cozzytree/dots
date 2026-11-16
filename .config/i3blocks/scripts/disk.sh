#!/usr/bin/env sh

DIR="${BLOCK_INSTANCE:-$HOME}"
ALERT_LOW="${ALERT_LOW:-10}"
LABEL="${LABEL:-}"

df -hP "$DIR" | awk -v label="$LABEL" -v alert_low="$ALERT_LOW" '
NR==2 {
    avail = $4
    used  = $5
    gsub(/%/, "", used)

    free = 100 - used

    if (free <= alert_low) {
        color = "#f7768e"    # red
        icon = "󰪥"
    } else if (free <= 25) {
        color = "#e0af68"    # yellow
        icon = "󰪤"
    } else {
        color = "#9ece6a"    # green
        icon = "󰋊"
    }

    # full text
    print icon " " avail

    # short text
    print icon " " avail

    # color
    print color
}'
