return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-python',
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require 'neotest-python' {
          dap = { justMyCode = false },
          -- runner = 'unittest',
          runner = 'pytest',
          -- python = '.pyenv/shims/python'
        },
      })
    end,
  },
}
