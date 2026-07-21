require("vim-pack").add({
	{
		src = "folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				floats = "transparent",
			},
		},
		on_setup = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
})
