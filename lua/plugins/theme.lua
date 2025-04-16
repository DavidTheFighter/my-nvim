return {
  {
    'rockyzhang24/arctic.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    name = 'arctic',
    branch = 'v2',
    priority = 999,
    config = function()
      vim.cmd 'colorscheme arctic'
    end,
  },
}
