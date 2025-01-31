return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {}
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "html"
      }
    }
  }
}
