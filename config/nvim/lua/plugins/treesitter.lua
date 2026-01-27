return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"fish",
				"gitcommit",
				"html",
				"graphql",
				"javascript",
				"json",
				"json5",
				"jsonc",
				"lua",
				"regex",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			-- indent = { enable = true }
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
