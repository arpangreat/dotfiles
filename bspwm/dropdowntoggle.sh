#!/usr/bin/env bash
id=$(xdotool search --class dropdown)

if [ "$id" != "" ]
 then
  bspc node "$id" --flag hidden -f
fi
