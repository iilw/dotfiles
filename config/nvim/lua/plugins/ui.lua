return {
  -- Alpha
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },

  -- Noice
  {
    "folke/noice.nvim",
    enabled = false,
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<Tab>",
        "<Cmd>BufferLineCycleNext<CR>",
        desc = "Next tab",
      },
      {
        "<S-Tab>",
        "<Cmd>BufferLineCyclePrev<CR>",
        desc = "Prev tab",
      },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icon = false,
        show_close_icon = false,
      },
    },
  },
}
