

set -gx TERM xterm-256color

# theme
   

# aliases
        alias g git
## ide
alias ide "bash ~/ide.sh"

command -qv nvim && alias vim nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


# Node
set --universal nvm_default_version v18.13.0


