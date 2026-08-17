#!/usr/bin/env sh

case "$1" in
    focus)
        /home/cozzycode/.local/bin/zoomer focus --min-radius=10 --max-radius=300
        ;;
    screen)
        /home/cozzycode/.local/bin/zoomer screen
        ;;
    cursor)
        /home/cozzycode/.local/bin/zoomer cursor
        ;;
    *)
        echo "Usage: $0 {focus|unfocus|toggle}"
        exit 1
        ;;
esac
