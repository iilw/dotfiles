return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				typescriptreact = { "prettier" },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"typescript",
				"html",
			},
		},
	},
}
