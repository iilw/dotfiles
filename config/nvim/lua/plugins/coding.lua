return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
		version = "*",
		build = "cargo build --release",
		event = "InsertEnter",
		opts_extend = { "sources.default" },
		opts = {
			keymap = { preset = "enter" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				cmdline = {},
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
			completion = {
				menu = {
					winblend = vim.o.pumblend,
					scrollbar = false,
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
				},
				ghost_text = {
					enabled = false,
				},
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		dependencies = { "giuxtaposition/blink-cmp-copilot" },
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},
}
