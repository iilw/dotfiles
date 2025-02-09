vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "gg<S-v>G", opts)

keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabeprev<Return>", opts)

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- diagnostic
keymap.set("n", "]e", vim.diagnostic.goto_next)
keymap.set("n", "[e", vim.diagnostic.goto_prev)
