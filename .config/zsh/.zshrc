# 初始化 Zinit 插件管理器
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi

# 在 compinit 扫描 fpath 前加载额外补全定义
zinit light zsh-users/zsh-completions

# 开启 Zsh 原生补全系统（fzf-tab 依赖）
autoload -Uz compinit
compinit -C

# zsh-abbr
zinit light olets/zsh-abbr

# 双击esc 加 sudo
zinit snippet OMZP::sudo

zinit wait lucid light-mode for \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting

zinit light Aloxaf/fzf-tab


[[ -f "$ZDOTDIR/fzf-tab.zsh" ]] && source "$ZDOTDIR/fzf-tab.zsh"
[[ -f "$ZDOTDIR/aliases.zsh" ]] && source "$ZDOTDIR/aliases.zsh"
[[ -f "$ZDOTDIR/proxy.zsh" ]] && source "$ZDOTDIR/proxy.zsh"

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi
