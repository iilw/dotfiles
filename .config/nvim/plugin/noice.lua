require("vim-pack").add({
	{
		src = "MunifTanjim/nui.nvim",
		setup = false,
	},
	{
		src = "rcarriga/nvim-notify",
		setup = false,
	},
	{
		src = "folke/noice.nvim",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "notify",
						find = "Empty hover response",
					},
					opts = { skip = true },
				},
			},
			presets = {
				inc_rename = true,
				lsp_doc_border = true,
			},
		},
	},
})
