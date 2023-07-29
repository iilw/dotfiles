local status, leap = pcall(require, 'leap');
if (not status) then return end

leap.add_default_mappings()

vim.keymap.set({'x', 'o', 'n'}, 'r', '<Plug>(leap-forward-till)')
vim.keymap.set({'x', 'o', 'n'}, 'R', '<Plug>(leap-backward-till)')
