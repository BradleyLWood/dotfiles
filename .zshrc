# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# I set my titles with a zoxide fzf script in kitty
DISABLE_AUTO_TITLE="true"

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

# Aliases
alias ls="eza -H --icons --group-directories-first"
alias la="ls -a"
alias lat="ls -aT"
alias lt="ls -T"
alias ll="ls -l --time-style='+%F %I:%M:%S %P'"
alias llt="ls -lT --time-style='+%F %I:%M:%S %P'"
alias lla="la -l --time-style='+%F %I:%M:%S %P'"
alias llat="la -lT --time-style='+%F %I:%M:%S %P'"

alias weather="curl wttr.in"

# Completion
zstyle :compinstall filename '/home/bradley/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

config() {
    local dir=$HOME/.dotfiles/worktrees/main/
    local passed_args=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -x|--exclusive)
                dir=$HOME/.dotfiles/worktrees/exclusive/
                shift
                ;;
            *)
                # Everything else is captured as a positional argument
                passed_args+=("$1")
                shift
                ;;
        esac
    done

    $(which git) --git-dir=$dir --work-tree=$HOME "${passed_args[@]}"

}
compdef config=git
_config() {
    local -x GIT_DIR=$HOME/.dotfiles/worktrees/main
    local -x GIT_WORK_TREE=$HOME

    local -a words_orig
    words_orig=("${words[@]}")

    # Check if -x or --exclusive is present as the first arg
    if [[ ${words[2]} == "-x" || ${words[2]} == "--exclusive"  ]]; then
        # set the git dir to the exclusive worktree
        GIT_DIR=$HOME/.dotfiles/worktrees/exclusive
        # Remove it from the words array
        words[2]=()
        # Shift CURRENT back by one since we removed an element
        (( CURRENT-- ))
    fi

    _git
}
compdef _config config

# Initialize zoxide
eval "$(zoxide init zsh --cmd cd)"

# Initialize starship
eval "$(starship init zsh)"

# Initialize fzf completion
source <(fzf --zsh)

# TODO redo this to work with herdr and zellij
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
