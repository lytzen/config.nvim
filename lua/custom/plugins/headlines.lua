return {
  'lukas-reineke/headlines.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('headlines').setup {
      -- markdown = {},
      -- rmd = {},
      -- norg = {},
      -- org = {},
    }
  end,
}
