# dotfiles (chezmoi)

个人开发环境配置仓库，使用 [chezmoi](https://www.chezmoi.io/) 管理。

当前包含的主要配置：
- `fish`（别名、abbr、PATH、Node/Python/Bun/PNPM 环境变量）
- `nvim`（Lazy.nvim + LSP + Telescope + Treesitter + blink.cmp）
- `tmux`（前缀键改为 `Ctrl+t`、TPM 插件管理、lazygit popup）
- `lazygit`（主题和界面样式）
- `neofetch`

## 目录结构

```text
.
├── dot_config/
│   ├── fish/
│   ├── nvim/
│   ├── tmux/
│   ├── lazygit/
│   └── neofetch/
├── .chezmoiignore
└── README.md
```

## 快速开始

### 1) 安装 chezmoi

macOS（Homebrew）：

```bash
brew install chezmoi
```

### 2) 拉取并应用配置

```bash
chezmoi init --apply iilw
```

如果你使用 SSH：

```bash
chezmoi init --apply git@github.com:iilw/dotfiles.git
```

### 3) 之后同步更新

```bash
chezmoi update
```

## 常用 chezmoi 命令

```bash
# 查看与本地生效文件的差异
chezmoi diff

# 只应用变更
chezmoi apply

# 编辑某个托管文件（会自动映射到 source state）
chezmoi edit ~/.config/fish/config.fish

# 查看 chezmoi source 目录位置
chezmoi source-path
```

## 依赖建议

为了完整体验当前配置，建议安装：
- `fish`
- `neovim`（建议 >= 0.11）
- `tmux`
- `git`
- `ripgrep`
- `fd`
- `fzf`
- `eza`
- `lazygit`
- `neofetch`
- `lua-language-server`
- `stylua`
- `prettier`
- `shfmt`
- `make`
- `rustup` + `cargo`（`blink.cmp` 使用 Rust 构建）

macOS 可按需使用 Homebrew 安装：

```bash
brew install fish neovim tmux git ripgrep fd fzf eza lazygit neofetch \
  lua-language-server stylua prettier shfmt rustup-init
```

## 本地修改与提交

在任意生效文件中修改后，同步回 chezmoi source：

```bash
chezmoi re-add
```

然后正常提交：

```bash
git add -A
git commit -m "chore: update dotfiles"
```

## 注意事项

- `README.md` 已在 `.chezmoiignore` 中，不会被应用到 `$HOME`。
- 部分配置包含 macOS 相关路径（如 Homebrew、Android SDK、PNPM 路径），在 Linux 上请按需调整。
