#!/bin/sh
# i3lock-fancy wrapper for i3 ($mod+l, and the rofi power menu lock entry).
#
# IMPORTANT: /usr/bin/i3lock on this system is STOCK i3lock 2.16, not
# i3lock-color. Stock i3lock only understands:
#   -v -n -b -d -c -u -p -i -t -e -I -f -k
# Any --*-color / --indicator / --clock / --time-str / --keylayout option makes
# i3lock exit non-zero, and i3lock-fancy then silently falls back to a plain
# uncoloured screen. So keep this call minimal.
#
# -p  pixelate the wallpaper (fast, works on any WM)

if pgrep -x i3lock > /dev/null 2>&1; then
    exit 0
fi

exec i3lock-fancy -p
