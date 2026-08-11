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
#bindkey -s '^[f' '~/.local/bin/tmux-sessionizer^M'
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

# Initialize fzf shell completion
eval "$(fzf --zsh)"

# Initialize starship
eval "$(starship init zsh)"

# TODO get to work with herdr tabs
function precmd() {
    if command -v herdr >/dev/null 2>&1; then
        # Parse the active workspace name
        local ws=$(herdr workspace list 2>/dev/null | awk '/\*/ {print $2}')
        if [[ -n "$ws" ]]; then
            print -Pn "\e]0;Herdr: $ws\a"
        fi
        print -Pn "\e]1;%c\a"
    fi
}

function preexec() {
    print -Pn "\e]1;${1}\a"
}

# Run 'reset' when a new tmux window/pane is created
if [ -n "$TMUX" ]; then
    reset
fi
