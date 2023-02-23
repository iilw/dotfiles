local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'Telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    color_devicons = true,
    mappings = {
      n = {
        ['q'] = actions.close,
      }
    }
  },
  extensions = {
    -- file_browser
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function ()
            vim.cmd('normal vbd')
          end
        },
        ['n'] = {
          ['h'] = fb_actions.goto_parent_dir
        },
      },
    },

    tailiscope = {
      -- register to copy classes to on selection
			register = "a",
		 	-- indicates what picker opens when running Telescope tailiscope
			-- can be any file inside of docs dir but most useful opts are
			-- all, base, categories, classes
			-- These are also accesible by running Telescope tailiscope <picker>
			default = "base",
			-- icon indicates an item which can be opened in tailwind docs
			-- can be icon or false
			doc_icon = " ",
		  	-- if you would prefer to copy with/without class selector
		 	-- dot is maintained in display to differentiate class from other pickers
			no_dot = true,
			maps = {
				i = {
					back = "<C-b>",
					open_doc = "<C-o>",
				},
				n = {
					back = "b",
					open_doc = "od",
				},
			},
    }
  }
}


telescope.load_extension('file_browser')


vim.keymap.set('n', ';f', function()
  builtin.find_files({
    no_ignore = false,
    hidden = true
  })
end)

-- 关键字搜索
vim.keymap.set('n', ';r', builtin.live_grep, {})

-- buffers下搜索
vim.keymap.set('n', '\\\\', builtin.buffers, {})

-- 上次搜索
vim.keymap.set('n', ';;', builtin.resume, {})

-- 列出诊断
vim.keymap.set('n', ';e', builtin.diagnostics, {})

-- file_browser搜索
vim.keymap.set('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    -- previewer = true,
    initial_mode = 'normal',
    layout_config = { height = 30 }
  })
end)

