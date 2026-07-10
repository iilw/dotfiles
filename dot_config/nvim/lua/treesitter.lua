local M = {}

M.parsers = {
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

function M.start(bufnr, filetype)
	local language = vim.treesitter.language.get_lang(filetype)
	if language and vim.list_contains(M.parsers, language) then
		vim.treesitter.start(bufnr, language)
	end
end

return M
