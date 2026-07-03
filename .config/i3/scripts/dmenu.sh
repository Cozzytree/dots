#!/bin/bash
# Styled dmenu launcher

# Colors matching the dark theme
BG="#040402"
FG="#d4daf0"
SEL_BG="#161615"
SEL_FG="#f5e642"
FONT="Hack Nerd Font:size=12"

dmenu_run -i \
    -fn "$FONT" \
    -nb "$BG" \
    -nf "$FG" \
    -sb "$SEL_BG" \
    -sf "$SEL_FG" \
    -l 10
