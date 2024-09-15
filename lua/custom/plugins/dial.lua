return {
  'monaqa/dial.nvim',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'VeryLazy',
  config = function()
    local augend = require 'dial.augend'
    require('dial.config').augends:register_group {
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'],
        augend.hexcolor.new { case = 'lower' },
        augend.constant.alias.bool,
      },
      visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.constant.alias.bool,
      },
    }
  end,
  keys = function()
    vim.keymap.set('n', '<C-a>', function()
      require('dial.map').manipulate('increment', 'normal')
    end)
    vim.keymap.set('n', '<C-x>', function()
      require('dial.map').manipulate('decrement', 'normal')
    end)
    vim.keymap.set('n', 'g<C-a>', function()
      require('dial.map').manipulate('increment', 'gnormal')
    end)
    vim.keymap.set('n', 'g<C-x>', function()
      require('dial.map').manipulate('decrement', 'gnormal')
    end)
    vim.keymap.set('v', '<C-a>', function()
      require('dial.map').manipulate('increment', 'visual')
    end)
    vim.keymap.set('v', '<C-x>', function()
      require('dial.map').manipulate('decrement', 'visual')
    end)
    vim.keymap.set('v', 'g<C-a>', function()
      require('dial.map').manipulate('increment', 'gvisual')
    end)
    vim.keymap.set('v', 'g<C-x>', function()
      require('dial.map').manipulate('decrement', 'gvisual')
    end)
  end,
}
