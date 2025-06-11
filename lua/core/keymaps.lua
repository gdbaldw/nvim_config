-- Set leader keys
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Clear search highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Quick escape from insert mode
vim.keymap.set('i', 'jk', '<esc>')

