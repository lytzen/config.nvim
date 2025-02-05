-- if not require("custom").plugins.test.lua then
--   return {}
-- end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'lua', 'luadoc', 'luap' })
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'stylua' })
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'
      table.insert(opts.sources, nls.builtins.formatting.stylua)
    end,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-plenary',
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require 'neotest-plenary',
      })
    end,
  },
}
