return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    },
    config = function()
      require('codecompanion').setup {
        strategies = {
          chat = {
            adapter = 'bedrock_claude_chat',
          },
          inline = {
            adapter = 'bedrock_claude_chat',
          },
          cmd = {
            adapter = 'bedrock_claude_chat',
          },
        },
        adapters = {
          opts = {
            show_defaults = false,
          },
          bedrock_claude_chat = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              env = {
                url = 'http://172.31.25.243:8000',
              },
              schema = {
                messages = {
                  { role = 'user', content = '' },
                },
                model = {
                  default = 'bedrock-claude-v1',
                },
                max_tokens = {
                  default = 200000,
                },
              },
            })
          end,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
      vim.keymap.set({ 'n', 'v' }, '<LocalLeader>a', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
      vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

      vim.cmd [[cab cc CodeCompanion]]
    end,
  },
}
