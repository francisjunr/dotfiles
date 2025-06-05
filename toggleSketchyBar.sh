#!/usr/bin/env bash

top_padding=$(yabai -m query --windows --window | jq '.frame.y')

if [[ $top_padding == 35.0000 ]]; then
	yabai -m config top_padding 10 
	sketchybar --bar hidden=on
elif [ $top_padding = "10.0000" ]; then
	yabai -m config top_padding 35 
	sketchybar --bar hidden=off
fi
