#!/usr/bin/env fish

function tmux-cht
	set languages ~/.config/fish/functions/tmux-cht-languages
	set commands ~/.config/fish/functions/tmux-cht-commands

	set selected (cat $languages $commands | fzf)

	if not set -q selected[1]
		echo "not found"
		exit 1
	end
	
	echo $selected & read -l -P 'Enter Query: ' query
  set query (echo $query | tr ' ' '+')

	if grep -qs $selected $languages
		tmux neww fish -c "curl -s cht.sh/$selected/$query ; read -P 'Enter to close'"
	else
		tmux neww fish -c "curl -s cht.sh/$selected~$query | less"
	end
end
