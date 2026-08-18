#!/usr/bin/env bash

dir=$( (echo "$HOME"; zoxide query -l) | fzf --reverse --height=40%)
if [[ -z "$dir" ]]; then
    exit 0
fi

# stable, unique class derived from the resolved path
base=$(basename "$dir")
label="$base-$(echo -n "$dir" | md5sum | cut -c1-8)"

if [[ -n "$ZELLIJ" ]]; then
    # inside zellij
    zellij action switch-session $label --cwd $dir
else
    # outside zellij
    zellij attach --create $label options --default-cwd $dir
fi

