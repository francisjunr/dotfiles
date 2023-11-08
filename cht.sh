#!/usr/bin/env bash
languages=`echo "js typescript golang lua bash" | tr ' ' '\n'`
core_utils=`echo "find fzf tr awk" | tr ' ' '\n'`
selected=`printf "$languages\n$core_utils" | fzf`
if [[ -z $selected ]]; then
	exit 0
fi

read -p "Enter Query: " query

if echo "$languages" | grep -qs "$selected"; then
	query=`echo $query | tr ' ' '+'`
	tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl -s cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
