#!/bin/bash

rm "./pkgs.txt"
rm "./pkgs_aur.txt"

pacman -Qqen > "./pkgs.txt"
pacman -Qqem > "./pkgs_aur.txt"
