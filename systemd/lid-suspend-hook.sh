#!/bin/bash
# Systemd sleep hook - locks before suspend from any source (including lid close)
# Install to /usr/lib/systemd/system-sleep/hyprlock-suspend

case $1 in
    pre)
        # Before sleep - lock with hyprlock
        export DISPLAY=:0
        export WAYLAND_DISPLAY=wayland-0
        /usr/bin/hyprlock &
        sleep 1
        ;;
    post)
        # After resume
        ;;
esac
