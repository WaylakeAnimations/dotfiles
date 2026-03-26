#!/bin/bash

LST_PATH=$(dirname $(dirname $(dirname "$(readlink -f "$0")")))

# Run general theme-applying script
bash $LST_PATH/apply-general.sh

# Stop softwares that can't reload configs on the fly
pkill mpvpaper
pkill waybar

# Reload configs for softwares that can do it on the fly
hyprctl reload
hyprctl hyprpaper wallpaper ' , '$LST_PATH'/current-wallpapers/static.png, fill'

# Restart stopped softwares
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &

bash /home/Waylake/.config/waybar-quotes/quote_picker.sh
waybar -c ~/.config/waybar-quotes/config.jsonc -s ~/.config/waybar-quotes/style.css &

if [ $(cat $LST_PATH/mpvpaper-status.txt) == 1 ] ; then
    mpvpaper -p -o "no-audio loop" '*' $LST_PATH/current-wallpapers/live.mp4 &
fi

exit 0