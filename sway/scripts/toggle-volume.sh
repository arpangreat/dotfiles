#!/bin/bash

if pgrep -x "pavucontrol-qt" > /dev/null; then
    pkill pavucontrol-qt
else
    pavucontrol-qt &
fi
