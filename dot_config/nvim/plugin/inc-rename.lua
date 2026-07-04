require("vim-pack").add({
	{
		src = "smjonas/inc-rename.nvim",
    module_name = "inc_rename",
		on_setup = function()
			vim.keymap.set("n", "<leader>cr", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end)
		end,
	},
})
