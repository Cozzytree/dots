#!/bin/bash
# Styled clipmenu launcher via dmenu

# Set locale for dmenu/clipmenu to function properly when launched from window manager
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Colors matching the dark theme
BG="#040402"
FG="#d4daf0"
SEL_BG="#161615"
SEL_FG="#efefef"
BORDER="#161615"
FONT="Hack:size=11"

clipmenu -i \
    -fn "$FONT" \
    -nb "$BG" \
    -nf "$FG" \
    -sb "$SEL_BG" \
    -sf "$SEL_FG" \
    -l 20
