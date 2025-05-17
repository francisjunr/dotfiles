#!/usr/bin/env bash

wallpaper_folder=~/personal/wallpapers/
wallpaper=$(ls $wallpaper_folder| wofi --show=dmenu)
echo $wallpaper
hyprctl hyprpaper reload ,$wallpaper_folder$wallpaper
