# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt GLOB_DOTS

export EDITOR=nvim
export VISUAL="$EDITOR"

export PATH="$PATH:$HOME/.local/bin"

# Bindings
bindkey -v
bindkey -s '^[f' '~/.local/bin/tmux-sessionizer^M'
bindkey '^L' 'autosuggest-accept'

# Completion
zstyle :compinstall filename '/home/bradley/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Aliases
alias ls="eza -H --icons --group-directories-first"
alias la="ls -a"
alias lat="ls -aT"
alias lt="ls -T"
alias ll="ls -l"
alias llt="ls -lT"
alias lla="la -l"
alias llat="la -lT"

alias r="ranger"

alias config="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
compdef config=git
_config() {
  local -x GIT_DIR=$HOME/.dotfiles
  local -x GIT_WORK_TREE=$HOME
  _git
}
compdef _config config

# Initialize zoxide
eval "$(zoxide init zsh --cmd cd)"

# Initialize starship
eval "$(starship init zsh)"

# Run 'reset' when a new tmux window/pane is created
if [ -n "$TMUX" ]; then
    reset
fi
