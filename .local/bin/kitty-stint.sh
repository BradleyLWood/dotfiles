#!/usr/bin/env bash
# stint: zoxide + kitty + hyprland — open or focus a per-directory kitty window
# usage: stint <zoxide-query>

dir=$( (echo "$HOME"; zoxide query -l) | fzf --reverse --height=40%)
if [[ -z "$dir" ]]; then
    exit 0
fi

# stable, unique class derived from the resolved path
class="ztk-$(echo -n "$dir" | md5sum | cut -c1-10)"

addr=$(hyprctl clients -j | jq -r --arg c "$class" \
  '.[] | select(.class==$c) | .address' | head -n1)

if [[ -n "$addr" ]]; then
    hyprctl eval "hl.dispatch(hl.dsp.focus({ window = 'address:"$addr"' }))"
else
    kitty @ launch --type os-window --cwd "$dir" --os-window-class "$class"
fi
