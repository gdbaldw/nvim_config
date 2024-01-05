-- This is NVim Autocompletion support
local cmp = require 'cmp'

-- This function sets up autocompletion
cmp.setup {

  -- This mapping affects the autocompletion choices menu
  mapping = cmp.mapping.preset.insert(),

  -- This table names the sources for autocompletion
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
}
