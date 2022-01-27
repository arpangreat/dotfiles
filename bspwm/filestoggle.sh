#!/usr/bin/env bash
id=$(xdotool search --class files)

if [ "$id" != "" ]
 then
  bspc node "$id" --flag hidden -f
fi
