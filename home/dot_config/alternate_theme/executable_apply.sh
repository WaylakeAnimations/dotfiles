#!/bin/bash

pkill mpvpaper
pkill hyprpaper
pkill waybar

FOLDER=~/.config/alternate_theme/$1/

bash /home/Waylake/.config/waybar-quotes/quote_picker.sh &

echo $1 > ~/.config/alternate_theme/current-name.txt
echo $FOLDER > ~/.config/alternate_theme/current.txt

ICON=$(cat $FOLDER/icon.txt)
THEME=$(cat $FOLDER/theme.txt)

cp $FOLDER/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf

if [ $(cat ~/.config/alternate_theme/mpvpaper-status.txt) == 1 ] ;
then
    mpvpaper -p -o "no-audio loop" '*' $FOLDER/wallpaper/live.mp4 &
fi

hyprpaper --config $FOLDER/hypr/hyprpaper.conf &
waybar -c $FOLDER/waybar/config.jsonc -s $FOLDER/waybar/style.css &
waybar -c ~/.config/waybar-quotes/config.jsonc -s $FOLDER/waybar-quotes/style.css &
gsettings set org.gnome.desktop.interface gtk-theme $THEME &
gsettings set org.gnome.desktop.interface icon-theme $ICON &

exit