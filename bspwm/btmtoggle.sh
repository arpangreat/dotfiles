#!/usr/bin/env bash
id=$(xdotool search --class btm)

if [ "$id" != "" ]
 then
  bspc node "$id" --flag hidden -f
fi
