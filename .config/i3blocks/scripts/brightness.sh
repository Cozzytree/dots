#!/usr/bin/env sh

echo "󰃠 $(brightnessctl -m | cut -d',' -f4)"

case "$BLOCK_BUTTON" in
    4)
        brightnessctl set +5% >/dev/null
        ;;
    5)
        brightnessctl set 5%- >/dev/null
        ;;
esac
