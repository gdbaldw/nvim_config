-- This is a Boot-Strapping function for the Packer package manager
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
  function(use)

    -- This is a NVim Package Manager
    use 'wbthomason/packer.nvim'

    -- This is a NVim Color Scheme
    use 'ellisonleao/gruvbox.nvim'

    -- This is a NVim File Tree Explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
    }

    -- This is a NVim Status Line
    use 'nvim-lualine/lualine.nvim'

    -- This is the Unison-Lang support for Vim
    use {
      'unisonweb/unison',
      branch = 'trunk',
      rtp = 'editor-support/vim'
    }

    -- This implements editing of encrypted files: .gpg, .pgp or .asc suffix
    use 'jamessan/vim-gnupg'

    -- This is NVim LSP Configuration support
    use 'neovim/nvim-lspconfig'

    -- This is NVim Autocompletion support
    use 'hrsh7th/nvim-cmp'

    -- This is LSP Source for NVim Autocompletion
    use 'hrsh7th/cmp-nvim-lsp'

    -- This is Buffer Source for NVim Autocompletion
    use 'hrsh7th/cmp-buffer'

    -- This is Python Autocompletion support
    use 'davidhalter/jedi-vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  -- This is the Packer custom configuration table
  config = { git = { clone_timeout = 120 } }

})
