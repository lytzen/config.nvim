return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20,
    open_mapping = [[<c-_>]], -- nvim unstands this as <C-/>
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
    vim.keymap.set('n', '<leader>gg', function()
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
      lazygit:toggle()
    end, { noremap = true, silent = true, desc = 'Toggle Lazygit' }),
  },
}
