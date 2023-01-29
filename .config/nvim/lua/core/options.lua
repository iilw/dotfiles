vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }


vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- local opt = vim.opt
--
-- -- 行号
-- opt.relativenumber = true
-- opt.number = true
--
-- -- 缩进
-- opt.tabstop = 2
-- opt.shiftwidth = 2
-- opt.expandtab = true
-- opt.autoindent = true
--
-- -- 防止包裹
-- opt.wrap = false
--
-- -- 光标行
-- opt.cursorline = true
--
-- -- 启用鼠标
-- opt.mouse:append("a")
--
-- -- 系统剪贴板
-- opt.clipboard:append("unnamedplus")
--
-- -- 新窗口右和下
-- opt.splitright = true
-- opt.splitbelow = true
--
-- -- 搜索
-- opt.ignorecase = true
-- opt.smartcase = true
--
-- -- 外观
-- opt.termguicolors = true
-- opt.signcolumn = "yes"
--
--
-- vim.cmd [[colorscheme tokyonight-moon]]
