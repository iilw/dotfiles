vim.g.mapleader = " "

local keymap = vim.keymap


keymap.set("i", "jk", "<ESC>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gb=gb")


-- New Tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
keymap.set("n", "ss", ":split<Return><C-w>w")
-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')


