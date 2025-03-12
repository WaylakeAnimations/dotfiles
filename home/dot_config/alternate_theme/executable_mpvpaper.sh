#!/bin/bash

if [ $(cat ~/.config/alternate_theme/mpvpaper-status.txt) == 0 ] ;
then
    mpvpaper -p -o "no-audio loop" '*' $(cat ~/.config/alternate_theme/current.txt)/wallpaper/live.mp4 & echo 1 > ~/.config/alternate_theme/mpvpaper-status.txt
else
    pkill mpvpaper & echo 0 > ~/.config/alternate_theme/mpvpaper-status.txt
fi