return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-vim-test',
      'folke/lazydev.nvim',
      'stevearc/overseer.nvim',
    },
    keys = {
      { '<leader>tF', "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = 'Debug File' },
      { '<leader>tL', "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>", desc = 'Debug Last' },
      { '<leader>ta', "<cmd>w|lua require('neotest').run.attach()<cr>", desc = 'Attach' },
      { '<leader>tf', "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = 'File' },
      { '<leader>tl', "<cmd>w|lua require('neotest').run.run_last()<cr>", desc = 'Last' },
      { '<leader>tn', "<cmd>w|lua require('neotest').run.run()<cr>", desc = 'Nearest' },
      { '<leader>tN', "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = 'Debug Nearest' },
      { '<leader>to', "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>", desc = 'Output' },
      { '<leader>ts', "<cmd>w|lua require('neotest').run.stop()<cr>", desc = 'Stop' },
      { '<leader>tS', "<cmd>w|lua require('neotest').summary.toggle()<cr>", desc = 'Summary' },
    },
    opts = function()
      return {
        adapters = {
          require 'neotest-vim-test' {
            ignore_file_types = { 'python', 'vim', 'lua', 'sh' },
          },
        },
        consumers = {
          overseer = require 'neotest.consumers.overseer',
        },
        overseer = {
          enable = true,
          force_default = true,
        },
      }
    end,
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)
      require('neotest').setup(opts)
    end,
  },
  {
    'stevearc/overseer.nvim',
    keys = {
      { '<leader>ttR', '<cmd>OverseerRunCmd<cr>', desc = 'Run Command' },
      { '<leader>tta', '<cmd>OverseerTaskAction<cr>', desc = 'Task Action' },
      { '<leader>ttb', '<cmd>OverseerBuild<cr>', desc = 'Build' },
      { '<leader>ttc', '<cmd>OverseerClose<cr>', desc = 'Close' },
      { '<leader>ttd', '<cmd>OverseerDeleteBundle<cr>', desc = 'Delete Bundle' },
      { '<leader>ttl', '<cmd>OverseerLoadBundle<cr>', desc = 'Load Bundle' },
      { '<leader>tto', '<cmd>OverseerOpen<cr>', desc = 'Open' },
      { '<leader>ttq', '<cmd>OverseerQuickAction<cr>', desc = 'Quick Action' },
      { '<leader>ttr', '<cmd>OverseerRun<cr>', desc = 'Run' },
      { '<leader>tts', '<cmd>OverseerSaveBundle<cr>', desc = 'Save Bundle' },
      { '<leader>ttt', '<cmd>OverseerToggle<cr>', desc = 'Toggle' },
    },
    opts = {},
  },
}
