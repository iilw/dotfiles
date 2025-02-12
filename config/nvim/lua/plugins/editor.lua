return {
	{
		"smjonas/inc-rename.nvim",
		keys = {
			{ "gr", ":IncRename " },
		},
		opts = {},
	},
	{
		"folke/trouble.nvim",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
			},
		},
		opts = {},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
		},
		opts = {},
	},
}
