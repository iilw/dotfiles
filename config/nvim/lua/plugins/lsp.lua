return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- disable keymaps
      keys[#keys + 1] = { "]e", false }
      keys[#keys + 1] = { "[e", false }
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gd", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gr", false }
    end,
  },
}
