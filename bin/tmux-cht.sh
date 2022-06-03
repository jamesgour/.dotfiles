#!/usr/bin/env bash
languages=`echo "python python3 js typescript csharp" | tr ' ' '\n'`
core_utils=`echo "find man tldr sed awk tr ls grep mv git git-status git-commit git-rebase stow chmod" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "Enter Query: " query

if printf $languages | grep -qs $selected; then
  tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
  tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
