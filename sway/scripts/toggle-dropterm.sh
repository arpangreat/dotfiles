#!/bin/bash

if swaymsg '[app_id="kitty-dropterm"]' focus 2>/dev/null; then
    # If focused, move to scratchpad
    swaymsg '[app_id="kitty-dropterm"]' move scratchpad
else
    # Check if it exists in scratchpad
    if swaymsg 'scratchpad show' 2>/dev/null | grep -q "kitty-dropterm"; then
        # Show from scratchpad
        swaymsg '[app_id="kitty-dropterm"]' scratchpad show
    else
        # Create new dropdown terminal
        kitty --class kitty-dropterm tmux &
        sleep 0.5
        swaymsg '[app_id="kitty-dropterm"]' floating enable
        swaymsg '[app_id="kitty-dropterm"]' resize set 75ppt 60ppt
        swaymsg '[app_id="kitty-dropterm"]' move position center
    fi
fi
