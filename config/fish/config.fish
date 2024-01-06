set fish_greeting ""

set -gx TERM xterm-256color

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias cls clear
alias vi vim
alias vim nvim
# alias for dotfiles
# alias dotfiles "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# proxy
alias proxy "export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unproxy "export http_proxy= https_proxy= all_proxy="


set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
# Nodejs
set -gx PATH node_modules/.bin $PATH
# Brew
set -gx PATH /opt/homebrew/bin $PATH
# flutter
set -gx PATH ~/flutter/flutter/bin $PATH

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return
    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end



test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish


switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
