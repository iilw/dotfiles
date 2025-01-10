return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        ";f",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      {
        ";;",
        "<cmd>Telescope resume<cr>",
        desc = "Resume",
      },
      {
        ";r",
        "<cmd>Telescope live_grep<cr>",
        desc = "Telescope live_grep",
      },
    },
    opts = {
      defaults = {},
      pickers = {
        find_files = {},
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("file_browser")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "sf",
        function()
          local t = require("telescope")
          t.extensions.file_browser.file_browser({
            path = "%:p:h",
            grouped = true, -- 文件夹优先显示
            cwd = vim.fn.expand("%:p:h"),
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Telescope file_browser",
      },
    },
  },
}
