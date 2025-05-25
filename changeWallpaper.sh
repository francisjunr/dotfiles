#!/usr/bin/env bash

wallpaper_folder=~/personal/wallpapers/
wallpaper=$(ls $wallpaper_folder| wofi --show=dmenu)

if [[ -z "$wallpaper" ]]; then
	exit 0
fi

hyprctl hyprpaper reload ,$wallpaper_folder$wallpaper
