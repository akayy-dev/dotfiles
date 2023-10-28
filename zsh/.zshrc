# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting pipenv)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Put homebrew in PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH


# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load zsh-syntax-highlighting
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Spaceship theme
source /opt/homebrew/opt/spaceship/spaceship.zsh

# iTerm2 tmux integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# User configuration
export MANPAGER="nvim +Man!" # Neovim manpager
export EDITOR="nvim"         # Use neovim as default editor
bindkey -v                   # Vim bindings

# Aliases
alias dir="exa -T -L 2 --icons" # Directory Overview
alias fzh="history | awk '{\$1=\"\"; sub(/^ /, \"\"); print}' | fzf"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Install pipenv venv in current directory
export PIPENV_VENV_IN_PROJECT=1

# Tmux aliases because the plugin won't work.
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'
