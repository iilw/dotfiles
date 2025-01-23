# Disable fish_greeting
set fish_greeting "Hello world! Let's code."

# Default version for nodejs
# set --universal nvm_default_version v20

# Path
fish_add_path /bin
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.cargo.
# fish_add_path ~/flutter/flutter/bin

# pyenv
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

set -gx ANDROID_HOME $HOME/Library/Android/sdk

set -gx EDITOR nvim

# cocopoilot
set GH_OVERRIDE_SHELL_FILE "$HOME/.copilot.override.sh"
if test -f "$GH_OVERRIDE_SHELL_FILE"
    source "$GH_OVERRIDE_SHELL_FILE"
end


# Tmux 
abbr t tmux
abbr ta 'tmux attach -t'
abbr tc 'tmux attach'
abbr tl 'tmux ls'
abbr ts 'tmux new -s'
abbr tk 'tmux kill-session -t'

# Files
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias ls 'eza --color=always --icons --group-directories-first'
alias la 'eza --color=always --icons --group-directories-first --all'
alias ll 'eza --color=always --icons --group-directories-first --all --long'
abbr l ll

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim

# Dev
alias lazygit "TERM=xterm-256color command lazygit"
abbr gg lazygit

# Other
abbr cls clear
# proxy
alias proxy "export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unproxy "export http_proxy= https_proxy= all_proxy="
