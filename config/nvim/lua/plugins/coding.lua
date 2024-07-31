return {
  -- luasnip
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = {
          "./snippets",
        },
      })
    end,
  },
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.18.2/bin/node",
    },
  },
  -- Lspsaga
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    keys = {
      -- {
      --   "gd",
      --   "<cmd>Lspsaga goto_definition<cr>",
      --   desc = "Lspsaga Goto definition",
      -- },
      {
        "gf",
        "<cmd>Lspsaga finder<cr>",
        desc = "Lspsaga finder",
      },
      {
        "]e",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        desc = "Lspsaga diagnostic next",
      },
      {
        "[e",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "Lspsaga diagnostic prev",
      },
    },
    opts = {
      ui = {
        border = "rounded",
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      outline = {
        layout = "float",
      },
      diagnostic = {
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
    },
  },

  -- im-select
  {
    "keaising/im-select.nvim",
    config = function(_, opts)
      require("im_select").setup(opts)
    end,
  },
}
