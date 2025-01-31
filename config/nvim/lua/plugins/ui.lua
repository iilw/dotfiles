return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "tabs",
        show_close_icon = false,
        always_show_bufferline = false
      }
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true
      }
    }
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      indent = { enabled = true },
      bigfile = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      input = { enabled = true },
      words = { enabled = true },
      dashboard = {
        sections = {
          { section = "header" },
          { section = "startup" }
        }
      }
    }
  }
}
