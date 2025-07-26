# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt GLOB_DOTS

export EDITOR=nvim
export VISUAL="$EDITOR"

# Android Dev
export JAVA_HOME=/opt/android-studio/jbr
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_AVD_HOME="$HOME/.android/avd"
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"

# Path
export PATH=~/bin:~/.local/bin:~/.yarn/bin:$PATH

# Deno
export DENO_INSTALL=~/.deno 
export PATH=$DENO_INSTALL/bin:$PATH

# Go
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

# Rust
export RUSTPATH=~/.cargo
export PATH=$RUSTPATH/bin:$PATH

# Project path for pj plugin
export PROJECT_PATHS=~/code

# Flutter
export PATH="$HOME/code/flutter/bin:$PATH"

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
alias ls="exa -H --icons --group-directories-first"
alias la="ls -a"
alias lat="ls -aT"
alias lt="ls -T"
alias ll="ls -l"
alias llt="ls -lT"
alias lla="la -l"
alias llat="la -lT"

alias r="ranger"

alias cd=z

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
compdef config=git
_config() {
  local -x GIT_DIR=$HOME/.dotfiles
  local -x GIT_WORK_TREE=$HOME
  _git
}
compdef _config config

# Cargo
. "$HOME/.cargo/env"

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugins

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Abbrebiations
zinit light olets/zsh-abbr

# FZF Completion
zinit light Aloxaf/fzf-tab

# Initialize zoxide
eval "$(zoxide init zsh)"

# Initialize starship
eval "$(starship init zsh)"
