# Greeting
set fish_greeting ""

# Commands to run in interactive sessions can go here
fish_vi_key_bindings
fish_user_vi_key_bindings

# Aliases

# Use ls
#alias ls  "ls -hpG --group-directories-first --color"
#alias la  "ls -A"
#alias ll  "ls -l"
#alias lla "la -A"
# Use exa
alias ls  "exa --icons --group-directories-first"
alias la  "ls -a"
alias ll  "ls -l"
alias lla "la -l"

# Attach tmux to a session if one exists, otherwise creates one
alias t "tmux -u attach || tmux -u new"
# Attaches tmux to a session (example: ta portal)
alias ta "tmux attach -t"
# Creates a new named session (example: tn portal)
alias tn "tmux new -s"
# List all sessions
alias tl "tmux list-sessions"
# Create tmux session for nvim configuration
alias vconfig "tmux new-session -d -s nvim -c ~/.config/nvim/ \; switchc -t nvim"

# Ranger
alias r "ranger"

# vim
abbr v nvim
abbr vs "sudo nvim"

# Pacman
abbr -a p "sudo pacman"

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
set -gx PATH ~/code/public_scripts $PATH
set -gx PATH ~/code/private_scripts $PATH
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

