local M = {}

function M.codecompanion_strategies()
  return {
    chat = {
      adapter = 'bedrock_claude_chat',
    },
    inline = {
      adapter = 'bedrock_claude_chat',
    },
    cmd = {
      adapter = 'bedrock_claude_chat',
    },
  }
end

function M.codecompanion_adapters()
  return {
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
  }
end

return M
