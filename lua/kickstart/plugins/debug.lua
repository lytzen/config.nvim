-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- lazy = true,
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    -- Required dependacy for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>Dc', dap.continue, { desc = '[D]ebug: Start/[C]ontinue' })
    vim.keymap.set('n', '<leader>DR', dap.run_to_cursor, { desc = '[D]ebug: [R]un to cursor' })
    vim.keymap.set('n', '<leader>Di', dap.step_into, { desc = '[D]ebug: Step [i]nto' })
    vim.keymap.set('n', '<leader>Do', dap.step_over, { desc = '[D]ebug: Step [o]ver' })
    vim.keymap.set('n', '<leader>Du', dap.step_out, { desc = '[D]ebug: Step O[u]t' })
    vim.keymap.set('n', '<leader>Db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
    vim.keymap.set('n', '<leader>DB', function()
      dap.set_breakpoint(vim.fn.input '[Condition] > ')
    end, { desc = '[D]ebug: Set Conditional [B]reakpoint' })

    vim.keymap.set('n', '<leader>Dq', dap.close, { desc = '[D]ebug: [Q]uit' })
    vim.keymap.set('n', '<leader>Dx', dap.terminate, { desc = '[D]ebug: e[x]it' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup()
    -- dapui.setup {
    --   -- Set icons to characters that are more likely to work in every terminal.
    --   --    Feel fr
    --   --    Don't feel like these are good choices.
    --   icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    --   controls = {
    --     enabled = true,
    --     icons = {
    --       pause = '⏸',
    --       play = '▶',
    --       step_into = '⏎',
    --       step_over = '⏭',
    --       step_out = '⏮',
    --       step_back = 'b',
    --       run_last = '▶▶',
    --       terminate = '⏹',
    --       disconnect = '⏏',
    --     },
    --   },
    -- }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>DU', dapui.toggle, { desc = '[D]ebug: [U]I See last session result.' })
    vim.keymap.set({ 'n', 'v' }, '<leader>De', dapui.eval, { desc = '[D]ebug: Evaluate [E]xpression.' })
    vim.keymap.set('n', '<leader>DE', function()
      dapui.eval(vim.fn.input '[Expression] > ')
    end, { desc = '[D]ebug: Evaluate [E]xpression.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup()

    -- Initialize python config
    -- debugpy is installed in the pyenv "debugpy", hence the
    -- reference to python in the pyenv shims.
    -- (The installation instructions recommended this approach)
    dap.adapters.bashdb = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
      name = 'bashdb',
    }
    dap.configurations.sh = {
      {
        type = 'bashdb',
        request = 'launch',
        name = 'Launch file',
        showDebugOutput = true,
        pathBashdb = vim.fn.stdpath 'data' .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
        pathBashdbLib = vim.fn.stdpath 'data' .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
        trace = true,
        file = '${file}',
        program = '${file}',
        cwd = '${workspaceFolder}',
        pathCat = 'cat',
        pathBash = 'bash',
        pathMkfifo = 'mkfifo',
        pathPkill = 'pkill',
        args = {},
        env = {},
        terminalKind = 'integrated',
      },
    }
    dap.configurations.java = {
      {
        type = 'java',
        request = 'attach',
        name = "Debug (Attach) - Remote",
        hostname = "127.0.0.1",
        port = 5007,
      },
    }
    require('dap-python').setup '~/.pyenv/shims/python'
  end,
}
