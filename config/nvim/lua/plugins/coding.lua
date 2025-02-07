return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",
		build = "cargo build --release",
		event = "InsertEnter",
		opts_entend = { "sources.default" },
		opts = {
			keymap = { preset = "enter" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				cmdline = {},
			},
			completion = {
				menu = {
					scrollbar = false,
					winblend = 5,
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 2 },
							{ "source_name" },
						},
					},
				},
				documentation = {
					auto_show = true,
					window = {
						winblend = 5,
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
		},
	},
}
