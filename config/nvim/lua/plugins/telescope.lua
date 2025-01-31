return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim'},
    keys = {
      {";f", "<cmd>Telescope find_files<cr>"},
      {";r", "<cmd>Telescope live_grep<cr>"},
      {";;", "<cmd>Telescope resume<cr>"},
      {"sf", function()
        local t = require("telescope")
        t.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = vim.fn.expand("%:p:h"),
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 }
        })
      end}
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          theme = "dropdown",
          border = true,
          winblend = 20,
          preview = {
            winblend = 20
          },
          mappings = {
            n = {
              ["q"] = actions.close
            }
          }
        },
        extensions = {
          file_browser = {
            theme = "dropdown"
          }
        }
      }
    end,
    config = function(_,opts)
      local t = require("telescope")
      t.setup(opts)
      t.load_extension("file_browser")
    end
  }
}
