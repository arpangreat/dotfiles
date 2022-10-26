#!/usr/bin/env bash
if ! [ -x "$(command -v archlinux-logout)" ]; then
   sh ~/.config/i3/polybar/scripts/powermenu.sh
else
    archlinux-logout
fi
