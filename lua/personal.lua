local M = {
  local_plugin_directory = 'personal_plugins',
}

function M.codecompanion_strategies()
  return {
    chat = {
      adapter = 'anthropic',
    },
    inline = {
      adapter = 'anthropic',
    },
    cmd = {
      adapter = 'anthropic',
    },
  }
end

function M.codecompanion_adapters()
  local secrets = require 'secrets'
  return {
    opts = {
      show_defaults = false,
    },
    local_ollama = function()
      return require('codecompanion.adapters').extend('ollama', {
        env = {
          url = 'localhost:11434',
        },
        parameters = {
          sync = true,
        },
      })
    end,
    anthropic = function()
      return require('codecompanion.adapters').extend('anthropic', {
        env = {
          api_key = secrets.anthropic_api_key,
        },
        schema = {
          model = {
            default = 'claude-3-7-sonnet-20250219',
          },
        },
      })
    end,
  }
end

return M
