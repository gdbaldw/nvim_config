-- This function is for configuring a buffer when an LSP is attached
local on_attach = function(client, bufnr)
  -- Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appear/become resolved
  vim.o.signcolumn = 'yes'

  -- Update the cursor hover location every 1/4 of a second
  vim.o.updatetime = 250

  -- Disable appending of the error text at the offending line
  vim.diagnostic.config({virtual_text = false})

  -- Enable a floating window containing the error text when hovering over an error
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })

  -- LSP-related keybindings
  local opts = { buffer = bufnr, noremap = true, silent = true }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
end

-- Setup the Unison LSP
require('lspconfig')['unison'].setup{
  on_attach = on_attach,
}

-- Setup the Python LSP (Pyright)
require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
}

