#!/usr/bin/env bash

export PATH="$HOME/.cargo/bin:$PATH"

/usr/lib/xdg-desktop-portal-wlr  >/dev/null 2>&1 &
pipewire &
wireplumber &

wl-gammarelay-rs >/dev/null 2>&1 &

# wait until the D-Bus service registers, then apply temperature
for _ in $(seq 1 20); do
    busctl --user set-property \
        rs.wl-gammarelay \
        / \
        rs.wl.gammarelay \
        Temperature q 4000 2>/dev/null && break
    sleep 0.5
done

# wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &

# Start clipboard manager
# wl-paste --type text --watch cliphist store &
# wl-paste --type image --watch cliphist store &
copyq &

# killall waybar
waybar -c ~/.config/mango/waybar/config -s ~/.config/mango/waybar/style.css &
emacs --daemon &
swaybg -i ~/Downloads/pexels-ryank-27429860.jpg &
