local treesitter = require("treesitter")

require("vim-pack").add({
	{
		src = "nvim-treesitter/nvim-treesitter",
		on_setup = function()
			require("nvim-treesitter").install(treesitter.parsers):wait(300000)
		end,
	},
})
