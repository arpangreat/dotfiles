#!/bin/bash

# This script upgrades all tools installed via uv.

uv tool list | awk '{print $1}' | while read -r tool; do
  # The output of `uv tool list` has the tool name on one line
  # and the executable on the next, indented.
  # We only want the lines with the tool name.
  # A simple way to filter is to ignore lines that start with a hyphen,
  # but awk '{print $1}' already handles this by taking the first word.
  # The output of awk will have the tool name and then empty lines for the executables.
  # So we just need to check for empty lines.
  if [[ -n "$tool" && "$tool" != "-" ]]; then
    echo "Upgrading $tool..."
    uv tool upgrade "$tool"
  fi
done

echo "All uv tools have been upgraded."
