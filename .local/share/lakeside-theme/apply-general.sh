#!/bin/bash

LST_PATH=$(dirname "$(readlink -f "$0")")

# Set theme folder variable
TFOLDER=$LST_PATH/themes/$(cat $LST_PATH/current-theme.txt)
echo $TFOLDER > $LST_PATH/current-theme-path.txt

# Set GTK theme and icon theme
GTKT=$(cat $TFOLDER/theme.txt)
ICONT=$(cat $TFOLDER/icon.txt)
gsettings set org.gnome.desktop.interface gtk-theme $GTKT
gsettings set org.gnome.desktop.interface icon-theme $ICONT

# Link wallpaper folder and copy .config stuff
rm $LST_PATH/current-wallpapers
ln -s $TFOLDER/wallpaper $LST_PATH/current-wallpapers
cp -r $TFOLDER/dot-config/* ~/.config/

exit 0