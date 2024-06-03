return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'rcasia/neotest-bash',
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require 'neotest-bash',
      })
    end,
  },
}
