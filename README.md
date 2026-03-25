# dotfiles (chezmoi)

个人开发环境配置仓库，使用 [chezmoi](https://www.chezmoi.io/) 管理，当前主要面向 macOS。

## 包含内容

- `fish`：PATH、环境变量、常用 alias/abbr，以及 `config-local.fish` 本地扩展入口
- `nvim`：基于 `lazy.nvim` 的配置，包含 LSP、Treesitter、Telescope、blink.cmp 等插件
- `tmux`：前缀键改为 `Ctrl+t`，集成 `lazygit` popup、TPM、resurrect/continuum
- `ghostty`：终端主题与 macOS 专用选项
- `lazygit`：界面主题与交互配置
- `btop`：主题与监控面板配置
- `neofetch`：终端信息展示配置

## 主要目录

```text
.
├── dot_config/
│   ├── btop/
│   ├── ghostty/
│   ├── lazygit/
│   ├── neofetch/
│   ├── nvim/
│   ├── private_fish/
│   └── tmux/
├── run_onchange_install-fisher-plugins.sh.tmpl
├── .chezmoiignore
└── README.md
```

说明：

- `dot_config/private_fish/` 会映射到 `~/.config/fish/`
- `run_onchange_install-fisher-plugins.sh.tmpl` 会在 `fish_plugins` 变更后自动执行 `fisher update`
- `README.md` 和 `~/.config/fish/fish_variables` 已在 `.chezmoiignore` 中排除

## 快速开始

### 1. 安装 chezmoi

macOS（Homebrew）：

```bash
brew install chezmoi
```

### 2. 拉取并应用配置

HTTPS：

```bash
chezmoi init --apply iilw
```

SSH：

```bash
chezmoi init --apply git@github.com:iilw/dotfiles.git
```

首次应用后，如果系统中已安装 `fish`，`chezmoi` 会根据 `fish_plugins` 自动安装/更新 `fisher` 插件。

### 3. 后续同步更新

```bash
chezmoi update
```

## 常用 chezmoi 命令

```bash
# 查看 source state 与本地生效文件的差异
chezmoi diff

# 只应用变更
chezmoi apply

# 编辑某个托管文件（自动映射到 source state）
chezmoi edit ~/.config/fish/config.fish

# 查看 chezmoi source 目录
chezmoi source-path

# 将本地已生效文件重新同步回 source state
chezmoi re-add ~/.config/fish/config.fish
```

## 依赖建议

为了完整使用当前配置，建议安装以下工具：

- 基础：`git`、`curl`
- Shell/CLI：`fish`、`tmux`、`ghostty`、`lazygit`、`btop`、`neofetch`
- 通用工具：`ripgrep`、`fd`、`fzf`、`eza`
- Neovim：`neovim`（建议 `>= 0.11`）、`lua-language-server`、`stylua`、`prettier`、`shfmt`
- 构建链：`make`、`rustup` + `cargo`（`blink.cmp` 需要 Rust 构建）
- 可选语言环境：`pyenv`、`pnpm`、`bun`

macOS 可按需使用 Homebrew 安装：

```bash
brew install chezmoi fish neovim tmux git curl ripgrep fd fzf eza lazygit btop neofetch
brew install lua-language-server stylua prettier shfmt rustup-init
brew install --cask ghostty
```

`tmux` 主题依赖 `tokyonight.nvim` 仓库中的额外文件，默认读取路径如下：

```text
~/ghq/github.com/folke/tokyonight.nvim/extras/tmux/tokyonight_day.tmux
```

如未准备该文件，可手动拉取：

```bash
mkdir -p ~/ghq/github.com/folke
git clone https://github.com/folke/tokyonight.nvim ~/ghq/github.com/folke/tokyonight.nvim
```

## 本地定制

`fish` 配置会尝试加载同目录下的 `config-local.fish`：

```fish
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
```

适合放不想提交到仓库的机器相关配置，例如私有 token、本地 PATH 或实验性 alias。

## 本地修改与提交

修改生效文件后，可以同步回 chezmoi source：

```bash
chezmoi re-add ~/.config/fish/config.fish
chezmoi re-add ~/.config/nvim/init.lua
```

然后正常提交：

```bash
git add -A
git commit -m "chore: update dotfiles"
```

## 注意事项

- 当前配置里包含明显的 macOS 路径与工具假设，例如 `/opt/homebrew`、`~/Library/Android/sdk`、`/Users/devling/Library/pnpm`
- 如果在 Linux 或其他用户名环境使用，建议先检查 `fish` 中的 PATH 和环境变量
- `ghostty` 额外提供了 `config-macos`，适用于 macOS 标题栏与 Option 键行为
