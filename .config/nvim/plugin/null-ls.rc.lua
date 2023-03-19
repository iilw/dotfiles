local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local formatting = null_ls.builtins.formatting

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    -- filter = function (client)
    --   return client == "null-ls"
    -- end,
    bufnr = bufnr,
    async = true
  })
end

null_ls.setup({
  sources = {
    formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
          -- vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
})

-- 在当前的buffer关闭自动格式化
vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
