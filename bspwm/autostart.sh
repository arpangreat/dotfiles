#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
# xrandr --output HDMI1 --mode 1920x1080 --rate 74.97 --primary --left-of eDP1 --mode 1920x1080 --rate 60
xrandr --output eDP1 --primary --mode 1920x1080 --rate 60.00
#autorandr horizontal

$HOME/dotfiles/bspwm/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

# keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

# if [ $keybLayout = "be" ]; then
  # run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
# else
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
# fi

picom --config $HOME/.config/bspwm/picom.conf &

#Some ways to set your wallpaper besides variety or nitrogen
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/devyg41-28cd223e-1a1f-48b6-87c7-41c0064fe163.jpg &
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/w1.jpg
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/minimalist11.jpg
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/tropic_island_night.jpg
feh --bg-scale /home/arpangreat/dotfiles/wallpaper/jjk/anime-jujutsu-kaisen-hd-wallpaper-f8062df850900ca8f08cb1def842c4ca.jpg
# feh --bg-center /home/arpangreat/Pictures/Snapchat-612959769.jpg
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/neon.png &
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/woods.jpg
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/wallpaperflare.com_wallpaper.jpg
# feh --bg-scale /home/arpangreat/dotfiles/wallpaper/nightfox.jpeg
# setxkbmap us

# dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
# xsetroot -cursor_name left_ptr &

# conky -c $HOME/.config/bspwm/system-overview &
run kitty &
# run wezterm &
# run alacritty &
# run thunar & 
# run dolphin &
# run emacs &
run conky &
# run brave &
run firefox &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run discord &
#run spotify &
#run atom &
