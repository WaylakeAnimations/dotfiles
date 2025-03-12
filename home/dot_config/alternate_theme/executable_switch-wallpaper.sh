#!/bin/bash

FOLDER=$(cat ~/.config/alternate_theme/current.txt)
CURRENT=$(cat $FOLDER/current-wallpaper.txt)

if [ $CURRENT == 1 ] ;
then
    echo 2 > $FOLDER/current-wallpaper.txt
else
    echo 1 > $FOLDER/current-wallpaper.txt
fi

cp $FOLDER/wallpaper/live$(cat $FOLDER/current-wallpaper.txt).mp4 $FOLDER/wallpaper/live.mp4
cp $FOLDER/wallpaper/static$(cat $FOLDER/current-wallpaper.txt).png $FOLDER/wallpaper/static.png

pkill hyprpaper &
pkill mpvpaper

if [ $(cat ~/.config/alternate_theme/mpvpaper-status.txt) == 1 ] ;
then
    mpvpaper -p -o "no-audio loop" '*' $FOLDER/wallpaper/live.mp4 &
fi

hyprpaper --config $FOLDER/hypr/hyprpaper.conf &