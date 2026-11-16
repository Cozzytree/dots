#!/usr/bin/env sh

case "$1" in
    focus)
        zoomer focus -z 1
        ;;
    screen)
        /home/cozzycode/.local/bin/zoomer screen -z 1
        ;;
    cursor)
        /home/cozzycode/.local/bin/zoomer cursor
        ;;
    pan)
        zoomer pan
        ;;
    *)
        echo "Usage: $0 {focus|unfocus|toggle}"
        exit 1
        ;;
esac
