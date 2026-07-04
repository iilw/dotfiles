local parsers = {
	"bash",
	"c",
	"fish",
	"gitcommit",
	"html",
	"javascript",
	"json",
	"json5",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"scss",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

require("vim-pack").add({
	{
		src = "nvim-treesitter/nvim-treesitter",
		on_setup = function()
			require("nvim-treesitter").install(parsers):wait(300000)
		end,
	},
})
