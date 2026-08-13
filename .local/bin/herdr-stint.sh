#!/usr/bin/env bash

#if ! [[ -z $(pgrep -x "herdr") ]] then
#    herdr
#fi
dir=$( (echo "$HOME"; zoxide query -l) | fzf --reverse --height=40%)
if [[ -z "$dir" ]]; then
    exit 0
fi

# stable, unique class derived from the resolved path
base=$(basename "$dir")
label=".../$base-$(echo -n "$dir" | md5sum | cut -c1-8)"

herdr_id=$(herdr workspace list | jq -r --arg label "$label" \
    '.result.workspaces[] | select(.label == $label) | .workspace_id' 2>/dev/null)

if [[ -n "$herdr_id" ]]; then
    herdr workspace focus $herdr_id >/dev/null
else
    herdr workspace create --focus --cwd $dir --label $label
fi

