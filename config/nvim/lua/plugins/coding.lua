return {

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
    keys = {
      {
        "K",
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "Lspsaga hover_doc",
      },
      {
        "gd",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Lspsaga Goto definition",
      },
      {
        "gr",
        "<cmd>Lspsaga rename<cr>",
        desc = "Lspsaga rename",
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
    -- config = function(_, opts)
    --   require("lspsaga").setup(opts)
    -- end,
  },

  -- snippets
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = "./my_snippets",
      })
    end,
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- im-select
  {
    "keaising/im-select.nvim",
    config = function(_, opts)
      require("im_select").setup(opts)
    end,
  },

  -- CopilotChat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
