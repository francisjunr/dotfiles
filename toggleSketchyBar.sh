#!/usr/bin/env bash

toggle_padding=$(yabai -m query --windows --window | jq '.frame.y')
if [[ $toggle_padding == 35.0000 ]]; then
	yabai -m config top_padding 10 
	sketchybar --bar hidden=toggle
elif [ $toggle_padding = "10.0000" ]; then
	yabai -m config top_padding 35 
	sketchybar --bar hidden=toggle
fi
