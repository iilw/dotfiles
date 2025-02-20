return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
		keys = {
			{ ";f", "<cmd>Telescope find_files<cr>" },
			{ ";r", "<cmd>Telescope live_grep<cr>" },
			{ ";;", "<cmd>Telescope resume<cr>" },
			{ ";e", "<cmd>Telescope diagnostics<cr>" },
			{ ";v", "<cmd>Telescope vim_options<cr>" },
			{
				"sf",
				function()
					local t = require("telescope")
					t.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = vim.fn.expand("%:p:h"),
						grouped = true,
						hidden = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
			},
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					selection_caret = " ",
					theme = "dropdown",
					sorting_strategy = "ascending",
					layout_config = { prompt_position = "top" },
					file_ignore_patterns = { ".git/" },
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
					},
				},
			}
		end,
		config = function(_, opts)
			local t = require("telescope")
			t.setup(opts)
			t.load_extension("file_browser")
		end,
	},
}
