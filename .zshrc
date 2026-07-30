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

# Cursor shape function
function zle-keymap-select () {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
  echo -ne '\e[1 q'   # block cursor for normal mode
elif [[ ${KEYMAP} == main ]] ||
  [[ ${KEYMAP} == viins ]] ||
  [[ ${KEYMAP} = '' ]] ||
  [[ $1 = 'beam' ]]; then
echo -ne '\e[5 q'   # blinking line cursor for insert mode
  fi
}
zle -N zle-keymap-select

# Reset to beam on new prompt / after certain widgets (fixes cursor staying block after enter)
zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init

# Also fix cursor after Ctrl-C or command finishes
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

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

# Initialize fzf completion
source <(fzf --zsh)

# Run 'reset' when a new tmux window/pane is created
if [ -n "$TMUX" ]; then
    reset
fi
