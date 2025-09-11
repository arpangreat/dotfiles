#!/bin/bash

if swaymsg '[app_id="kitty-utop"]' focus 2>/dev/null; then
    # If focused, move to scratchpad
    swaymsg '[app_id="kitty-utop"]' move scratchpad
else
    # Check if it exists in scratchpad
    if swaymsg 'scratchpad show' 2>/dev/null | grep -q "kitty-utop"; then
        # Show from scratchpad
        swaymsg '[app_id="kitty-utop"]' scratchpad show
    else
        # Create new utop terminal
        kitty --class kitty-utop ipython &
        sleep 0.5
        swaymsg '[app_id="kitty-utop"]' floating enable
        swaymsg '[app_id="kitty-utop"]' resize set 75ppt 60ppt
        swaymsg '[app_id="kitty-utop"]' move position center
        swaymsg '[app_id="kitty-utop"]' move scratchpad
    fi
fi
