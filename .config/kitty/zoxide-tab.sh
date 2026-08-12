#!/usr/bin/env bash

selected=$( (echo "$HOME"; zoxide query -l) | fzf --reverse --height=40%)
if [[ -n "$selected" ]]; then
    real=$(realpath "$selected")
    label=$(basename "$real")
    escaped=$(printf '%s' "$real" | sed -e 's/[.[\*^$()+?{|]/\\&/g')

    kitty @ focus-window --match "var:zoxide_tab_id=^${escaped}$" 2>/dev/null \
        || kitty @ launch --type=tab --cwd="$real" \
               --var "zoxide_tab_id=${real}" \
               --tab-title "$label"
fi

# close the kitty overlay in which fzf is running
kitty @ close-window --self
