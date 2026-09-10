#!/usr/bin/env bash

# export PATH="$HOME/.cargo/bin:$PATH"
export XDG_CURRENT_DESKTOP=wlroots
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=wlroots

dbus-update-activation-environment --all

# /usr/libexec/xdg-desktop-portal-wlr  >/dev/null 2>&1 &
pipewire >/tmp/pipewire.log 2>&1 &

# qs &
# /home/cozzycode/.cargo/bin/wl-gammarelay-rs >/tmp/wl-gammarelay.log 2>&1 &
copyq &
# emacs --daemon &

# wait until the D-Bus service registers, then apply temperature
# for _ in $(seq 1 20); do
#     if busctl --user status rs.wl-gammarelay >/dev/null 2>&1; then
#         break
#     fi
#     sleep 0.5
# done

# Set temperature
# busctl --user set-property \
#     rs.wl-gammarelay \
#     / \
#     rs.wl.gammarelay \
#     Temperature q 4000

# wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &

# Start clipboard manager
# wl-paste --type text --watch cliphist store &
# wl-paste --type image --watch cliphist store &

# killall waybar
# waybar -c ~/.config/mango/waybar/config -s ~/.config/mango/waybar/style.css &
# swaybg -i ~/Downloads/pexels-ryank-27429860.jpg &
