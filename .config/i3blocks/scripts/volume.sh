#!/usr/bin/env bash

output() {
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

    if [[ $vol == *MUTED* ]]; then
        echo " Muted"
    else
        percent=$(awk '{printf "%.0f", $2 * 100}' <<< "$vol")
        echo "  ${percent}%"
    fi
}

case "$BLOCK_BUTTON" in
    1)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    4)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    5)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
esac

output
