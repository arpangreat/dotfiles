#!/bin/bash
# Install hyprlock systemd hooks for suspend (including lid close)

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Installing hyprlock systemd hooks..."

# Install sleep hook script
sudo cp "$DOTFILES_DIR/systemd/lid-suspend-hook.sh" /usr/lib/systemd/system-sleep/hyprlock-suspend
sudo chmod +x /usr/lib/systemd/system-sleep/hyprlock-suspend

echo "✓ Hyprlock will now lock before suspend and on lid close"
