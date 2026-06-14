#!/bin/bash

DOTFILES_DIR="$(realpath $(dirname $0)/../)"
SCRIPT_DIR="$(realpath $(dirname $0))"

echo "taking from $HOME to $DOTFILES_DIR..."
cd "$HOME"

while read LINE; do
    if [[ "$(echo $LINE | grep -c '//')" -eq 0 ]]; then
        cp --parents -r "./$LINE" "$DOTFILES_DIR"
    else
        echo "$LINE is commented, ignoring..."
    fi
done < "$SCRIPT_DIR/_list"

echo 'done...'