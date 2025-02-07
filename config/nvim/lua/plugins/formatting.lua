return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts_extends = { "formatters_by_ft" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
