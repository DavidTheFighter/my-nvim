return {
  {
    'sindrets/diffview.nvim',
    config = function()
      local diffview = require('diffview').setup {}

      vim.g.diffview_open = false

      vim.keymap.set('n', '<leader>gD', function()
        if vim.g.diffview_open then
          vim.cmd 'DiffviewClose'
        else
          vim.cmd 'DiffviewOpen'
        end

        vim.g.diffview_open = not vim.g.diffview_open
      end, { desc = '[G]it toggle [D]iffview' })
    end,
  },
}
