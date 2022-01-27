#!/usr/bin/env bash
id=$(xdotool search --class calc)

if [ "$id" != "" ]
 then
  bspc node "$id" --flag hidden -f
fi
