---@type vim.lsp.Config
return {
	cmd = { "tsgo", "--lsp", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	on_attach = function(_, bufnr)
		local map = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
		end

		-- map("n", "K", vim.lsp.buf.hover)
		-- map("n", "gd", vim.lsp.buf.definition)
		-- map("n", "<leader>ca", vim.lsp.buf.code_action)
		-- map("n", "<leader>cr", vim.lsp.buf.rename)
	end,
}
