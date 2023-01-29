local status, telescope = pcall(require, "telescope")
if (not status) then return end
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  },
  extendsion = {
    file_browser = {
      theme = "bropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd('normal vbd')
          end
        },
        ['n'] = {

        }
      }
    }
  }
}

require("telescope").load_extension("file_browser")

vim.keymap.set("n", ';f', function()
  builtin.find_files()
end)
vim.keymap.set('n', ';r', builtin.live_grep, {})
vim.keymap.set('n', '\\\\', builtin.buffers, {})
vim.keymap.set('n', ';;', builtin.resume, {})
vim.keymap.set('n', ';e', builtin.diagnostics, {})
vim.keymap.set('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
