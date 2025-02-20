# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions zsh-syntax-highlighting pipenv)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Put homebrew in PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH


# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh


# Spaceship theme
source /opt/homebrew/opt/spaceship/spaceship.zsh

# iTerm2 tmux integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# User configuration
export MANPAGER="nvim +Man!" # Neovim manpager
export EDITOR="nvim"         # Use neovim as default editor
bindkey -v                   # Vim bindings

# Aliases
alias fzh="history | awk '{\$1=\"\"; sub(/^ /, \"\"); print}' | fzf"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Tmux aliases because the plugin won't work.
# alias tad='tmux attach -d -t'
# alias ts='tmux new-session -s'
# alias tl='tmux list-sessions'
# alias tksv='tmux kill-server'
# alias tkss='tmux kill-session -t'
# alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'

ta() {
	# Function for attaching to tmux with fzf
	SEL=$(tmux list-sessions | fzf --height=20 --reverse | awk '
		BEGIN {
			FS=":"
		}
		{
			print $1
		}
	')
	if [ -z "${SEL}" ]; then
		# if string is empty (user pressed escape) do nothing
	else
		tmux a -t $SEL
	fi
}


# fuzzy find file and open with nvim
alias ff="fzf --preview 'bat --color=always {}' | xargs nvim"

#
# Load zsh-syntax-highlighting
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# fzf completions & bindings
source <(fzf --zsh)

# Source OpenJDK Path
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
