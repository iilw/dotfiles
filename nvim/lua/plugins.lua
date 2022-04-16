local packer = require("packer")
packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    
    ----------color
    use("folke/tokyonight.nvim")

    -------------------------- plugins -------------------------------------------
    -- nvim-tree (新增)
    use ({'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'})
    
    --bufferline
    use ({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    use ({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' }})
    -- telescope
    use ({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }})
    use ("LinArcX/telescope-env.nvim")

    -- dashboard-nvim
    use ("glepnir/dashboard-nvim")
    use ("ahmedkhalf/project.nvim")
    use ({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- LSP
    use ({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
end)


pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
