local packer = require("packer")
packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    
    ----------color
    use("folke/tokyonight.nvim")

    -------------------------- plugins -------------------------------------------
    -- nvim-tree (新增)
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
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
