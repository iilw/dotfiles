return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				mode = "tabs",
				show_close_icon = false,
				show_buffer_close_icons = false,
				always_show_bufferline = false,
			},
		},
		keys = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = { enabled = false },
			bigfile = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			scope = { enabled = true },
			image = { enabled = true },
			words = { enabled = true },
			scroll = { enabled = false },
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {},
	},
}
