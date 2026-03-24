return {
	{
		"L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function(_, opts)
			local luasnip = require("luasnip")
			luasnip.setup(opts)

			require("luasnip.loaders.from_vscode").lazy_load()

			require("luasnip.loaders.from_vscode").lazy_load({
				paths = vim.fn.stdpath("config") .. "/snippets",
			})
		end,
	},
}
