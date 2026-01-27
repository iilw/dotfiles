return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		keys = {
			{ ";f", "<cmd>Telescope find_files<cr>" },
			{ ";F", "<cmd>Telescope find_files hidden=true<cr>" },
			{ ";r", "<cmd>Telescope live_grep<cr>" },
			{ ";;", "<cmd>Telescope resume<cr>" },
			{ "sf", "<cmd>Telescope file_browser path=%:p:h<cr>" },
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					theme = "dropdown",
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
					mappings = {
						["n"] = {
							q = actions.close,
						},
					},
				},
				extensions = {
					file_browser = {
						layout_config = { horizontal = { width = 100 } },
						initial_mode = "normal",
						previewer = false,
						grouped = true,
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
			}
		end,
		config = function(_, opts)
			local t = require("telescope")
			t.setup(opts)

			t.load_extension("fzf")
			t.load_extension("file_browser")
		end,
	},
}
