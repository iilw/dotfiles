return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
		keys = {
			{
				";f",
				LazyVim.pick("files"),
			},
			{
				";F",
				LazyVim.pick("files", { path = "%:p:h", cwd = vim.fn.expand("%:p:h") }),
			},
			{
				";r",
				LazyVim.pick("live_grep"),
			},
			{
				";R",
				LazyVim.pick("live_grep", { path = "%:p:h", cwd = vim.fn.expand("%:p:h") }),
			},
			{
				";;",
				"<cmd>Telescope resume<cr>",
			},
			{
				"sf",
				function()
					local t = require("telescope")
					t.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = vim.fn.expand("%:p:h"),
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { horizontal = { width = 100 } },
					})
				end,
			},
		},
		opts = {
			defaults = {
				theme = "dropdown",
				-- layout_config
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				-- path
				-- path_display = {
				-- 	"filename_first",
				-- },
				-- ui
				-- results_title = "",
				-- previewer
			},
		},
	},
}
