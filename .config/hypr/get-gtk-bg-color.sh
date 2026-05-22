#!/bin/bash

THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g")

HEX=$(grep '@define-color theme_bg_color' "/usr/share/themes/$THEME/gtk-3.0/gtk.css" | sed 's/.*#//; s/\;//' | tr '[:lower:]' '[:upper:]')

printf "\n  Theme     = $THEME \n  Hex       = #$HEX\n"

R1="$(echo 'ibase=16; '$(echo $HEX | cut -c-2)  | bc)"
G1="$(echo 'ibase=16; '$(echo $HEX | cut -c3-4) | bc)"
B1="$(echo 'ibase=16; '$(echo $HEX | cut -c5-6) | bc)"

echo "  RGB       = $R1 $G1 $B1"

RED=$(echo "scale=10;   $R1 / 255" | bc)
GREEN=$(echo "scale=10; $G1 / 255" | bc)
BLUE=$(echo "scale=10;  $B1 / 255" | bc)

if [[ $RED == '.'* ]]; then
    REDF=$(echo $RED | sed 's/^/0/')
else
    REDF=$RED
fi

if [[ $GREEN == '.'* ]]; then
    GREENF=$(echo $GREEN | sed 's/^/0/')
else
    GREENF=$GREEN
fi

if [[ $BLUE == '.'* ]]; then
    BLUEF=$(echo $BLUE | sed 's/^/0/')
else
    BLUEF=$BLUE
fi

BKG="bkg=[$REDF $GREENF $BLUEF]"
echo "  formatted = $BKG"

wl-copy $BKG
printf "\n    bkg value copied to clipboard\n\n"

exit 0
