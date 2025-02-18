return {
  {
    'rcasia/neotest-java',
    ft = 'java',
    dependencies = {
      'mfussenegger/nvim-jdtls',
      'mfussenegger/nvim-dap', -- for the debugger
      'rcarriga/nvim-dap-ui', -- recommended
      'theHamsta/nvim-dap-virtual-text', -- recommended
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require 'neotest-java',
      })
    end,
    -- opts = {
    --   adapters = {
    --     ['neotest-java'] = {
    --       -- config here
    --     },
    --   },
    -- },
  },
}
