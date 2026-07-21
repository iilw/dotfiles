-- treesitter
local group = vim.api.nvim_create_augroup("treesitter/start", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	desc = "Start Treesitter highlighting when a parser is configured",
	callback = function(args)
		require("treesitter").start(args.buf, args.match)
	end,
})
