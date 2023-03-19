local status, packer = pcall(require, 'packer')
if (not status) then return end

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }


  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- mason
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- lspconfig

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip' -- 补全引擎
  use "rafamadriz/friendly-snippets"
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs

  use 'jose-elias-alvarez/null-ls.nvim'

  --telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'norcalli/nvim-colorizer.lua'

  use 'akinsho/bufferline.nvim'

  use {
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  } -- gcc & gc注释
  use 'lewis6991/gitsigns.nvim'
end)
