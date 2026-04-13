#!/bin/bash

PICK=$(hyprpicker -f rgb -o '{0},{1},{2}')

RED=$(echo "scale=10; $(echo $PICK | sed 's/,.*//') / 255" | bc)
GREEN=$(echo "scale=10; $(echo $PICK | cut -d ',' -f 2- | sed 's/,.*//') / 255" | bc)
BLUE=$(echo "scale=10; $(echo $PICK | cut -d ',' -f 3- ) / 255" | bc)

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

RES="darkwindow:shade chromakey bkg=[$REDF $GREENF $BLUEF] similarity=\$sim amount=\$amt targetOpacity=\$app_opct"
echo "$RES"
wl-copy "$RES"
