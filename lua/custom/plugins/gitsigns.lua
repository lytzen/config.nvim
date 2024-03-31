-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Hunk Actions
      map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
      map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
      map('v', '<leader>ghs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Stage selected hunk' })
      map('v', '<leader>ghr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Reset selected hunk' })
      map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
      map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview hunk' })
      map('n', '<leader>ghj', gs.next_hunk, { desc = 'Next hunk' })
      map('n', '<leader>ghk', gs.prev_hunk, { desc = 'Prev hunk' })

      -- Buffer actions
      map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
      map('n', '<leader>gr', gs.reset_buffer, { desc = 'Reset buffer' })
      map('n', '<leader>gb', function()
        gs.blame_line { full = true }
      end, { desc = 'Blame line' })
      map('n', '<leader>gd', function()
        gs.diffthis 'HEAD'
      end, { desc = 'Diff buffer with HEAD' })

      -- Toggles
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[T]oggle current line [B]lame' })
      map('n', '<leader>gtd', gs.toggle_deleted, { desc = '[T]oggle show [D]eleted lines' })
      map('n', '<leader>gth', gs.toggle_linehl, { desc = '[T]oggle [H]ighlight changed lines' })
      map('n', '<leader>gtw', gs.toggle_word_diff, { desc = '[T]oggle highlight [W]ord changes' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  },
}
