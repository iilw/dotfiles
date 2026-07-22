
# XDG base directories.
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/.cargo/bin:$PATH" # cargo
export PATH="$HOME/.local/bin:$PATH" # Local scripts.

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Set up neovim as the default editor.
EDITOR="$(which nvim)"
export EDITOR
export VISUAL="$EDITOR"

[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
