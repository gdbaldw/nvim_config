-- This command loads the Lualine plugin
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {

      -- This option is for displaying the full path to the file
      {
        'filename',
        path = 1,
      }
    }
  }
}
