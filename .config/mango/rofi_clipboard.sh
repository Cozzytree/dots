#!/usr/bin/env bash
# Show clipboard history using rofi and copy selection to clipboard
cliphist list | rofi -dmenu -theme ~/.config/mango/rofi-dmenu.rasi -p "Clipboard" | cliphist decode | wl-copy
