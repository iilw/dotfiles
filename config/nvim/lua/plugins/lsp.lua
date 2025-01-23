return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- vim.list_extend(opts.ensure_installed, {
      --   "stylua",
      --   "selene",
      --   "luacheck",
      --   "shellcheck",
      --   "shfmt",
      --   "tailwindcss-language-server",
      --   "typescript-language-server",
      --   "css-lsp",
      -- })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- inc-rename.nvim
      keys[#keys + 1] = {
        "gr",
        function()
          local inc_rename = require("inc_rename")
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename (inc-rename.nvim)",
        has = "rename",
      }
    end,
  },
}
