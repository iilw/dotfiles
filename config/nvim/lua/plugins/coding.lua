return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",
		build = "cargo build --release",
		event = "InsertEnter",
		opts_extend = { "sources.default" },
		opts = {
			keymap = { preset = "enter" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				cmdline = {},
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
					enabled = true,
				},
			},
		},
	},
}
