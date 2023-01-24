require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- https://github.com/williamboman/mason-lspconfig.nvim#configuration
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "tailwindcss",
    "cssls",
    "html",
    "jsonls",
    "bashls"
  }
})
