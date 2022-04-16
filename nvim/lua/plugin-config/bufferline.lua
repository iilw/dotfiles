local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有 bufferline")
    return
  end

-- bufferline
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({})
