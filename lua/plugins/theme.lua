return {
  {
    'DavidTheFighter/arctic.nvim',

    dependencies = { 'rktjmp/lush.nvim' },
    name = 'arctic',
    branch = 'main',
    priority = 999,
    config = function()
      vim.cmd 'colorscheme arctic'
    end,
  },
}
