-- This function for setting the good movements, does not seem to work.
-- Not sure why. I have stolen it from my previous configuration.
function _G.set_terminal_keymaps()
  -- vim.print 'set_terminal_keymaps called'
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-_><C-n><C-W>h]], { noremap = true })
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-_><C-n><C-W>j]], { noremap = true })
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-_><C-n><C-W>k]], { noremap = true })
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-_><C-n><C-W>l]], { noremap = true })
end

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

    -- The usual move keys.
    -- vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()',
    vim.api.nvim_create_autocmd('TermOpen', {
      desc = 'Make moving between windows easier',
      pattern = 'term://*',
      group = vim.api.nvim_create_augroup('terminal_keymaps', { clear = true }),
      callback = function()
        set_terminal_keymaps()
      end,
    }),
  },
}
