return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "json5" }}
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {}
      }
    }
  }
}
