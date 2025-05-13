#!/usr/bin/env bash

session_Name=$(tmux display-message -p '#S')

if [ "$session_Name" = "w" ]; then
	from=work
elif [ "$session_Name" = "p" ]; then
	from=personal
fi

selected=$(basename $(find $HOME/$from -maxdepth 1 -type d -print | fzf))

if [[ -z "$selected" ]]; then
	exit 0
fi

open_window=$(tmux list-window | grep ${selected:0:15})
open_window_index=${open_window:0:1}

if [[ -z "$open_window" ]]; then
	cd "$HOME/$from/$selected"
	nvim "$selected"
else 
	tmux select-window -t $open_window_index
fi

