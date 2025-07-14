# Greeting
set fish_greeting ""

# Commands to run in interactive sessions can go here
fish_vi_key_bindings
fish_user_vi_key_bindings

# nvm
# Call it on initialization or listening to directory switching won't work
#load_nvm > /dev/stderr

# Aliases

# Use ls
#alias ls  "ls -hpG --group-directories-first --color"
#alias la  "ls -A"
#alias ll  "ls -l"
#alias lla "la -A"
# Use exa
alias ls  "exa -H --icons --group-directories-first"
alias la  "ls -a"
alias lat  "ls -aT"
alias lt  "ls -T"
alias ll  "ls -l"
alias llt  "ls -lT"
alias lla "la -l"
alias llat "la -lT"

alias config "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Attach tmux to a session if one exists, otherwise creates one
#abbr t "tmux -u attach || tmux -u new"
# Attaches tmux to a session (example: ta portal)
#abbr ta "tmux attach -t"
# Creates a new named session (example: tn portal)
#abbr tn "tmux new -s"
# List all sessions
#abbr tl "tmux list-sessions"
# Create tmux session for nvim configuration
#abbr vconfig "tmux new-session -d -s nvim -c ~/.config/nvim/ \; switchc -t nvim"

# Ranger
alias r "ranger"

# Z
alias cd z

#alias j z
#alias jj "z -"

# vim
abbr v nvim
abbr vs "sudo nvim"
abbr vim nvim

# Pacman
abbr -a p "sudo pacman"

# Postgres user
abbr -a pgu "sudo -u postgres"

# Git abbreviations
abbr -a gd   "git difftool"
abbr -a ga   "git add"
abbr -a gaa  "git add --all ."
abbr -a gbd  "git branch -D"
abbr -a gs   "git status"
abbr -a gc   "git commit"
abbr -a gca  "git commit -a"
abbr -a gm   "git merge --no-ff"
abbr -a gpt  "git push --tags"
abbr -a gp   "git push"
abbr -a grh  "git reset --hard"
abbr -a gb   "git branch"
abbr -a gcob "git checkout -b"
abbr -a gco  "git checkout"
abbr -a gba  "git branch -a"
abbr -a gl   "git log --pretty=format:\"%Cgreen%h%Creset - %Cblue%an%Creset @ %ar : %s\""
abbr -a gl2  "git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
abbr -a glv  "git log --stat"
abbr -a gpom "git pull origin master"

# Editor
set -gx EDITOR nvim

# Path
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /usr/local/bin $PATH

# Deno
set -gx DENO_INSTALL ~/.deno 
set -gx PATH $DENO_INSTALL/bin $PATH

# Go
set -gx GOPATH ~/go
set -gx PATH $GOPATH/bin $PATH

# Rust
set -gx RUSTPATH ~/.cargo
set -gx PATH $RUSTPATH/bin $PATH

# Flutter
set -gx PATH ~/code/flutter/bin $PATH

# Project path for pj plugin
set -gx PROJECT_PATHS ~/code

# Bun
set -Ux BUN_INSTALL "/home/bradley/.bun"
set -px --path PATH "/home/bradley/.bun/bin"

# pnpm
set -gx PNPM_HOME "/home/bradley/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

set -gx DPRINT_INSTALL "/home/bradley/.dprint/bin"
set -gx PATH $DPRINT_INSTALL $PATH

# Use bat as pager for man pages
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Initialize zoxide
zoxide init fish | source

# Initialize starship
starship init fish | source
