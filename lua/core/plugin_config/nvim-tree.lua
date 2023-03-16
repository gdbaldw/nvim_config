-- These variables disable loading of the default Netrw file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- This function sets up the NVim Tree plugin
require("nvim-tree").setup()

-- This setting is for toggling the directory of the current file
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')


