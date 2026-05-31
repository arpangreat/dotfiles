#!/bin/bash

WIDTH=50
DELAY=0.25
SEPARATOR="   -   "

while true; do
    if ! command -v playerctl >/dev/null 2>&1; then
        echo ""
        sleep 5
        continue
    fi

    TITLE=$(playerctl metadata --format='{{ title }}' 2>/dev/null)

    if [ -z "$TITLE" ]; then
        echo ""
        sleep 2
        continue
    fi

    TEXT="$TITLE$SEPARATOR"
    LENGTH=${#TEXT}

    if [ "$LENGTH" -le "$WIDTH" ]; then
        echo "$TITLE"
        sleep 2
        continue
    fi

    for ((i = 0; i < LENGTH; i++)); do
        CURRENT=$(playerctl metadata --format='{{ title }}' 2>/dev/null)

        if [ "$CURRENT" != "$TITLE" ]; then
            break
        fi

        SCROLL_TEXT="$TEXT$TEXT"
        echo "${SCROLL_TEXT:i:WIDTH}"
        sleep "$DELAY"
    done
done
