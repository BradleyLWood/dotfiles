function dotfiles
	git --git-dir=$HOME/.cfgrepo --work-tree=$HOME $argv
end
