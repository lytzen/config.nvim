return {
  'Exafunction/codeium.nvim',
  event = 'BufEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {
      api = {
        host = 'codeium.terma.com',
        path = '/_route/api_server',
      },
      enterprise_mode = true,
    }
  end,
}
