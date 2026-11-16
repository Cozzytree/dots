#!/usr/bin/env bash

STATE_FILE="${STATE_FILE:-${XDG_RUNTIME_DIR:-/tmp}/i3blocks-volume.state}"

read_state() {
	old_vol=""
	last_id=""
	if [ -f "$STATE_FILE" ]; then
		old_vol=$(sed -n '1p' "$STATE_FILE")
		last_id=$(sed -n '2p' "$STATE_FILE")
	fi
}

write_state() {
	printf '%s\n%s\n' "$1" "$2" > "$STATE_FILE"
}

send_notification() {
    local args=()
    [ -n "$last_id" ] && args+=(--replace-id="$last_id")
    last_id=$(dunstify \
        --app-name=i3blocks \
        --urgency=low \
        --icon="$notify_icon" \
        --expire-time=5000 \
        "${args[@]}" \
        "Volume" "$msg" --print-id 2>/dev/null)
}

format() {
    vol=$1

    if [[ $vol == *MUTED* ]]; then

        msg=" 󰖁 Muted"
        notify_icon="audio-volume-muted"
    else
        percent=$(awk '{printf "%.0f", $2 * 100}' <<< "$vol")

        if (( percent == 0 )); then

            notify_icon="audio-volume-muted"
        elif (( percent <= 30 )); then

            notify_icon="audio-volume-low"
        elif (( percent <= 70 )); then

            notify_icon="audio-volume-medium"
        else

            notify_icon="audio-volume-high"
        fi

        msg=" 󰕾 ${percent}%"
    fi
}

case "$BLOCK_BUTTON" in
    1)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    3)
        pavucontrol >/dev/null 2>&1 &
        ;;
    4)
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    5)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
esac

read_state
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
format "$vol"

echo "$msg"

if [ -z "$old_vol" ]; then
    write_state "$vol" ""
    exit 0
fi

if [ "$old_vol" != "$vol" ]; then
    send_notification
    write_state "$vol" "$last_id"
fi