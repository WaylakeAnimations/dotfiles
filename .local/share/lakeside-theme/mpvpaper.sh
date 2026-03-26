#!/bin/bash

WORKINGPATH=$(dirname "$(readlink -f "$0")")

if [ $(cat $WORKINGPATH/mpvpaper-status.txt) == 0 ] ;
then
    mpvpaper -p -o "no-audio loop" '*' $WORKINGPATH/current-wallpapers/live.mp4 & echo 1 > $WORKINGPATH/mpvpaper-status.txt
else
    pkill mpvpaper & echo 0 > $WORKINGPATH/mpvpaper-status.txt
fi