#!/usr/bin/env bash

STATE_FILE="${STATE_FILE:-${XDG_RUNTIME_DIR:-/tmp}/i3blocks-brightness.state}"

read_state() {
	old_bright=""
	last_id=""
	if [ -f "$STATE_FILE" ]; then
		old_bright=$(sed -n '1p' "$STATE_FILE")
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
        --icon=display-brightness \
        --expire-time=5000 \
        "${args[@]}" \
        "Brightness" "$msg" --print-id 2>/dev/null)
}

case "$BLOCK_BUTTON" in
    4)
        brightnessctl set +5% >/dev/null
        ;;
    5)
        brightnessctl set 5%- >/dev/null
        ;;
esac

read_state
cur=$(brightnessctl -m | cut -d',' -f4)
msg="$cur"

echo "󰃠 $msg"

if [ -z "$old_bright" ]; then
    write_state "$cur" ""
    exit 0
fi

if [ "$old_bright" != "$cur" ]; then
    send_notification
    write_state "$cur" "$last_id"
fi