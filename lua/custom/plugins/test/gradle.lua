return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'weilbith/neotest-gradle',
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require 'neotest-gradle',
      })
    end,
  },
}
