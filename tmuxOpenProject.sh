#!/usr/bin/env bash

session_Name=$(tmux display-message -p '#S')

if [ "$session_Name" = "w" ]; then
	from=work
elif [ "$session_Name" = "p" ]; then
	from=personal
fi

# the find command lists all the directories and symlinks and pipes it to fzf
selected=$(basename $(find $HOME/$from -maxdepth 1 -type d -o -maxdepth 1 -type l | fzf))

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

