# Hyprlock Systemd Integration

Makes hyprlock the default locker for system suspend operations.

## Installation

```bash
sudo bash ~/dotfiles/systemd/install.sh
```

Or manually:

```bash
sudo cp ~/dotfiles/systemd/hyprlock-suspend.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable hyprlock-suspend.service
```

## Features

- Hyprlock locks before all system suspend operations
- Hyprlock locks on idle after 5 minutes (hypridle)
- Hyprlock locks + suspends after 10 minutes idle
- Hyprlock locks + suspends on lid close
- Elephant power menu suspend/hibernate locks before action

## Configuration Files

- `~/dotfiles/systemd/hyprlock-suspend.service` - Systemd service
- `~/dotfiles/hypr/hypridle.conf` - Idle and lid close behavior
- `~/dotfiles/elephant/menus/power.toml` - Power menu actions
