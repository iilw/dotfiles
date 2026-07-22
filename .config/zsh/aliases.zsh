# 允许 zsh-abbr 覆盖系统同名命令
export ABBR_FORCE=1

# Files
abbr add mv='mv -iv'
abbr add cp='cp -riv'
abbr add mkdir='mkdir -vp'

# eza
alias ls='eza --color=always --icons --group-directories-first'
alias la='eza --color=always --icons --group-directories-first --all'
alias ll='eza --color=always --icons --group-directories-first --all --long'
alias l='ll'

# Editor
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Dev
alias gg="lazygit"

# Other
abbr add cls='clear'
