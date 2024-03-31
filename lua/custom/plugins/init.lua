-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  require 'custom.plugins.colorscheme',
  require 'custom.plugins.lualine',
  require 'custom.plugins.autopairs',
  require 'custom.plugins.gitsigns',
  require 'custom.plugins.telescope',
  require 'custom.plugins.treesitter',
  require 'custom.plugins.nvim-tree',

  require 'custom.plugins.quickfixdd',
  require 'custom.plugins.vim-tmux-navigator',

  require 'custom.plugins.toggleterm',
  require 'custom.plugins.dial',
}
