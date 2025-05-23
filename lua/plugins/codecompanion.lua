return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    },
    enabled = false,
    config = function()
      local local_config = require 'local'

      require('codecompanion').setup {
        strategies = local_config.codecompanion_strategies(),
        adapters = local_config.codecompanion_adapters(),
      }

      vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
      vim.keymap.set({ 'n', 'v' }, '<LocalLeader>a', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
      vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

      vim.cmd [[cab cc CodeCompanion]]
    end,
  },
}
