vim.g.mapleader = " "

local keymap = vim.keymap


keymap.set("i", "jk", "<ESC>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gb=gb")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


