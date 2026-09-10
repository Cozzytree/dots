#!/usr/bin/env bash

output() {
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

    if [[ $vol == *MUTED* ]]; then
        msg=" Muted"
        icon="audio-volume-muted"
    else
        percent=$(awk '{printf "%.0f", $2 * 100}' <<< "$vol")
        msg="  ${percent}%"
        icon="audio-volume-high"
    fi

    # Print to stdout for i3blocks
    echo "$msg"

    # XFCE FIX: Instantly close the old notification process to clear the corner
    pkill xfce4-notifyd 2>/dev/null

    # Send a clean, standard notification without the broken -r flag
    notify-send -i "$icon" "Volume" "$msg"
}

case "$BLOCK_BUTTON" in
    1) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    4) wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ ;;
    5) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
esac

output
