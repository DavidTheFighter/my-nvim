local M = {}

function M.setup_keybinds()
  -- Open new window
  vim.keymap.set('n', '<leader>W', function()
    vim.cmd.vnew()
  end, { desc = 'New [W]indow' })

  -- Open new terminal
  vim.keymap.set('n', '<leader>T', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 10)
    vim.cmd.startinsert()
  end, { desc = '[T]erminal' })

  vim.keymap.set('n', '<leader>wk', function()
    -- Get the current window and its height
    local current_window = vim.api.nvim_get_current_win()

    -- Get the total number of lines in the current Neovim instance
    local total_height = vim.api.nvim_get_option 'lines'

    -- Calculate 40% of the total height
    local new_height = math.floor(total_height * 0.6)

    -- Set the height of the current window
    vim.api.nvim_win_set_height(current_window, new_height)
  end, { desc = '[w]indow increase height' })

  vim.keymap.set('n', '<leader>wj', function()
    -- Get the current window and its height
    local current_window = vim.api.nvim_get_current_win()

    -- Get the total number of lines in the current Neovim instance
    local total_height = vim.api.nvim_get_option 'lines'

    -- Calculate 40% of the total height
    local new_height = math.floor(10)

    -- Set the height of the current window
    vim.api.nvim_win_set_height(current_window, new_height)
  end, { desc = '[w]indow decrease height' })
end

return M
