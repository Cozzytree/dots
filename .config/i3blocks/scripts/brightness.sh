#!/usr/bin/env sh

# File to track notification ID so popups replace each other
ID_FILE="/tmp/bright_notif_id"

# Process the button actions first
case "$BLOCK_BUTTON" in
    4)
        brightnessctl set +5% >/dev/null
        ;;
    5)
        brightnessctl set 5%- >/dev/null
        ;;
esac

# Read the updated brightness percentage
percent=$(brightnessctl -m | cut -d',' -f4)
msg="    ${percent}"

# Print to stdout for i3blocks
echo "$msg"

# Send the desktop notification
if [ -f "$ID_FILE" ]; then
    last_id=$(cat "$ID_FILE")
    # Reuse existing ID to prevent stacking windows
    new_id=$(notify-send -p -r "$last_id" -i "display-brightness" "Brightness" "$msg")
else
    new_id=$(notify-send -p -i "display-brightness" "Brightness" "$msg")
fi

echo "$new_id" > "$ID_FILE"
