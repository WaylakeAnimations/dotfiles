#!/bin/bash

ARG="$1"

if [[ "$ARG" == "-h" ]]; then
    printf "
            Waylake's darkwindow windowrule maker
            (writes to darkwindow.conf by default)

  -c  Copy to clipboard instead of directly writing to file
  -g  Write to darkwindow-gtk-theme-dependent.conf instead
  -h  Display this text\n\n"
    exit
fi

SCRIPTDIR=$(dirname "$(readlink -f "$0")")
echo Change your active window...

handle() {
    case $1 in
        # only do the rest if activewindow change
        activewindow'>>'*) CLASS=$(echo $1 | sed 's/,.*//' | cut -d '>' -f 3-)

        echo Class is $CLASS
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

        if [[ "$ARG" == "-c" ]]; then
            echo "$RES"
            wl-copy "$RES"

        elif [[ "$ARG" == "-g" ]]; then
            echo "windowrule = match:class $CLASS, $RES" | tee -a "$SCRIPTDIR/darkwindow-gtk-theme-dependent.conf" > echo /dev/null

        else
            echo "windowrule = match:class $CLASS, $RES" | tee -a "$SCRIPTDIR/darkwindow.conf"> echo /dev/null

        fi
        exit ;;
    esac
}

# socket thingy
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
