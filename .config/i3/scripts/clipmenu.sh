#!/bin/bash
# Styled clipmenu launcher via dmenu

# Set locale for dmenu/clipmenu to function properly when launched from window manager
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Colors matching the dark theme
BG="#040402"
FG="#d4daf0"
SEL_BG="#161615"
SEL_FG="#f5e642"
BORDER="#161615"
FONT="Iosevka KG Terminal Md Ex:size=13"

clipmenu -i \
    -fn "$FONT" \
    -nb "$BG" \
    -nf "$FG" \
    -sb "$SEL_BG" \
    -sf "$SEL_FG" \
    -l 10
