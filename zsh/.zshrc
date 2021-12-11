# Path to your oh-my-zsh installation.
export ZSH="/Users/ahadukebede/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting tmux)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPAGER="nvim +Man!" # Neovim manpager
export EDITOR="nvim"         # Use neovim as default editor
bindkey -v                   # Vim bindings
