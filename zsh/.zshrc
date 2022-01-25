# If you come from bash you might have to change your $PATH.
export PATH=$HOME/usr/local/go/bin:$HOME/bin:$HOME/local/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/bradley/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
	docker
	git
	grunt
	gulp
	history
	history-substring-search
	ng
	node
	npm
	pip
	postgres
	pylint
	python
	rails
	ruby
	scala
	ssh-agent
	sudo
	tmux
	vagrant
	vi-mode
	ubuntu
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

# Aliases
alias ls="ls -1 --group-directories-first --color"
alias ll="ls -lhp"
alias la="ls -lhpA"
# Attach tmux to a session if one exists, otherwise creates one
alias t="tmux -u attach || tmux -u new"
# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'
# Creates a new named session (example: tn portal)
alias tn='tmux new -s'
# dotfile git commands
alias dotfiles='/usr/bin/git --git-dir=$HOME/.configrepo --work-tree=$HOME'

unsetopt beep

bindkey -v

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# up and down arrows search history
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

export KEYTIMEOUT=1

