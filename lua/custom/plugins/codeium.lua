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
      enable_chat = true,
      -- language_server = '/home/mlh/Downloads/language_server_linux_x64',
    }
  end,
  enabled = true,
}
