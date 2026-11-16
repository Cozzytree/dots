#!/bin/sh

if [ "$BLOCK_BUTTON" = "1" ]; then
    i3-msg -q exec "$HOME/.config/rofi/powermenu/type-2/powermenu.sh"
fi

printf '%s\n' "$LABEL"
