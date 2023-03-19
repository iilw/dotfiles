local status, ls = pcall(require, 'luasnip');
if (not status) then return end

require('luasnip/loaders/from_vscode').lazy_load()
require('luasnip/loaders/from_snipmate').lazy_load()

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
})

-- load snippets
-- example <https://github.com/rafamadriz/friendly-snippets>
ls.filetype_extend("typescriptreact", {
  "javascript-react",
  "next-ts",
})
ls.filetype_extend("javascript", { "react-es7" })


