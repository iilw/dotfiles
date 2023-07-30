return {
  -- neo tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
      extensions = {
        -- file_browser
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {},
        },
      },
    },
    keys = {
      {
        "sf",
        function()
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end
          require("telescope").extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "open telescope file_browser",
      },
      {
        ";f",
        function()
          require("telescope.builtin").find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
      },
      {
        ";r",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
      {
        "\\\\",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        ";;",
        function()
          require("telescope.builtin").resume()
        end,
      },
      {
        ";e",
        function()
          require("telescope.builtin").diagnostics()
        end,
      },
    },
  },

  -- add telescope-file-browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },

  -- ts-autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
