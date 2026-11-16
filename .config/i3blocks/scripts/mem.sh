#!/usr/bin/env sh

TYPE="${BLOCK_INSTANCE:-mem}"
PERCENT="${PERCENT:-true}"

awk -v type="$TYPE" -v percent="$PERCENT" '
/^MemTotal:/      { mem_total=$2 }
/^MemAvailable:/  { mem_avail=$2 }
/^SwapTotal:/     { swap_total=$2 }
/^SwapFree:/      { swap_free=$2 }

END {
    if (type == "swap") {
        total = swap_total / 1024 / 1024
        used  = (swap_total - swap_free) / 1024 / 1024
        icon  = "󰾵"
    } else {
        total = mem_total / 1024 / 1024
        used  = (mem_total - mem_avail) / 1024 / 1024
        icon  = "󰍛"
    }

    pct = (total > 0) ? used / total * 100 : 0

    if (pct >= 90) {
        color = "#f7768e"
    } else if (pct >= 75) {
        color = "#e0af68"
    } else {
        color = "#9ece6a"
    }

    if (percent == "true")
        printf("%s %.1fG/%.1fG (%.0f%%)\n", icon, used, total, pct)
    else
        printf("%s %.1fG/%.1fG\n", icon, used, total)

    printf("%s %.0f%%\n", icon, pct)

    print color
}
' /proc/meminfo
