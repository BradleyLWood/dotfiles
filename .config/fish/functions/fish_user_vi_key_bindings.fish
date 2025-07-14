function fish_user_vi_key_bindings
	bind -M insert \cl forward-char
	bind -M insert \cf run_tmux_sessionizer
	bind -M default \cf run_tmux_sessionizer
end
