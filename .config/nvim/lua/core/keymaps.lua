vim.g.mapleader = " "

local keymap = vim.keymap


keymap.set("i", "jk", "<ESC>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gb=gb")


-- New Tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


