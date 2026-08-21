#!/bin/bash
# Styled dmenu launcher

# Set locale for dmenu to function properly when launched from window manager
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Colors matching the dark theme
BG="#040402"
FG="#efefef"
SEL_BG="#303029"
SEL_FG="#efefef"
FONT="Terminus Nerd Font:size=10"

dmenu_run -i \
    -fn "$FONT" \
    -nb "$BG" \
    -nf "$FG" \
    -sb "$SEL_BG" \
    -sf "$SEL_FG" \
    -l 10
