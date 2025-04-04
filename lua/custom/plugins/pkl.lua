return {
  {
    'https://github.com/apple/pkl-neovim',
    enabled = false,
    lazy = true,
    event = {
      'BufReadPre *.pkl',
      'BufReadPre *.pcf',
      'BufReadPre PklProject',
      ft = {
        'pkl',
        'pcf',
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    build = function()
      vim.cmd 'TSInstall! pkl'
    end,
  },
}
