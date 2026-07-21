require("vim-pack").add_on_event({
	"BufReadPre",
	"BufNewFile",
}, {
	{
		src = "lewis6991/gitsigns.nvim",
	},
})
