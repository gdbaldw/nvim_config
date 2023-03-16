-- This sets the unison filetype because nvim does not detect unison files
vim.cmd [[ autocmd BufRead,BufNewFile *.u set filetype=unison ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.uu set filetype=unison ]]
