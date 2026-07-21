#!/usr/bin/env bash

# /usr/lib/xdg-desktop-portal-wlr  >/dev/null 2>&1 &
pipewrire &
wireplumber &
wl-gammarelay-rs &
busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4000

# wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &

# Start clipboard manager
# wl-paste --type text --watch cliphist store &
# wl-paste --type image --watch cliphist store &
copyq &

killall waybar
waybar -c ~/.config/mango/waybar/config -s ~/.config/mango/waybar/style.css &
