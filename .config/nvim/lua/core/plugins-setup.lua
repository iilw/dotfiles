local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保持此文件自动更新插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities

  -- 主题
  use 'folke/tokyonight.nvim'

  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    -- 状态栏图标
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- 文档树
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- lspconfig

  -- 语法高亮
  use 'nvim-treesitter/nvim-treesitter'

  -- cmp plugins
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"

  use "L3MON4D3/LuaSnip"
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  use "numToStr/Comment.nvim" -- gcc & gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号
  use "windwp/nvim-ts-autotag"
  use "kyazdani42/nvim-web-devicons" -- File icons
  use "akinsho/nvim-bufferline.lua"
  use "lewis6991/gitsigns.nvim" -- 左 git提示

  use "akinsho/nvim-bufferline.lua"

  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
