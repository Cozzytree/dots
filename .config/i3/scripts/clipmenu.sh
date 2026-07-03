#!/bin/bash
# Styled clipmenu launcher via dmenu

# Colors matching the dark theme
BG="#040402"
FG="#d4daf0"
SEL_BG="#161615"
SEL_FG="#f5e642"
BORDER="#161615"
FONT="Hack Nerd Font:size=12"

clipmenu -i \
    -fn "$FONT" \
    -nb "$BG" \
    -nf "$FG" \
    -sb "$SEL_BG" \
    -sf "$SEL_FG" \
    -l 10
