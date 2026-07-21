require("vim-pack").add_on_event("BufWritePre", {
	{
		src = "stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				less = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				markdown = { "prettier" },
				scss = { "prettier" },
				yaml = { "prettier" },
				python = { "ruff_format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
})
