return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = true,
      auto_attach = true,
      signcolumn = true,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Normal mode --
        map('n', '<leader>gb', gitsigns.blame_line, { desc = '[G]it [b]lame line' })

        -- Toggles --
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>td', gitsigns.toggle_word_diff, { desc = '[T]oggle git word [d]iff' })
      end,
    },
  },
}
