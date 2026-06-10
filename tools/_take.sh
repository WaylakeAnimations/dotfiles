#!/bin/bash

DOTFILES_DIR="$(realpath $(dirname $0)/../)"
SCRIPT_DIR="$(realpath $(dirname $0))"

echo taking from $HOME to $DOTFILES_DIR
cd $HOME

while read LINE; do
    cp --parents -r "./$LINE" "$DOTFILES_DIR"
done < "$SCRIPT_DIR/_list"