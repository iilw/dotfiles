return {
	{
		"smjonas/inc-rename.nvim",
		keys = {
			{ "gr", ":IncRename " },
		},
		opts = {},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings(true)
		end,
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
}
