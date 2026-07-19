# dotfiles (chezmoi)

面向 macOS 的个人工作站配置仓库，使用 [chezmoi](https://www.chezmoi.io/) 管理 Shell、编辑器、终端、窗口管理和状态栏配置。

> 本仓库主要负责**分发配置**，不会统一安装所有应用、启动后台服务或配置 macOS 权限。首次应用前请先阅读[依赖与准备](#依赖与准备)和[应用后激活](#应用后激活)。

## 包含内容

| 分类 | 组件 | 说明 |
| --- | --- | --- |
| Shell | `fish`、Fisher | PATH、环境变量、alias/abbr，以及不纳入版本控制的 `config-local.fish` 扩展入口。 |
| 编辑器 | `nvim` | 基于 Neovim 原生 `vim.pack` 的配置，包含 LSP、Treesitter、Telescope、blink.cmp 和格式化。 |
| 终端与会话 | `ghostty`、`kitty`、`tmux` | macOS 终端选项、字体/主题、tmux 会话管理和 Lazygit popup。 |
| CLI 工具 | `lazygit`、`btop`、`neofetch` | Git TUI、资源监控和终端信息展示配置。 |
| 窗口管理 | `yabai`、`skhd` | BSP 平铺、Space/应用规则，以及窗口与 Space 快捷键。 |
| 状态栏 | `sketchybar` | Space、前台应用、时钟、Wi-Fi、音量、电池、输入法、CPU 和内存部件。 |

## 目录与映射

```text
.
├── dot_config/
│   ├── btop/
│   ├── ghostty/
│   ├── kitty/
│   ├── lazygit/
│   ├── neofetch/
│   ├── nvim/
│   ├── private_fish/
│   ├── sketchybar/
│   ├── skhd/
│   ├── tmux/
│   └── yabai/
├── run_onchange_install-fisher-plugins.sh.tmpl
├── .chezmoiignore
└── README.md
```

- `dot_config/<name>/` 会映射到 `~/.config/<name>/`。
- `dot_config/private_fish/` 会映射到 `~/.config/fish/`；`private_` 是 chezmoi 的私有文件命名约定。
- `run_onchange_install-fisher-plugins.sh.tmpl` 会在 `fish_plugins` 内容变更后运行：若本机存在 `fish`，将安装 Fisher（如缺失）并执行 `fisher update`。
- `README.md` 和目标机的 `~/.config/fish/fish_variables` 已在 `.chezmoiignore` 中排除。

## 快速开始

### 1. 安装 chezmoi

macOS（Homebrew）：

```bash
brew install chezmoi
```

### 2. 拉取并应用配置

以下命令中的 `--apply` 会立即把 source state 写入目标路径；应用前建议先确认本机配置项不会覆盖需要保留的内容。

HTTPS：

```bash
chezmoi init --apply iilw
```

SSH：

```bash
chezmoi init --apply git@github.com:iilw/dotfiles.git
```

首次应用后，如果系统中已安装 `fish`，chezmoi 会根据 `fish_plugins` 自动安装或更新 Fisher 插件。

### 3. 后续同步更新

```bash
chezmoi update
```

## 依赖与准备

按需安装下列工具；除 Fisher 外，仓库不提供统一的依赖安装流程。

### 核心与常用 CLI

- 基础：`chezmoi`、`git`、`curl`
- Shell/CLI：`fish`、`tmux`、`lazygit`、`btop`、`neofetch`
- 通用工具：`ripgrep`、`fd`、`fzf`、`eza`

```bash
brew install chezmoi fish tmux git curl ripgrep fd fzf eza lazygit btop neofetch
```

### 终端、窗口管理与状态栏

安装并按各项目官方文档完成必要的 macOS 权限与启动配置：

- 终端：`ghostty`、`kitty`
- 窗口管理：`yabai`、`skhd`
- 状态栏：`sketchybar`
- SketchyBar/yabai 集成所需：`jq`、`python3`
- 可选：`borders`。`yabai` 仅在检测到该命令和 `update_border_color.sh` 时启用边框颜色更新。

Kitty、Ghostty 和 SketchyBar 均依赖字体配置。建议准备 JetBrains Mono、JetBrainsMono Nerd Font Mono、Symbols Nerd Font 与 Hack Nerd Font Mono；否则终端字形或状态栏图标可能无法正确显示。

### Neovim 与开发工具

此配置使用原生 `vim.pack.add()` 管理插件，需要 **Neovim 0.12+**。首次启动会按需从 GitHub 获取插件、安装配置的 Treesitter parser，并在更新 `blink.cmp` 时触发其构建流程。

建议准备：

- Neovim/LSP：`neovim`、`lua-language-server`、`pyright-langserver`、`sourcekit-lsp`
- 格式化：`stylua`、`prettier`、`shfmt`、`ruff`
- 构建：`make`、`rustup` 与 `cargo`（`blink.cmp` 需要 Rust 构建环境）
- 可选语言环境：`pyenv`、`pnpm`、`bun`

```bash
brew install neovim lua-language-server stylua prettier shfmt rustup-init
```

> LSP 配置中存在未启用的语言服务器定义；README 列出的工具不代表所有语言服务都会自动启用。

### tmux 外部依赖

`tmux.conf` 通过 `~/.tmux/plugins/tpm/tpm` 初始化 TPM，因此需先按 [TPM](https://github.com/tmux-plugins/tpm) 文档将其安装到该路径。

主题还依赖 `tokyonight.nvim` 仓库中的文件：

```text
~/ghq/github.com/folke/tokyonight.nvim/extras/tmux/tokyonight_day.tmux
```

如未准备该文件，可手动拉取：

```bash
mkdir -p ~/ghq/github.com/folke
git clone https://github.com/folke/tokyonight.nvim ~/ghq/github.com/folke/tokyonight.nvim
```

## 应用后激活

### 自动发生的操作

- 当 `fish` 已安装且 `fish_plugins` 发生变化时，chezmoi 的 onchange 脚本会安装或更新 Fisher 插件。
- 启动 Neovim 后，原生 `vim.pack` 会按配置拉取缺失插件；首次使用可能需要网络连接及 Rust 构建环境。

### 需要手动完成的操作

- 安装 Ghostty、Kitty、yabai、skhd、SketchyBar 等应用或工具。
- 依照各项目官方文档，授予 yabai/skhd 所需的 macOS 权限，并启动或设置其常驻方式。
- 启动 SketchyBar 并确认其读取 `~/.config/sketchybar/sketchybar`；布局、Space 点击和部分状态栏交互会调用 yabai。
- 安装 TPM 与 TokyoNight tmux 主题文件后，再启动 tmux。

## 常用快捷键

### tmux

| 快捷键 | 操作 |
| --- | --- |
| `Ctrl+t` | tmux 前缀键 |
| 前缀键 + `g` | 在当前 pane 目录打开 Lazygit popup |
| 前缀键 + `o` | 在当前 pane 目录中通过 macOS `open` 打开 Finder |

已启用鼠标支持。

### Kitty

| 快捷键 | 操作 |
| --- | --- |
| `⌘ Enter` | 在当前工作目录新建窗口 |
| `⌘ T` | 在当前工作目录新建标签页 |
| `⌘ W` | 关闭当前窗口 |
| `⌘ [` / `⌘ ]` | 切换上一页 / 下一页标签 |
| `⌘ ⇧ R` | 重载 Kitty 配置 |

### skhd + yabai

以下操作需要 yabai 正常运行：

| 快捷键 | 操作 |
| --- | --- |
| `⌥ H/J/K/L` | 聚焦左/下/上/右窗口 |
| `⌥ ⇧ H/J/K/L` | 与左/下/上/右窗口交换位置 |
| `⌥ ⌘ H/J/K/L` | 调整窗口边缘大小 |
| `⌥ ⇧ F` | 切换父容器缩放 |
| `⌥ ⇧ E` | 切换浮动与边框 |
| `⌥ ⇧ R` | 平衡当前 Space 的窗口大小 |
| `⌥ 1/2/3/4/9/0` | 聚焦 Space 1–6 |
| `⌥ ⇧ 1/2/3/4/9/0` | 将当前窗口移动到 Space 1–6 |

另外，内建键盘的 `Caps Lock` 被映射为左 `Control`，左 `Control + H/J/K/L` 映射为方向键。

## 本地定制

### Fish 本地配置

`fish` 会尝试加载同目录下、未受版本控制的 `config-local.fish`：

```fish
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
```

适合放私有 token、本机 PATH 或实验性 alias。

### 机器相关配置点

应用前后请优先检查以下值：

- `~/.config/yabai/yabairc`：内建显示器 UUID、Space 标签、应用分流规则、窗口间距与 SketchyBar 顶部留白均为个人工作流设置。
- `~/.config/skhd/skhdrc`：内建键盘的 vendor/product ID 及按键映射针对当前设备。
- `~/.config/sketchybar/sketchybar`：当前配置创建 1–10 号 Space、使用 `SF Pro` 与 `Hack Nerd Font Mono`，可按需调整部件、字体、颜色和刷新频率。
- `~/.config/kitty/kitty.conf` 与 `~/.config/ghostty/`：字体、透明度、主题及 macOS Option 键行为可按偏好修改。
- `~/.config/tmux/tmux.conf`：TPM 与 TokyoNight 主题路径均依赖固定位置。
- Fish 环境变量包含 `/opt/homebrew`、`~/Library/Android/sdk`、`/Users/devling/Library/pnpm`、OrbStack 等 macOS/用户特定假设；在其他用户名或 Linux 环境使用前应逐项调整。

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
