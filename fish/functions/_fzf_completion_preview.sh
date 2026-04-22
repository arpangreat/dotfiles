#!/usr/bin/env sh
f="$1"

# Resolve symlink for type checking, but show the original path
if [ -L "$f" ]; then
    resolved=$(readlink -f "$f")
    echo "symlink → $resolved"
    echo "---"
    f="$resolved"
fi

if [ -d "$f" ]; then
    eza --tree --color=always --icons=always --level=2 "$f" 2>/dev/null || ls -1 --color=always "$f"
elif [ -f "$f" ]; then
    bat --color=always --line-range=:200 "$f"
else
    echo "$f" | bat --color=always -l bash --plain
fi
